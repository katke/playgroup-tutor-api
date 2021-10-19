Rails.application.routes.draw do
  #users
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"
  #sessions
  post "/sessions" => "sessions#create"
  #messages
  get "/my-messages" => "messages#my_messages"
  get "/messages" => "messages#index"
  get "/messages/:id" => "messages#show"
  post "/messages" => "messages#create"
  post "/messages" => "messages#create"
  patch "/messages/:id" => "messages#update"
  delete "/messages/:id" => "messages#destroy"
  #relationships
  get "/friends" => "relationships#friends"
  get "/relationships" => "relationships#index"
  get "/relationships/:id" => "relationships#show"
  post "/relationships" => "relationships#create"
  patch "/relationships/:id" => "relationships#update"
  delete "/relationships/:id" => "relationships#destroy"
  #favorite_formats
  get "/favoriteformats" => "favoriteformats#index"
  get "/favoriteformats/:id" => "favoriteformats#show"
  post "/favoriteformats" => "favoriteformats#create"
  patch "/favoriteformats/:id" => "favoriteformats#update"
  delete "/favoriteformats/:id" => "favoriteformats#destroy"
end
