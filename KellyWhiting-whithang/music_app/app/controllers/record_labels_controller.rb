class RecordLabelsController < ApplicationController
before_action :authenticate_user!, except: [:index]
def index
  	@record_labels = RecordLabel.all
    
  end

	def new
		@record_label = RecordLabel.new
	end

  def create
  	@record_label = RecordLabel.new(record_label_params)
    if @record_label.save
      redirect_to record_labels_path, notice: "New Record Label successfully created"
    else
      render "new"
    end
  end

	def edit
		@record_label = get_record_label
	end

  def update
    @record_label = get_record_label
    if @record_label.update_attributes(record_label_params)
      # missing code for update_attributes method
    else
      render 'edit'
    end
  end
 	
 	def show
 		@record_label = get_record_label
  end

def destroy
    # binding.pry
    # @artist = get_artist
    # @artist.destroy
    # need to delete all songs associated with this artist too
    redirect_to record_label_path, notice: "Record Label successfully deleted"
  end
  
  private

  def record_label_params
  	params.require(:record_label).permit(:name, :city, :year_founded, :genre)
  end

  def get_record_label
  	RecordLabel.find(params[:id])
  end
end
