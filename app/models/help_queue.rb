class HelpQueue < ActiveRecord::Base

  has_many :students
  has_many :instructors

end
