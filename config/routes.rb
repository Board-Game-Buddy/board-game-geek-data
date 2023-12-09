Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      get "/board_games/all_by_params", to: "board_games#all_by_params"
      
      get '/board_games', to: 'board_games#carousel'
      
      get '/multi_board_games', to: 'board_games#multi_games'
      
      resources :board_games, only: [:show]
    end
  end
end
