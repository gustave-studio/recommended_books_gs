class Api::SixMonthsRankingsController < ApplicationController
  def index
    @six_months_rankings ||= cache_ranking
  end

  private def cache_ranking
    Rails.cache.fetch("six_months_ranking", expires_in: 24.hours) do
      SixMonthsRanking.order('ranking ASC').limit(10)
    end
  end
end
