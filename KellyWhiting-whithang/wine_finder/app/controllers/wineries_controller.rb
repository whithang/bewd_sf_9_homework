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
    else
      render 'edit'
    end
  end
 	
 	def show
 		@winery = get_winery
  end

  def search
  	# @search_address = Winery.find_by_address(params["SearchInput"])
  	# add this method or figure out how to search
    @wineries = Winery.all
  end

	def destroy
    @winery = get_winery
    @winery.destroy
    redirect_to wineries_path, notice: "Winery successfully deleted"
  end
  
  private

  def winery_params
  	params.require(:winery).permit(:name, :bio, :founded_date, :street, :city, :state, :zip, :photo)
  end

  def get_winery
  	Winery.find(params[:id])
  end
end
