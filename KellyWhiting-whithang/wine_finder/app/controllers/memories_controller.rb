class MemoriesController < ApplicationController
  before_action :authenticate_user!

	def index
    if params[:user_id] 
      @memories = Memory.where(user_id: params[:user_id])
    else
      @memories = Memory.all
    end 
  end

	def new
      @memory = Memory.new
	end

  def create
    @memory = Memory.new(memory_params)
  end

	def edit
		@memory = get_memory
	end

  def update
    @memory = get_memory
    if @memory.update_attributes(memory_params) 
      redirect_to memory_path(@memory), notice: "Your Memory was updated successfully"
    else
      render 'edit'
    end
  end

  # def select
  #   @memory = Memory.new
  #   if current_user
  #     @memories = Memory.where(user_id: current_user)
  #     @winery = Winery.find(params[:winery])
  #   end
  # end
 	
 	def show
 		@memory = get_memory
    # @memory_details = MemoryDetail.where(memory_id: @memory)
    # @winery = Winery.where(id: @memory)
  end

	def destroy
    @memory = get_memory
    @memory.destroy
    redirect_to memories_path, notice: "Memory successfully deleted"
  end
  
  private

  def memory_params
  	params.require(:memory).permit(:user_id, :name, :trip_date)
  end

  def get_memory
  	Memory.find(params[:id])
  end
end
