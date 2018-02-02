# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

env :PATH, ENV['PATH']
set :environment, ENV['RAILS_ENV'] || 'development'
set :output, {:error => 'log/whenever.error.log', :standard => 'log/whenever.cron.log'}

every 1.minutes do
    runner "ScheduleService.create_pins_for_schedule_group(:minutes_15)"
end