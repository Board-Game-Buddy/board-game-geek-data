class AddColumnsToBoardGames < ActiveRecord::Migration[7.0]
  def change
    add_column :board_games, :year_published, :integer
    add_column :board_games, :rank, :integer
    add_column :board_games, :abstracts_rank, :integer
    add_column :board_games, :cgs_rank, :integer
    add_column :board_games, :childrens_games_rank, :integer
    add_column :board_games, :family_games_rank, :integer
    add_column :board_games, :party_games_rank, :integer
    add_column :board_games, :strategy_games_rank, :integer
    add_column :board_games, :thematic_rank, :integer
    add_column :board_games, :wargames_rank, :integer
  end
end
