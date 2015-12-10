#
class LoginUserSerializer < UserSerializer
  attributes :token, :instructor_role
end
