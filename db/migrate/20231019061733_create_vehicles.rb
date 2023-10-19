class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_type
      t.string :license_plate
      t.string :color
      t.string :status
      t.boolean :active
      t.text :insurance_info
      t.text :registration_info
      t.integer :capacity
      t.integer :year
      t.text :details

      t.timestamps
    end
  end
end