Feature tests for setting up a new Oystercard.

<!-- #New oystercard
# 2.6.0 :001 > require './lib/oystercard'
#  => true
# 2.6.0 :002 > card = Oystercard.new
#  => #<Oystercard:0x00007fdeb58b05b0 @balance=0>

#Card has a default balance of 0
# 2.6.0 :001 > require './lib/oystercard'
#  => true
# 2.6.0 :002 > card = Oystercard.new
#  => #<Oystercard:0x00007fefc6072ed0 @balance=0>
# 2.6.0 :003 > card.balance
#  => 0


#Provide maximum balance
# 2.6.0 :001 > require './lib/oystercard'
#  => true
# 2.6.0 :002 > card = Oystercard.new
#  => #<Oystercard:0x00007fdeb58b05b0 @balance=0>
# 2.6.0 :003 > card.top_up(90)
#  => 90
# 2.6.0 :004 > card.top_up(1)
# Traceback (most recent call last):
#         5: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
#         4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
#         3: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#         2: from (irb):4
#         1: from /Users/yems/Projects/oystercard_challenge/lib/oystercard.rb:11:in `top_up'
# RuntimeError (Card violation: cannot exceed £90) -->
