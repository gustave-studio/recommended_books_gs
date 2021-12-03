class AddTitleToRecommendedBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :recommended_books, :title, :string
    add_column :recommended_books, :likes_count, :integer
  end
end
