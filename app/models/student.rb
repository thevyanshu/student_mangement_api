class Student < ApplicationRecord
    before_create :set_roll_no
    belongs_to :department
    has_many :subjects, through: :department
    
    has_one :user, as: :aspect

    self.per_page = 5
    
    def set_roll_no
        last_roll_no = Student.maximum("roll_no")
        self.roll_no = last_roll_no.to_i + 1
    end

    accepts_nested_attributes_for :department, :subjects
end
