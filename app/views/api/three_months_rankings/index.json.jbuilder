json.set! :three_months_rankings do
  json.array! @three_months_rankings do |ranking|
    json.extract! ranking, :id, :isbn, :count, :ranking, :likes_count, :created_at, :updated_at
  end
end