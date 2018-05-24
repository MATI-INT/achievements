module Api
  class StatisticsController < ApplicationController
    skip_before_action :authenticate_user!

    def show
      @category = Category.find_by id: params[:id]
      @grouped_visits = Visit.all_from_category(@category.id).group_by_day('visits.created_at').count
      @posts_count = @category.posts.group_by_day(:created_at).count
      render partial: 'show'
    end
  end
end