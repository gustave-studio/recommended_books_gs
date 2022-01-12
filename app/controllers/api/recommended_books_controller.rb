class Api::RecommendedBooksController < ApplicationController
  def index
    asin = params[:asin]

    if asin
      @articles = RecommendedBook.where(asin: asin).order('created_at DESC')
    else
      @articles = RecommendedBook.order('created_at DESC')
    end
  end
end
