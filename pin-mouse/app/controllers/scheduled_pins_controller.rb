class ScheduledPinsController < ApplicationController
  def index
    @pins = PinterestService.retrieve_to_be_scheduled_pins
    @boards = PinterestService.retrieve_boards
  end

  def schedule
    # data = params.permit(:pin_uuid)
    data = params

    puts data.inspect

    puts
  end
end