class AddAsinToEditorialDepartmentRecommendations < ActiveRecord::Migration[6.1]
  def change
    add_column :editorial_department_recommendations, :asin, :string
  end
end
