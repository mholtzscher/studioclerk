class CreditMailer < ApplicationMailer
  default from: 'admin@studioclerk.herokuapp.com'
 
  def credit_email(student, credit)
    @student = student
    @credit = credit
    mail(to: @student.parents_email, subject: 'Lesson Account Credit')
  end
end
