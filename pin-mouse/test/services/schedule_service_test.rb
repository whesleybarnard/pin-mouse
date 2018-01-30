require 'test_helper'

class ScheduleServiceTest < ActiveSupport::TestCase
    test "test ScheduleService group_and_flatten_schedules" do
        data = {:schedule_group=>"minutes_15", :scheduled_pins=>[{:scheduled_pin_id=>1, :board_uuid=>"856176647848743913"}, {:scheduled_pin_id=>2, :board_uuid=>"856176647848743913"}, {:scheduled_pin_id=>3, :board_uuid=>"7777777777"}, {:scheduled_pin_id=>4, :board_uuid=>"7777777777"}, {:scheduled_pin_id=>5, :board_uuid=>"856176647848743913"}]}
        
        grouped_schedules = ScheduleService.group_and_flatten_schedules data[:scheduled_pins]
        
        assert grouped_schedules.length == 2
    end

    
end