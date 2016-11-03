class AddLessonTimeToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :lesson_time, :string, default: "3:30"
  end
end
