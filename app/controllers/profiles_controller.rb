class ProfilesController < ApplicationController
	def show
		@profile = Profile.find_by(user_id: current_user.id)
	end

	def new
		@profile = Profile.new
		@user = current_user
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.user_id = current_user.id
		@user = current_user

		if @profile.save
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def profile_params
		params.require(:profile).permit(:bio, :linkedin, :username, :user_id)
	end


end


