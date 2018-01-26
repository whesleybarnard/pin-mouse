class CreateExternalPin < ActiveRecord::Migration[5.1]
  def change
    create_table :external_pins do |t|
      t.string :pin_uuid;
      t.boolean :resolved;

      t.timestamps
    end
  end
end
