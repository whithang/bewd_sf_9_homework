class UsersController < ApplicationController
	def index
      @users = User.all
  end

	def new
      @user = User.new

	end

  def create
    @user = User.new(user_params)
    
  end

	def edit
		@user = get_user
	end

  def update
    @user = get_user
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "User details updated successfully"
    else
      render 'edit'
    end
  end
 	
 	def show
 		@user = get_user
  end

	def destroy
    @user = get_user
    @user.destroy
    redirect_to users_path, notice: "User successfully deleted"
  end
  
  private

  def user_params
  	params.require(:user).permit(:email)
  end

  def get_user
  	User.find(params[:id])
  end
end
