class Review < ApplicationRecord
	belongs_to :movie, optional: true
	belongs_to :user
	validates :comment, :rating, presence: true
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
  default_scope { order(created_at: :desc) }
  has_and_belongs_to_many :related_review, class_name: 'Review', join_table: 'related_review', 
    foreign_key: :review_parent_id, association_foreign_key: :review_child_id, dependent: :nullify, optional: true
end
