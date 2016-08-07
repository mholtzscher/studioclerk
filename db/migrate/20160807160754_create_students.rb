class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :phone
      t.string :parent_phone
      t.text :notes
      t.decimal :balance
      t.decimal :rate
      t.string :email
      t.string :parents_email

      t.timestamps
    end
  end
end
