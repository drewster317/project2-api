#
class User < ActiveRecord::Base
  include Authentication
  belongs_to :student

  has_many :books
end
