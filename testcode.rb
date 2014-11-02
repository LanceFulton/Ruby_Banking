# MakerSquare Coding Challenge
# Lance Fulton


# Testcode

require_relative 'banking.rb'

chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")

me = Person.new("Lance", 500)
friend1 = Person.new("Hiro", 1000)

chase.open_account(me)
chase.open_account(friend1)
wells_fargo.open_account(me)
wells_fargo.open_account(friend1)

chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)

chase.transfer(me, wells_fargo, 100)

chase.deposit(me, 5000)
chase.withdraw(me, 5000)

puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank

chase.cc_open(friend1, 3000)
chase.cc_use(friend1, 1000)
chase.cc_statement(friend1)
chase.cc_use(friend1, 3000)
chase.cc_statement(friend1)
chase.cc_use(friend1, 1000)
chase.cc_payment(friend1, 2500)
chase.cc_use(friend1, 1000)
chase.cc_statement(friend1)
