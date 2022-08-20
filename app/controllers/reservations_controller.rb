class ReservationsController < ApplicationController

  def index
    @rooms = Room.all
    @q = Reservation.ransack(params[:q])
    @reservations = @q.result(distinct: true)
  end

  def show
    reservation
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params )

    if @reservation.save
      redirect_to reservations_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    reservation
  end

  def update
    if reservation.update(reservation_params )
      redirect_to reservations_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    reservation.destroy

    redirect_to reservations_path, notice: t('.destroyed'), status: :see_other
  end

  private

  def reservation_params
    params.require(:reservation).permit(:room_id, :entry_date, :departure_date, :customer_name, :customer_email)
  end

  def reservation
    @reservation = Reservation.find(params[:id])
  end
end