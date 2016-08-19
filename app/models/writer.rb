class Writer < ApplicationRecord
has_many :Writer
validates :name, presence: true

end
