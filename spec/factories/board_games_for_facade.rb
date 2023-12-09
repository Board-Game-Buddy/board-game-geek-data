FactoryBot.define do
  factory :board_game_for_facade, class: 'BoardGame' do
    bgg_id { Faker::Number.unique.number(digits: 5) }
    min_players { Faker::Number.between(from: 1, to: 5) }
    max_players { min_players + rand(0..2) }
    min_playtime { Faker::Number.between(from: 30, to: 60) }
    max_playtime { min_playtime + rand(0..30) }
    categories { [Faker::Lorem.word, Faker::Lorem.word] }
    cooperative { [true, false].sample }
    description { Faker::Lorem.sentence }
  end
end