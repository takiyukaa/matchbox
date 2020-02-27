class WorkHistoriesController < ApplicationController

  def new
    @workhistory = WorkHistory.new
      authorize @workhistory
  end

  def create
    @workhistory = WorkHistory.new(work_history_params)
    @workhistory.user = current_user
    if @workhistory.save
      redirect_to bookings_path
      authorize @workhistory
    else
      render :new
    end
  end

private

  def work_history_params
    params.require(:work_history).permit(:company_name, :job_title, :start_date, :end_date, :description)
  end
end
