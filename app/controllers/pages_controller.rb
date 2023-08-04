class PagesController < ApplicationController
	def index
		@ukfinancejobs = Ukfinancejob.order(:application_opening_date)
		@newjobs = @ukfinancejobs.where('application_opening_date BETWEEN ? AND ?', Date.today, 1.week.from_now)
		@events = Meeting.where('start_time BETWEEN ? AND ?', Date.today, 1.week.from_now)

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

  	def daily
  		alljobs = Ukfinancejob.all
  		@alljobs_array = []
  		@counter = 0
  		alljobs.each do |job|
  			if job.application_opening_date == Date.today
  				@alljobs_array.push(job)
  				@counter = @counter + 1
  			end
  		end 

  		return @alljobs_array
  	end

  	def lol
		alljobs = Ukfinancejob.all

  		@alljobs_array_opening_today = []
  		@alljobs_array_closing_today = []
  		@alljobs_array_opening_week = []

  		@jobcounter_opening = 0
  		@jobcounter_closing = 0
  		@jobcounter_opening_week = 0

  		alljobs.each do |job|
  			if job.guesstimate == false && job.application_opening_date == Date.today
  				@alljobs_array_opening_today.push(job)
  				@jobcounter_opening = @jobcounter_opening + 1
  			end

  			if job.guesstimate_deadline == false && job.deadline_date == Date.today
  				@alljobs_array_closing_today.push(job)
  				@jobcounter_closing = @jobcounter_closing + 1
  			end 

  			if job.guesstimate_deadline == false && (job.application_opening_date) <= (Date.today + 7)
  				@alljobs_array_opening_week.push(job)
  				@jobcounter_opening_week = @jobcounter_opening_week + 1
  			end 
  		end 



  		allevents = Meeting.all
  		@allevents_array = []
  		@eventcounter = 0
  		allevents.each do |event|
  			if event.start_time == Date.today
  				@allevents_array.push(event)
  				@eventcounter = @eventcounter + 1
  			end
  		end 
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
