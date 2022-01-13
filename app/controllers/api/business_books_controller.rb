class Api::BusinessBooksController < ApplicationController
  def index
      category = params[:category]
      asin = params[:asin]

      if category
        @business_books = BusinessBook.where(category: category).order(order: 'ASC')
      elsif asin
        @business_books = BusinessBook.where(asin: asin).order(order: 'ASC')
      else
        @business_books = BusinessBook.order(order: 'ASC')
      end
  end
end
