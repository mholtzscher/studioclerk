json.extract! lesson, :id, :date_time, :duration, :notes, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)