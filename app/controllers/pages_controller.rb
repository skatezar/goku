class PagesController < ApplicationController
	def index
	end

	def CV
    	@response = ChatgptService.call(params[:message])
	end

	def interviews
	end

	def ukfinancejobs
	end	
end
