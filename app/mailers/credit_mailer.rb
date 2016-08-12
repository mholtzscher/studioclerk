class CreditMailer < ApplicationMailer
default from: 'admin@studioclerk.herokuapp.com'
 
  def credit_email(student, credit)
    @student = student
    @credit = credit
    @email = @student.parents_email
    mail(to: @email, subject: 'Lesson Account Credit')
  end
end
