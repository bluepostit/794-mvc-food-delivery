class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    @running = true
    while @running
      display_menu
      action = user_action
      print `clear`
      dispatch(action)
    end
    puts 'Goodbye'
  end

  private

  def display_menu
    puts '---- Food Delivery ----'
    puts '1. List all meals'
    puts '2. Add a new meal'
    puts '3. List all customers'
    puts '4. Add a new customer'
    puts '5. Update a customer'
    puts '9. Exit'
  end

  def user_action
    print '> '
    gets.chomp.to_i
  end

  def dispatch(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @customers_controller.update
    when 9 then @running = false
    end
  end
end
