require_relative 'app/models/meal'
require_relative 'app/repositories/meal_repository'

sushi = Meal.new(name: 'sushi', price: 100)
puts "#{sushi.name} - #{sushi.price}"


meal_repo = MealRepository.new('data/meals.csv')
p meal_repo

pizza = Meal.new(name: 'pizza', price: 60)
meal_repo.create(pizza)

p meal_repo
