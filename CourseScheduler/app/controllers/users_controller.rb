class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    tmp_user = User.find(current_user.id)
    if (tmp_user.user_type == "Admin")
      @user = User.all
      @course = Course.all
      redirect_to "/users/admin_index"
#      @schedule = Schedule.where(user_id: current_user.id, complete: "In Progress")
    else
      @user = User.where(id: current_user.id)
      @schedule = Schedule.where(user_id: current_user.id, complete: "In Progress")
      if (tmp_user.user_type == "Instructor")
        redirect_to "/users/instructor_index"
      end
    end
  end

  def admin_index
  end

  def instructor_index
    @user = User.where(id: current_user.id)
    @course = Course.all
  end

  def instructor_update
    respond_to do |format|
      format.html {redirect_to "/users/instructor_index"}
      format.js {render :layout => false}
    end
  end

  def edit
  end

  def schedule
    tmp_user = User.find(current_user.id)
    if (tmp_user.user_type == "Admin")
      @schedule = Schedule.all
    else
      @schedule = Schedule.where(user_id: current_user.id, complete: "In Progress")
    end
  end
  # GET /users/1
  # GET /users/1.json
  def show
  end

  def add_course
    course = Course.find(params[:id])
    user = current_user
    schedule = Schedule.new(:user_id=>user.id, :course_id=>course.id, :semester=>"Spring", :year=>2016, :complete=>"In Progress")
    respond_to do |format|
      if schedule.valid?
        if schedule.save
          format.html { redirect_to users_url, notice: 'Course was successfully added to schedule.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { redirect_to users_url, alert: 'Course could not be added to schedule' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
          end
      else
        format.html { redirect_to users_url, alert: 'Course could not be added to schedule (invalid)' }
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
    params.require(:user).permit(:email, :first_name, :last_name, :street_address, :phone_number, :user_type)
  end
end
