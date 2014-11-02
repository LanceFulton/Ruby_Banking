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
puts
chase.cc_open(friend1, 3000, 0.08) #open a cc account
chase.cc_use(friend1, 1000) #use cc to make a purchase
chase.cc_statement(friend1) #get cc statement
puts
chase.cc_payment(friend1, 400) #normal payment
chase.cc_statement(friend1)
puts
chase.cc_use(friend1, 3000) #first purchase to exceed limit
chase.cc_statement(friend1)
puts
chase.cc_use(friend1, 500) #attempt to further exceed limit
chase.cc_payment(friend1, 2500) #payment to bring balance under limit
chase.cc_use(friend1, 500) #successful purchase
chase.cc_statement(friend1)
puts
chase.cc_calc_int(friend1, 2) #2 months of interest
chase.cc_statement(friend1)
