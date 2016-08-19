class AddBookToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :books, foreign_key: true
  end
end
