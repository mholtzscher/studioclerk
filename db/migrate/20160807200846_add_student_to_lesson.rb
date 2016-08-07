class AddStudentToLesson < ActiveRecord::Migration[5.0]
  def change
    add_reference :lessons, :student, foreign_key: true
  end
end
