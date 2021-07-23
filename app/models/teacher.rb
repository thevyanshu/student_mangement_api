class Teacher < ApplicationRecord
    before_create :set_id_number
    has_many :subjects
    has_one :user_aspect, as: :aspect
    has_one :user, through: :user_aspect

    self.per_page = 5

    def set_id_number
        last_id_number = Teacher.maximum("id_number")
        self.id_number = last_id_number.to_i + 1
    end
end
