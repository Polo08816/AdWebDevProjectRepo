class SchedulesController < ApplicationController
  load_and_authorize_resource

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def index
    @schedule = Schedule.find(params[:id])
  end

  def show
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def schedule_params
    params.require(:schedule).permit(:users_id, :courses_id, :semester, :year, :complete, :id)
  end
end
