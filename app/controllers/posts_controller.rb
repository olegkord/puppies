class PostsController < ApplicationController

  def index
    @post = Post.all

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    if post.save
      redirect_to '/posts'
    else
      redirect_to '/posts/new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to '/posts'
    else
      redirect_to '/posts/edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :body
      :img_url
    )
  end
end
