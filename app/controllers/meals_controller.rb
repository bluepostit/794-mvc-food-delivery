require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    # fetch meals from the repo
    # display them in the view
    meals = @meal_repository.all
    @view.display(meals)
  end

  def add
    # ask user for name and price
    # create a new Meal instance
    # send to repo to persist
    name = @view.ask_user_for('name')
    price = @view.ask_user_for_price
    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
  end
end
