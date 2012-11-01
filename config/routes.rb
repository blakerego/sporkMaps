SporkWeb::Application.routes.draw do

  get "sessions/new"

  resources :orders

  resources :order_items

  resources :food_trucks

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  resources :menus

  resources :items

  resources :authenticate
  resources :food_truck

  match '/signup' => 'users#new'
  match '/signin' => 'sessions#new'
  match '/signout' => 'session#destroy'
  match ':action' => 'static#:action'
  root :to => 'static#index'
  
end
