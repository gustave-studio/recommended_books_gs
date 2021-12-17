class Api::ItEngineerBooksAwardsController < ApplicationController
  def index
    category = params[:category]

    if category == 'technology' then
      @awards = ItEngineerBooksAward.where(category: "technology").order(order: 'ASC')
    elsif category == 'business' then
      @awards = ItEngineerBooksAward.where(category: "business").order(order: 'ASC')
    else
      @awards = ItEngineerBooksAward.order(order: 'ASC')
    end
  end
end
