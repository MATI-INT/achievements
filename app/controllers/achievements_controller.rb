class AchievementsController < ApplicationController
  def index
    @achievements = Achievement.order('created_at DESC')
  end

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(achievements_params)
    if @achievement.save
      flash[:success] = 'Created!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def achievements_params
    params.require(:achievement).permit(:title, :image, :description, :retained_image)
  end
end