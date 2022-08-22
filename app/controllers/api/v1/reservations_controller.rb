module Api
  module V1
    class ReservationsController < ApplicationController
      skip_before_action :verify_authenticity_token

      before_action :check_token

      def index
        reservations = Reservation.order('entry_date DESC')
        render json: {status: 'SUCCESS', message: 'All reservation loaded', data: reservations}, status: :ok
      end

      def show
        reservation
        render json: {status: 'SUCCESS', message: 'Reservation loaded', data: @reservation}, status: :ok
      end

      def create
        @reservation = Reservation.new(reservation_params)
        @reservation.user_id = @user.id

        if @reservation.save
          render json: {status: 'SUCCESS', message: 'Reservation saved', data: @reservation}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Reservation not saved', data: @reservation.errors}, status: :unprocessable_entity
        end
      end

      def update
        authorize_api! reservation

        if reservation.update(reservation_params )
          render json: {status: 'SUCCESS', message: 'Reservation Updated', data: @reservation}, status: :ok
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        authorize_api! reservation

        reservation.destroy

        render json: {status: 'SUCCESS', message: 'Reservation deleted', data: @reservation}, status: :ok
      end

      private

      def reservation_params
        params.require(:reservation).permit(:room_id, :entry_date, :departure_date, :customer_name, :customer_email)
      end

      def reservation
        @reservation ||= Reservation.find(params[:id])
      end
    end
  end
end