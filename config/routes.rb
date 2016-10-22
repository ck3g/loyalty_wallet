Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  authenticated :user do
    root "dashboard#show", as: :authenticated_root
  end

  root "welcome#index"
end
