#
class User < ActiveRecord::Base
  include Authentication
  has_one :profile

  has_many :student_help_items, class_name: 'HelpItem', foreign_key: 'student_id'
  has_many :instructor_help_items, class_name: 'HelpItem', foreign_key: 'instructor_id'

  # if I'm a student I can create a help item
  def create(comment)
    if !instructor_role
      student_help_items.create!(comment: "Need Help")
    end
  end

  # Get the next item that is waiting out of all HelpItems
  def next_item
    HelpItem.where(status: 'waiting').order(created_at: :desc).first
  end

  # if I'm a instructor I can assign myself to a help item.
  def assign_me_next_item
    if instructor_role
     item_im_taking = next_item()
     item_im_taking.instructor =  self
     item_im_taking.status = 'active'
     item_im_taking.save!
    end
  end
end
