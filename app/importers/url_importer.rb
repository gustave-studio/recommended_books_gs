class UrlImporter
  class << self
    def import
      page_to_get = 1
      recommended_information = []

      until page_to_get.nil?
        period = "created:>=#{Date.today.days_ago(1).to_s} created:<=#{Date.today.to_s}"
        status, page_to_get, articles = QiitaApiManager.search(period, page_to_get)

        recommended_information << collect_url(articles)
      end


      recommended_information.flatten!


      ActiveRecord::Base.transaction do
        recommended_information.each.with_index(1) do |information, index|
          RecommendedBook.create(article_id: information[:article_id],
                                 title: information[:title],
                                 article_url: information[:article_url],
                                 book_url: information[:book_url],
                                 asin: information[:asin],
                                 likes_count: information[:likes_count],
                                 total_count: index,
                                 article_created_at: information[:article_created_at])
        end
      end
    end

    private def collect_url(articles)
      articles_including_book_url = []

      articles.each do |article|
        url_array = URI.extract(article['body'], ['https'])
        url_array.each do |url|  
          if url.include?('https://www.amazon.co.jp/')
            url.chop! if url.last == ')'
            asin = url.match(/[^0-9A-Z]([0-9A-Z]{10})([^0-9A-Z]|$)/)
            next if asin.nil?

            articles_including_book_url << { article_id: article['id'],
                                             title: article['title'],
                                             article_url: article['url'],
                                             likes_count: article['likes_count'],
                                             book_url: url,
                                             asin: asin[1],
                                             article_created_at: article['created_at'] }
          end
        end
      end

      articles_including_book_url
    end

    # private def aggregate_results(amazon_url)
    #   aggregate_url(amazon_url).to_h
    # end

    # private def aggregate_url(amazon_url)
    #   amazon_url.group_by(&:itself).map do |key, value|
    #     [key, value.count]
    #   end
    # end
  end
end
