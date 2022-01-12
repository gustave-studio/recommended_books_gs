json.set! :it_engineer_books_awards do
  json.array! @awards do |award|
    json.extract! award, :id, :title, :asin, :category, :description, :award, :order, :created_at, :updated_at
  end
end
