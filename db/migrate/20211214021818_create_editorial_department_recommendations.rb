class CreateEditorialDepartmentRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :editorial_department_recommendations do |t|
      t.string :title
      t.string :isbn
      t.string :category
      t.integer :order

      t.timestamps
    end
  end
end
