class AddWriterToCommentsWriters < ActiveRecord::Migration[5.0]
  def change
    add_column :comments_writers, :writer_id, :integer
    add_foreign_key :comments_writers, :writers
  end
end
