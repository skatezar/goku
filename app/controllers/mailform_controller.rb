class MailformController < ApplicationController
	def index
		@emails = Mailform.all
	end
	
	def new
	    @email = Mailform.new
    end

	def create
		@email = Mailform.new(email_params)   
	    if @email.save
		    redirect_to root_path
		else
		    render :new
		end
	end

	private

	def email_params
		params.require(:mailform).permit(:email)
	end
end
