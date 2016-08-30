# Student model
class Student < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :destroy
  has_many :credits, dependent: :destroy
  validates :name, :balance, :rate, presence: true

  def account_debit(cost)
    self.balance -= cost
    self.save
  end

  def account_credit(amount)
    self.balance += amount
    self.save
  end
end
