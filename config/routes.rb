Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :board_games, only: [:show]
      get '/board_games', to: '/api/v1/board_games#carousel'
    end
  end
  
  get '/api/v1/multi_board_games', to: 'api/v1/board_games#multi_games'
end
