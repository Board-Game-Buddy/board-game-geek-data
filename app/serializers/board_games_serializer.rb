class BoardGamesSerializer
  include JSONAPI::Serializer
    attributes :bgg_id, :title, :image_path, :min_players, :max_players, :min_playtime, :max_playtime, :categories, :cooperative, :description, :rating, :year_published, :rank, :abstracts_rank, :cgs_rank, :childrens_games_rank, :family_games_rank, :party_games_rank, :strategy_games_rank, :thematic_rank, :wargames_rank
end