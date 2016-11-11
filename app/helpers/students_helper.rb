# Helpers for students
module StudentsHelper
  def account_status(student)
    if student.balance > student.rate
      'success'
    elsif student.balance >= 0
      'warning'
    else
      'danger'
    end
  end
end
