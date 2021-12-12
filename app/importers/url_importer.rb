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
                                 isbn: information[:isbn],
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
            isbn = url.match(/[0-9\-]{9,16}[0-9X]/)
            next if isbn.nil?
            next if isbn_exist?(book_data_array, isbn[0])
            # binding.pry

            book_data_array << { url: url, isbn: isbn[0] }
          end
        end

        book_data_array.each do |book_data|
          articles_including_book_url << { article_id: article['id'],
                                           user_id: article['user']['id'],
                                           title: article['title'],
                                           article_url: article['url'],
                                           likes_count: article['likes_count'],
                                           book_url: book_data[:url],
                                           isbn: book_data[:isbn],
                                           article_created_at: article['created_at'] }
        end
      end

      articles_including_book_url
    end

    private def isbn_exist?(book_data_array, isbn)
      book_data_array.any? do |book_data|
        book_data[:isbn] == isbn
      end
    end
  end
end
