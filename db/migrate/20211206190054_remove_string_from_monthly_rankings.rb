class RemoveStringFromMonthlyRankings < ActiveRecord::Migration[6.1]
  def change
    remove_column :monthly_rankings, :string, :string
  end
end
