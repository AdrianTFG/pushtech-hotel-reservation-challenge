Rails.application.routes.draw do
  resources :rooms
  resources :reservations, path: '/'

  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create]
  end
end
