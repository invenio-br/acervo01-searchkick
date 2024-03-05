Rails.application.routes.draw do
  namespace :admin do
    resources :places
    resources :tags

    root to: "places#index"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :places, only: [:index, :show] do
    collection do
      get :search
    end
  end

  # Defines the root path route ("/")
  root "places#index"
end
