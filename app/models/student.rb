class Student < ApplicationRecord
    has_one :department
    has_many :subjects, through: :department

    accepts_nested_attributes_for :department, :subjects
end
