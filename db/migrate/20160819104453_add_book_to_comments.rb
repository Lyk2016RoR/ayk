class AddBookToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :book_id, :integer
    add_foreign_key :comments, :books
  end
end
