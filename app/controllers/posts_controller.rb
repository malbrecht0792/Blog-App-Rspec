class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post }
      else
        format.html { render 'new' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to @post }
      else
        format.html { render 'edit' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @post.destroy
        format.html { redirect_to posts_path }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:article, :title, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
