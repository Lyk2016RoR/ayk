class Writer < ApplicationRecord
has_many :Books, dependent: :destroy
validates :name, presence: true

end
