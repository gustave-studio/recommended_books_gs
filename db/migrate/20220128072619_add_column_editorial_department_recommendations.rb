class AddColumnEditorialDepartmentRecommendations < ActiveRecord::Migration[6.1]
  def change
    add_column :editorial_department_recommendations, :target, :text
  end
end
