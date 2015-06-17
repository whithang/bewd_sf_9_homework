class ArtistsController < ApplicationController
	def index
  	@artists = Artist.all
    
  end

	def new
		@artist = Artist.new
	end

  def create
  	@artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path, notice: "New Artist successfully created"
    else
      render "new"
    end
  end

	def edit
		@artist = get_artist
	end

  def update
    @artist = get_artist
    if @artist.update_attributes(artist_params)
    else
      render 'edit'
    end
  end
 	
 	def show
 		@artist = get_artist
  end

def destroy
    # binding.pry
    # @artist = get_artist
    # @artist.destroy
    # need to delete all songs associated with this artist too
    redirect_to artist_path, notice: "Artist successfully deleted"
  end
  
  private

  def artist_params
  	params.require(:artist).permit(:name, :bio, :formed_date, :formed_city)
  end

  def get_artist
  	Artist.find(params[:id])
  end

end
