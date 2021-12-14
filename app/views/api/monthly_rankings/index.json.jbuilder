json.set! :monthly_rankings do
  json.array! @monthly_rankings do |ranking|
    json.extract! ranking, :id, :asin, :count, :ranking, :likes_count, :created_at, :updated_at
  end
end
