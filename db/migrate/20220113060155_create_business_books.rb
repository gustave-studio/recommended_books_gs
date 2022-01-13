class CreateBusinessBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :business_books do |t|
      t.string :title
      t.string :isbn
      t.string :asin
      t.text :description
      t.string :category
      t.integer :order

      t.timestamps
    end
  end
end
