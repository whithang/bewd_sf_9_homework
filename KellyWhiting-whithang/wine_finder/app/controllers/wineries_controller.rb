class WineriesController < ApplicationController

	def index

      @wineries = Winery.all
  end

	def new
      @winery = Winery.new
	end

  def create
    @winery = Winery.new(winery_params)
  end

	def edit
		@winery = get_winery
	end

  def update
    @winery = get_winery
    if @winery.update_attributes(winery_params)
      redirect_to wineries_path(@winery, notice: "Winery updated successfully")
    else
      render 'edit'
    end
  end
 	
 	def show
 		@winery = get_winery
    if current_user
      @existing_review = @winery.reviews.exists?(:user_id => current_user.id)
    else
      @existing_review = false
    end
    # @friends_review = @winery.reviews.exists?(:user_id => current_user.id)
  end

  def search
  	# @search_address = Winery.find_by_address(params["SearchInput"])
  	# add this method or figure out how to search
    # downcase after entry
    
    if !params[:city].blank?
      @city = params[:city]
      @wineries = Winery.city(@city)
      render 'search'
    else
      @wineries = Winery.all
      render 'index'
    end
  end

	def destroy
    @winery = get_winery
    @winery.destroy
    redirect_to wineries_path, notice: "Winery successfully deleted"
  end
  
  private

  def winery_params
  	params.require(:winery).permit(:name, :bio, :street, :city, :state, :zip, :photo, :phone, :email, :appointment, :pets, :picnic, :fee, :open, :close, :website)
  end

  def get_winery
  	Winery.find(params[:id])
  end
end
