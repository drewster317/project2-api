class HelpItem < ActiveRecord::Base

  enum status: [:waiting, :active, :done]

  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :instructor, class_name: 'User', foreign_key: 'instructor_id'

  after_create { self.waiting! }

end
