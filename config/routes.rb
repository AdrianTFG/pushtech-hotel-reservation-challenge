Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :reservations
      resources :rooms
    end
  end

  namespace :authentication, path: '', as: '' do
    resources :users, only: [:index, :new, :create], path: '/user'
    resources :sessions, only: [:new, :create, :destroy], path: '/login', path_names: {new: '/'}
  end

  resources :rooms
  resources :reservations, path: '/'

end
