class PostAchievementsController < ApplicationController
  def create
    @post = Post.find_by(id: params[:post_id])
    @achievement = Achievement.find_by(id: params[:achievement_id])
    if @post && @achievement
      @post.achievements << @achievement
      flash[:success] = 'Achievement assigned!'
      redirect_to post_path(@post)
    else
      flash[:warning] = "Post not found..."
      redirect_to root_path
    end
  end
end