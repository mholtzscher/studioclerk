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

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  def update
    @student = @user.students.find(params[:id])

    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  def destroy
    @student = @user.students.find(params[:id])
    
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def letsencrypt
    # use your code here, not mine
    render text: "qWvXpFUktJDHyNkNPQAumV6IhzPKr_TphNA2ByjIeM8.nB_r1xDaYAd3Ie85vYCa1rdBSjsoLMPAJdyC2K2kF5U"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    def check_authorization
      redirect_to students_url, alert: 'You do not have permission to view that student!' unless @user.students.exists?(params[:id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :phone, :parent_phone, :notes, :balance, :rate, :email, :parents_email)
    end
end
