require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'router'

meal_csv_path = 'data/meals.csv'
customer_csv_path = 'data/customers.csv'
employee_csv_path = 'data/employees.csv'

meal_repository = MealRepository.new(meal_csv_path)
meals_controller = MealsController.new(meal_repository)

customer_repository = CustomerRepository.new(customer_csv_path)
customers_controller = CustomersController.new(customer_repository)

employee_repository = EmployeeRepository.new(employee_csv_path)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller)
router.run
