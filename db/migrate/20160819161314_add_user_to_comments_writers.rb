class AddUserToCommentsWriters < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments_writers, :user, foreign_key: true
  end
end
