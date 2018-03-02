class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if !user.activated?
        flash.now[:danger] = "用户未激活!"
        render 'new'
      elsif user.forbidden?
        flash.now[:danger] = "用户被禁止!"
        render 'new'
      else
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:success] = "用户登录成功!"
        redirect_back_or user
      end
    else
      flash.now[:danger] = '邮箱或者密码错误!'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end
end
