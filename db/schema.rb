# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160819065056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.date     "published_date"
    t.integer  "page_number"
    t.integer  "category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "{:foreign_key=>true}_id"
    t.integer  "comments_id"
    t.index ["category_id"], name: "index_books_on_category_id", using: :btree
    t.index ["comments_id"], name: "index_books_on_comments_id", using: :btree
    t.index ["{:foreign_key=>true}_id"], name: "index_books_on_{:foreign_key=>true}_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_comments_on_book_id", using: :btree
  end

  add_foreign_key "books", "comments", column: "comments_id"
  add_foreign_key "comments", "books"
end
