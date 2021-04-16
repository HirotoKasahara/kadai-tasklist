class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]="登録しました"
      redirect_to root_url
    else 
      flash.now[:danger]="間違いがあります"
      render :new
    end 
  end

  def new
    @user = User.new
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end 
end
