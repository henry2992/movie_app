class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :title, :studio, :date, :price, :genre, presence: true
end
