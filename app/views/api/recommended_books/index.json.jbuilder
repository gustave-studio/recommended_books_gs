json.set! :recommended_books do
  json.array! @tasks do |task|
    json.extract! task, :id, :url, :total_count, :aggregation_date, :created_at, :updated_at
  end
end
