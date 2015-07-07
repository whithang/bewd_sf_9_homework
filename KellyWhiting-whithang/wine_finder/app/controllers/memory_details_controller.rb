class MemoryDetailsController < ApplicationController
	before_action :authenticate_user!

	def index
      @memory_details = MemoryDetail.all
  end

	def new 
      @memory_detail = MemoryDetail.new

      if params[:winery]
        @winery = Winery.find(params[:winery]) 
# this is correct param when coming from winery/index
      else
        @winery = Winery.find(params[:winery_id])
# error when coming from new memory creation
      end 
	end

  def create
    @memory_detail = MemoryDetail.new(memory_detail_params)
    
    if @memory_detail.save
      redirect_to memory_path(@memory_detail.memory_id), notice: "Your Memory was updated successfully"
    else
      render "new"
    end
  end

	def edit
		@memory_detail = get_memory_detail
	end

  def update
    @memory_detail = get_memory_detail
    if @memory_detail.update_attributes(memory_detail_params) 
      redirect_to memory_path(@memory_detail.memory), notice: "Your Memory was updated successfully"
    else
      render 'edit'
    end
  end

  # def select
  #   @memory_detail = MemoryDetail.new
  #   if current_user
  #     @winery = Winery.find(params[:winery])
  #   end
  # end
 	
 	def show
    
 		@memory_detail = get_memory_detail
  end

	def destroy
    @memory_detail = get_memory_detail
    @memory_detail.destroy
    redirect_to memory_path, notice: "Item successfully deleted from this Memory"
  end
  
  private

  def memory_detail_params
  	params.require(:memory_detail).permit(:notes, :visited, :visited_date, :winery_id, :memory_id)
  end

  def get_memory_detail
  	MemoryDetail.find(params[:id])
  end
end
