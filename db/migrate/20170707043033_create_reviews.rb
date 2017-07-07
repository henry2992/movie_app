class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.float :rating
      t.belongs_to :movie, index: true
      t.timestamps
    end
  end
end
