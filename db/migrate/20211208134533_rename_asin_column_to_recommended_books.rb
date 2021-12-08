class RenameAsinColumnToRecommendedBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :recommended_books, :asin, :isbn
  end
end
