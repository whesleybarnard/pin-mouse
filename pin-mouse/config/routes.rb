Rails.application.routes.draw do
  root to: 'scheduled_pins#index'

  resources :scheduled_pins, only: [:index]
  get '/scheduled_pins/scheduled', to: 'scheduled_pins#scheduled'
  post '/scheduled_pins/schedule', to: 'scheduled_pins#schedule'
  get '/scheduled_pins/pinned', to: 'scheduled_pins#pinned'

  post '/external_pins/save_pin_id', to: 'external_pins#save_pin_id'

end
