class AddLikesCountToMonthlyRankings < ActiveRecord::Migration[6.1]
  def change
    add_column :monthly_rankings, :likes_count, :integer
  end
end
