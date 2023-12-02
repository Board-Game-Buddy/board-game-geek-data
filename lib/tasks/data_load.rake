require "csv"

namespace :fill_database do
  desc "load board game data from csv"
  task board_games_csv: :environment do
    board_games = CSV.open "./db/data/test.csv", headers: true, header_converters: :symbol
    board_games.each do |board_game|
      BoardGame.create!(bgg_id: board_game[:id], title: board_game[:name], year_published: board_game[:yearpublished], rank: board_game[:rank], rating: board_game[:bayesaverage], abstracts_rank: board_game[:abstracts_rank], cgs_rank: board_game[:cgs_rank], childrens_games_rank: board_game[:childrensgames_rank], family_games_rank: board_game[:familygames_rank], party_games_rank: board_game[:partygames_rank], strategy_games_rank: board_game[:strategygames_rank], thematic_rank: board_game[:thematic_rank], wargames_rank: board_game[:wargames_rank])
    end
  end

  desc "consume BGG API to update existing database"
  task board_games_api: :environment do
    board_games = BoardGamesFacade.new.get_board_games(BoardGame.all.pluck(:bgg_id))
  end
end

