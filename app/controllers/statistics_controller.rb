class StatisticsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @category = Category.includes(:posts).find_by id: params[:id]
    @grouped_visits = Visit.all_from_category(@category.id).group_by_day('visits.created_at').count
  end

  def post
    @post = Post.find_by id: params[:id]
    @grouped_visits = @post.visits.group_by_day(:created_at).count
  end
end