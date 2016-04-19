class VotesController < ApplicationController
  def create
    @achievement = Achievement.find_by(id: params[:achievement_id])
    if @achievement
      @vote = current_user.votes.build({achievement_id: @achievement.id})
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