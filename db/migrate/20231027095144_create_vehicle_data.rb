class CreateVehicleData < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_data do |t|

      t.string :title
      t.string :subtitle
      t.string :img_url
      t.string :category
      t.string :details
      t.string :pax_info
      t.string :category_key
      t.boolean :is_ryde
      t.string :review_rating
      t.string :review_bc
      t.string :review_brc
      t.string :pay_type
      t.integer :so_price
      t.integer :price
      t.string :price_msg
      t.string :cta_text
      t.integer :per_off
      t.integer :sod
      t.float :e_f_r
      t.integer :base_fare
      t.boolean :is_zero_booking
      t.json :cab_facilities
      t.string :d_s
      t.json :t_g_i
      t.json :offers
      t.string :dbg
      t.timestamps
    end
  end
end
