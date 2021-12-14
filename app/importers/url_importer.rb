class UrlImporter
  class << self
    # period
    #   "created:>=2021-11-01 created:<=2021-11-30"
    #   "created:>=#{Date.today.days_ago(1).to_s} created:<=#{Date.today.to_s}"
    def import(period)
      page_to_get = 1
      recommended_information = []

      until page_to_get.nil?
        status, page_to_get, articles = QiitaApiManager.search(period, page_to_get)

        recommended_information << collect_url(articles)
      end


      recommended_information.flatten!


      ActiveRecord::Base.transaction do
        recommended_information.each.with_index(1) do |information, index|
          RecommendedBook.create(article_id: information[:article_id],
                                 user_id: information[:user_id],
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
        book_data_array = []
        url_array.each do |url|  
          if url.include?('https://www.amazon.co.jp/')
            url.chop! if url.last == ')'
            asin = url.match(/[^0-9A-Z]([0-9A-Z]{10})([^0-9A-Z]|$)/)
            next if asin.nil?
            next if asin_exist?(book_data_array, asin[1])
            # binding.pry

            book_data_array << { url: url, asin: asin[1] }
          end
        end

        book_data_array.each do |book_data|
          articles_including_book_url << { article_id: article['id'],
                                           user_id: article['user']['id'],
                                           title: article['title'],
                                           article_url: article['url'],
                                           likes_count: article['likes_count'],
                                           book_url: book_data[:url],
                                           asin: book_data[:asin],
                                           article_created_at: article['created_at'] }
        end
      end

      articles_including_book_url
    end

    private def asin_exist?(book_data_array, asin)
      book_data_array.any? do |book_data|
        book_data[:asin] == asin
      end
    end
  end
end
