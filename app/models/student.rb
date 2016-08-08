class Student < ApplicationRecord
    has_many :lessons, dependent: :destroy
    has_many :transactions, dependent: :destroy

    def account_debit(cost)
        self.balance -= cost
        self.save
    end

    def account_credit(amount)
        self.balance += amount
        self.save
    end
end
