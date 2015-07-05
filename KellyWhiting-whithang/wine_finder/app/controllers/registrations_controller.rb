class RegistrationsController < Devise::RegistrationsController

	def new
		super
		
	end

	def create
	  
	  super

    # session[:user_id] = current_user.id
    # session[:user_name] = current_user.email

		@memory = Memory.create(name: "Wish List", user_id: @user.id) 
	end 
		
	def update
		super
	end

end