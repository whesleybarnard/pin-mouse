class ExternalPinsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def save_pin_id
    data = params.permit(:pin_uuid)
    puts "the pin to save is: #{data[:pin_uuid]}"

    PinterestService.create_external_pin(data[:pin_uuid])

    render json: { saved: true, pin: data[:pin_uuid] }
  end
end