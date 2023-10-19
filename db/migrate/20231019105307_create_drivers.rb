class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :license_number
      t.string :vehicle_type
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
