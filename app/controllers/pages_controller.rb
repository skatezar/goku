class PagesController < ApplicationController
	def index
	end

	def CV
	end

	def interviews
	end

	def ukfinancejobs
	end	

	def requestsubmission
	end

	def networking
		start_date = params.fetch(:start_date, Date.today).to_date
		@meetings = Meeting.all
		#start_date = params.fetch(:start_date, Date.today).to_date @meetings = Meeting.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
	end
end
