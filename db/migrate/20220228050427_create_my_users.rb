class CreateMyUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :my_users do |t|
      t.string :name
      t.string :phone
      t.string :role

      t.timestamps
    end
  end
end
