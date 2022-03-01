class RemoveColumnFromMyUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :my_users, :name, :string
    remove_column :my_users, :phone, :string
    remove_column :my_users, :role, :string
  end
end
