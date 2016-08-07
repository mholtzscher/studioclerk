class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.datetime :date_time
      t.integer :duration
      t.text :notes

      t.timestamps
    end
  end
end
