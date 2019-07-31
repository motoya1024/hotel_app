class UsersController < ApplicationController

  before_action :logged_in_admin, only: [:index]
  before_action :logged_not_current_user, only: [:edit,:update]
  
  def new
    @user = User.new
  end
  
  def index
    @search = params[:search]
    @per_pages = ["全表示",10,20,30,50,100]
    if params[:per_page] == nil || params[:per_page] == "全表示"
       @page = "全表示"
       @users = User.search(@search)
    else
       @page = params[:per_page]
       @users = User.search(@search).paginate(page: params[:page], per_page: @page)
    end
    p @page
  end
  
  def create
    @user = User.new(user_params)  
    if @user.save
       log_in @user
       redirect_to myhotel_url @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to edit_user_url(@user)
    else
      render "edit"
    end
  end
  
  private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end