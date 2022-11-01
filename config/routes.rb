Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :spaces, except: [:edit, :update] do
    resources :bookings, only: [:new, :create, :show]
    # resources :reviews, only: [:new, :create]
  end
  # resources :spaces, only: :destroy
  # resources :reviews, only: :destroy
end
