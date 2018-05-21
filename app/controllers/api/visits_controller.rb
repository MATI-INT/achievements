module Api
  class VisitsController < ApplicationController
    def create
      #binding.pry # stop code execution
      category = Category.find_by id: params[:category]
      post = Post.find_by id: params[:post]
      if category.present? || post.present? # && current_user
        Visit.create category: category, user: current_user, post: post
      end

      head :ok
    end
  end
end