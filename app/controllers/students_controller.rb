# Controller for all things Student related
class StudentsController < ApplicationController
  before_action :set_user
  before_action :check_authorization, only: [:show, :edit, :update, :destroy]

  # GET /students
  def index
    @students = @user.students.all
  end

  # GET /students/1
  def show
    @student = @user.students.find(params[:id])
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    @student = @user.students.find(params[:id])
  end

  # POST /students
  def create
    @student = @user.students.new(student_params)

    if @student.save
      redirect_to @student, notice: 'Student was successfully added.'
    else
      render :new
    end
  end

  # PATCH/PUT /students/1
  def update
    @student = @user.students.find(params[:id])

    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /students/1
  def destroy
    @student = @user.students.find(params[:id])
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private

  def set_user
    @user = current_user
  end

  def check_authorization
    alert_text = 'You do not have permission to view that student!'
    redirect_to students_url, alert: alert_text unless @user.students.exists?(params[:id])
  end

  # whitelist parameters
  def student_params
    params.require(:student).permit(:name, :phone, :parent_phone, :notes, :balance, :rate, :email, :parents_email)
  end
end
