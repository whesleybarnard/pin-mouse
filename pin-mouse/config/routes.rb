Rails.application.routes.draw do
  root to: 'scheduled_pins#index'

  resources :pins, only: [:index]

  post '/external_pins/save_pin_id', to: 'external_pins#save_pin_id'
  post '/scheduled_pins/schedule', to: 'scheduled_pins#schedule'
end
