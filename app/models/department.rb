class Department < ApplicationRecord
    has_many :students
    has_many :subjects
end
