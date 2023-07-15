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
			redirect_to profile_path(@profile)
		else
			render :new
		end
	end

	def edit
		@user = current_user
		@profile = Profile.find_by(user_id: current_user.id)
  	end

	def update
		@profile = Profile.find_by(user_id: current_user.id)
		@user = current_user
		if @profile.update(profile_params)
			redirect_to @profile
		else
			render :edit
		end
	end

	private

	def profile_params
		params.require(:profile).permit(:bio, :linkedin, :username, :user_id)
	end


end


