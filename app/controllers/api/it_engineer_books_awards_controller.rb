class Api::ItEngineerBooksAwardsController < ApplicationController
  def index
    @awards = ItEngineerBooksAward.order(order: 'ASC')
  end
end
