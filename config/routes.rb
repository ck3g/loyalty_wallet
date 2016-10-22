Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  authenticated :user do
    root "dashboard#show", as: :dashboard
  end

  resources :stamps, only: [:new, :create]

  root "welcome#index"
end
