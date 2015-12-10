#
class User < ActiveRecord::Base
  include Authentication
  has_one :profile

  has_many :student_help_items, class_name: 'HelpQueue', foreign_key: 'student_id'
  has_many :instructor_help_items, class_name: 'HelpQueue', foreign_key: 'instructor_id'
end
