class Api::V1::BoardGamesController < ApplicationController
  ALLOWED_PARAMS = ["controller", "action", "subcategory", "cooperative", "max_players"].freeze

  def carousel
    unexpected_params = params.keys - ALLOWED_PARAMS
    if !unexpected_params.empty?
      render json: { error: "Unexpected Parameters", status: 404 }, status: 404
    else
      carousel_games = choose_carousel(params)
      if carousel_games.nil?
        render json: { error: "Invalid Parameter Value", status: 400 }, status: 400
      else
        render json: BoardGamesSerializer.new(carousel_games)
      end
    end
  end

  def show
    # BE app requests individual game data by ID
    render json: BoardGamesSerializer.new(BoardGame.find(params[:id]))
  end

  def multi_games
    ids = params[:ids]
    boardgames = BoardGame.where(id: ids)
    render json: BoardGamesSerializer.new(boardgames)
  end

  def all_by_params
    boardgames = filter_by_params(params)
    serialized_response = BoardGamesSerializer.new(boardgames).serializable_hash
    # require 'pry';binding.pry
    render json: {
      current_page: params[:page] || "1",
      total_pages: boardgames.total_pages.to_s,
      data: serialized_response[:data]
    }
  end

  private
  
  def choose_carousel(params)
    allowed_params = ["controller", "action"]
    unexpected_params = params.keys - allowed_params

    if unexpected_params.empty?
      # find top ranked games
      find_top_ranked
    elsif params[:subcategory]
      begin
        # find games by ranked category
        find_by_ranked_category(params[:subcategory])
      rescue ActiveRecord::StatementInvalid => e
        render json: { error: "Unexpected Parameter Value", status: 400 }, status: 400
      end
    elsif params[:cooperative] == 'true'
      # find cooperative games
      find_cooperative_games
    elsif params[:max_players] == '2'
      # find 2 player games
      find_2_player_games
    end
  end

  def find_by_ranked_category(subcategory)
    BoardGame.order(subcategory.to_sym).limit(20)
  end

  def find_cooperative_games
    BoardGame.where(cooperative: true).order(:rank).limit(20)
  end

  def find_2_player_games
    BoardGame.where(min_players: 2, max_players: 2).order(:rank).limit(20)
  end

  def find_by_min_players(min_players)
    BoardGame.where("min_players >= ?", min_players).order(:rank).limit(20)
  end

  def find_top_ranked
    BoardGame.where(rank: (1..20)).order(:rank)
  end

  def filter_by_params(params)
    categories = params[:categories]
    min_players = params[:min_players]
    max_players = params[:max_players]
    cooperative = params[:cooperative]
    board_games = BoardGame.all
    board_games = board_games.where('min_players >= ?', min_players) if min_players
    board_games = board_games.where('max_players <= ?', max_players) if max_players
    board_games = board_games.where(cooperative: true) if cooperative
    categories.split(',').each do |category|
      board_games = board_games.where("categories ILIKE ?", "%#{category}%")
    end if categories

    board_games.order(:rank).paginate(page: params[:page])
  end
end
