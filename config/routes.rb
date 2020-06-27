Rails.application.routes.draw do
  get 'profiles/new'
  get 'profiles/index'
  get 'profiles/show'
  get 'profiles/edit'
  root 'services#index'

  devise_for :users,
    controllers: {
      sessions: 'devise/sessions',
      registrations: "users/registrations",
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :services do
    collection do
      match 'search' => 'services#search', via: [:get, :post]
    end
  end

  resources :profiles
  resources :favorites, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]

end