module StudentsHelper
    def account_status(student)
        if student.balance > student.rate
            status = "active"
        elsif student.balance >= 0
            status = "warning"
        else
            status = "danger"
        end
    end
end
