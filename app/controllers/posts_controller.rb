class PostsController < ApplicationController
  before_action :autheniticate_user
  def index
    if !params[:season]
      @posts = Post.all
    else
      @posts = Post.where(season: params[:season])
    end
  end

  def new
    if !@post
      @post = Post.new(first: "", second: "", third: "")
    end
  end

  def create
    @post = Post.new(first: params[:first], second: params[:second], third: params[:third], 
                     user_id: session[:user_id], season: params[:season])
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to("/posts/index")
    else
      flash.now[:danger] = "投稿に失敗しました"

      render "new"
    end
  end
  def delete
    post = Post.find_by(id: params[:id])
    if post.user_id == session[:user_id]
      post.delete
      flash[:success] = "削除しました"
      redirect_to("/posts/index")
    else
      flash.now[danger] = "削除に失敗しました"
      redirect_to("/posts/index")
    end
  end
end
