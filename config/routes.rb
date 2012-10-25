SporkWeb::Application.routes.draw do

  resources :users

  resources :menus

  resources :items

  resources :authenticate
  resources :food_truck

  match '/signup' => 'users#new'

  match ':action' => 'static#:action'
  root :to => 'static#index'
  
end
