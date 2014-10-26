
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
		puts "#{@customer}, thanks for opening an account at #{@bankname}!"
	end
end

Person = Class.new do
	def initialize(name, cash)
		@name = name
		@cash = cash
		puts "Hi, #{@name}. You have $#{@cash}!"
	end
end
