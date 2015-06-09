class MoviesController < ApplicationController
  def index
  	@movies = Movie.all
  end

	def new
		@movie = Movie.new
	end

  def create
  	@movie = Movie.create(movie_params)

  	redirect_to movies_path
  end

	def edit
		@movie = get_movie
	end

  def update
    @movie = get_movie
    if @movie.update_attributes(movie_params)
    else
      render 'edit'
    end
  end
 	
 	def show
 		@movie = get_movie
  end

  private

  def movie_params
  	params.require(:movie).permit(:title, :year_released, :description)
  end

  def get_movie
  	Movie.find(params[:id])
  end

end
