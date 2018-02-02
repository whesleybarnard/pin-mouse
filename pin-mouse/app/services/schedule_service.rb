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

        true
    end

    private

    def self.group_and_flatten_schedules(data)
        
        a = data.group_by { |i| i[:board_uuid] }

        arr = []
        a.each do |key, val|
            arr << { board_uuid: key, ids: val.map { |e| e[:scheduled_pin_id] } }
        end
        
        arr
    end
end