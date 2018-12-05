Rails.application.routes.draw do
  resources :interventions
  resources :reviews
  resources :users_specialities
  resources :specialities
  devise_for :users
  root to: 'pages#home'
  get 'users/:user_id/user_profile', to: 'pages#user_profile_edit', as: :user_profile_edit
  patch 'users/:user_id', to: 'pages#user_profile_update', as: :user_profile_update
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
