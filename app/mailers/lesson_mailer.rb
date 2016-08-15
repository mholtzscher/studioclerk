class LessonMailer < ApplicationMailer
    default from: 'admin@studioclerk.herokuapp.com'
 
    def lesson_email(student, lesson, user)
        @student = student
        @lesson = lesson
        @user = user
        mail(to: @student.parents_email, subject: 'Private Lesson', from: @user.email)
    end
end
