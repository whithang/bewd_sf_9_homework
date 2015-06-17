module SongsHelper

	def artist_name
	  if params.has_key?(:artist_id)
	  	artist = Artist.find(params[:artist_id])
	  	"Song for #{artist.name}"
	  else
     "New Song"
   end
	end
end
