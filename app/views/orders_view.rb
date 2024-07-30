class OrdersView
  def ask_index
    puts "Enter index:"
    gets.chomp.to_i - 1
  end

  def display_riders(riders)
    riders.each_with_index do |rider, index|
      puts "#{index + 1} - #{rider.username}"
    end
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} - Customer: #{order.customer.name} - Meal: #{order.meal.name} - Delivered by #{order.employee.username}"
    end
  end
end
