class AddAsinToThreeMonthsRankings < ActiveRecord::Migration[6.1]
  def change
    add_column :three_months_rankings, :asin, :string
  end
end
