class ChangeItEngineerToItEngineerBooks < ActiveRecord::Migration[6.1]
  def change
    rename_table :it_engineer_awards, :it_engineer_books_awards
  end
end
