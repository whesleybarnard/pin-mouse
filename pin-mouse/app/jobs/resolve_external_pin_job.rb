class ResolveExternalPinJob < ApplicationJob
  queue_as :default

  def perform(external_pin)
    Rails.logger.info("Starting the retrieval of :#{external_pin.pin_uuid}")

    PinterestService.create_scheduled_pin(external_pin)

    Rails.logger.info("Completed the retrieval of :#{external_pin.pin_uuid}")
  end
end
