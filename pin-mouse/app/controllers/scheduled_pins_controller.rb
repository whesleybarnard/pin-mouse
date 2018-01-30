class ScheduledPinsController < ApplicationController
  def index
    @pins = PinterestService.retrieve_to_be_scheduled_pins
    @boards = PinterestService.retrieve_boards
    @schedule_groups = ScheduledPin.schedule_groups
  end

  def schedule
    data = params.permit(:schedule_group, scheduled_pins: [[:scheduled_pin_id, :board_uuid]])
    # data = params

    # puts data.inspect
    ScheduleService.update_board_and_time_bulk data.to_h

    puts
  end
end