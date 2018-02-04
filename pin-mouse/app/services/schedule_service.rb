class ScheduleService
    def self.update_board_and_time_bulk(bulk_data)
        Rails.logger.info "Doing bulk update for scheduled pins"

        bulk_data = bulk_data.deep_symbolize_keys

        grouped_data = group_and_flatten_schedules bulk_data[:scheduled_pins]
        puts grouped_data.inspect

        ScheduledPin.transaction do
            grouped_data.each do |t|
                puts t.inspect
                ScheduledPin.where(id: t[:ids]).update_all(status: :scheduled, board_uuid: t[:board_uuid], schedule_group: bulk_data[:schedule_group])
            end
        end

        true
    end

    def self.create_pins_for_schedule_group(schedule_group)
        Rails.logger.info "Starting the pin creation run for schedule-group: #{schedule_group}"

        scheduledPins = ScheduledPin.where(status: :scheduled, schedule_group: schedule_group)
        grouped_scheduled_pins = group_scheduled_by_board_1_each scheduledPins

        Rails.logger.info "#{grouped_scheduled_pins.length} pins to create during this run"

        grouped_scheduled_pins.each do |scheduled_pin|
            Rails.logger.info "Creating pin for scheduled_pin: #{scheduled_pin.id}"
            pin_info = PinterestResource.create_pin scheduled_pin
            Rails.logger.info "pin created, pinterest pin_uuid: #{pin_info.pin_uuid}"

            Rails.logger.info "updating status of scheduled_pin: #{scheduled_pin.id} to: #{:pinned}"
            scheduled_pin.status = :pinned
            scheduled_pin.pin_uuid = pin_info.pin_uuid
            scheduled_pin.pin_date = DateTime.now
            scheduled_pin.save
        end

        Rails.logger.info "pin creation run completed successfully"
        true
    end

    private

    def self.group_scheduled_by_board_1_each(scheduledPins)
        grouped = scheduledPins.group_by {|i| i[:board_uuid]}

        grouped_first = []
        grouped.each do |key, val|
            grouped_first << val.first
        end

        grouped_first
    end

    def self.group_and_flatten_schedules(data)
        
        a = data.group_by { |i| i[:board_uuid] }

        arr = []
        a.each do |key, val|
            arr << { board_uuid: key, ids: val.map { |e| e[:scheduled_pin_id] } }
        end
        
        arr
    end
end