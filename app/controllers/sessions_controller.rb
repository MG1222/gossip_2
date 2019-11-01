class SessionsController < ApplicationController
	def new
		
	end
	
	def create
		@user = User.find_by(email: params[:email])

		if @user && @user.authenticate(params[:password])
 
     	 flash[:success] = 'ok'
     	 redirect_to gossips_path
     	else
			flash.now[:danger] = 'nop'
      		render new_session_path
		end
		
	end

 	def destroy
 		session.delete(:user_id)
 		redirect_to root_path
 	
 	end

end # class 
