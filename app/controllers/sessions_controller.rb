require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # ask user for username
    # ask user for password
    # check username, password
    # if it matches - welcome
    # if not, error message; try again!
    username = @view.ask_user_for('user name')
    password = @view.ask_user_for('password')

    # First check if we have an employee with the given username
    employee = @employee_repository.find_by_username(username)
    # If we do, then check the password also
    if employee && employee.password == password
      @view.welcome
      return employee
    else # now employee found with that username OR password is wrong
      @view.error
      sign_in
    end
  end
end
