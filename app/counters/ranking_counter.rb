class RankingCounter
  class << self
    # period
    #   Range.new(1.month.ago.beginning_of_day, Time.zone.now.beginning_of_day)
    def create_monthly_ranking
      sorted_book_data = count_ranking(Range.new(1.month.ago.beginning_of_day, Time.zone.now.beginning_of_day))

      ActiveRecord::Base.transaction do
        MonthlyRanking.destroy_all

        sorted_book_data.each.with_index(1) do |data, index|
          MonthlyRanking.create(asin: data[:asin], count: data[:count], likes_count: data[:likes_count], ranking: index)
        end
      end
    end

    def create_three_months_ranking
      sorted_book_data = count_ranking(Range.new(3.month.ago.beginning_of_day, Time.zone.now.beginning_of_day))

      ActiveRecord::Base.transaction do
        ThreeMonthsRanking.destroy_all

        sorted_book_data.each.with_index(1) do |data, index|
          ThreeMonthsRanking.create(asin: data[:asin], count: data[:count], likes_count: data[:likes_count], ranking: index)
        end
      end
    end

    def create_six_months_ranking
      sorted_book_data = count_ranking(Range.new(6.month.ago.beginning_of_day, Time.zone.now.beginning_of_day))

      ActiveRecord::Base.transaction do
        SixMonthsRanking.destroy_all

        sorted_book_data.each.with_index(1) do |data, index|
          SixMonthsRanking.create(asin: data[:asin], count: data[:count], likes_count: data[:likes_count], ranking: index)
        end
      end
    end

    private def count_ranking(period)
      recommended_data = RecommendedBook.where(article_created_at: period).group(:asin, :user_id, :likes_count).select(:asin, :likes_count).map{ |data| { asin: data.asin, likes_count: data.likes_count } }

      book_data_count = recommended_data.flatten.each_with_object([]) { |value, result|
        existing_book_data = result.find { |result| result[:asin].include?(value[:asin]) }

        if existing_book_data
          existing_book_data[:likes_count] += value[:likes_count]
          existing_book_data[:count] += 1
        else
          result << { asin: value[:asin], likes_count: value[:likes_count], count: 1 }
        end
      }

      book_data_count.sort_by { |h| h.values_at(:count, :likes_count) }.reverse
    end
  end
end
