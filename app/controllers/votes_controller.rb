class VotesController < ApplicationController
  def create
    achievement = Achievement.find_by(id: params[:achievement_id])
    post = Post.find_by(id: params[:post_id])
    post_achievement = achievement.post_achievements.find_by(post: post)
    if post_achievement
      @vote = current_user.votes.build({post_achievement_id: post_achievement.id})
      if @vote.save
        flash[:success] = "Thanks!"
      else
        flash[:warning] = "Cannot save your vote!"
      end
    else
      flash[:warning] = "Achievement not found!"
    end
    redirect_back fallback_location: root_path
  end
end