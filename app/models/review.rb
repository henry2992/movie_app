class Review < ApplicationRecord
	belongs_to :movie
	validates :comment, :rating, presence: true
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
end
