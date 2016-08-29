# Controller for handling anything Lesson related
class LessonsController < ApplicationController
  before_action :set_student
  before_action :check_authorization

  # GET /lessons
  def index
    @lessons = @student.lessons.new_to_old
  end

  # GET /lessons/1
  def show
    @lesson = @student.lessons.find(params[:id])
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
    @lesson = @student.lessons.find(params[:id])
  end

  # POST /lessons
  def create
    @lesson = @student.lessons.new(lesson_params)

    if @lesson.save
      deduct_lesson
      send_email_receipt
      redirect_to [@student, @lesson]
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /lessons/1
  def update
    @lesson = @student.lessons.find(params[:id])

    if @lesson.update(lesson_params)
      notice_text = 'Lesson was successfully updated.'
      redirect_to [@student, @lesson], notice: notice_text
    else
      render :edit
    end
  end

  # DELETE /lessons/1
  def destroy
    @lesson = @student.lessons.find(params[:id])
    @lesson.destroy
    notice_text = 'Lesson was successfully destroyed.'
    redirect_to student_lessons_url, notice: notice_text
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  # white list params
  def lesson_params
    params.require(:lesson).permit(:date_time, :duration, :notes, :email_receipt)
  end

  def check_authorization
    @user = current_user
    alert_text = 'You do not have permission to view that student!'
    redirect_to students_url, alert: alert_text unless @user.students.exists?(params[:student_id])
  end

  def deduct_lesson
    rate = @student.rate
    cost = (@lesson.duration / 60.0) * rate
    cost = cost.to_i
    @student.account_debit(cost)
  end

  def send_email_receipt
    receipt_requested = params[:lesson][:email_receipt].to_i
    if receipt_requested == 1 && !@student.parents_email.empty?
      LessonMailer.lesson_email(@student, @lesson, current_user).deliver_now
    end
  end
end
