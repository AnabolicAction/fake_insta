class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index
  load_and_authorize_resource
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(3)
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def new
    @post=Post.new #랜더링을 하기위해서 비어있는 Post를 만들어준다
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
    if @post.save
      #저장이 되었을 경우에 실행
      format.html {redirect_to "/", notice: '글작성완료'}
      # flash[:notice]="글작성 완료"
      # redirect_to "/"
    else
      #저장이 실패했을 경우에(validates) 실행
        format.html {render :new}
        format.json { render json: @post.errors }
      # flash[:alert]="글작성 실패 ㅜㅜ"
      # redirect_to new_post_path
    end
  end
end

  def show
    @comments = @post.comments
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
      format.html { redirect_to @post, notice: '글 수정완료'}
      else
        format.html { render :edit }
        format.html { render json: @post.error}
      end
    end
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
