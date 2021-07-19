class Student < ApplicationRecord
    belongs_to :department
    has_many :subjects, through: :department
    has_one :credential
    
    accepts_nested_attributes_for :department, :subjects
end
