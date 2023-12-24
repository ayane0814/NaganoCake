class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :uniti_price_including_tax, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
