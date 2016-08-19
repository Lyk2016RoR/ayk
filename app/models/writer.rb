class Writer < ApplicationRecord
has_many :Books
validates :name, presence: true

end
