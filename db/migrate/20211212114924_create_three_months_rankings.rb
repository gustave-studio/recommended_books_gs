class CreateThreeMonthsRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :three_months_rankings do |t|
      t.string :url
      t.string :isbn
      t.integer :count
      t.string :ranking
      t.string :integer
      t.integer :likes_count

      t.timestamps
    end
  end
end
