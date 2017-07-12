class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :title, :studio, :date, :price, :genre, presence: true
  before_save :assign_rating

  def assign_rating
  	movie_rating = reviews.pluck(:rating).inject(:+)
  	if movie_rating.nil?
  	  movie_rating = reviews.first.rating
  	else
  	  movie_rating = reviews.pluck(:rating).inject(:+) / reviews.count
  	end
  	self.rating = movie_rating
  end
end
