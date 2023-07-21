class UkfinancejobsController < ApplicationController
  before_action :set_ukfinancejob, only: [:show, :edit, :update, :destroy]

  def index
    @ukfinancejobs = Ukfinancejob.order(:application_opening_date)
     # Initialize filter options
    @locations = Ukfinancejob.pluck(:location).uniq
    @types_of_job = Ukfinancejob.pluck(:type_of_job).uniq
    @deadline_dates = Ukfinancejob.pluck(:deadline_date).uniq
    @companies = Ukfinancejob.pluck(:company).uniq

    # Apply filters if provided in params
    @ukfinancejobs = @ukfinancejobs.where(location: params[:location]) if params[:location].present?
    @ukfinancejobs = @ukfinancejobs.where(company: params[:company]) if params[:company].present?
    @ukfinancejobs = @ukfinancejobs.where(type_of_job: params[:type_of_job]) if params[:type_of_job].present?
    @ukfinancejobs = @ukfinancejobs.where(deadline_date: params[:deadline_date]) if params[:deadline_date].present?
    @ukfinancejobs = @ukfinancejobs.where(rolling_admission: params[:rolling_admission]) if params[:rolling_admission].present?

    if params[:application_opening_date_filter] == 'true'
      @ukfinancejobs = @ukfinancejobs.where('application_opening_date < ?', Date.today)
    end
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
    if @ukfinancejob.update(ukfinancejob_params)
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
    params.require(:ukfinancejob).permit(:application_opening_date, :eligibility, :industry, :hr_email, :app_process, :photo, :title, :url, :type_of_job, :location, :deadline_date,  :rolling_admission, :company, :guesstimate, :description, :guesstimate_deadline)
  end
end