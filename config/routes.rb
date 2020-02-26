Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'doctors', to: 'doctors#index', as: 'doctors'
  get "test", to: 'pages#test'
  resources :users, only: [] do
    resources :appointments, only: [:new, :create]
  end
  get "/users", to: "doctors#index", as: :users
  get "/users/:id", to: "doctors#show", as: :user
end
