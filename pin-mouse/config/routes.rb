Rails.application.routes.draw do
  root to: 'pins#index'

  resources :pins, only: [:index]
  resources :scheduled_pins, only: [:create]

  post '/scheduled_pins/save_pin_id', to: 'scheduled_pins#save_pin_id'
end
