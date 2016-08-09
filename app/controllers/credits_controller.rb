class CreditsController < ApplicationController
  before_action :set_student

  # GET /credits
  def index
    @credits = @student.credits
  end

  # GET /credits/1
  def show
    @credit = @student.credits.find(params[:id])
  end

  # GET /credits/new
  def new
    @credit = Credit.new
  end

  # GET /credits/1/edit
  def edit
    @credit = @student.credits.find(params[:id])
  end

  # POST /credits
  def create
    @credit = @student.credits.new(credit_params)

    respond_to do |format|
      if @credit.save
        credit_account
        format.html { redirect_to [@student, @credit], notice: 'Credit was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /credits/1
  def update
    @credit = @student.credits.find(params[:id])

    respond_to do |format|
      if @credit.update(credit_params)
        format.html { redirect_to [@student, @credit], notice: 'Credit was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /credits/1
  def destroy
    @credit = @student.credits.find(params[:id])
    @credit.destroy
    respond_to do |format|
      format.html { redirect_to student_credits_url, notice: 'Credit was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:student_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_params
      params.require(:credit).permit(:ammount, :date_time, :notes, :credit)
    end

    def credit_account
      num = @credit.ammount
      @student.account_credit(num)
    end
end