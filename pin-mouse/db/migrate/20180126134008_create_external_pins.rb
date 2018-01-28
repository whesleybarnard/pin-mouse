class CreateExternalPins < ActiveRecord::Migration[5.1]
  def change
    create_table :external_pins do |t|
      t.string :pin_uuid, null: false
      t.boolean :resolved, null: false, default: false

      t.timestamps
    end
  end
end
