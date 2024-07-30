class SessionsView
  def ask_for_username
    puts "What's your username?"
    print "> "
    gets.chomp
  end

  def ask_for_password
    puts "What's your password?"
    print "> "
    gets.chomp
  end

  def wrong_credentials
    puts "Wrong credentials... Try again!"
  end

  def welcome(employee)
    puts "Welcome #{employee.username}!"
  end
end
