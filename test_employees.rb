require_relative 'app/models/employee'
require_relative 'app/repositories/employee_repository'

bob = Employee.new(username: 'bob', password: '1234', role: 'manager')
puts "#{bob.username} - #{bob.password} - #{bob.role}"


employee_repo = EmployeeRepository.new('data/employees.csv')

employee_repo.all.each do |employee|
  puts "#{employee.username} - #{employee.password} - #{employee.role}"
end
