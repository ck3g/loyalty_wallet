Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    root "dashboard#show", as: :authenticated_root
  end

  root "welcome#index"
end
