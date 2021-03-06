# Lesson Model
class Lesson < ApplicationRecord
  belongs_to :student
  scope :recent, -> { order(date_time: :desc).limit(6) }
  scope :new_to_old, -> { order(date_time: :desc) }
  attr_accessor :email_receipt
  validates :date_time, :duration, presence: true
end
