class ScheduledPinsController < ApplicationController
    protect_from_forgery unless: -> { request.format.json? }

    def create
        data = params.permit(:board_uuid, :note, :link, :image_url)

        PinterestService.create_scheduled_pin(data.to_h)

        render json: { saved: true }
    end
end