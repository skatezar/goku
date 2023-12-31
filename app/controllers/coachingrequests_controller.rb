class CoachingrequestsController < ApplicationController
	def index
		@coachingrequest = Coachingrequest.all
	end

	def new
	    @coachingrequest = Coachingrequest.new
    end

	def create
		@coachingrequest = Coachingrequest.new(coachingrequest_params)   
	    if @coachingrequest.save
		    redirect_to requestsubmission_path
		else
		    render :new
		end
	end

	private

	def coachingrequest_params
		params.require(:coachingrequest).permit(:email, :description)
	end
end
