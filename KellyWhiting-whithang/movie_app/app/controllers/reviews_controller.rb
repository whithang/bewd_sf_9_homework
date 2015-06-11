class ReviewsController < ApplicationController

  def create
  	@movie = Movie.find(params[:review_id])
    @review = @movie.articles.create(review_params)
      redirect_to movies_path(@movie)
  end

	def destroy
    @movie = Movie.find(params[:movie_id])
    @review = @movie.comments.find(params[:id])
    @review.destroy
    redirect_to movie_path(@movie)
  end
  
  private

  def review_params
  	params.require(:review).permit(:movie_id, :comment, :user_name, :rating)
  end

end
