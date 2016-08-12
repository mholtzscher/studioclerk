class LessonsController < ApplicationController
  before_action :set_student

  # GET /lessons
  def index
    @lessons = @student.lessons
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

      if lesson_params[:email_receipt] == true
          LessonMailer.lesson_email(@student, @lesson).deliver_now
      end

      redirect_to [@student, @lesson]
    else
      render action: "new"
    end
  end

  # PATCH/PUT /lessons/1
  def update
    @lesson = @student.lessons.find(params[:id])

    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to [@student, @lesson], notice: 'Lesson was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /lessons/1
  def destroy
    @lesson = @student.lessons.find(params[:id])
    
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to student_lessons_url, notice: 'Lesson was successfully destroyed.' }
    end
  end

  private
    def set_student
      @student = Student.find(params[:student_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:date_time, :duration, :notes, :email_receipt)
    end

    def deduct_lesson
      rate = @student.rate
      cost = (@lesson.duration / 60.0) * rate
      cost = cost.to_i
      @student.account_debit(cost)
    end
end
