module Api
  module V1
    class PlacesController < ApplicationController
      def index
        places = Place.order('created_at DESC');
        render json: {status: 'Success', message: 'Loaded places', data:places}, status: :ok
      end

      def show
        place = Place.find(params[:id])
        render json: {status: 'Success', message: 'Loaded place', data:place}, status: :ok
      end

      def create
        place = Place.new(place_params)
        if place.save
          render json: {status: 'Success', message: 'Place saved', data:place}, status: :ok
        else
          render json: {status: 'Error', message: 'Place not saved', data:place}, status: :unprocessable_entity
        end
      end

      def destroy
        place = Place.find(params[:id])
        place.destroy
        render json: {status: 'Success', message: 'Burned Down!', data:place}, status: :ok

      end
      def update
        place = Place.find(params[:id])
        if place.update_attributes(place_params)
          render json: {status: 'Success', message: 'Updated place', data:place}, status: :ok
        else
          render json: {status: 'Error', message: 'Not Updated', data:place}, status: :unprocessable_entity

        end
      end

      def place_params
        params.permit(:name)
      end
    end
  end
end
