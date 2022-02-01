json.set! :business_books do
  json.array! @business_books do |book|
    json.extract! book, :id, :title, :asin, :category, :target, :description, :order, :created_at, :updated_at
  end
end
