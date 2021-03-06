json.set! :editorial_department_recommendations do
  json.array! @recommendations do |recommendation|
    json.extract! recommendation, :id, :title, :asin, :category, :target, :description, :order, :created_at, :updated_at
  end
end
