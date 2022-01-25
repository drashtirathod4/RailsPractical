class AddAuthors < ActiveRecord::Migration[7.0]
  def up
    Author.create(fname: 'Chetan', lname: 'Bhagat', dob: '22 April 1974', email: 'chetan@gmail.com')
  end
  def down
  end
end
