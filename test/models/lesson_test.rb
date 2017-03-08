require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  should belong_to(:student)
  should validate_presence_of(:date_time)
  should validate_presence_of(:duration)
end
