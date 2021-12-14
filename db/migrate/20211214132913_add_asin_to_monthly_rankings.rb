class AddAsinToMonthlyRankings < ActiveRecord::Migration[6.1]
  def change
    add_column :monthly_rankings, :asin, :string
  end
end
