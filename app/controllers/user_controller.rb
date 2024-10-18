class UserController < ApplicationController
  before_action :require_login, only: [:show, :destroy, :edit, :update, :index]

  def index
    @user = User.all
  end

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
      redirect_to profile_path(current_user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @follow = Follow.new
    @block = Block.new
  end

  def destroy
    # user = User.find(params[:id])
    current_user.destroy
    redirect_to signup_path
  end

  def send_icon
    user = User.find(params[:id])
    send_data(user.icon, disposition: :inline)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_update_attributes)
      redirect_to profile_path(@user), notice: "User was successfully updated"
    else
      render 'edit'
    end
  end

  private

  def user_params_update
    params.require(:user).permit(:name, :icon, :grade, :klass, :profile, :hobby_1, :hobby_2, :hobby_3, :hobby_4, :hobby_5)
  end

  def user_update_attributes
    if user_params_update[:icon] == nil
    {
      name: user_params_update[:name], profile: user_params_update[:profile], grade: user_params_update[:grade], klass: user_params_update[:klass], hobby_1: user_params_update[:hobby_1], hobby_2: user_params_update[:hobby_2], hobby_3: user_params_update[:hobby_3], hobby_4: user_params_update[:hobby_4], hobby_5: user_params_update[:hobby_5]

    }
    else
    {
      name: user_params_update[:name], profile: user_params_update[:profile], grade: user_params_update[:grade], klass: user_params_update[:klass], hobby_1: user_params_update[:hobby_1], hobby_2: user_params_update[:hobby_2], hobby_3: user_params_update[:hobby_3], hobby_4: user_params_update[:hobby_4], hobby_5: user_params_update[:hobby_5], icon: user_params_update[:icon].read
    }
    end
  end

    def user_params
      params.require(:user).permit(:user_name, :password, :password_confirmartion, :name, :grade, :klass, :icon, :profile, :hobby_1)
    end
    
end
