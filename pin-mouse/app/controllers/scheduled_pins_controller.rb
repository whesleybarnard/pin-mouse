class ScheduledPinsController < ApplicationController
  def index
    @pins = PinterestService.retrieve_scheduled_pins_by_status(:to_be_scheduled)
    @boards = PinterestService.retrieve_boards
    @schedule_groups = ScheduledPin.schedule_groups
  end

  def schedule
    data = params.permit(:schedule_group, scheduled_pins: [[:scheduled_pin_id, :board_uuid]])
    ScheduleService.update_board_and_time_bulk data.to_h

    render json: { saved: true }
  end

  def scheduled
    @pins = PinterestService.retrieve_scheduled_pins_by_status(:scheduled)
    @boards = PinterestService.retrieve_boards
    @schedule_groups = ScheduledPin.schedule_groups
    @schedule_status = ScheduledPin.schedule_status
  end

  def pinned
    @pins = PinterestService.retrieve_scheduled_pins_by_status(:pinned)
    @boards = PinterestService.retrieve_boards
    @schedule_groups = ScheduledPin.schedule_groups
    @schedule_status = ScheduledPin.schedule_status
  end
end