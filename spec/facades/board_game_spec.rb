require 'rails_helper'

RSpec.describe BoardGamesFacade, type: :facade do
  before do
    @facade = BoardGamesFacade.new
  end

  describe '#get_board_games' do
    it 'fetches and updates board games' do
      allow(BoardGamesService).to receive_message_chain(:new, :get_board_games).and_return(
        "items" => {
          "item" => [
            { "id" => "123", "minplayers" => { "value" => "2" }, "maxplayers" => { "value" => "4" }, "minplaytime" => { "value" => "30" }, "maxplaytime" => { "value" => "60" }, "link" => [{ "type" => "boardgamecategory", "value" => "Strategy" }] }
          ]
        }
      )
      allow(BoardGame).to receive(:find_by).and_return(nil)

      expect(BoardGamesService).to receive_message_chain(:new, :get_board_games).with("123").and_call_original

      @facade.get_board_games(["123"])

      expect(BoardGame.last).to have_attributes(
        min_players: 2,
        max_players: 4,
        min_playtime: 30,
        max_playtime: 60,
        categories: "Strategy"
      )
    end

    it 'skips updating if min_players is not nil' do
      allow(BoardGame).to receive(:find_by).and_return(double("BoardGame", min_players: 3))

      expect(BoardGamesService).not_to receive(:new)

      @facade.get_board_games(["456"])
    end
  end

  describe '#game_categories' do
    it 'returns categories for a given game' do
      game = { "link" => [{ "type" => "boardgamecategory", "value" => "Adventure" }, { "type" => "boardgamecategory", "value" => "Exploration" }] }

      expect(@facade.game_categories(game)).to eq("Adventure, Exploration")
    end

    it 'returns nil if no categories are present' do
      game = { "link" => [] }

      expect(@facade.game_categories(game)).to be_nil
    end
  end

  describe '#cooperative_game?' do
    it 'returns true for a cooperative game' do
      game = { "link" => [{ "type" => "some_type", "value" => "Cooperative Game" }] }

      expect(@facade.cooperative_game?(game)).to be true
    end

    it 'returns false for a non-cooperative game' do
      game = { "link" => [{ "type" => "some_type", "value" => "Competitive Game" }] }

      expect(@facade.cooperative_game?(game)).to be false
    end

    it 'returns false if no link is present' do
      game = { "link" => nil }

      expect(@facade.cooperative_game?(game)).to be false
    end
  end
end