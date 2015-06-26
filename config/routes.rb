Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  delete "logout" => "users/sign_out"

  devise_for :users, path: "", path_name: {sign_out: "logout"}, controllers: {
    sessions: "custom_devise/sessions"
  }

  namespace :admin do
    root "dashboard#show"
    resources :skills
    resources :positions
    resources :users
    resources :projects
  end

  resources :users
  resources :projects, only: :show
  resources :teams, only: [:index, :show]
  resources :activities, only: :index
end
