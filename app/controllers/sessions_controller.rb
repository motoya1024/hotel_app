class SessionsController < ApplicationController
  
  def new
    if logged_in?
        @user = User.find(current_user.id)
    end
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in user
        if user.admin == nil
           redirect_to user_favorites_path(current_user)
        else 
           redirect_to root_path
        end
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'メールアドレスとパスワードが正しくありません。' # 本当は正しくない
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
