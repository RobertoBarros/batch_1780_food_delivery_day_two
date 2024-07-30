require_relative "../views/customers_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    # Mandar a view perguntar ao usuário o nome e o endereço do customer
    name = @view.ask_name
    address = @view.ask_address

    # Criar uma instância de customer com esses dados
    customer = Customer.new(name: name, address: address)

    # Mandar o customer para o repositório
    @customer_repository.create(customer)
  end

  def list
    # Pegar todos os customers do customer_repository
    customers = @customer_repository.all
    # Mandar esses customers para a view
    @view.display(customers)
  end
end
