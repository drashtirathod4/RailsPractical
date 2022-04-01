class AddIndexToJwt < ActiveRecord::Migration[7.0]
  def change
    add_index :jwt_denylists, :jti
  end
end
