# Migration with Reversible

class ChangeTableBooks < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      change_table :books do |t|
        dir.up   { t.remove :gst}
        dir.down { t.decimal :gst, :precision => 7, :scale => 2 }
      end
    end
  end
end
