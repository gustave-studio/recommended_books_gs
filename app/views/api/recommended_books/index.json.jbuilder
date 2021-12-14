json.set! :recommended_books do
  json.array! @articles do |article|
    json.extract! article, :id, :book_url, :isbn, :asin, :total_count, :article_url, :article_id, :user_id, :title, :likes_count, :article_created_at, :created_at, :updated_at
  end
end
