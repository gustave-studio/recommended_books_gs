class Api::SixMonthsRankingsController < ApplicationController
  def index
    @six_months_rankings = SixMonthsRanking.order('ranking ASC').limit(10)
  end
end
