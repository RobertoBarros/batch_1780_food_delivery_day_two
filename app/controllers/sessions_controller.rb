require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def login
    username = @view.ask_for_username
    password = @view.ask_for_password

    employee = @employee_repository.find_by_username(username)

    if employee && employee.password == password
      @view.welcome(employee)
      employee
    else
      @view.wrong_credentials
      login
    end
  end
end
