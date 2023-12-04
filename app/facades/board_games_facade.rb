class BoardGamesFacade
  def get_board_games(game_ids)
    until game_ids.empty?
      three_hundred_ids = game_ids.shift(300)
      last_game = BoardGame.find_by(bgg_id: three_hundred_ids.last)
      if last_game.min_players.nil?
        games = BoardGamesService.new.get_board_games(three_hundred_ids.join(","))["items"]["item"]
        games.each do |game|
          existing_game = BoardGame.find_by(bgg_id: game["id"].to_i)
          existing_game.update(
            image_path: game&.dig("image"),
            min_players: game&.dig("minplayers", "value").to_i,
            max_players: game&.dig("maxplayers", "value").to_i,
            min_playtime: game&.dig("minplaytime", "value").to_i,
            max_playtime: game&.dig("maxplaytime", "value").to_i,
            categories: game_categories(game),
            cooperative: cooperative_game?(game),
            description: game&.dig("description")
          )
        end
        sleep 5
      end
    end
  end

  def game_categories(game)
    if game["link"] && !game["link"].select { |link| link["type"] == "boardgamecategory" }.empty?
      game["link"].select { |link| link["type"] == "boardgamecategory" }.map { |category| category["value"] }.join(", ")
    end
  end

  def cooperative_game?(game)
    if game["link"]
      !game["link"].select { |link| link["value"] == "Cooperative Game"}.empty?
    end
  end
end