class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @categories = Category.order('created_at DESC')
    @posts = Post.order('created_at DESC').limit(5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
end