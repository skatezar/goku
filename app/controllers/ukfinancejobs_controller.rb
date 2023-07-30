class UkfinancejobsController < ApplicationController
  before_action :set_ukfinancejob, only: [:show, :edit, :update, :destroy]
  include ActiveModel::Dirty

  def index
    @ukfinancejobs = Ukfinancejob.order(:application_opening_date)
     # Initialize filter options
    @locations = Ukfinancejob.pluck(:location).uniq
    @types_of_job = Ukfinancejob.pluck(:type_of_job).uniq.sort
    @deadline_dates = Ukfinancejob.pluck(:deadline_date).uniq
    @companies = Ukfinancejob.pluck(:company).uniq.sort
    @fields_in_finance = Ukfinancejob.pluck(:field_in_finance).uniq.sort


    # Apply filters if provided in params
    @ukfinancejobs = @ukfinancejobs.where(location: params[:location]) if params[:location].present?
    @ukfinancejobs = @ukfinancejobs.where(company: params[:company]) if params[:company].present?
    @ukfinancejobs = @ukfinancejobs.where(type_of_job: params[:type_of_job]) if params[:type_of_job].present?
    @ukfinancejobs = @ukfinancejobs.where(deadline_date: params[:deadline_date]) if params[:deadline_date].present?
    @ukfinancejobs = @ukfinancejobs.where(rolling_admission: params[:rolling_admission]) if params[:rolling_admission].present?

    if params[:application_opening_date_filter] == 'true'
      @ukfinancejobs = @ukfinancejobs.where('application_opening_date < ?', Date.today)
    end

    @ukfinancejobs = @ukfinancejobs.where(diversity: true) if params[:diversity_filter] == 'true'

    if params[:field_in_finance].present?
      @ukfinancejobs = @ukfinancejobs.where(field_in_finance: params[:field_in_finance])
    end

    if params[:search].present?
      @ukfinancejobs = @ukfinancejobs.search_by_keyword(params[:search])
    end   
  end

  def favorite
    @ukfinancejob = Ukfinancejob.find(params[:id])
    current_user.favorite_ukfinancejobs << @ukfinancejob
    redirect_to @ukfinancejob, notice: 'UK finance job has been favorited!'
    
  end

  def unfavorite
    @ukfinancejob = Ukfinancejob.find(params[:id])
    current_user.favorite_ukfinancejobs.delete(@ukfinancejob)
    redirect_to @ukfinancejob, notice: 'UK finance job has been unfavorited.'
  end

  def favorites
    @favorite_ukfinancejobs = current_user.favorite_ukfinancejobs
  end

  def show
  end

  def new
    @ukfinancejob = Ukfinancejob.new
  end

  def create
    @ukfinancejob = Ukfinancejob.new(ukfinancejob_params)

    if @ukfinancejob.save
      redirect_to @ukfinancejob, notice: 'UK finance job was successfully created.'
    else
      render :new
    end
  end

  def edit
    @ukfinancejob = Ukfinancejob.find(params[:id])
  end

  def update
    if Date.today >= @ukfinancejob.application_opening_date && Date.today <= @ukfinancejob.deadline_date 
      @status = "OPEN"
    elsif Date.today < @ukfinancejob.application_opening_date
      @status = "NOT YET OPEN"
    else
      @status = "CLOSED"
    end

    previous_status = @status

    if @ukfinancejob.update(ukfinancejob_params)
      if previous_status != 'OPEN' && Date.today >= @ukfinancejob.application_opening_date && Date.today <= @ukfinancejob.deadline_date 
        @favorited_jobs = Favorite.where(ukfinancejob_id: @ukfinancejob.id)
        user_ids_that_favorited_job = []
        @favorited_jobs.each do |job|
          user_ids_that_favorited_job.push(job.user_id)
        end 
        user_ids_that_favorited_job.each do |user_id|
          user = User.find(user_id)
          JobNotificationMailer.job_notification(user, @ukfinancejob).deliver_now
        end
      end
      redirect_to @ukfinancejob, notice: 'UK finance job was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ukfinancejob.destroy
    redirect_to ukfinancejobs_url, notice: 'UK finance job was successfully destroyed.'
  end

  private

  def set_ukfinancejob
    @ukfinancejob = Ukfinancejob.find(params[:id])
  end

  def ukfinancejob_params
    params.require(:ukfinancejob).permit(:application_opening_date, :eligibility, :industry, :hr_email, :app_process, :photo, :title, :url, :type_of_job, :location, :deadline_date,  :rolling_admission, :company, :guesstimate, :description, :guesstimate_deadline, :diversity, :field_in_finance)
  end


    
end