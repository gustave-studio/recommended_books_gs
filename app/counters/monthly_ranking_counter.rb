class MonthlyRankingCounter
  class << self
    def count
      period = Range.new(1.month.ago.beginning_of_day, Time.zone.now.beginning_of_day)
      book_data = RecommendedBook.where(article_created_at: period).group("asin").count

      ActiveRecord::Base.transaction do
        book_data.each do |data|
          MonthlyRanking.create(asin: data[0], count: data[1])
        end
      end
    end
  end
end
