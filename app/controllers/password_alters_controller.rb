class PasswordAltersController < ApplicationController
  before_action :logged_in_user

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if !@user.authenticate(params[:password_alter][:old_password])
      @user.errors.add(:old_password, "旧密码不正确!")
      render 'edit'
    elsif @user.authenticate(params[:password_alter][:old_password]) && params[:password_alter][:old_password] == params[:password_alter][:password]
      @user.errors.add(:password, "不能使用旧密码进行更新!")
      render 'edit'
    elsif params[:password_alter][:password].empty?
      @user.errors.add(:password, "密码不能为空!")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      @user.update_attribute(:reset_digest, nil)
      flash[:success] = "密码已经被成功重置!"
      redirect_to edit_password_alter_path(@user)
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:password_alter).permit(:old_password, :password, :password_confirmation)
    end
end
