class ReviewsController < ApplicationController
  def new
    # restaurant_id is the restaurant id found in the review table
    @restaurant = Restaurant.find(params[:restaurant_id])
    # instantiate
    @review = Review.new
  end

  def create
    # create responds to a button click in the form
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params) # why new instead of create?
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    review = Review.find(params[:id])
    review.destroy
    redirect_to restaurant_path(@restaurant.id)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
