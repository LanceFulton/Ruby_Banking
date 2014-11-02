
# MakerSquare Coding Challenge
# Lance Fulton


# Classes

Bank = Class.new do #the Bank class
	attr_reader :accounts #to see an account listing by calling '.accounts'
	attr_reader :bankname #for use when stating the receiving bank's name in a transfer message
	def initialize(bankname)
		@bankname = bankname
		@accounts = {}
		@cc_limits = {}
		@cc_balances = {}
		puts "#{@bankname} bank was just created."
	end
	def open_account(customer)
		@accounts[customer] = 0
		puts "#{customer.name}, thanks for opening an account at #{@bankname}!"
	end
	def deposit (customer, amount)
		if amount <= customer.cash
			@accounts[customer] += amount
			customer.cash -= amount
			puts "#{customer.name} deposited $#{amount} to #{@bankname}. #{customer.name} has $#{customer.cash}. #{customer.name}'s account has $" + @accounts[customer].to_s + "."
		else
			puts "#{customer.name} does not have enough cash to deposit $#{amount}."
		end
	end
	def withdraw (customer, amount)
		if @accounts[customer] - amount > 0
			@accounts[customer] -= amount
			customer.cash += amount
			puts "#{customer.name} withdrew $#{amount} from #{@bankname}. #{customer.name} has $#{customer.cash}. #{customer.name}'s account has $" + @accounts[customer].to_s + "."
		else
			puts "#{customer.name} does not have enough money in the account to withdraw $#{amount}."
		end
	end
	def transfer (customer, receiver, amount)
		@accounts[customer] -= amount
		receiver.accounts[customer] += amount
		puts "#{customer.name} transfered $#{amount} from the #{@bankname} account to the #{receiver.bankname} account. The #{@bankname} account has $#{@accounts[customer]} and the #{receiver.bankname} account has $#{receiver.accounts[customer]}."
	end
	def total_cash_in_bank
		@banktotal = 0
		@accounts.each do |customer, balance|
			@banktotal += balance
		end
		print "#{@bankname} has $#{@banktotal} in the bank."
	end
	def cc_open (customer, limit)
		@cc_limits[customer] = limit
		@cc_balances[customer] = 0
		puts "#{customer.name}, thanks for opening a credit card account with #{@bankname}. Your credit limit is $#{@cc_limits[customer]}."
	end
	def cc_statement (customer)
		puts "#{customer.name}, your #{@bankname} credit card balance is $#{@cc_balances[customer]}. Your available credit is $#{@cc_limits[customer] - @cc_balances[customer]}."
	end
	def cc_spend (customer, amount)
		@cc_balances[customer] += amount
		print "#{customer.name}, you charged $#{amount} to your #{bankname} credit card."
		if (@cc_limits[customer] - @cc_balances[customer]) < 0
			print " You have overdrawn your account by $" + (@cc_balances[customer] - @cc_limits[customer]).to_s + "."
			@cc_balances[customer] += ((@cc_balances[customer] - @cc_limits[customer]) * 0.10)
			puts " Additionally, you have been charged an overdraft fee of 10% of the overdrawn amount, and a hold has been placed on your account."
		else
			puts
		end
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
