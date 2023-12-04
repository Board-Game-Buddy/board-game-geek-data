# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_01_215914) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_games", force: :cascade do |t|
    t.integer "bgg_id"
    t.string "title"
    t.string "image_path"
    t.integer "min_players"
    t.integer "max_players"
    t.integer "min_playtime"
    t.integer "max_playtime"
    t.string "categories"
    t.boolean "cooperative"
    t.string "description"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year_published"
    t.integer "rank"
    t.integer "abstracts_rank"
    t.integer "cgs_rank"
    t.integer "childrens_games_rank"
    t.integer "family_games_rank"
    t.integer "party_games_rank"
    t.integer "strategy_games_rank"
    t.integer "thematic_rank"
    t.integer "wargames_rank"
  end

end
