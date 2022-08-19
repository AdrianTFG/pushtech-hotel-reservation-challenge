Rails.application.routes.draw do
  resources :rooms
  resources :reservations, path: '/'
end
