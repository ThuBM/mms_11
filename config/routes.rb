Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "teams/index"

  devise_for :users

  namespace :admin do
    root "dashboard#show"
    resources :skills
  end

  resources :users, only: [:show]
  resources :projects, only: [:show]
  resources :teams, only: [:index, :show]
end