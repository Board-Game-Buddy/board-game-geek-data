require 'rails_helper'

RSpec.describe Api::V1::BoardGamesController, type: :controller do
  describe 'GET #index' do
    context 'top_ranked_games' do
      it 'returns a successful response with a list of serialized board games' do
        create_list(:board_game, 40)

        get :index

        response_data = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(response_data['data']).to be_an(Array)
        expect(response_data['data'].count).to eq(20)

        response_data['data'].each do |board_game|
          attributes = board_game['attributes']

          expect(attributes).to include(
            'bgg_id', 'title', 'image_path', 'min_players', 'max_players',
            'min_playtime', 'max_playtime', 'categories', 'cooperative',
            'description', 'rating', 'year_published', 'rank', 'abstracts_rank',
            'cgs_rank', 'childrens_games_rank', 'family_games_rank',
            'party_games_rank', 'strategy_games_rank', 'thematic_rank', 'wargames_rank'
          )
        end
      end
    end

    xcontext 'when filtering by category' do
      it 'returns board games based on the specified category' do
        create_list(:board_game, 10, categories: ['Category1'])
        create_list(:board_game, 5, categories: ['Category2'])
    
        get :index, params: { categories: ['Category1'] }
    
        response_data = JSON.parse(response.body)
    
        expect(response).to have_http_status(:ok)
        expect(response_data['data']).to be_an(Array)
        expect(response_data['data'].count).to eq(10)
      end
    end

    context 'when filtering for 2 player games' do
      it 'returns board games suitable for 2 players' do
        create_list(:board_game, 10, min_players: 2, max_players: 2)

        get :index, params: { min_players: '2', max_players: '2' }

        response_data = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(response_data['data']).to be_an(Array)
      end
    end

    context 'when filtering by minimum players' do
      it 'returns board games based on the specified minimum players' do
        create_list(:board_game, 5, min_players: 2)
        create_list(:board_game, 10, min_players: 3)
        create_list(:board_game, 5, min_players: 4)
    
        get :index, params: { min_players: '3' }
    
        response_data = JSON.parse(response.body)
    
        expect(response).to have_http_status(:ok)
        expect(response_data['data']).to be_an(Array)
        expect(response_data['data'].count).to eq(15)
      end
    end

  end

  describe 'GET #show' do
    it 'returns a successful response with serialized board game by ID' do
      board_game = create(:board_game)

      get :show, params: { id: board_game.id }

      expect(response).to be_successful
      expect(response.content_type).to eq('application/json; charset=utf-8')

      parsed_response = JSON.parse(response.body)

      expect(parsed_response).to be_an_instance_of(Hash)
      expect(parsed_response['data']).to be_an_instance_of(Hash)
    end
  end

  describe 'GET #multi_games' do
    it 'returns a successful response with a list of serialized board games by IDs' do
      board_games = create_list(:board_game, 3)
      ids = board_games.map(&:id)

      get :multi_games, params: { ids: ids }

      response_data = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(response_data['data']).to be_an(Array)
      expect(response_data['data'].count).to eq(ids.count)

      response_data['data'].each do |board_game|
        attributes = board_game['attributes']

        expect(attributes).to include(
          'bgg_id', 'title', 'image_path', 'min_players', 'max_players',
          'min_playtime', 'max_playtime', 'categories', 'cooperative',
          'description', 'rating', 'year_published', 'rank', 'abstracts_rank',
          'cgs_rank', 'childrens_games_rank', 'family_games_rank',
          'party_games_rank', 'strategy_games_rank', 'thematic_rank', 'wargames_rank'
        )
      end
    end
  end
end