class StatisticsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by id: params[:id]
    @grouped_visits = @category.visits.group_by_day(:created_at).count
  end
end