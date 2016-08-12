class LessonMailer < ApplicationMailer
    default from: 'admin@studioclerk.herokuapp.com'
 
    def lesson_email(student, lesson)
        @student = student
        @lesson = lesson
        mail(to: @student.parents_email, subject: 'Private Lesson')
    end
end
