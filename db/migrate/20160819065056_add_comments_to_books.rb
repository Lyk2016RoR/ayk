class AddCommentsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :comments, foreign_key: true
  end
end
