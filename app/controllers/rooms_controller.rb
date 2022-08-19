class RoomsController < ApplicationController

  def index
    @rooms = Room.all.order(room_name: :asc)
  end

  def new
    @room = Room.new
  end

  def edit
    room
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to rooms_url, notice: t('.created')
    else
      ender :new, status: :unprocessable_entity
    end
  end

  def update
    if room.update(room_params)
      redirect_to rooms_url, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: t('.destroyed') }
    end
  end

  private
    def room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:room_name, :description, :price, :currency)
    end
end
