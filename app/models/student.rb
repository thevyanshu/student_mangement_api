class Student < ApplicationRecord
    belongs_to :department
    has_many :subjects
end
