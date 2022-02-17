class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.integer :user_id
      t.integer :like
      t.references :commentable, polymorphic: true
      t.timestamps
    end
  end
end
