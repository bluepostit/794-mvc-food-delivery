class SessionsView
  def ask_user_for(item)
    puts "Please enter your #{item}:"
    print '> '
    gets.chomp
  end

  def welcome
    puts 'Welcome!'
  end

  def error
    puts 'Please check your details and try again'
  end
end
