class AddColumnArticleUrl < ActiveRecord::Migration[6.1]
  def up
    add_column :recommended_books, :article_url, :string
  end

  def down
    remove_column :recommended_books, :article_url, :string
  end
end
