class ScheduleService
    def self.update_board_and_time_bulk(bulk_data)
        Rails.logger.info "Doing bulk update for scheduled pins"

        bulk_data = bulk_data.deep_symbolize_keys
        # puts
        # puts bulk_data.inspect

        grouped_data = group_and_flatten_schedules bulk_data[:scheduled_pins]
        puts grouped_data.inspect

        # scheduled_pins

        ScheduledPin.transaction do
            grouped_data.each do |t|
                puts t.inspect
                ScheduledPin.where(id: t[:ids]).update_all(name: 'test')
                # User.where(name: 'test1').update_all(name: 'test')
            end

            raise RuntimeError.new("temp stuff..................")
        end




        

        puts
    end

    private

    def self.group_and_flatten_schedules(data)
        
        a = data.group_by { |i| i[:board_uuid] }
        puts a.inspect
        puts

        arr = []
        a.each do |key, val|
            arr << { board_uuid: key, ids: val.map { |e| e[:scheduled_pin_id] } }
        end
        
        arr
    end
end