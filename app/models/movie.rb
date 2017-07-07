class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :title, :studio, :date, :price, :rating, :genre, presence: true
end
