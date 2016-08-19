class Book < ApplicationRecord
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	belongs_to :category
	belongs_to :writer

end
