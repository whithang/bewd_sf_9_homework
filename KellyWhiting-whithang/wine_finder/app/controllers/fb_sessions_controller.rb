class FbSessionsController < ApplicationController
  def create
  	fb_user = FbUser.from_omniauth(env["omniauth.auth"])
    session[:user_id] = fb_user.id
    session[:user_name] = fb_user.name
    session[:user_email] = fb_user.email
# should we look to see if a matching user profile exists to the email?
# if so, connect fb and regular user?

    redirect_to root_path
  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_path
  end
end
