class Student < ApplicationRecord
    belongs_to :department
    has_many :subjects, through: :department
    
    has_one :user_aspect, as: :aspect
    has_one :user, through: :user_aspect

    self.per_page = 5
    
    def set_roll_no
        last_roll_no = Student.maximum("roll_no")
        self.roll_no = last_roll_no.to_i + 1
    end

    accepts_nested_attributes_for :department, :subjects
end
