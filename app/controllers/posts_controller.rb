class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index
  def index
    @posts = Post.all
  end

  def new
    @post=Post.new #랜더링을 하기위해서 비어있는 Post를 만들어준다
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to "/"
  end

  def show
    @comments = @post.comments
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to "posts/#{@post.id}"
  end

  def destroy
    @post.destroy
    redirect_to "/"
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
