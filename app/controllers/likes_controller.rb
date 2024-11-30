class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user: current_user)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])
    @like.destroy
    redirect_to @post
  end

  def index
    @post = Post.find(params[:post_id])
    @likes = @post.likes
    render json: @likes
  end
end
