class MemoriesController < ApplicationController
  before_action :authenticate_user!
  
	def index
      @memories = Memory.all
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
    else
      render 'edit'
    end
  end
 	
 	def show
 		@memory = get_memory
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
