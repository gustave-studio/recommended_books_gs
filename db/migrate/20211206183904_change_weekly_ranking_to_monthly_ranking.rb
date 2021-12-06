class ChangeWeeklyRankingToMonthlyRanking < ActiveRecord::Migration[6.1]
  def change
    rename_table :weekly_rankings, :monthly_rankings
  end
end
