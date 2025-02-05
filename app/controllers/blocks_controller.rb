class BlocksController < ApplicationController
  before_action :set_block, only: %i[ show edit update ]

  # GET /blocks or /blocks.json
  def index
    @block = Block.where("user_id=?", current_user.id)

    # session["key_block"] ||= params[:key_block]
    session[:key] = '5'
  end

  # GET /blocks/1 or /blocks/1.json
  def show
  end

  # GET /blocks/new
  def new
    @block = Block.new
  end

  # GET /blocks/1/edit
  def edit
  end

  # POST /blocks or /blocks.json
  def create
    @block = Block.new(block_params)
    @block.user_id = current_user.id

    # respond_to do |format|
      if @block.save
        # redirect_to profile_path(@block.blocked_user_id), notice: "block was successfully created."
        redirect_to profile_path(@block.blocked_user_id, key_windowclose: params[:key_windowclose])

        # format.html { redirect_to @block, notice: "Block was successfully created." }
        # format.json { render :show, status: :created, location: @block }
      else
        # redirect_to profile_path(@block.blocked_user_id), notice: "block was successfully failed."
        redirect_to profile_path(@block.blocked_user_id, key_windowclose: params[:key_windowclose])
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /blocks/1 or /blocks/1.json
  def update
    respond_to do |format|
      if @block.update(block_params)
        format.html { redirect_to @block}
        format.json { render :show, status: :ok, location: @block }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1 or /blocks/1.json
  def destroy
    # @block.destroy

    # respond_to do |format|
    #   format.html { redirect_to blocks_path, status: :see_other, notice: "Block was successfully destroyed." }
    #   format.json { head :no_content }
    # end
    @block = Block.find_by(blocked_user_id: params[:id], user_id: current_user.id)
    @block.destroy
    # redirect_to profile_path(@block.blocked_user_id)
    redirect_to profile_path(@block.blocked_user_id, key_windowclose: params[:key_windowclose])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def block_params
      params.require(:block).permit(:user_id, :blocked_user_id)
    end
end
