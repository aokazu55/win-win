Rails.application.routes.draw do
  get 'services/new'
  get 'services/index'
  get 'services/show'
  get 'services/edit'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
