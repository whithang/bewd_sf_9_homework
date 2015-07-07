class MemoriesController < ApplicationController
  before_action :authenticate_user!

	def index

    if current_user
      @memories = Memory.where(user_id: current_user.id)
    else
      @memories = Memory.all
    end 
  end

	def new
    
      @memory = Memory.new
      @winery = Winery.where(id: params[:winery_id]).first
	end

  def create

    @memory = Memory.new(memory_params)
    @winery = Winery.where(id: params[:memory][:winery_id]).first

    if @memory.save
      redirect_to new_winery_memory_memory_detail_path(@winery, @memory), notice: "Your New Memory was created successfully"
    else
      render "new"
    end
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
  	params.require(:memory).permit(:user_id, :name, :trip_date, :trip_date_end)
  end

  def get_memory
  	Memory.find(params[:id])
  end
end
