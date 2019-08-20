module Api
  module V1
    class ReviewsController < ApplicationController
      before_action :authenticate_user!
      def index
        user_name = params[:user_name]
        @place = Place.find(params[:place_id])
        @reviews = @place.reviews
        json_response(@reviews)
      end

      def show
        @place = Place.find(params[:place_id])
        @review = @place.reviews.find(params[:id])
        json_response(@review)
      end

      def create
        @review = Review.create!(review_params)
        json_response(@review, :created)
      end

      def update
        @review = Review.find(params[:id])
        if @review.update!(review_params)
          render status: 200, json: {
            message: "This review has been updated successfully."
          }
        end
      end

      def destroy
        @review = Review.find(params[:id])
        @review.destroy
      end

      private
      def json_response(object, status = :ok)
        render json: object, status: status
      end

      def review_params
        params.permit(:user_name, :text)
      end
    end
  end
end
