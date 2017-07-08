class AddRelatedReviewsTable < ActiveRecord::Migration[5.1]
  def change
  	 create_table :related_review do |t|
      t.references :review_parent, null: false
      t.references :review_child, null: false
    end
    add_index :related_review, [:review_parent_id, :review_child_id], unique: true
    add_foreign_key :related_review, :reviews, column: :review_parent_id
    add_foreign_key :related_review, :reviews, column: :review_child_id
  end
end