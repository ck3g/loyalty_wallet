Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions",
    passwords: "passwords"
  }

  authenticated :user do
    root "dashboard#show", as: :dashboard
  end

  get "/analytics" => "analytics#show"

  resources :deals, only: [:new, :create]
  resources :stamps, only: [:new, :create]
  resource :vendor, only: [:edit, :update]

  get "/users/:user_id/put-stamp" => "stamps#create"
  get "/about" => "about#index"

  root "welcome#index"
end
