class CreateWeeklyRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :weekly_rankings do |t|
      t.string :url
      t.string :asin
      t.string :string
      t.integer :count
      t.integer :ranking

      t.timestamps
    end
  end
end
