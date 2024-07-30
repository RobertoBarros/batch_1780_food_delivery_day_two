class CustomersView
  def ask_name
    puts "What is the name of the customer?"
    print "> "
    gets.chomp
  end

  def ask_address
    puts "What is the address of the customer?"
    print "> "
    gets.chomp
  end

  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name} - Address: #{customer.address}"
    end
  end
end
