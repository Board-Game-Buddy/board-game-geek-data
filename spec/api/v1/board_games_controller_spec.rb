require 'rails_helper'

RSpec.describe Api::V1::BoardGamesController, type: :controller do
  describe 'GET #carousel' do
    context 'top_ranked_games' do
      it 'returns a successful response with a list of serialized board games' do
        create_list(:board_game, 40)

        get :carousel

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

      it 'returns a list of cooperative games' do
        cooperative_game = create(:board_game, cooperative: true, rank: 1)
        non_cooperative_game = create(:board_game, cooperative: false, rank: 2)

        get :carousel, params: { cooperative: 'true' }

        response_data = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(response_data['data']).to be_an(Array)
        expect(response_data['data'].count).to eq(1)
        expect(response_data['data'][0]['attributes']['rank']).to eq(cooperative_game.rank)
      end

    # dunno about this one
      it 'returns a 400 status with an error message' do
        allow_any_instance_of(Api::V1::BoardGamesController)
          .to receive(:find_by_ranked_category)
          .and_raise(ActiveRecord::StatementInvalid.new('Simulated error'))
    
        get :carousel, params: { subcategory: "hehehehehe" }

        expect(response).to have_http_status(:bad_request)
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Invalid Parameter Value', 'status' => 400 })
      end
    
    end

    context 'when filtering by ranked category' do
      it 'returns board games based on the specified ranked category' do
        create(:board_game, party_games_rank: 1)
        create(:board_game, party_games_rank: 2)
        create(:board_game, party_games_rank: 3)
        create_list(:board_game, 3, party_games_rank: nil)

        get :carousel, params: { subcategory: 'party_games_rank' }

        response_data = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(response_data['data']).to be_an(Array)

        non_nil_party_games = response_data['data'].select { |game| game['attributes']['party_games_rank'].present? }

        expect(non_nil_party_games.count).to eq(3)
      end
    end

    context 'when filtering for 2 player games' do
      it 'returns board games suitable for 2 players' do
        create_list(:board_game, 10, max_players: 2)

        get :carousel, params: { max_players: '2' }

        response_data = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(response_data['data']).to be_an(Array)
      end
    end

    # this useage doesnt exist anymore
    # context 'when filtering by minimum players' do
    #   it 'returns board games based on the specified minimum players' do
    #     create_list(:board_game, 5, min_players: 2)
    #     create_list(:board_game, 10, min_players: 3)
    #     create_list(:board_game, 5, min_players: 4)

    #     get :carousel, params: { min_players: '2' }

    #     response_data = JSON.parse(response.body)

    #     expect(response).to have_http_status(:ok)
    #     expect(response_data['data']).to be_an(Array)
    #     expect(response_data['data'].count).to eq(15)
    #   end
    # end

    context 'issue with parameters' do
      it 'returns a 404 status with an error message' do
        get :carousel, params: { unexpected_param: 'value' }

        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Unexpected Parameters', 'status' => 404 })
      end
      
      it 'returns a 400 status with an error message' do
        get :carousel, params: { max_players: 'a' }

        expect(response).to have_http_status(:bad_request)
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Invalid Parameter Value', 'status' => 400 })
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

  describe 'GET #all_by_params' do
    context 'when filtering by parameters' do
      it 'returns a successful response with a list of serialized board games based on the specified parameters' do
        create_list(:board_game, 10, min_players: 2, max_players: 4, cooperative: true, categories: ['Strategy'])
        create_list(:board_game, 5, min_players: 3, max_players: 5, cooperative: false, categories: ['Party'])
        create_list(:board_game, 8, min_players: 1, max_players: 3, cooperative: true, categories: ['Family'])

        get :all_by_params, params: { min_players: '2', max_players: '4', cooperative: true, categories: 'Strategy' }

        response_data = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(response_data['data']).to be_an(Array)
        expect(response_data['data'].count).to eq(10)

        response_data['data'].each do |board_game|
          attributes = board_game['attributes']

          expect(attributes).to include(
            'bgg_id', 'title', 'image_path', 'min_players', 'max_players',
            'min_playtime', 'max_playtime', 'categories', 'cooperative',
            'description', 'rating', 'year_published', 'rank', 'abstracts_rank',
            'cgs_rank', 'childrens_games_rank', 'family_games_rank',
            'party_games_rank', 'strategy_games_rank', 'thematic_rank', 'wargames_rank'
          )
          expect(attributes['min_players']).to be >= 2
          expect(attributes['max_players']).to be <= 4
          expect(attributes['cooperative']).to eq(true)
          expect(attributes['categories']).to include('Strategy')
        end
      end
    end
  end
end