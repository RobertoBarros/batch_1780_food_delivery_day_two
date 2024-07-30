require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    # Mandar a view perguntar ao usuário o nome e o preço do meal
    name = @view.ask_name
    price = @view.ask_price

    # Criar uma instância de meal com esses dados
    meal = Meal.new(name: name, price: price)

    # Mandar o meal para o repositório
    @meal_repository.create(meal)
  end

  def list
    # Pegar todos os meals do meal_repository
    meals = @meal_repository.all
    # Mandar esses meals para a view
    @view.display(meals)
  end
end
