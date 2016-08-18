class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.date :published_date
      t.integer :page_number

      t.timestamps
    end
  end
end
