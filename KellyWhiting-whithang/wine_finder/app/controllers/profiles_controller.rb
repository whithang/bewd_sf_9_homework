class ProfilesController < ApplicationController
	def index
      @profiles = Profile.all
  end

	def new
      @profile = Profile.new
	end

  def create
    @profile = Profile.new(profile_params)
  end

	def edit
		@profile = get_profile
	end

  def update
    @profile = get_profile
    if @profile.update_attributes(profile_params)
    else
      render 'edit'
    end
  end
 	
 	def show
 		@profile = get_profile
  end

	def destroy
    @profile = get_profile
    @profile.destroy
    redirect_to profiles_path, notice: "User Profile successfully deleted"
  end
  
  private

  def profile_params
  	params.require(:profile).permit(:user_id, :first_name, :last_name, :bio, :birth_date, :street, :city, :state, :zip, :photo)
  end

  def get_user
  	Profile.find(params[:id])
  end
end
