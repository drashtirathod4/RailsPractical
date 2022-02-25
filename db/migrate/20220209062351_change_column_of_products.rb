class ChangeColumnOfProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :description, :text
    change_column :products, :capacity, :string
  end
end
