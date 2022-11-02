Rails.application.routes.draw do
  get 'dashboards/show'
  devise_for :users
  root to: "pages#home"

  resources :spaces, except: [:edit, :update] do
    resources :bookings, only: [:new, :create, :show]
    # resources :reviews, only: [:new, :create]
  end

  get "dashboard", to: "pages#dashboard"
end
