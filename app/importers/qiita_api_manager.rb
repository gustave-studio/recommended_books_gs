require 'net/http'
require 'json'
require 'uri'

class QiitaApiManager
  PER_PAGE = 100
  QIITA_ACCESS_TOKEN = ENV['QIITA_ACCESS_TOKEN']
  GET_ITEMS_URI = 'https://qiita.com/api/v2/items'

  def self.search(query, page)
    uri = URI.parse (GET_ITEMS_URI)
    uri.query = URI.encode_www_form({ query: query, per_page: PER_PAGE, page: page })
    req = Net::HTTP::Get.new(uri.request_uri)
    req['Authorization'] = "Bearer #{QIITA_ACCESS_TOKEN}"

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    res = http.request(req)

    total_page = ((res['total-count'].to_i - 1) / PER_PAGE) + 1
    total_page = (total_page > 100) ? 100 : total_page
    next_page = (page < total_page) ? page + 1 : nil

    return res.code.to_i, next_page, JSON.parse(res.body)
  end
end
