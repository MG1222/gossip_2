class AuthorController < ApplicationController
	def show
		@user = User.find(params[:author_id])
		
	end
end
