class AddAsinToRecommendedBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :recommended_books, :asin, :string
  end
end
