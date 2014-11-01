
# MakerSquare Coding Challenge
# Lance Fulton


# Classes

Bank = Class.new do #the Bank class
	attr_reader :accounts #to see an account listing by calling '.accounts'
	attr_reader :bankname #for use when stating the receiving bank's name in a transfer message
	def initialize(bankname)
		@bankname = bankname
		@accounts = {}
		#@cc_accounts = {}
		puts "#{@bankname} bank was just created."
	end
	def open_account(customer)
		@accounts[customer.name] = 0
		puts "#{customer.name}, thanks for opening an account at #{@bankname}!"
	end
	def deposit (customer, amount)
		if amount <= customer.cash
			@accounts[customer.name] += amount
			customer.cash -= amount
			puts "#{customer.name} deposited $#{amount} to #{@bankname}. #{customer.name} has $#{customer.cash}. #{customer.name}'s account has $" + @accounts[customer.name].to_s + "."
		else
			puts "#{customer.name} does not have enough cash to deposit $#{amount}."
		end
	end
	def withdraw (customer, amount)
		if @accounts[customer.name] - amount > 0
			@accounts[customer.name] -= amount
			customer.cash += amount
			puts "#{customer.name} withdrew $#{amount} from #{@bankname}. #{customer.name} has $#{customer.cash}. #{customer.name}'s account has $" + @accounts[customer.name].to_s + "."
		else
			puts "#{customer.name} does not have enough money in the account to withdraw $#{amount}."
		end
	end
	def transfer (customer, receiver, amount)
		@accounts[customer.name] -= amount
		receiver.accounts[customer.name] += amount
		puts "#{customer.name} transfered $#{amount} from the #{@bankname} account to the #{receiver.bankname} account. The #{@bankname} account has $#{@accounts[customer.name]} and the #{receiver.bankname} account has $#{receiver.accounts[customer.name]}."
	end
	def total_cash_in_bank
		@banktotal = 0
		@accounts.each do |customer, balance|
			@banktotal += balance
		end
		print "#{@bankname} has $#{@banktotal} in the bank."
	end
	#def cc_open
	#end
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
