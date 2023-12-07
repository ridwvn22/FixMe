Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'

  resources :habits do
    resources :reminders
    resources :logs, only: [:new, :create, :index, :edit, :update, :destroy]  
    member do
      post 'mark_as_current'
    end

    member do
      get 'calendar'
    end
  end
end
