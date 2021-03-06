class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :set_course, only: [:show, :edit, :update, :destroy, :schedule_course, :schedule_admin]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/1
  # GET /courses/1.json
  def schedule_course
    @schedule = Schedule.all
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def schedule_add
    @courses = Course.all
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if (@course.courses_number == nil)
        format.html { redirect_to @course, alert: 'Course number missing.' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      else
        if @course.save
          format.html { redirect_to @course, notice: 'Course was successfully created.' }
          format.json { render :show, status: :created, location: @course }
        else
          format.html { render :new }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
#-      @course = current_course
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_name, :description, :course_number, :department, :prerequisite_course_number, :instructor_id)
    end
end
