Rails.application.routes.draw do
  root to: 'scheduled_pins#index'

  resources :scheduled_pins, only: [:index]
  get '/scheduled_pins/scheduled', to: 'scheduled_pins#scheduled'

  post '/external_pins/save_pin_id', to: 'external_pins#save_pin_id'
  post '/scheduled_pins/schedule', to: 'scheduled_pins#schedule'
end
