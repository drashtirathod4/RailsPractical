class CreateMyusers < ActiveRecord::Migration[7.0]
  def change
    create_table :myusers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.boolean :subscription
      t.text :subscription_email

      t.timestamps
    end
  end
end
