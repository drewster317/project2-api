class HelpItemSerializer < ActiveModel::Serializer
  attributes :comment, :status,  :student_id, :student_name, :instructor_id, :instructor_name

  def student_id
    object.student.id
  end

  def student_name
    object.student.profile.full_name
  end

  def instructor_id
    object.instructor.id if object.instructor
  end

  def instructor_name
    object.instructor.profile.full_name if object.instructor
  end
end
