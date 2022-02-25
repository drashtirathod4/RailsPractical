class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.decimal :total_price
      t.integer :status

      t.timestamps
    end
  end
end
