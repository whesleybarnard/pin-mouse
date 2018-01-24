class PinterestService
  def self.retrieve_pins
    pins = PinterestResource.retrieve_pins
  end

  def self.create_scheduled_pin(scheduled_pin)
    pin = ScheduledPin.new(scheduled_pin)
    pin.save

    puts scheduled_pin.inspect
    puts pin.inspect
  end
end