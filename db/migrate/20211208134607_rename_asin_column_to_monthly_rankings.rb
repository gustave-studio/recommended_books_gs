class RenameAsinColumnToMonthlyRankings < ActiveRecord::Migration[6.1]
  def change
    rename_column :monthly_rankings, :asin, :isbn
  end
end
