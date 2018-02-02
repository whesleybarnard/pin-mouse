class PinterestService

  def self.create_external_pin(pin_uuid)
    pin = ExternalPin.new
    pin.pin_uuid = pin_uuid
    pin.resolved = false
    pin.save

    ResolveExternalPinJob.perform_later pin

    pin
  end

  def self.retrieve_scheduled_pins_by_status(status)
    ScheduledPin.where(status: status)
  end

  def self.retrieve_boards
    PinterestResource.retrieve_boards
  end

  def self.retrieve_pin(pin_uuid)
    PinterestResource.retrieve_pin(pin_uuid)

  rescue RuntimeError => e
    Rails.logger.error "Invalid pin: #{e}"
    false
  end

  def self.create_scheduled_pin(external_pin)
    pin = retrieve_pin(external_pin.pin_uuid)

    scheduledPin = ScheduledPin.new
    scheduledPin.note = pin.note
    scheduledPin.link = pin.link
    scheduledPin.image_url = pin.image_url
    scheduledPin.status = :to_be_scheduled
    scheduledPin.save

    external_pin.resolved = true
    external_pin.save

    scheduledPin
  end

end