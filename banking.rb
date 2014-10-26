
# MakerSquare Coding Challenge
# Lance Fulton


# Classes

Bank = Class.new do
	attr_accessor :accounts
	def initialize(bankname)
		@bankname = bankname
		@accounts = {}
		puts "#{@bankname} bank was just created."
	end
	def open_account(customer)
		@customer = customer
		@accounts[customer.name] = 0
		puts "#{@customer.name}, thanks for opening an account at #{@bankname}!"
	end
	def deposit (customer, deposit)
		@accounts[customer.name] += deposit
		customer.cash -= deposit
		puts "#{customer.name} deposited $#{deposit} to #{@bankname}. #{customer.name} has $#{customer.cash}. #{customer.name}'s account has $" + @accounts[customer.name].to_s + "."
	end
end

Person = Class.new do
	attr_accessor :name
	attr_accessor :cash
	def initialize(name, cash)
		@name = name
		@cash = cash
		puts "Hi, #{@name}. You have $#{@cash}!"
	end
end
