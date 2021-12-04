class AddArticleCreatedAtToRecommendedBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :recommended_books, :article_created_at, :datetime
  end
end
