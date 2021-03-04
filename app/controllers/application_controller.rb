class ApplicationController < ActionController::Base
  def autheniticate_user
    if session[:user_id]==nil
      flash[:notice]="ログインが必要です"
      redirect_to("/users/login_form")
    end
  end
end
