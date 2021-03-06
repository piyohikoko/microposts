class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to user_path(@user) , notice: 'メッセージを編集しました'
    else
      #  保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end  
  end
      
  def show #追加
    @user = User.find(params[:id])
    @microposts = @user.microposts
    @followings = @user.following_users
    @followers = @user.follower_users
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user #ここを修正
    else
      render 'new'
    end
  end  
    
  private
    
  def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :job ,:place ,:selfintroduction )
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end