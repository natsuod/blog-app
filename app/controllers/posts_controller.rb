class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @new = Post.new
  end
end
