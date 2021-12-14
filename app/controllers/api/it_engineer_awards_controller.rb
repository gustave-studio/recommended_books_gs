class Api::ItEngineerAwardsController < ApplicationController
  def index
    @awards = ItEngineerAward.order(order: 'ASC')
  end
end
