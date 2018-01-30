class CreateScheduledPins < ActiveRecord::Migration[5.1]
  def change
    create_table :scheduled_pins do |t|
      t.string :board_uuid
      t.string :note, null: false
      t.string :link, null: false
      t.string :image_url, null: false
      t.string :status, null: false, default: :to_be_scheduled
      t.string :schedule_group
      t.datetime :pin_date

      t.timestamps
    end
  end
end
