class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run
    @employee = @sessions_controller.login

    loop do
      if @employee.manager?
        print_options_manager
        action = gets.chomp.to_i
        route_action_manager(action)
      else
        print_options_rider
        action = gets.chomp.to_i
        route_action_rider(action)
      end
    end
  end

  private

  def print_options_manager
    puts "-" * 50
    puts "---- MANAGER ----"
    puts "-" * 50
    puts "1 - Add a meal"
    puts "2 - List all meals"
    puts "-" * 50
    puts "3 - Add a customer"
    puts "4 - List all customers"
    puts "-" * 50
    puts "5 - Add order"
    puts "6 - List undelivered orders"

    puts "-" * 50
    puts "Select an option:"
  end

  def route_action_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    end
  end

  def print_options_rider
    puts "-" * 50
    puts "---- RIDER ----"
    puts "1. List my orders"
    puts "2. Mark as delivered"
    puts "-" * 50
    puts "Select an option:"
  end

  def route_action_rider(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    end
  end
end
