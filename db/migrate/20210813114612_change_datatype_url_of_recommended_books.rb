class ChangeDatatypeUrlOfRecommendedBooks < ActiveRecord::Migration[6.1]
  def change
    change_column :recommended_books, :url, :text
  end
end
