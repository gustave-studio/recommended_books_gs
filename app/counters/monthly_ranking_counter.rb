class MonthlyRankingCounter
  class << self
    def count
      period = Range.new(1.month.ago.beginning_of_day, Time.zone.now.beginning_of_day)
      recommended_data = RecommendedBook.where(article_created_at: period).group(:isbn, :user_id, :likes_count).select(:isbn, :likes_count).map{ |data| { isbn: data.isbn, likes_count: data.likes_count } }

      book_data_count = recommended_data.flatten.each_with_object([]) { |value, result|
        a = result.find do |result|
          result[:isbn].include?(value[:isbn])
        end

        if a
          a[:likes_count] += value[:likes_count]
          a[:count] += 1
        else
          result << { isbn: value[:isbn], likes_count: value[:likes_count], count: 1 }
        end
      }

      sorted_book_data = book_data_count.sort_by { |h| h.values_at(:count, :likes_count) }.reverse

      ActiveRecord::Base.transaction do
        sorted_book_data.each.with_index(1) do |data, index|
          MonthlyRanking.create(isbn: data[:isbn], count: data[:count], likes_count: data[:likes_count], ranking: index)
        end
      end
    end
  end
end
