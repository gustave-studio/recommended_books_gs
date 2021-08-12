class CreateRecommendedBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :recommended_books do |t|
      t.string :url
      t.integer :total_count
      t.date :aggregation_date

      t.timestamps
    end
  end
end
