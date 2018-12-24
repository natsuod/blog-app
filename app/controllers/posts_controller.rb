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

  def create_params
    params.require(:post).permit(:text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
