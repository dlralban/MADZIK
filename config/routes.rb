Rails.application.routes.draw do
  devise_for :users
  root to: "instruments#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :instruments do
    collection do
      get :my_instruments
    end
    resources :rentals, only: %i[new create]
  end

  resources :rentals, only: %i[index show edit update destroy]
end
