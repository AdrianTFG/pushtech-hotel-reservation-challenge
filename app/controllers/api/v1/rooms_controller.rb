module Api
  module V1
    class RoomsController < ApplicationController

      before_action :authorize_api!

      def index
        rooms = Room.order('room_name ASC')
        render json: {status: 'SUCCESS', message: 'Rooms loaded', data: rooms}, status: :ok
      end

      def show
        render json: {status: 'SUCCESS', message: 'Room loaded', data: room}, status: :ok
      end

      def create
        @room = Room.new(room_params)

        if @room.save
          render json: {status: 'SUCCESS', message: 'Room saved', data: @room}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Room not saved', data: @room.errors}, status: :unprocessable_entity
        end
      end

      def update
        authorize_api! room

        if @room.update(room_params )
          render json: {status: 'SUCCESS', message: 'Room Updated', data: @room}, status: :ok
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        authorize_api! room

        room.destroy

        render json: {status: 'SUCCESS', message: 'Room deleted', data: @room}, status: :ok
      end

      private

      def room_params
        params.require(:room).permit(:room_name, :description, :price, :currency)
      end

      def room
        @room ||= Room.find(params[:id])
      end
      
    end
  end
end