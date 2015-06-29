class RegistrationsController < Devise::RegistrationsController

	def new
		super
	end

	def create
	  
	  super
		@memory = Memory.create(name: "Wish List", user_id: @user.id) 
	end 
		
	def update
		super
	end

end