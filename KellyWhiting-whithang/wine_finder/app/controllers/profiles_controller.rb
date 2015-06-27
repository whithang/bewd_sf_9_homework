class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
	def index
    if params[:user_id]
      @profile = Profile.where(user_id: params[:user_id])
    else
      @profiles = Profile.all
    end
  end

	def new
      @profile = Profile.new
	end

  def create
    @profile = Profile.new(profile_params)
    render :index
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

  def get_profile
  	Profile.find(params[:user_id])
  end
end
