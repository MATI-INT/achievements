class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    p = post_params
    @category = Category.find_by(id: p.delete('category'))
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
    @posts = if params[:category]
      Post.where(category: params[:category])
    else
      Post.all
    end.order('created_at DESC').page(params[:page])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @achievements = Achievement.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category)
  end
end