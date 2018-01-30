# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..5).each do |t|
  p = ExternalPin.new
  p.pin_uuid = '316166836332265804'
  p.resolved = false
  p.save!

  puts "Created ExternalPin: #{p.id}"
end

(1..5).each do |t|
  sp = ScheduledPin.new
  sp.note = 'some text'
  sp.link = 'some text'
  sp.image_url = 'some text'
  sp.status = :to_be_scheduled
  sp.save!

  puts "Created ScheduledPin: #{sp.id}"
end




