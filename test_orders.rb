require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/repositories/order_repository'
require_relative 'app/models/order'

meal_repo = MealRepository.new('data/meals.csv')
customer_repo = CustomerRepository.new('data/customers.csv')
employee_repo = EmployeeRepository.new('data/employees.csv')

meal = meal_repo.all[0]
customer = customer_repo.all.first
employee = employee_repo.all.first

order = Order.new(
  meal: meal,
  customer: customer,
  employee: employee
)

p order

puts "\n\n\n--------------\n\n\n"

repo = OrderRepository.new('data/orders.csv', meal_repo, customer_repo, employee_repo)
p repo.all.first.customer.name
p repo.all.first.meal.price
