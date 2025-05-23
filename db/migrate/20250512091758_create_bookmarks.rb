class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.references :recipe, null: false, foreign_key: true
      t.text :comment
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
