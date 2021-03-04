class UsersController < ApplicationController
  before_action :autheniticate_user, {only: [:show, :logout]}

  def new
    if !@user
      @user = User.new(email: "", name: "", password: "")
    end
  end
  def create
    @user = User.new(email: params[:email], name: params[:name], password: params[:password])
    if @user.save
      flash[:success] = "登録しました"
      session[:user_id] = @user.id
      redirect_to("/posts/index")
    else
      flash[:danger] = "登録に失敗しました"
      render "new"
    end
  end
  def login_form
    if !@user
      @user = User.new(email: params[:email], password: "")
    end
  end
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:success] = "ログインしました"
      session[:user_id] = @user.id
      redirect_to("/posts/index")
    else
      flash[:danger] = "ログインに失敗しました"
      render "login_form"
    end
  end
  def show
      @user = User.find_by(id: params[:id])
  end
  def logout
    session[:user_id] = nil
    redirect_to("/home/top")
  end
end
