class Api::EditorialDepartmentRecommendationsController < ApplicationController
  def index
    category = params[:category]

    if category
      @recommendations = EditorialDepartmentRecommendation.where(category: category).order(order: 'ASC')
    else
      @recommendations = EditorialDepartmentRecommendation.order(order: 'ASC')
    end
  end
end
