module Api
  module V1
    class PlacesController < ApplicationController
      def index
        places = Place.order('created_at DESC');
        render json: {status: 'Success', message: 'Loaded places', data:places}, status: :ok
      end
    end
  end
end
