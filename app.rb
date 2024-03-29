require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/sessions_controller'

require_relative 'router'

meal_csv = File.join(__dir__, 'data/meals.csv')
meal_repo = MealRepository.new(meal_csv)
# p meal_repo
meals_controller = MealsController.new(meal_repo)

customer_csv = File.join(__dir__, 'data/customers.csv')
customer_repo = CustomerRepository.new(customer_csv)
customers_controller = CustomersController.new(customer_repo)

employee_csv = File.join(__dir__, 'data/employees.csv')
employee_repo = EmployeeRepository.new(employee_csv)
sessions_controller = SessionsController.new(employee_repo)

router = Router.new(meals_controller, customers_controller, sessions_controller)
router.run
