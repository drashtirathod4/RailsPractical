class AddBooks < ActiveRecord::Migration[7.0]
  def up
    Book.create(name: '2 States', price: 200.0, author_id: '1')
  end
  def down
  end
end
