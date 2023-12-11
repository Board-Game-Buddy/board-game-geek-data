FactoryBot.define do
  factory :board_game do
    sequence(:bgg_id)
    sequence(:title) { |n| "Mock Game #{n}" }
    sequence(:image_path) { |n| "https://example.com/mock_game_#{n}.jpg" }
    min_players { rand(1..4) }
    max_players { min_players + rand(0..2) }
    min_playtime { rand(30..240) }
    max_playtime { min_playtime + rand(0..120) }
    categories { ["Category#{rand(1..5)}", "Category#{rand(6..10)}"] }
    cooperative { [true, false].sample }
    sequence(:description) { |n| "This is a mock game description for Mock Game #{n}." }
    rating { rand(7.5..9.0).round(5) }
    year_published { rand(2000..2023) }
    sequence(:rank)
    abstracts_rank { [1, 2, 3, nil].sample }
    cgs_rank { [1, 2, 3, nil].sample }
    childrens_games_rank { [1, 2, 3, nil].sample }
    family_games_rank { [1, 2, 3, nil].sample }
    party_games_rank { [1, 2, 3, nil].sample }
    strategy_games_rank { [1, 2, 3, nil].sample }
    thematic_rank { [1, 2, 3, nil].sample }
    wargames_rank { [nil, 1, 2].sample }
  end
end