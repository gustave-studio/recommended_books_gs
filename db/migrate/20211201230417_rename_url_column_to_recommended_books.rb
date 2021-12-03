class RenameUrlColumnToRecommendedBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :recommended_books, :url, :book_url
  end
end
