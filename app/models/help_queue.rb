class HelpQueue < ActiveRecord::Base

  belongs_to :students, class: 'User'
  belongs_to :instructors, class: 'User'

end
