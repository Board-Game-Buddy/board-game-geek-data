class BoardGamesService
  def get_board_games(game_ids)
    response = conn.get("thing") do |req|
      req.params["id"] = game_ids
    end
    Hash.from_xml(response.body)
  end

  private

  def conn
    Faraday.new(url: "https://boardgamegeek.com/xmlapi2/") do |f|
      f.headers["Content-Type"] = "application/xml"
      f.options[:timeout] = 50000
    end
  end
end