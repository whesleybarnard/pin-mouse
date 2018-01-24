Rails.application.routes.draw do
  root to: 'pins#index'

  resources :pins, only: [:index]
  resources :scheduled_pins, only: [:create]
end
