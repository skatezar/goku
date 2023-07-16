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

	def meetingfilter
		@meetings = Meeting.order(:start_time)
		@companies = Meeting.pluck(:company).uniq
    	@start_times = Meeting.pluck(:start_time).uniq
   		@industries = Meeting.pluck(:industry).uniq
   		@locations = Meeting.pluck(:location).uniq
	    @virtual_or_inperson_options = Meeting.pluck(:virtual_or_inperson).uniq

    	filter_meetings if params[:company].present? || params[:start_time].present? || params[:industry].present?
  	end

	private

	def filter_meetings
    	@meetings = @meetings.where(company: params[:company]) if params[:company].present?
	    @meetings = @meetings.where(start_time: params[:start_time]) if params[:start_time].present?
	    @meetings = @meetings.where(industry: params[:industry]) if params[:industry].present?
	    @meetings = @meetings.where(location: params[:location]) if params[:location].present?
	    @meetings = @meetings.where(virtual_or_inperson: params[:virtual_or_inperson]) if params[:virtual_or_inperson].present?
	end

	def filter_params_present?
	    params[:company].present? || params[:start_time].present? || params[:industry].present? ||
	    params[:location].present? || params[:virtual_or_inperson].present?
	end
end
