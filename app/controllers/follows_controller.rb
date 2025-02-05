class FollowsController < ApplicationController
  before_action :set_follow, only: %i[ show edit update ]

  def top
    @follow = Follow.all.order(user_id: :asc)
  end


  # GET /follows or /follows.json
  def index   
    key = params[:key]
    if key == '1' 
      @follow = Follow.where("user_id=?", current_user.id)
      session[:key] = '3'
    end
    if key == '2' 
      @follow = Follow.where("followed_user_id=?", current_user.id)
      session[:key] = '4'
    end
    
  end

  # GET /follows/1 or /follows/1.json
  def show
    # @follow = Follow.all
    
  end

  # GET /follows/new
  def new
    @follow = Follow.new
  end

  # GET /follows/1/edit
  def edit
  end

  # POST /follows or /follows.json
  def create
    @follow = Follow.new(follow_params)
    @follow.user_id = current_user.id

    # respond_to do |format|
      if @follow.save
        # redirect_to profile_path(@follow.followed_user_id), notice: "follow was successfully created."
        redirect_to profile_path(@follow.followed_user_id, key_windowclose: params[:key_windowclose])
        
        # format.html { redirect_to @follow, notice: "Follow was successfully created." }
        # format.json { render :show, status: :created, location: @follow }
      else
        # redirect_to profile_path(@follow.followed_user_id), notice: "follow was successfully failed."
        redirect_to profile_path(@follow.followed_user_id, key_windowclose: params[:key_windowclose])
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /follows/1 or /follows/1.json
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow}
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1 or /follows/1.json
  def destroy
    # @follow.destroy

    # respond_to do |format|
    #   format.html { redirect_to follows_path, status: :see_other, notice: "Follow was successfully destroyed." }
    #   format.json { head :no_content }
    # end
    @follow = Follow.find_by(followed_user_id: params[:id] , user_id: current_user.id)
    @follow.destroy
    # redirect_to profile_path(@follow.followed_user_id)
    redirect_to profile_path(@follow.followed_user_id, key_windowclose: params[:key_windowclose])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follow_params
      params.require(:follow).permit(:user_id, :followed_user_id)
    end
end
