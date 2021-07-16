class Student < ApplicationRecord
    belongs_to :department
    has_many :subjects, through: :department

    accepts_nested_attributes_for :department, :subjects
end
