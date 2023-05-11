class UkfinancejobsController < ApplicationController
  before_action :set_ukfinancejob, only: [:show, :edit, :update, :destroy]

  def index
    @ukfinancejobs = Ukfinancejob.all
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