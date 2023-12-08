Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :board_games, only: [:index, :show]
    end
  end
  
  get '/api/v1/multi_board_games', to: 'api/v1/board_games#multi_games'

end
