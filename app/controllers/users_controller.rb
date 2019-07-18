class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def index
    @search = params[:search]
    @users = User.order(id: :asc).paginate(page: params[:page], per_page: 10)
    @per_pages = ["全表示",10,20,30,50,100]
    if params[:per_page] == nil || params[:per_page] == "全表示"
       @page = "全表示"
       @users = User.search(@search)
       #@users = User.all.order(id: :asc)
    else
       @page = params[:per_page]
       @users = User.search(@search).paginate(page: params[:page], per_page: @page)
    end
  end
  
  def create
    @user = User.new(user_params)  
    if @user.save
       log_in @user
       redirect_to timecard_path @user
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