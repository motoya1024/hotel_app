class SessionsController < ApplicationController
  
  before_action :logged_not_in, only: [:new,:create]
  
  def new
  
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.admin == nil
        redirect_to user_favorites_path(current_user)
      else 
        redirect_to users_path
      end
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'メールアドレスとパスワードが正しくありません。' 
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
