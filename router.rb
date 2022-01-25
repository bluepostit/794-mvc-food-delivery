class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
  end

  def run
    @running = true
    while @running
      @employee = @sessions_controller.sign_in
      while @employee
        display_menu
        action = user_action
        print `clear`
        dispatch(action)
      end
    end
    puts 'Goodbye'
  end

  private

  def display_menu
    if @employee.manager?
      display_manager_menu
    else
      display_rider_menu
    end
  end

  def display_manager_menu
    puts '---- Food Delivery ----'
    puts '1. List all meals'
    puts '2. Add a new meal'
    puts '3. List all customers'
    puts '4. Add a new customer'
    puts '5. Update a customer'
    puts '8. Sign out'
    puts '9. Exit'
  end

  def display_rider_menu
    puts '---- Food Delivery ----'
    puts '1. List my orders'
    puts '2. Deliver an order'
    puts '8. Sign out'
    puts '9. Exit'
  end

  def user_action
    print '> '
    gets.chomp.to_i
  end

  def dispatch(action)
    if @employee.manager?
      dispatch_manager_action(action)
    else
      dispatch_rider_action(action)
    end
  end

  def dispatch_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @customers_controller.update
    when 8 then @employee = nil
    when 9 then exit
    end
  end

  def dispatch_rider_action(action)
    # To do...
    case action
    when 8 then @employee = nil
    when 9 then exit
    end
  end

  def exit
    @employee = nil
    @running = false
  end
end
