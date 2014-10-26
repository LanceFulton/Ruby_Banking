
# MakerSquare Coding Challenge
# Lance Fulton


# Classes

Bank = Class.new do
	attr_accessor :accounts
	attr_accessor :bankname
	def initialize(bankname)
		@bankname = bankname
		@accounts = {}
		puts "#{@bankname} bank was just created."
	end
	def open_account(customer)
		@accounts[customer.name] = 0
		puts "#{customer.name}, thanks for opening an account at #{@bankname}!"
	end
	def deposit (customer, amount)
		@accounts[customer.name] += amount
		customer.cash -= amount
		puts "#{customer.name} deposited $#{amount} to #{@bankname}. #{customer.name} has $#{customer.cash}. #{customer.name}'s account has $" + @accounts[customer.name].to_s + "."
	end
	def withdraw (customer, amount)
		@accounts[customer.name] -= amount
		customer.cash += amount
		puts "#{customer.name} withdrew $#{amount} from #{@bankname}. #{customer.name} has $#{customer.cash}. #{customer.name}'s account has $" + @accounts[customer.name].to_s + "."
	end
	def transfer (customer, receiver, amount)
		@accounts[customer.name] -= amount
		receiver.accounts[customer.name] += amount
		puts "#{customer.name} transfered $#{amount} from the #{@bankname} account to the #{receiver.bankname} account. The #{@bankname} account has $#{@accounts[customer.name]} and the #{receiver.bankname} account has $#{receiver.accounts[customer.name]}."
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
