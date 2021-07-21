class Student < ApplicationRecord
    belongs_to :department
    has_many :subjects, through: :department
    
    has_one :user_aspect, as: :aspect
    has_one :user, through: :user_aspect
    
    accepts_nested_attributes_for :department, :subjects
end
