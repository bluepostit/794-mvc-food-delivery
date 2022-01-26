class OrdersView
  def ask_user_for_index
    puts 'Please enter the number'
    print '> '
    gets.chomp.to_i - 1
  end

  def display_riders(riders)
    riders.each_with_index do |rider, index|
      puts "#{index + 1}. #{rider.username}"
    end
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} - #{order.customer.address} - #{order.employee.username}"
    end
  end
end
