class AddWriterToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :writer, foreign_key: true
  end
end
