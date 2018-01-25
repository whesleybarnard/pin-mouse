class ScheduledPinsController < ApplicationController
    protect_from_forgery unless: -> { request.format.json? }

    def create
        data = params.permit(:board_uuid, :note, :link, :image_url)

        PinterestService.create_scheduled_pin(data.to_h)

        render json: { saved: true }
    end

    def save_pin_id
        data = params.permit(:pin_uuid)

        puts "the pin to save is: #{data[:pin_uuid]}"
    end
end