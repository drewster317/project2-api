#
class User < ActiveRecord::Base
  include Authentication
#  belongs_to :student

  has_one :profile
#  has_many :books
end
