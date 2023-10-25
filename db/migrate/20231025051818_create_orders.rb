class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :total_amount
      t.string :status
      t.string :razorpay_order_id
      t.string :pickup_location
      t.string :dropoff_location
      t.datetime :pickup_time

      t.timestamps
    end
  end
end
