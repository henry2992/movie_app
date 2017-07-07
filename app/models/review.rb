class Review < ApplicationRecord
	belongs_to :movie
	validates :comment, :rating, presence: true
end
