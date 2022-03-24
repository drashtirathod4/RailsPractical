class CreateMailUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :mail_users do |t|
      t.string :name
      t.string :email
      t.string :picture

      t.timestamps
    end
  end
end
