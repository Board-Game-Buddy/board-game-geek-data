FactoryBot.define do
  factory :board_game_for_facade, class: 'BoardGame' do
    sequence(:bgg_id) { |n| n }
    title { 'Mock Board Game'}
    image_path { "https://example.com/image.jpg" }
    min_players { 2 }
    max_players { 4 }
    min_playtime { 30 }
    max_playtime { 60 }
    categories { "Category1, Category2" }
    cooperative { false }
    description { "Sample description" }
    rating { 6.0 }
    year_published { 2023 }
    rank { 13 }
    abstracts_rank { nil }
    cgs_rank { nil }
    childrens_games_rank { nil }
    family_games_rank { nil }
    party_games_rank { nil }
    strategy_games_rank { 1 }
    thematic_rank { nil }
    wargames_rank { 2 }
  end
end