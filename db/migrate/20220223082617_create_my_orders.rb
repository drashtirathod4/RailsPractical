class CreateMyOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :my_orders do |t|
      t.integer :quantity
      t.references :my_product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
