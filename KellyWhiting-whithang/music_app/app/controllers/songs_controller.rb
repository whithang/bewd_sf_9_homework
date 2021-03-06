class SongsController < ApplicationController
	def index
    if params[:artist_id]
      @songs = Song.where(artist_id: params[:artist_id])
    else
      @songs = Song.all
    end
  	
  end

	def new
		@song = Song.new
	end

  def create
  	@song = Song.new(song_params)
    if @song.save
      redirect_to artist_song_path(@song.artist,@song), notice: "New Song successfully created"
    else
      render "new"
    end
  end

	def edit
		@song = get_song
	end

  def update
    @song = get_song
    if @song.update_attributes(song_params)
      # missing code for update_attributes method
    else
      render 'edit'
    end
  end
 	
 	def show
 		@song = get_song
  end

def destroy
  # binding.pry
    @song = get_song
    @song.destroy
    redirect_to artists_path, notice: "Song successfully deleted"
  end
  
  private

  def song_params
  	params.require(:song).permit(:title, :album, :year, :artist_id)
  end

  def get_song
  	Song.find(params[:id])
  end
end
