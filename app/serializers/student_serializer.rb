class StudentSerializer < ActiveModel::Serializer
  attributes :name
  belongs_to :department
end
