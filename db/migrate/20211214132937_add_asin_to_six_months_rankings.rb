class AddAsinToSixMonthsRankings < ActiveRecord::Migration[6.1]
  def change
    add_column :six_months_rankings, :asin, :string
  end
end
