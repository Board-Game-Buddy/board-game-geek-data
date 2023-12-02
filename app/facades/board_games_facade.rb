class BoardGamesFacade
  def get_board_games(game_ids)
    until game_ids.empty?
      five_hundred_ids = game_ids.shift(500).join(",")
      games = BoardGamesService.new.get_board_games(five_hundred_ids)["items"]["item"]
      games.each do |game|
        existing_game = BoardGame.find_by(bgg_id: game["id"].to_i)
        existing_game.update(image_path: game["image"], min_players: game["minplayers"]["value"].to_i, max_players: game["maxplayers"]["value"].to_i, min_playtime: game["minplaytime"]["value"].to_i, max_playtime: game["maxplaytime"]["value"].to_i, categories: game["link"].select { |category| category["type"] == "boardgamecategory" }.map { |category| category["value"] }.join(", "), cooperative: !game["link"].find { |category| category["value"] == "Cooperative Game" }.nil?, description: game["description"])
      end
      sleep 5
    end
  end
end