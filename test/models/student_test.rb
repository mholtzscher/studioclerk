require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to(:user)
  should have_many(:lessons)
  should have_many(:credits)
  should validate_presence_of(:name)
  should validate_presence_of(:balance)
  should validate_presence_of(:rate)

  test "debit makes account stays positive" do
    s = students(:good)
    starting = s.balance
    s.account_debit(s.rate)
    assert_equal starting - s.rate, s.balance, "Balance did not update correctly after debit"
    assert s.balance < starting
  end

  test "debit makes balance negative" do
    s = students(:warning)
    starting = s.balance
    s.account_debit(s.rate)
    assert_equal starting - s.rate, s.balance, "Balance did not update correctly after debit"
    assert s.balance < starting
  end

  test "debit makes balance even more negative" do
    s = students(:bad)
    starting = s.balance
    s.account_debit(s.rate)
    assert_equal starting - s.rate, s.balance, "Balance did not update correctly after debit"
    assert s.balance < starting
  end

  test "credit makes account balance higher" do
    s = students(:good)
    starting = s.balance
    s.account_credit(s.rate)
    assert_equal starting + s.rate, s.balance, "Balance did not update correctly after debit"
    assert s.balance > starting
  end

  test "credit makes account warning balance higher" do
    s = students(:warning)
    starting = s.balance
    s.account_credit(s.rate)
    assert_equal starting + s.rate, s.balance, "Balance did not update correctly after debit"
    assert s.balance > starting
  end

  test "credit makes account bad balance higher" do
    s = students(:bad)
    starting = s.balance
    s.account_credit(s.rate)
    assert_equal starting + s.rate, s.balance, "Balance did not update correctly after debit"
    assert s.balance > starting
  end
end
