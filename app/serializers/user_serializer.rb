#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :token, :current_user

  def current_user
    scope == object
  end
end
