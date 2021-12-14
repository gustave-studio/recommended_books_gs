class ChangeDatatypeRankingOfSixMonthsRankings < ActiveRecord::Migration[6.1]
  def change
    change_column :six_months_rankings, :ranking, :integer
  end
end
