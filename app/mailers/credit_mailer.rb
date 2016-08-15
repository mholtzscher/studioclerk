class CreditMailer < ApplicationMailer
  default from: 'admin@studioclerk.herokuapp.com'
 
  def credit_email(student, credit, user)
    @student = student
    @credit = credit
    @user = user
    mail(to: @student.parents_email, subject: 'Lesson Account Credit', from: @user.email)
  end
end
