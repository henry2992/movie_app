class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :studio
      t.date :date
      t.float :price
      t.float :rating
      t.string :genre

      t.timestamps
    end
  end
end
