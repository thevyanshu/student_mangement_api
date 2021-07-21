class UserAspect < ApplicationRecord
    
    belongs_to :user
    belongs_to :aspect, polymorphic: true
end
