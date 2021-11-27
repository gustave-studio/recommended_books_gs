class UrlImporter
  class << self
    def import
      page_to_get = 1
      books_url = []

      until page_to_get.nil?
        period = "created:>=#{Date.today.days_ago(1).to_s} created:<=#{Date.today.to_s}"
        status, page_to_get, articles = QiitaApiManager.search(period, page_to_get)

        books_url << collect_url(articles)
      end

      aggregate_results = aggregate_results(books_url.flatten!)

      ActiveRecord::Base.transaction do
        aggregate_results.each do |url, total_count|
          RecommendedBook.create(url: url, total_count: total_count, aggregation_date: Date.today)
        end
      end
    end

    private def collect_url(articles)
      amazon_url = []

      articles.each do |article|
        url_array = URI.extract(article['body'], ['https'])
        url_array.each do |url|  
          if url.include?('https://www.amazon.co.jp/')
            url.chop! if url.last == ')'
            amazon_url << url
          end
        end
      end

      amazon_url
    end

    private def aggregate_results(amazon_url)
      aggregate_url(amazon_url).to_h
    end

    private def aggregate_url(amazon_url)
      amazon_url.group_by(&:itself).map do |key, value|
        [key, value.count]
      end
    end
  end
end
