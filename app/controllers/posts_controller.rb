class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :require_admin!, only: [:destroy, :edit, :update]

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:success] = "Post destroyed!"
    redirect_to posts_path
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = 'Post edited!'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def new
    @post = Post.new
  end

  def create
    p = post_params
    @category = Category.find_by(id: p.delete('category_id'))
    @post = current_user.posts.build(p)
    if @category
      @post.category = @category
      if @post.save
        flash[:success] = 'Post created!'
        redirect_to posts_path
      else
        render 'new'
      end
    else
      flash.now[:warning] = 'Category does not exist...'
      render 'new'
    end
  end

  def index
    @category = Category.includes(:posts, :callouts).find_by id: params[:category]
    if @category.present?
      @posts = @category.posts
      @callouts = @category.callouts
    else
      @posts = Post.all
    end
    @posts = @posts.order('created_at DESC').page(params[:page])
  end

  def show
    @post = Post.includes(:achievements, :comments).find_by(id: params[:id])
    @callouts = @post.category.callouts.order(Arel.sql('random()')).limit(3)
    @comment = Comment.new
    @ach_to_assign = (Achievement.where(community: true) + (current_user.nil? ? [] : current_user.achievements) - @post.achievements).uniq
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end