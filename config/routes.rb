Rails.application.routes.draw do

  resources :users_specialities do
      resources :reviews
      resources :interventions
  end
  resources :specialities
  devise_for :users


  root to: 'pages#home'
  get 'search' => 'pages#search'

  get 'users/:user_id/user_details', to: 'pages#user_profile_show', as: :user_profile_show
  get 'users/:user_id/user_profile', to: 'pages#user_profile_edit', as: :user_profile_edit
  patch 'users/:user_id', to: 'pages#user_profile_update', as: :user_profile_update
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
