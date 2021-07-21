class Teacher < ApplicationRecord
    has_many :subjects
    has_one :user_aspect, as: :aspect
    has_one :user, through: :user_aspect

    self.per_page = 5

    def set_e_number
        last_e_number = Student.maximum("e_number")
        self.e_number = last_e_number.to_i + 1
    end
end
