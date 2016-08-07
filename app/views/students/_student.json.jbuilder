json.extract! student, :id, :name, :phone, :parent_phone, :notes, :balance, :rate, :email, :parents_email, :created_at, :updated_at
json.url student_url(student, format: :json)