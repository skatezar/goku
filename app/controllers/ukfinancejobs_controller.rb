class UkfinancejobsController < ApplicationController
  before_action :set_ukfinancejob, only: [:show, :edit, :update, :destroy]

  def index
    @ukfinancejobs = Ukfinancejob.all
     # Initialize filter options
    @locations = Ukfinancejob.pluck(:location).uniq
    @types_of_job = Ukfinancejob.pluck(:type_of_job).uniq
    @deadline_dates = Ukfinancejob.pluck(:deadline_date).uniq

    # Apply filters if provided in params
    @ukfinancejobs = @ukfinancejobs.where(location: params[:location]) if params[:location].present?
    @ukfinancejobs = @ukfinancejobs.where(type_of_job: params[:type_of_job]) if params[:type_of_job].present?
    @ukfinancejobs = @ukfinancejobs.where(deadline_date: params[:deadline_date]) if params[:deadline_date].present?
    @ukfinancejobs = @ukfinancejobs.where(rolling_admission: params[:rolling_admission]) if params[:rolling_admission].present?
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
    params.require(:ukfinancejob).permit(:title, :url, :type_of_job, :location, :deadline_date, :rolling_admission)
  end
end