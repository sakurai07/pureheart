class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]
  def search
    # if params[:search].present? && params[:search][:hobby].present?
    #   @group = Group.where("id <> #{current_user.id} and (hobby_1 like '%#{params[:search][:hobby]}' or hobby_2 like '%#{params[:search][:hobby]}' or hobby_3 like '%#{params[:search][:hobby]}' or hobby_4 like '%#{params[:search][:hobby]}' or hobby_5 like '%#{params[:search][:hobby]}')").order(created_at: :desc)
    # else
    #   @group = []
    #   flash.now[:danger] = "検索条件を入力してください"
    # end
    @groups = Group.all.order(created_at: :desc)

    @message = ""

    if params[:search].present? && params[:search][:hobbys].present?
      # @group = Group.where("group.hobby_1 like '%#{params[:search_title]}' or hobby_2 like '%#{params[:search_title]}' or hobby_3 like '%#{params[:search_title]}' or hobby_4 like '%#{params[:search_title]}' or hobby_5 like '%#{params[:search_title]}'").order(created_at: :desc)
      @group = Group.where("hobby_1 like '%#{params[:search][:hobbys]}'").order(created_at: :desc)
      if @group.size == 0
        @message = "検索結果がありませんでした"
      end
    else
      @group = []
      # flash.now[:danger] = "検索条件を入力してください"
      @message = "検索条件を入力してください"
      # @group = Group.all.order(created_at: :desc)
    end
    render :index

    
  end

  # id <> #{current_user.id} and 
  # GET /groups or /groups.json
  def index
    @groups = Group.all.order(created_at: :desc)
    @group = []
    @gmember_new = Groupmember.new
  end

  # id <> #{current_user.id} and

  # GET /groups/1 or /groups/1.json
  def show
    @user = User.find( @group.user_id )
  end

  # GET /groups/new
  def new
    @user = User.all.order( created_at: :desc )
    @group = Group.new
    @gmember = Groupmember.new
  end

  # GET /groups/1/edit
  def edit
    @user = User.all.order( created_at: :desc )
    @groups = Group.all.order(created_at: :desc)
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end

    @gmember = Groupmember.new(group_id: @group.id, user_id: current_user.id)
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_path, status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:group_name, :user_id, :comment, :hobby_1, :hobby_2, :hobby_3, :hobby_4, :hobby_5)
    end

    def groupmember_params
      params.require(:groupmember).permit(:user_id, :group_id)
    end
end
