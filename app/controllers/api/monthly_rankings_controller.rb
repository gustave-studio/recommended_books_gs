class Api::MonthlyRankingsController < ApplicationController
  def index
    @monthly_rankings = MonthlyRanking.order('ranking ASC').limit(10)
  end
end
