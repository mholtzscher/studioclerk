# Miler for account credits to parents
class CreditMailer < ApplicationMailer
  default from: 'admin@studioclerkapp.com'

  def credit_email(student, credit, user)
    @student = student
    @credit = credit
    @user = user
    mail(to: @student.parents_email, subject: 'Lesson Account Credit', from: @user.email, content_type: "text/html")
  end
end
