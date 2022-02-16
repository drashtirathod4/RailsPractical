# Migration with up/down

class ChangeColumnOfBooks < ActiveRecord::Migration[7.0]
  def up
    change_column :books, :price, :decimal, :precision => 5, :scale => 2
    add_column :books, :gst, :decimal
  end
  def down
    change_column :books, :price, :decimal, :precision => 6, :scale => 2
  end
end
