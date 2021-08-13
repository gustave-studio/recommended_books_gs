class Api::RecommendedBooksController < ApplicationController
  def index
    @tasks = RecommendedBook.order('created_at DESC')
  end
end
