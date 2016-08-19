class AddBookToFavorites < ActiveRecord::Migration[5.0]
  def change
    add_column :favorites, :book_id, :integer
    add_foreign_key :favorites, :books
  end
end
