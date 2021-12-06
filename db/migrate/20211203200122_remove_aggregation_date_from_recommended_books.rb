class RemoveAggregationDateFromRecommendedBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :recommended_books, :aggregation_date, :date
  end
end
