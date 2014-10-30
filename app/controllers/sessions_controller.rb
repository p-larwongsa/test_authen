class SessionsController < ApplicationController
	skip_before_filter :set_current_user
	def create
		auth = request.env["omniauth.auth"]
		user = Currently.find_by_provider_and_uid(auth["provider"],auth["uid"]) || Currently.create_with_omniauth(auth)
		session[:user_id] = user.id
		redirect_to welcome_path
	end
	def destroy
		session.delete(:user_id)
		flash[:notice] = 'Logged out succesfully'
		redirect_to welcome_path
	end
end