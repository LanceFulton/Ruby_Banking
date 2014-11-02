
# MakerSquare Coding Challenge
# Lance Fulton


# Classes

Bank = Class.new do
	attr_reader :accounts #gives account listing by calling '.accounts'
	attr_reader :bankname #used when stating receiving bank's name in a transfer message
	def initialize(bankname)
		@bankname = bankname
		@accounts = {}
		@cc_limits = {}
		@cc_balances = {}
		@cc_holds = {}
		@cc_rates = {}
		puts "#{@bankname} bank was just created."
	end
	def open_account(customer)
		@accounts[customer] = 0 
		puts "#{customer.name}, thanks for opening an account at #{@bankname}!"
	end
	def deposit (customer, amount)
		if amount <= customer.cash #checks to make sure they have enough cash
			@accounts[customer] += amount
			customer.cash -= amount
			puts "#{customer.name} deposited $#{amount} to #{@bankname}. #{customer.name} has $#{customer.cash}. #{customer.name}'s account has $" + @accounts[customer].to_s + "."
		else
			puts "#{customer.name} does not have enough cash to deposit $#{amount}."
		end
	end
	def withdraw (customer, amount)
		if @accounts[customer] - amount > 0 #checks to make sure there is enough in their account
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
	def cc_open (customer, limit, rate)
		@cc_limits[customer] = limit
		@cc_balances[customer] = 0
		@cc_rates[customer] = rate
		@cc_holds[customer] = 0 #starts the account with no holds
		puts "#{customer.name}, thanks for opening a credit card account with #{@bankname}. Your credit limit is $#{@cc_limits[customer]}."
	end
	def cc_statement (customer)
		puts "#{customer.name}, your #{@bankname} credit card balance is $#{@cc_balances[customer]}. Your available credit is $#{@cc_limits[customer] - @cc_balances[customer]}."
	end
	def cc_use (customer, amount)
		if @cc_holds[customer] == 0 #checks if there is a hold
			@cc_balances[customer] += amount
			print "#{customer.name}, you charged $#{amount} to your #{bankname} credit card."
			if (@cc_limits[customer] - @cc_balances[customer]) < 0 # checks for overdraft
				print " You have overdrawn your account by $" + (@cc_balances[customer] - @cc_limits[customer]).to_s + "."
				@cc_balances[customer] += (((@cc_balances[customer] - @cc_limits[customer]) * 0.10).to_i)
				@cc_holds[customer] = 1 #adds a hold
				puts " Additionally, you have been charged an overdraft fee of 10% of the overdrawn amount, and a hold has been placed on your account."
			else
				puts #to return after initial message when no second sentence
			end
		else
			puts "#{customer.name}, there is currently a hold on your #{@bankname} credit card account. Please make a payment to bring your credit card balance to within your limit of $#{@cc_limits[customer]}, so that the hold may be lifted."
		end
	end
	def cc_payment (customer, amount)
		@cc_balances[customer] -= amount
		print "#{customer.name}, thank you for your payment of $#{amount} to your #{@bankname} credit card account. Your balance is now $#{@cc_balances[customer]}."
		if (@cc_limits[customer] - @cc_balances[customer]) >= 0 #checks if balance is below limit
			@cc_holds[customer] = 0 #clears the hold
			puts " The hold on your account has been lifted."
		end
	end
	def cc_calc_int (customer)
		@cc_balances[customer] += ((@cc_balances[customer] * @cc_rates[customer]).to_i)
		puts "#{customer.name}, a finance charge has accrued to your #{@bankname} credit card account. Your account balance is now $#{@cc_balances[customer]}."
	end
end

Person = Class.new do
	attr_reader :name
	attr_accessor :cash
	def initialize(name, cash)
		@name = name
		@cash = cash
		puts "Hi, #{@name}. You have $#{@cash}!"
	end
end
