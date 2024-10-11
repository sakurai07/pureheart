class SessionsController < ApplicationController

  before_action :require_login, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(user_name: params[:user_name].downcase)
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to root_path
    else
      flash.now[:danger] = "ユーザーネームかパスワードが間違っています"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

end
