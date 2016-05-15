class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :schedule, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    if (current_user.roles_mask == 2)
      @user = User.all
      @course = Course.all
      redirect_to "/users/admin_index"
#      @schedule = Schedule.where(user_id: current_user.id, complete: "In Progress")
    else
      @user = User.where(id: current_user.id)
      @schedule = Schedule.where(users_id: current_user.id, complete: "In Progress")
      if (current_user.roles_mask == 1)
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
    if (current_user.roles_mask == 2)
      @schedule = Schedule.all
    else
      @schedule = Schedule.where(users_id: current_user.id, complete: "In Progress")
    end
  end

  # GET /users/1
  # GET /users/1.json
  def schedule_remove
    @schedule = Schedule.where(users_id: params[:users_id], courses_id: params[:courses_id], semester: params[:semester], year: params[:year]).delete_all
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Course was successfully removed from schedule.' }
    end
  end


  # GET /users/1
  # GET /users/1.json
  def show
  end

  def add_course
    course = Course.find(params[:course_id])
    @user = current_user
    schedule = Schedule.new(:users_id=>current_user.id, :courses_id=>course.id, :semester=>"Spring", :year=>2016, :complete=>"In Progress")
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

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    user_tmp = User.find(params[:id])
    user_tmp.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :street_address, :phone_number, :roles_mask)
  end
end
