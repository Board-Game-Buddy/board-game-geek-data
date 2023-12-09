require 'rails_helper'

RSpec.describe BoardGamesFacade, type: :facade do
  before do
    @existing_game = FactoryBot.create(:board_game, bgg_id: 123)
    @game_ids = [@existing_game.bgg_id]
    @facade = BoardGamesFacade.new
  end

  it 'updates existing BoardGames with data from BoardGamesService' do
    @facade.get_board_games(@game_ids)
    @existing_game.reload

    expect(@existing_game.image_path).to start_with("https://example.com/mock_game")
    expect(@existing_game.min_players).to be_an(Integer)
    expect(@existing_game.max_players).to be_an(Integer)
    expect(@existing_game.min_playtime).to be_an(Integer)
    expect(@existing_game.max_playtime).to be_an(Integer)
    expect(JSON.parse(@existing_game.categories)).to be_kind_of(Array)
    expect(@existing_game.cooperative).to be_in([true, false])
    expect(@existing_game.description).to be_a(String)
  end
end