SporkWeb::Application.routes.draw do

  resources :menus

  resources :items

  resources :authenticate
  resources :food_truck
  match ':action' => 'static#:action'
  root :to => 'static#index'
  
end
