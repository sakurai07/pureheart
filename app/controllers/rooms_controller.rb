class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    room = []
    ActiveRecord::Base.transaction do
      room = Room.new
      room.save

      member1 = Member.new(:room_id => room.id, :user_id => current_user.id)
      member1.save

      member2 = Member.new(:room_id => room.id, :user_id => params[:member][:followed_user_id])
      member2.save
    end

    redirect_to messages_path(room_id: room.id)

    # @room = Room.new(room_params)

    # respond_to do |format|
    #   if @room.save
    #     format.html { redirect_to @room, notice: "Room was successfully created." }
    #     format.json { render :show, status: :created, location: @room }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @room.errors, status: :unprocessable_entity }
    #   end
    # end

  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_path, status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.fetch(:room, {})
    end
end
