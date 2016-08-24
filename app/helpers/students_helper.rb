module StudentsHelper
    def account_status(student)
        if student.balance > student.rate
            "card-success"
        elsif student.balance >= 0
            "card-warning"
        else
            "card-danger"
        end
    end
end
