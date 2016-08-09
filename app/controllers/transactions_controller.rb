class TransactionsController < ApplicationController
  before_action :set_student

  # GET /transactions
  def index
    @transactions = @student.transactions
  end

  # GET /transactions/1
  def show
    @transaction = @student.transactions.find(params[:id])
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
    @transaction = @student.transactions.find(params[:id])
  end

  # POST /transactions
  def create
    @transaction = @student.transactions.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        credit_account
        format.html { redirect_to [@student, @transaction], notice: 'Transaction was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /transactions/1
  def update
    @transaction = @student.transactions.find(params[:id])

    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to [@student, @transaction], notice: 'Transaction was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction = @student.transactions.find(params[:id])
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to student_transactions_url, notice: 'Transaction was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:student_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:ammount, :date_time, :notes, :credit)
    end

    def credit_account
      num = @transaction.ammount
      @student.account_credit(num)
    end
end
