class CalloutsController < ApplicationController
  def index
    @callouts = Callout.order('created_at DESC')
  end

  def edit
    @callout = Callout.find_by id: params[:id]
  end

  def update
    @callout = Callout.find_by id: params[:id]
    if @callout.update callout_params
      flash[:success] = 'Callout updated!'
      redirect_to callouts_path
    else
      render :edit
    end
  end

  def new
    @callout = Callout.new
  end

  def create
    @callout = Callout.new callout_params
    if @callout.save
      flash[:success] = 'Callout added!'
      redirect_to callouts_path
    else
      render :new
    end
  end

  private

  def callout_params
    params.require(:callout).permit(:url, :description, :image, :category_ids)
  end
end