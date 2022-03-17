class ChangeColumnTypeOfMyuser < ActiveRecord::Migration[7.0]
  def change
    change_column :myusers, :subscription_email, :string
  end
end
