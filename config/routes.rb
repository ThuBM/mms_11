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
  end

  resources :users, only: :show
  resources :projects, only: :show
  resources :teams, only: [:index, :show]
end
