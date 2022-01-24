class CustomersView
  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} 🏠 #{customer.address}"
    end
  end

  def ask_user_for(thing)
    puts "Please enter the customer #{thing}"
    print '> '
    gets.chomp
  end

  def ask_user_for_index
    ask_user_for('number').to_i - 1
  end
end
