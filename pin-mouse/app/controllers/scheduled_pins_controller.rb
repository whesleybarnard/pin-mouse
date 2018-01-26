class ScheduledPinsController < ApplicationController
    protect_from_forgery unless: -> { request.format.json? }

    def save_pin_id
        data = params.permit(:pin_uuid)

        # TODO: move to service
        puts "the pin to save is: #{data[:pin_uuid]}"
        pin = ExternalPin.new
        pin.pin_uuid = data[:pin_uuid]
        pin.resolved = false
        pin.save

        render json: { saved: true, pin: data[:pin_uuid] }
    end
end