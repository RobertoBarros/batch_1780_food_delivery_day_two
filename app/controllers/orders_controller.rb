require_relative "../views/orders_view"

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
  end

  def add
    # 1. Listar e selecionar um meal
    meals = @meal_repository.all
    @meals_view.display(meals)
    meal_index = @view.ask_index
    meal = meals[meal_index]

    # 2. Listar e selecionar um customer
    customers = @customer_repository.all
    @customers_view.display(customers)
    customer_index = @view.ask_index
    customer = customers[customer_index]

    # 3. Listar e selecionar um rider
    riders = @employee_repository.all_riders
    @view.display_riders(riders)
    rider_index = @view.ask_index
    rider = riders[rider_index]

    order = Order.new(meal: meal, customer: customer, employee: rider)

    @order_repository.create(order)
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @view.display(orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
    @view.display(orders)
  end

  def mark_as_delivered(employee)
    orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
    @view.display(orders)
    customer_index = @view.ask_index
    order = orders[customer_index]
    @order_repository.mark_as_delivered(order)
  end
end
