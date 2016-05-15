class SchedulesController < ApplicationController
  load_and_authorize_resource
#  before_action :set_schedule, only: [:show, :edit, :update, :schedule, :destroy]

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def index
    @schedule = Schedule.find(params[:id])
  end

  def show
  end

  def update
    @schedule = Schedule.find(params[:id])
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to "/users", notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def schedule_params
    params.require(:schedule).permit(:users_id, :courses_id, :semester, :year, :complete, :id)
  end
end
