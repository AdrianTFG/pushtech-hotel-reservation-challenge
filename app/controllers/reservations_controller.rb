class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(product_params)

    if @reservation.save
      redirect_to reservations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:reservation).permit(:hotel_name, :price, :currency, :entry_date, :departure_date, :customer_name, :customer_email)
  end
end