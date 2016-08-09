class Lesson < ApplicationRecord
    belongs_to :student
    scope :recent, order(date_time: :desc).limit(6)
end
