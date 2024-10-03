Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  namespace :users do
    resource :profile, only: [:show, :edit, :update]
  end
  resource :users, only: [:show]
  resources :rooms
  resources :reservations do
    collection do
      post :confirm
    end
    member do
      patch :edit_confirm
    end
  end
  get "searches/search"

  root to: "searches#top"
end
