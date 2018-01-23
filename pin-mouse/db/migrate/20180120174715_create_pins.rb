class CreatePins < ActiveRecord::Migration[5.1]
  def change
    create_table :pins do |t|
      t.string :url
      t.string :title
      t.string :description

      t.timestamp
    end
  end
end
