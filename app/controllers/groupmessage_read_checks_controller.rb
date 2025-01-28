class GroupmessageReadChecksController < ApplicationController
  before_action :set_groupmessage_read_check, only: %i[ show edit update destroy ]

  # GET /groupmessage_read_checks or /groupmessage_read_checks.json
  def index
    @groupmessage_read_checks = GroupmessageReadCheck.all
  end

  # GET /groupmessage_read_checks/1 or /groupmessage_read_checks/1.json
  def show
  end

  # GET /groupmessage_read_checks/new
  def new
    @groupmessage_read_check = GroupmessageReadCheck.new
  end

  # GET /groupmessage_read_checks/1/edit
  def edit
  end

  # POST /groupmessage_read_checks or /groupmessage_read_checks.json
  def create
    @groupmessage_read_check = GroupmessageReadCheck.new(groupmessage_read_check_params)

    respond_to do |format|
      if @groupmessage_read_check.save
        format.html { redirect_to @groupmessage_read_check, notice: "Groupmessage read check was successfully created." }
        format.json { render :show, status: :created, location: @groupmessage_read_check }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @groupmessage_read_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupmessage_read_checks/1 or /groupmessage_read_checks/1.json
  def update
    respond_to do |format|
      if @groupmessage_read_check.update(groupmessage_read_check_params)
        format.html { redirect_to @groupmessage_read_check, notice: "Groupmessage read check was successfully updated." }
        format.json { render :show, status: :ok, location: @groupmessage_read_check }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @groupmessage_read_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupmessage_read_checks/1 or /groupmessage_read_checks/1.json
  def destroy
    @groupmessage_read_check.destroy

    respond_to do |format|
      format.html { redirect_to groupmessage_read_checks_path, status: :see_other, notice: "Groupmessage read check was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupmessage_read_check
      @groupmessage_read_check = GroupmessageReadCheck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def groupmessage_read_check_params
      params.require(:groupmessage_read_check).permit(:group_id, :user_id, :groupmessage_id, :read)
    end
end
