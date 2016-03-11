class CreationPolicy < Struct.new(:user, :role)
  def initialize(user, role)
    @user = user
    @role = role
  end

  def update?
    return false if @user.nil?
    @user.has_role?(:admin)
  end

  def create?
    return false if @user.nil?
    @user.has_role?(:admin)
  end
end
