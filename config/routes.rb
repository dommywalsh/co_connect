Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :spaces do
    resources :bookings, only: [:new, :create, :show]
    # resources :reviews, only: [:new, :create]
  end

  get "dashboard", to: "pages#dashboard"
end
