class AddDescriptionToItEngineerBooksAwards < ActiveRecord::Migration[6.1]
  def change
    add_column :it_engineer_books_awards, :description, :text
  end
end
