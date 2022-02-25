class ChangeTableProducts < ActiveRecord::Migration[7.0]
  change_table :products do |p|
    p.rename :name, :title 
    p.rename :desc, :description
    p.decimal :price
    p.integer :capacity
    p.boolean :is_active
    p.integer :status
  end
end
