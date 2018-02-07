namespace :pin do
    desc "Call pinterest boards"
    task :boards do
        call_string = 'rails runner -e development "PinterestResource.retrieve_boards"'
        puts "running command: #{call_string}"
        system call_string
    end

    desc "Run ScheduleService to create scheduled pins"
    task :run_15 do
        call_string = 'rails runner -e development "ScheduleService.create_pins_for_schedule_group(:minutes_15)"'
        puts "running command: #{call_string}"
        system call_string
    end
end