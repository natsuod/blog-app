class PostsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @posts = Post.all
  end

  def new
    @new = Post.new
  end

  def create
    Post.create(create_params)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(create_params)
    end
  end

  private
  def create_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
