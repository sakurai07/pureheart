class GroupmessagesController < ApplicationController
  before_action :set_groupmessage, only: %i[ show edit update destroy ]

  # GET /groupmessages or /groupmessages.json
  def index
    @group = Group.find(params[:group_id])
    @groupmessages = @group.groupmessages

    # @groupmessages. each do |gm|
    #   updatemessage = GroupmessageReadCheck.where(group_id: gm.group_id, user_id: current_user.id, groupmessage_id: gm.id, read: false)
    # 上２行後回し
  end

  # GET /groupmessages/1 or /groupmessages/1.json
  def show
  end

  # GET /groupmessages/new
  def new
    @groupmessage = Groupmessage.new
  end

  # GET /groupmessages/1/edit
  def edit
  end

  # POST /groupmessages or /groupmessages.json
  def create
    @groupmessage = Groupmessage.new(groupmessage_params)

    respond_to do |format|
      if @groupmessage.save
        format.html { redirect_to @groupmessage, notice: "Groupmessage was successfully created." }
        format.json { render :show, status: :created, location: @groupmessage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @groupmessage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupmessages/1 or /groupmessages/1.json
  def update
    respond_to do |format|
      if @groupmessage.update(groupmessage_params)
        format.html { redirect_to @groupmessage, notice: "Groupmessage was successfully updated." }
        format.json { render :show, status: :ok, location: @groupmessage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @groupmessage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupmessages/1 or /groupmessages/1.json
  def destroy
    @groupmessage.destroy

    respond_to do |format|
      format.html { redirect_to groupmessages_path, status: :see_other, notice: "Groupmessage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupmessage
      @groupmessage = Groupmessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def groupmessage_params
      params.require(:groupmessage).permit(:user_id, :message, :group_id)
    end
end
