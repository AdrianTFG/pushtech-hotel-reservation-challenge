module Api
  module V1
    class RoomsController < ApplicationController

      before_action :check_token

      before_action :authorize_api!

      def index
        rooms = Room.order('room_name ASC')
        render json: {status: 'SUCCESS', message: 'Rooms loaded', data: rooms}, status: :ok
      end

      def show
        room = Room.find_by_id(params[:id])
        render json: {status: 'SUCCESS', message: 'Room loaded', data: room}, status: :ok
      end

      def create
        @room = Room.new(room_params)

        if @room.save
          render json: {status: 'SUCCESS', message: 'Room saved', data: @reservation}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Room not saved', data: @reservation.errors}, status: :unprocessable_entity
        end
      end


      private

      def room_params
        params.require(:room).permit(:room_name, :description, :price, :currency)
      end
      
    end
  end
end