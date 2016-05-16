class AchievementsController < ApplicationController
  before_action :require_admin!, only: [:destroy]

  def index
    @achievements = Achievement.community.order('created_at DESC')
  end

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = current_user.achievements.build(achievements_params)
    if @achievement.save
      flash[:success] = 'Created!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @achievement = Achievement.find_by(id: params[:id])
    if @achievement.destroy
      flash[:success] = "Achievement destroyed!"
    else
      flash[:warning] = "Cannot destroy achievement..."
    end
    redirect_back fallback_location: achievements_path
  end

  private

  def achievements_params
    params.require(:achievement).permit(:title, :image, :description,
                                        :retained_image, :community)
  end
end