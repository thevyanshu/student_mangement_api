class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :d_name, :students_count
  has_many :students

  def students_count
    object.students.size
  end
end
