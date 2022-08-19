Rails.application.routes.draw do
  post '/reservations', to: 'reservations#create'
  get '/reservations/new', to: 'reservations#new', as: 'new_reservation'
  get '/reservations', to: 'reservations#index'
  get '/reservations/:id', to: 'reservations#show', as: 'reservation'
  get '/reservations/:id/edit', to: 'reservations#edit', as: 'edit_reservation'
  patch '/reservations/:id', to: 'reservations#update'
end
