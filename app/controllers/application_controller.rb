class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  require 'open-uri'
  require 'kconv'
  require 'rexml/document'
  
  private
   # ログイン済みユーザーかどうか確認
    def logged_in
      unless logged_in?
        store_location
        flash[:danger] = "アクセス権がありません。"
        redirect_to login_url
      end
    end
    
     # ログイン済み管理者ユーザーかどうか確認
    def logged_in_admin
      unless admin_logged_in?
        store_location
        flash[:danger] = "アクセス権がありません。"
        redirect_to login_url
      end
    end
  
    # ログイン済みの自分以外のユーザに入れない
    def logged_not_current_user
       if logged_in?
          @user = User.find(params[:id])
          #自分以外のユーザーでなければ
          unless current_user?(@user)
             flash[:danger] ="他のユーザーはアクセスできません。"
             redirect_to login_url
          end
       end
    end

  
end
