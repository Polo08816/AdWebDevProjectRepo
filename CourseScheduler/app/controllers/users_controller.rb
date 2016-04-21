class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @users = User.all
  end

  def edit
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def add_course
    course = Course.find(params[:id])
    user = current_user
    schedule = Schedule.new(:user_id=>user.id, :course_id=>course.id, :semester=>"Spring", :year=>2016, :complete=>false)
    respond_to do |format|
      if !schedule.valid?
        if schedule.save
          format.html { redirect_to users_url, notice: 'Course was successfully added to schedule.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { redirect_to users_url, alert: 'Course could not be added to schedule' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
          end
      else
        format.html { redirect_to users_url, alert: 'Course could not be added to schedule' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :firstName, :lastName, :streetAddr, :phoneNum, :userType)
  end
end
