require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = OrdersView.new
  end

  def add
    # fetch all meals
    # show the meals
    # get user choice of meal
    meals = @meal_repository.all
    MealsView.new.display(meals)
    index = @view.ask_user_for_index
    meal = meals[index]

    # fetch all customers
    # show the customers
    # get user choice of customer
    customers = @customer_repository.all
    CustomersView.new.display(customers)
    index = @view.ask_user_for_index
    customer = customers[index]

    # fetch all riders
    # show the riders
    # get user choice of rider
    riders = @employee_repository.all_riders
    @view.display_riders(riders)
    index = @view.ask_user_for_index
    employee = riders[index]

    # create a new Order with this data
    # add it to the repo
    order = Order.new(
      meal: meal,
      customer: customer,
      employee: employee
    )
    employee.add_order(order)
    @order_repository.create(order)
  end

  def mark_as_delivered(employee)
    orders = employee.undelivered_orders
    @view.display(orders)
    index = @view.ask_user_for_index
    order = orders[index]
    @order_repository.deliver(order)
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @view.display(orders)
  end

  def list_my_orders(employee)
    orders = employee.undelivered_orders
    @view.display(orders)
  end
end
