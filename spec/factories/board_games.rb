FactoryBot.define do
  factory :board_game do
    sequence(:bgg_id) { |n| n }
    image_path { "default_image_url" }
    min_players { 2 }
    max_players { 4 }
    min_playtime { 30 }
    max_playtime { 60 }
    categories { "Category1, Category2" }
    cooperative { false }
    description { "Default game description" }
  end
end