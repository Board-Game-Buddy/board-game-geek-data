require 'rails_helper'

RSpec.describe BoardGamesFacade, type: :facade do

  describe '#game_categories' do
    it 'returns categories for a given game' do
      game = { "link" => [{ "type" => "boardgamecategory", "value" => "Category1" }, { "type" => "boardgamecategory", "value" => "Category2" }] }
      expect(BoardGamesFacade.new.game_categories(game)).to eq("Category1, Category2")
    end

    it 'returns nil if there are no categories' do
      game = { "link" => [] }
      expect(BoardGamesFacade.new.game_categories(game)).to be_nil
    end
  end

  describe '#cooperative_game?' do
    it 'returns true if the game is a cooperative game' do
      game = { "link" => [{ "value" => "Cooperative Game" }] }
      expect(BoardGamesFacade.new.cooperative_game?(game)).to be_truthy
    end

    it 'returns false if the game is not a cooperative game' do
      game = { "link" => [] }
      expect(BoardGamesFacade.new.cooperative_game?(game)).to be_falsey
    end
  end
end