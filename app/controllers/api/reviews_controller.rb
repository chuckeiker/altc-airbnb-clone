class Api::ReviewsController < ApplicationController
    
    wrap_parameters include: Review.attribute_names + [
        "listingId",
        "reviewerId",
        "reservationId",
        "checkIn",
    ]

    def create

        @review = Review.new(review_params)

        if @review.save
            # @reviews = current_user.reviews
            render :show
        else
            render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def index
        @review = current_user.reviews
        render :index
    end

    def show
        @review = Review.find_by(id: params[:id])
            render :show
    end

    def update
        @review = Review.find_by(id: params[:id])
        if @review.update(review_params)
            render :show
            
        else
            render json: @review.errors.full_messages, status: 422
        end
    end

    def destroy
        @review = Review.find_by(id: params[:id])

        if @review.reviewer_id == current_user.id
            @review.destroy
            render :show
        end
    end


    private

    def review_params
        params.require(:review).permit(
        :listing_id,
        :reviewer_id,
        :reservation_id,
        :cleanliness,
        :accuracy,
        :value,
        :communication,
        :check_in,
        :location,
        :rating,
        :body
        )
    end

end
