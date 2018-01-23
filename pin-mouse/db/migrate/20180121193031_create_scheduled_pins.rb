class CreateScheduledPins < ActiveRecord::Migration[5.1]
  def change
    create_table :scheduled_pins do |t|
      t.string :board_uuid
      t.string :note
      t.string :link
      t.string :image_url

      t.timestamp
    end
  end
end
