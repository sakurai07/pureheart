class GroupmembersController < ApplicationController
  before_action :set_groupmember, only: %i[ show edit update destroy ]

  # GET /groupmembers or /groupmembers.json
  def index
    @groupmembers = Groupmember.all
  end

  # GET /groupmembers/1 or /groupmembers/1.json
  def show
    @groupmembers = Groupmember.all
  end

  # GET /groupmembers/new
  def new
    @groupmember = Groupmember.new
  end

  # GET /groupmembers/1/edit
  def edit
  end

  # POST /groupmembers or /groupmembers.json
  def create
    @groupmember = Groupmember.new(groupmember_params)

    respond_to do |format|
      if @groupmember.save
        format.html { redirect_to groupmessages_path(group_id: @groupmember.group_id)}
        format.json { render :show, status: :created, location: @groupmember }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @groupmember.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupmembers/1 or /groupmembers/1.json
  def update
    respond_to do |format|
      if @groupmember.update(groupmember_params)
        format.html { redirect_to @groupmember }
        format.json { render :show, status: :ok, location: @groupmember }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @groupmember.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupmembers/1 or /groupmembers/1.json
  def destroy
    @groupmember.destroy

    respond_to do |format|
      format.html { redirect_to groupmembers_path, status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupmember
      @groupmember = Groupmember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def groupmember_params
      params.require(:groupmember).permit(:user_id, :group_id)
    end
end
