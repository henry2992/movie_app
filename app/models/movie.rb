class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :title, :studio, :date, :price, :genre, presence: true
  before_save :assign_rating

  def assign_rating
  	movie_rating = reviews.empty? ? 0 : reviews.pluck(:rating).inject(:+) / reviews.count
  	self.rating = movie_rating
  end
end
