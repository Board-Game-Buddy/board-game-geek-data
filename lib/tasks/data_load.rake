require "csv"

namespace :fill_database do
  desc "load board game data from csv"
  task board_games_csv: :environment do
    board_games = CSV.open "./db/data/board_games.csv", headers: true, header_converters: :symbol
    board_games.each do |board_game|
      BoardGame.create!(bgg_id: board_game[:id], title: board_game[:name], year_published: board_game[:yearpublished], rank: board_game[:rank], rating: board_game[:bayesaverage], abstracts_rank: board_game[:abstracts_rank], cgs_rank: board_game[:cgs_rank], childrens_games_rank: board_game[:childrensgames_rank], family_games_rank: board_game[:familygames_rank], party_games_rank: board_game[:partygames_rank], strategy_games_rank: board_game[:strategygames_rank], thematic_rank: board_game[:thematic_rank], wargames_rank: board_game[:wargames_rank])
    end
  end

  desc "consume BGG API to update existing database"
  task board_games_api: :environment do
    game_ids = BoardGame.all.pluck(:bgg_id).sort
    board_games = BoardGamesFacade.new.get_board_games(game_ids)
  end
end

namespace :export do
  desc 'Export PostgreSQL table to CSV'
  task postgres_to_csv: :environment do
    table_name = 'board_games'
    local_root_path = "/Users/lanebretschneider/turing_work/4mod/capstone"
    file_path = "#{local_root_path}/board-game-geek-data/db/data/board_game_middleman_api_data.csv"

    sql = "COPY (SELECT * FROM #{table_name}) TO '#{file_path}' WITH CSV HEADER;"
    ActiveRecord::Base.connection.execute(sql)

    puts "Table '#{table_name}' exported to CSV: #{file_path}"
  end
end
