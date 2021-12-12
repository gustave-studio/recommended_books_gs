class Api::ThreeMonthsRankingsController < ApplicationController
  def index
    @three_months_rankings = ThreeMonthsRanking.order('ranking ASC').limit(10)
  end
end
