class AddColumnToMyOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :my_orders, :total_price, :decimal
  end
end
