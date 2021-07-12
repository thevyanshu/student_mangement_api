class Teacher < ApplicationRecord
    has_many :students
    has_one :subject
end
