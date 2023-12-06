require 'rails_helper'

RSpec.describe 'BoardGameSerializer' do
  it 'returns a serialized boardgame object' do
    boardgame1 = BoardGame.create!(bgg_id: 224517, title: "Brass: Birmingham", image_path: "https://cf.geekdo-images.com/x3zxjr-Vw5iU4yDPg70Jgw__original/img/FpyxH41Y6_ROoePAilPNEhXnzO8=/0x0/filters:format(jpeg)/pic3490053.jpg", min_players: 2, max_players: 4, min_playtime: 60, max_playtime: 120, categories: "Age of Reason, Economic, Industry / Manufacturing, Post-Napoleonic, Trains, Transportation" , cooperative: false , description: "Brass: Birmingham is an economic strategy game sequel to Martin Wallace' 2007 masterpiece, Brass. Brass: Birmingham tells the story of competing entrepreneurs in Birmingham during the industrial revolution, between the years of 1770-1870.&#10;&#10;It offers a very different story arc and experience from its predecessor. As in its predecessor, you must develop, build, and establish your industries and network, in an effort to exploit low or high market demands. The game is played over two halves: the canal era (years 1770-1830) and the rail era (years 1830-1870). To win the game, score the most VPs. VPs are counted at the end of each half for the canals, rails and established (flipped) industry tiles.&#10;&#10;Each round, players take turns according to the turn order track, receiving two actions to perform any of the following actions (found in the original game):&#10;&#10;1) Build - Pay required resources and place an industry tile.&#10;2) Network - Add a rail / canal link, expanding your network.&#10;3) Develop - Increase the VP value of an industry.&#10;4) Sell - Sell your cotton, manufactured goods and pottery.&#10;5) Loan - Take a &pound;30 loan and reduce your income.&#10;&#10;Brass: Birmingham also features a new sixth action:&#10;&#10;6) Scout - Discard three cards and take a wild location and wild industry card. (This action replaces Double Action Build in original Brass.)&#10;&#10;", rating: 8.42201, year_published: 2018, rank: 1, strategy_games_rank: 1)

    serialized_bg = BoardGamesSerializer.new(boardgame1).serializable_hash

    expected_format = {
      data: {
        "id": "1",
          "type": "boardgame",
          "attributes": {
            "title": boardgame1.title,
            "cover_image": boardgame1.image_path,
            "min_players": boardgame1.min_players,
            "max_players": boardgame1.max_players,
            "min_playtime": boardgame1.min_playtime,
            "max_playtime": boardgame1.max_playtime,
            "categories": [
              "Age of Reason", 
              "Economic", 
              "Industry / Manufacturing", 
              "Post-Napoleonic", 
              "Trains",
              "Transportation"
            ],
            "cooperative": false,
            "description": boardgame1.description,
            "rating": boardgame1.rating,
            "year_published": boardgame1.year_published,
            "rank": 1,
            "strategy_games_rank": 1
          }
        }
    }

    expect(serialized_bg).to have_key(:data)
    expect(serialized_bg[:data]).to have_key(:attributes)
    expect(serialized_bg[:data][:attributes]).to have_key(:title)
    expect(serialized_bg[:data][:attributes]).to have_key(:image_path)
    expect(serialized_bg[:data][:attributes]).to have_key(:min_players)
    expect(serialized_bg[:data][:attributes]).to have_key(:max_players)
    expect(serialized_bg[:data][:attributes]).to have_key(:min_playtime)
    expect(serialized_bg[:data][:attributes]).to have_key(:max_playtime)
    expect(serialized_bg[:data][:attributes]).to have_key(:categories)
    expect(serialized_bg[:data][:attributes]).to have_key(:cooperative)
    expect(serialized_bg[:data][:attributes]).to have_key(:description)
    expect(serialized_bg[:data][:attributes]).to have_key(:rating)
    expect(serialized_bg[:data][:attributes]).to have_key(:year_published)
    expect(serialized_bg[:data][:attributes]).to have_key(:rank)
    expect(serialized_bg[:data][:attributes]).to have_key(:strategy_games_rank)

  end
end