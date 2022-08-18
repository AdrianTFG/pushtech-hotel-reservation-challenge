Rails.application.routes.draw do
  get '/reservations', to: 'reservations#index'
end
