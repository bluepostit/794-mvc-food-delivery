class Employee
  # State
  # - id
  # - user name
  # - password
  # - role
  # Behavior
  # - readers

  attr_reader :username, :password, :role, :id

  def initialize(attributes = {})
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
    @id = attributes[:id]
  end

  def manager?
    @role == 'manager'
  end
end
