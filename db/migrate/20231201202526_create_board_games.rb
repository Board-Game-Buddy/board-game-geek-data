class CreateBoardGames < ActiveRecord::Migration[7.0]
  def change
    create_table :board_games do |t|
      t.integer :bgg_id
      t.string :title
      t.string :image_path
      t.integer :min_players
      t.integer :max_players
      t.integer :min_playtime
      t.integer :max_playtime
      t.string :categories
      t.boolean :cooperative
      t.string :description
      t.float :rating

      t.timestamps
    end
  end
end
