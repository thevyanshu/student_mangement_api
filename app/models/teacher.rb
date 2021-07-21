class Teacher < ApplicationRecord
    has_many :subjects
    has_one :user_aspect, as: :aspect
    has_one :user, through: :user_aspect
end
