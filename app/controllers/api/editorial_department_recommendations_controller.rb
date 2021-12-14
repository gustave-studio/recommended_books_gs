class Api::EditorialDepartmentRecommendationsController < ApplicationController
  def index
    @recommendations = EditorialDepartmentRecommendation.order(order: 'ASC')
  end
end
