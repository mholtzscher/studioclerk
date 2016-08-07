class Student < ApplicationRecord
    has_many :lessons, dependent: :destroy
    has_many :transactions, dependent: :destroy
end
