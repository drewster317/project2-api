class HelpItemSerializer < ActiveModel::Serializer
  attributes :comment, :status,  :student_id, :student_first_name, :student_last_name, :instructor_id, :instructor_full_name, :instructor_first_name

  def student_id
    object.student.id
  end

  def student_first_name
    object.student.profile.first_name
  end

  def student_last_name
    object.student.profile.last_name
  end

  def instructor_id
    object.instructor.id if object.instructor
  end

  def instructor_full_name
    object.instructor.profile.full_name if object.instructor
  end

  def instructor_first_name
    object.instructor.profile.first_name if object.instructor
  end

end
