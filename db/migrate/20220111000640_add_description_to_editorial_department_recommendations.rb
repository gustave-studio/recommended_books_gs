class AddDescriptionToEditorialDepartmentRecommendations < ActiveRecord::Migration[6.1]
  def change
    add_column :editorial_department_recommendations, :description, :text
  end
end
