class ReviewsController < ApplicationController
	def index
      @reviews = Review.all
  end

	def new
      @review = Review.new
	end

  def create
    @review = Review.new(review_params)
  end

	def edit
		@review = get_review
	end

  def update
    @review = get_review
    if @review.update_attributes(review_params)
    else
      render 'edit'
    end
  end
 	
 	def show
 		@review = get_review
  end

	def destroy
    @review = get_review
    @review.destroy
    redirect_to reviews_path, notice: "Review successfully deleted"
  end
  
  private

  def review_params
  	params.require(:review).permit(:user_id, :winery_id, :comment, :rating)
  end

  def get_review
  	Review.find(params[:id])
  end
end
