class ReportsController < ApplicationController
  before_action :set_student

  # GET /reports
  # GET /reports.json
  def index
    # @reports = Report.all
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:student_id])
    end
end
