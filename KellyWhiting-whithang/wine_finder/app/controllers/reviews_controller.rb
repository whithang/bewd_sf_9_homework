class ReviewsController < ApplicationController
  before_action :authenticate_user!

	def index
      @reviews = Review.all
      @has_reviews = @reviews.exists?(:user_id => current_user.id)
      if @has_reviews
        @my_reviews = @reviews.where(user_id: current_user.id)
      end
  end

	def new
      @review = Review.new
      @winery = Winery.find(params[:winery_id])
      @user = current_user
	end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to winery_path(@review.winery), notice: "New Review successfully added"
    else
      render "new"
    end
  end

	def edit
		@review = get_review
	end

  def update
    @review = get_review
    
    if @review.update_attributes(review_params)
      redirect_to reviews_path, notice: "Your Review was updated successfully"
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
