class CreateItEngineerAwards < ActiveRecord::Migration[6.1]
  def change
    create_table :it_engineer_awards do |t|
      t.string :title
      t.string :isbn
      t.string :category
      t.string :award
      t.integer :order

      t.timestamps
    end
  end
end
