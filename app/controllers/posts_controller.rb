class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.order('created_at DESC').paginate(per_page: 25, page: params[:page])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @achievements = Achievement.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end