class Employee
  # State
  # - id
  # - user name
  # - password
  # - role
  # Behavior
  # - readers

  attr_reader :username, :password, :role
  attr_accessor :id

  def initialize(attributes = {})
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
    @id = attributes[:id]
    @orders = []
  end

  def manager?
    @role == 'manager'
  end

  def rider?
    @role == 'rider'
  end

  def add_order(order)
    @orders << order
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end
end
