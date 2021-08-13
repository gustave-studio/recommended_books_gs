class UrlImporter
  class << self
    def import
      period = "created:>=#{Date.today.months_ago(1).to_s} created:<=#{Date.today.to_s}"
      items = QiitaApiManager.search(period)
      articles = items[2]
      amazon_url = collect_url(articles)
      aggregate_results = aggregate_results(amazon_url)

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
          amazon_url << url if url.include?('https://www.amazon.co.jp/')
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
