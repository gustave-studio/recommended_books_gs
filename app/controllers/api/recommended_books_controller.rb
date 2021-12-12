class Api::RecommendedBooksController < ApplicationController
  def index
    @articles = RecommendedBook.order('created_at DESC')
  end
end
