class Api::V1::BoardGamesController < ApplicationController
  def index
    render json: BoardGamesSerializer.new(filter(params))
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
    render json: BoardGamesSerializer.new(boardgames)
  end

  private
  
  def filter(params)
    if params[:category]
      # find games by ranked category
      find_by_ranked_category(params[:category])
    elsif params[:min_players]
      if params[:max_players] == '2'
        # find 2 player games
        find_2_player_games
      else
        #find by min players
        find_by_min_players(params[:min_players])
      end
    else
      # find top ranked games
      find_top_ranked
    end
  end

  def find_by_ranked_category(category)
    BoardGame.order(category.to_sym).limit(20)
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

  # def top_20_by_rank
  #   where('rank > 0').order(:rank).limit(20)
  # end

  def filter_by_params(params)
    # require 'pry';binding.pry
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
