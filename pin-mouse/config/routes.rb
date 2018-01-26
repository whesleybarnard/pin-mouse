Rails.application.routes.draw do
  # TODO: need proper default root.
  # root to: 'pins#index'
  root to: 'pins#root_json'

  resources :pins, only: [:index]

  post '/scheduled_pins/save_pin_id', to: 'scheduled_pins#save_pin_id'
end
