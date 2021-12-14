class ChangeDatatypeRankingOfThreeMonthsRankings < ActiveRecord::Migration[6.1]
  def change
    change_column :three_months_rankings, :ranking, :integer
  end
end
