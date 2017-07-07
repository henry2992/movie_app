class Movie < ApplicationRecord
  validates :title, :studio, :date, :price, :rating, :genre, presence: true
end
