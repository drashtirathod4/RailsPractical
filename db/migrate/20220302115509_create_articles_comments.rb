class CreateArticlesComments < ActiveRecord::Migration[7.0]
  def change
    create_table :articles_comments do |t|
      t.string :comment
      t.date :date_of_comment
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
