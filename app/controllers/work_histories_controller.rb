class WorkHistoriesController < ApplicationController
  def new
    @work_history = WorkHistory.new
    @user = current_user
  end

  def create
  end

end

