Rails.application.routes.draw do

  resources :points
  get "log_out" => 'sessions#destroy', :as => "log_out"
  get "log_in" => 'sessions#new', :as => "log_in"
  get "sign_up" => 'users#new', :as => "sign_up"

  get "map" => 'maps#index', :as => "map"
  post "map" => 'maps#create', :as => "map_post"

  root :to => "home#index"

  resources :users
  resources :sessions
  resources :profiles
end
