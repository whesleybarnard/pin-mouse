# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ExternalPin.delete_all
ScheduledPin.delete_all
%w(424745808595885010 37506609380336632 560346378623556422 338966309446192996 526499012678792344).each do |pin_id|

  pin = ExternalPin.new
  pin.pin_uuid = pin_id
  pin.resolved = false
  pin.save

  ResolveExternalPinJob.perform_now pin

  puts "Created ExternalPin: #{pin.id}"
end

# ScheduledPin.delete_all
# (1..5).each do |t|
#   sp = ScheduledPin.new
#   sp.note = 'some text'
#   sp.link = 'some text'
#   sp.image_url = 'some text'
#   sp.status = :to_be_scheduled
#   sp.save!
#
#   puts "Created ScheduledPin: #{sp.id}"
# end
