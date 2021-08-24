class BandSerializer < ActiveModel::Serializer
  attributes :id, :d_name
  has_many :teachers
  has_many :students
end
