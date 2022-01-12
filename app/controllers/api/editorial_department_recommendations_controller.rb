class Api::EditorialDepartmentRecommendationsController < ApplicationController
  def index
    category = params[:category]
    asin = params[:asin]

    if category
      @recommendations = EditorialDepartmentRecommendation.where(category: category).order(order: 'ASC')
    elsif asin
      @recommendations = EditorialDepartmentRecommendation.where(asin: asin).order(order: 'ASC')
    else
      @recommendations = EditorialDepartmentRecommendation.order(order: 'ASC')
    end
  end
end
