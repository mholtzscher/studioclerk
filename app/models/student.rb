# Student model
class Student < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :destroy
  has_many :credits, dependent: :destroy
  validates :name, :balance, :rate, presence: true

  enum lesson_day: {
      Sunday: 0,
      Monday: 1,
      Tuesday: 2,
      Wednesday: 3,
      Thursday: 4,
      Friday: 5,
      Saturday: 6
  }

  def account_debit(cost)
    self.balance -= cost
    save
  end

  def account_credit(amount)
    self.balance += amount
    save
  end
end
