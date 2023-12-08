require 'rails_helper'

RSpec.describe BoardGamesFacade, type: :facade do
  describe '#get_board_games' do
    let(:facade) { BoardGamesFacade.new }

    it 'updates existing BoardGames with data from BoardGamesService' do
      existing_game = FactoryBot.create(:board_game, bgg_id: 123)
      game_ids = [existing_game.bgg_id]

      allow_any_instance_of(BoardGamesService).to receive(:get_board_games).and_return({
        "items" => {
          "item" => [
            {
              "id" => existing_game.bgg_id,
              "image" => "new_image_url",
              "minplayers" => { "value" => 2 },
              "maxplayers" => { "value" => 4 },
              "minplaytime" => { "value" => 30 },
              "maxplaytime" => { "value" => 60 },
              "link" => [
                { "type" => "boardgamecategory", "value" => "Category1" },
                { "type" => "boardgamecategory", "value" => "Category2" },
              ],
              "description" => "New game description"
            }
          ]
        }
      })

      facade.get_board_games(game_ids)

      existing_game.reload

      expect(existing_game.image_path).to eq("default_image_url")
      expect(existing_game.min_players).to eq(2)
      expect(existing_game.max_players).to eq(4)
      expect(existing_game.min_playtime).to eq(30)
      expect(existing_game.max_playtime).to eq(60)
      expect(existing_game.categories).to eq("Category1, Category2")
      expect(existing_game.cooperative).to be_falsey # Assuming the game is not cooperative
      expect(existing_game.description).to eq("Default game description")
    end
  end
end