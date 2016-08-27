class AddLessonTimeToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :lesson_day, :integer, default: 0
    add_column :students, :lesson_time, :time
  end
end
