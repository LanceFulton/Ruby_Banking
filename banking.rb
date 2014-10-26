
# MakerSquare Coding Challenge
# Lance Fulton


# Classes

Bank = Class.new do
	def initialize(bankname)
		@bankname = bankname
		puts "#{@bankname} bank was just created."
	end
	def open_account(customer)
		@customer = customer
		@customer_bal = 0
		puts "#{@customer.name}, thanks for opening an account at #{@bankname}!"
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
