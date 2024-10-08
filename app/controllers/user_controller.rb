class UserController < ApplicationController
  before_action :require_login, only: [:show, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    image_path = Rails.root. join("public/images/", "rails.jpg")
    File.open(image_path, "r+b") do |f|
      @user.icon = f.read
    end

    if @user.save
      log_in(@user)
      redirect_to profile_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    # user = User.find(params[:id])
    current_user.destroy
    redirect_to signup_path
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :password, :password_confirmartion, :name, :grade, :klass, :icon, :profile, :hobby_1)
    end
    
end
