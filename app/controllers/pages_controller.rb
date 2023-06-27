class PagesController < ApplicationController
	def index
	end

	def CV
		if params[:message].present?
    		@response = ChatgptService.call(params[:message] || "what is your name")
    	end
	end

	def interviews
	end

	def ukfinancejobs
	end	

	def requestsubmission
	end
end
