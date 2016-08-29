# Controller for handling all things related to Account Credits
class CreditsController < ApplicationController
  before_action :set_student
  before_action :check_authorization

  # GET /credits
  def index
    @credits = @student.credits.new_to_old
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
    if @credit.save
      credit_account
      send_email_receipt
      notice_text = 'Credit was successfully created.'
      redirect_to [@student, @credit], notice: notice_text
    else
      render :new
    end
  end

  # PATCH/PUT /credits/1
  def update
    @credit = @student.credits.find(params[:id])

    respond_to do |format|
      if @credit.update(credit_params)
        notice_text = 'Credit was successfully updated.'
        redirect_to [@student, @credit], notice: notice_text
      else
        render :edit
      end
    end
  end

  # DELETE /credits/1
  def destroy
    @credit = @student.credits.find(params[:id])
    @credit.destroy
    notice_text = 'Credit was successfully destroyed.'
    redirect_to student_credits_url, notice: notice_text
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  # whitelist params
  def credit_params
    params.require(:credit).permit(:amount, :date_time, :notes, :credit, :email_receipt)
  end

  def check_authorization
    @user = current_user
    alert_text = 'You do not have permission to view that student!'
    redirect_to students_url, alert: alert_text unless @user.students.exists?(params[:student_id])
  end

  def credit_account
    num = @credit.amount
    @student.account_credit(num)
  end

  def send_email_receipt
    receipt_requested = params[:credit][:email_receipt].to_i == 1
    if receipt_requested && !@student.parents_email.empty?
      CreditMailer.credit_email(@student, @credit, current_user).deliver_now
    end
  end
end
