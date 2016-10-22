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

  resources :stamps, only: [:new, :create]

  get "/users/:user_id/put-stamp" => "stamps#create"

  root "welcome#index"
end
