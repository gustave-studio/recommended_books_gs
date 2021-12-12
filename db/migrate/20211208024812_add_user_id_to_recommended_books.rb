class AddUserIdToRecommendedBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :recommended_books, :user_id, :string
  end
end
