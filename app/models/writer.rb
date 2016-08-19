class Writer < ApplicationRecord
has_many :books, dependent: :destroy
validates :name, presence: true
has_many :comments_writer, dependent: :destroy
end
