class AddLessonDayToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :lesson_day, :integer, null: false, default: 0
  end
end
