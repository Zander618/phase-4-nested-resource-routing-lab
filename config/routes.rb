Rails.application.routes.draw do
  
  resources :users, only: [:show]
  resources :items, only: [:index]

  get '/users/:user_id/items', to: 'users#index_user_items' 
  get '/users/:user_id/items/:id', to: "users#items"
  post "/users/:user_id/items", to: "users#create"

end
