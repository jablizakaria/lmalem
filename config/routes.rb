Rails.application.routes.draw do
  resources :interventions
  resources :reviews
  resources :users_specialities
  resources :specialities
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
