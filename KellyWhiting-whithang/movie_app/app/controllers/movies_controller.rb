class MoviesController < ApplicationController
  def index
  	@movies = Movie.all
    @review = Review.all
  end

	def new
		@movie = Movie.new
	end

  def create
  	@movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie successfully created"
    else
      render "new"
    end
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

def destroy
    @movie = set_movie
    @movie.destroy
    redirect_to movies_path
  end
  
  private

  def movie_params
  	params.require(:movie).permit(:title, :year_released, :description)
  end

  def get_movie
  	Movie.find(params[:id])
  end

end
