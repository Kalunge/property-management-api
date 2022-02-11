class UserRepresenter
  def initialize(user)
    @user = user
  end

  def as_json
    {
      id: user.id,
      name: user.name
    }
  end

  private
  attr_reader :user
end