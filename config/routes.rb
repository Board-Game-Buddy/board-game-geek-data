Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      get "/board_games/all_by_params", to: "board_games#all_by_params"
      
      resources :board_games, only: [:index, :show]
    end
  end
  
  get '/api/v1/multi_board_games', to: 'api/v1/board_games#multi_games'

end
