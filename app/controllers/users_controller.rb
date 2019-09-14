class UsersController < ApplicationController

  before_action :logged_in, only: [:edit,:update]
  before_action :logged_in_admin, only: [:index,:destroy]
  before_action :correct_user, only: [:edit,:update]
  
  def new
    @user = User.new
  end
  
  def index
    @search = params[:search]
    @per_pages = ["全表示",10,20,30,50,100]
    if params[:per_page] == nil || params[:per_page] == "全表示"
      @page = "全表示"
      if User.search(@search).present? && @search != ""
        @users = User.search(@search).order(id: :asc)
      else
        flash[:danger] = "該当するユーザーが存在しませんでした。"
        redirect_to users_url
      end
    else
      @page = params[:per_page]
      if User.search(@search).present? && @search != ""
        @users = User.search(@search).paginate(page: params[:page], per_page: @page).order(id: :asc)
      else
        flash[:danger] = "該当するユーザーが存在しませんでした。"
        redirect_to users_url
      end
    end
  end
  
  def create
    @user = User.new(user_params)  
    if @user.save
      log_in @user
      redirect_to user_favorites_url @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = @user.name + "さんのユーザー情報を削除しました。"
      redirect_to users_url 
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = @user.name_before_last_save + "さんのプロフィールを更新しました。"
      redirect_to edit_user_url(@user)
    else
      render "edit"
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
      
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      unless current_user.admin == true
        unless current_user?(@user)
          flash[:danger] ="他のユーザーのサイトにはアクセスできません。"
          redirect_to hotels_url
        end
      end
    end
end