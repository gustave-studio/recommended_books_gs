class AddColumnBusinessBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :business_books, :target, :text
  end
end
