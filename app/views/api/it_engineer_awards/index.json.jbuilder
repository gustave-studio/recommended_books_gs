json.set! :it_engineer_awards do
  json.array! @awards do |award|
    json.extract! award, :id, :title, :isbn, :category, :award, :order, :created_at, :updated_at
  end
end
