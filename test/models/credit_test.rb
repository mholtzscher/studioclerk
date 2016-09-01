require 'test_helper'

class CreditTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should belong_to(:student)
  should validate_presence_of(:date_time)
  should validate_presence_of(:amount)
  should allow_mass_assignment_of(:email_receipt)

end
