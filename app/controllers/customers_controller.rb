require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    # fetch customers from the repo
    # display them in the view
    customers = @customer_repository.all
    @view.display(customers)
  end

  def add
    # ask user for name and price
    # create a new Customer instance
    # send to repo to persist
    name = @view.ask_user_for('name')
    address = @view.ask_user_for('address')
    customer = Customer.new(name: name, address: address)
    @customer_repository.create(customer)
  end

  def update
    customers = @customer_repository.all
    @view.display(customers)
    # get user's choice of a customer, by index
    index = @view.ask_user_for_index
    old_customer = customers[index]

    name = @view.ask_user_for('name')
    address = @view.ask_user_for('address')
    customer = Customer.new(name: name, address: address, id: old_customer.id)

    @customer_repository.update(customer, index)
  end
end
