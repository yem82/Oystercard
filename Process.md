Feature tests for setting up a new Oystercard.

New oystercard
 2.6.0 :001 > require './lib/oystercard'
  => true
 2.6.0 :002 > card = Oystercard.new
  => <Oystercard:0x00007fdeb58b05b0 @balance=0>

Card has a default balance of 0
 2.6.0 :001 > require './lib/oystercard'
  => true
 2.6.0 :002 > card = Oystercard.new
  => <Oystercard:0x00007fefc6072ed0 @balance=0>
 2.6.0 :003 > card.balance
  => 0


Provide maximum balance
 2.6.0 :001 > require './lib/oystercard'
  => true
 2.6.0 :002 > card = Oystercard.new
  => <Oystercard:0x00007fdeb58b05b0 @balance=0>
 2.6.0 :003 > card.top_up(90)
  => 90
 2.6.0 :004 > card.top_up(1)
 Traceback (most recent call last):
         5: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
         4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
         3: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
         2: from (irb):4
         1: from /Users/yems/Projects/oystercard_challenge/lib/oystercard.rb:11:in `top_up'
 RuntimeError (Card violation: cannot exceed £90)


Feature test for #deduct
 2.6.0 :001 > require './lib/oystercard'
  => true
 2.6.0 :002 > card = Oystercard.new
  => <Oystercard:0x00007fd9b18fafd8 @balance=0>
 2.6.0 :003 > card.top_up(10)
  => 10
 2.6.0 :004 > card.balance
  => 10
 2.6.0 :005 > card.deduct(2)
  => 8


To use for feature testing:
irb
require './lib/oystercard'
card = Oystercard.new
card.top_up(10)
card.balance
card.deduct(2)


User Story Chapter 8

In order to get through the barriers.
As a customer
I need to touch in and out.

Object | Message

card   | touch_in
       | touch_out
       | in_journey?


RED



2.6.0 :001 > require './lib/oystercard'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007ff73d1b22b8 @balance=0>
2.6.0 :003 > card.touch_in
Traceback (most recent call last):
        4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):3
NoMethodError (undefined method `touch_in' for #<Oystercard:0x00007ff73d1b22b8 @balance=0>)
2.6.0 :004 > card.touch_out
Traceback (most recent call last):
        5: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):4
        1: from (irb):4:in `rescue in irb_binding'
NoMethodError (undefined method `touch_out' for #<Oystercard:0x00007ff73d1b22b8 @balance=0>)

GREEN

002 > card = Oystercard.new
 => #<Oystercard:0x00007fd81698bf70 @balance=0>
2.6.0 :003 > card.top_up(10)
 => 10
2.6.0 :004 > card.touch_in
 => nil
2.6.0 :005 > card.touch_out
 => nil
2.6.0 :006 > card.in_journey?
 => false
2.6.0 :007 > card.touch_in
 => nil
2.6.0 :008 > card.touch_in

2.6.0 :001 > require './lib/oystercard'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007fedfc955be0 @balance=0, @in_use=false>
2.6.0 :003 > card.touch_in
 => true
2.6.0 :004 > card.touch_in
 => true
2.6.0 :005 > card.in_journey?
 => true
2.6.0 :006 > card.touch_out
 => false
2.6.0 :007 > card.in_journey?
=> false
2.6.0 :008 > card2 = Oystercard.new
 => #<Oystercard:0x00007fedfc97edb0 @balance=0, @in_use=false>
2.6.0 :009 > card2.in_journey?
 => false


Chapter 8 User Story

In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.

Object  |  message

card    | minimum_amount --> £1




Green

2.6.0 :001 > require './lib/oystercard'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007f83c70d4920 @balance=0, @in_use=false>
2.6.0 :003 > card.top_up(0.5)
 => 0.5
2.6.0 :004 > card.touch_in
Traceback (most recent call last):
        5: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):4
        1: from /Users/yems/Projects/oystercard_challenge/lib/oystercard.rb:27:in `touch_in'
RuntimeError (Insufficient funds)

Chapter 10 User Story

In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card


GREEN

2.6.0 :001 > require './lib/oystercard'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007f84b7174678 @balance=0, @in_use=false>
2.6.0 :003 > card.in_journey?
=> false
2.6.0 :004 > card.top_up(10)
=> 10
2.6.0 :005 > card.in_journey?
=> false
2.6.0 :006 > card.touch_in
=> true
2.6.0 :007 > card.balance
=> 10
2.6.0 :008 > card.in_journey?
=> true
2.6.0 :009 > card.touch_out
=> false
2.6.0 :010 > card.balance
=> 9

chapter 11 User Story

In order to pay for my journey
As a customer
I need to know where I've travelled from

Object  |  Message

card    | entry_station

Failed Feature test

2.6.0 :001 > require './lib/oystercard'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007f91cb8af548 @balance=0, @in_use=false>
2.6.0 :003 > card.top_up(80)
 => 80
2.6.0 :004 > card.touch_in
 => true
2.6.0 :005 > card.balance
 => 80
2.6.0 :006 > card.entry_station
Traceback (most recent call last):
        4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'

        3: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):6
NoMethodError (undefined method `entry_station' for #<Oystercard:0x00007f91cb8af548 @balance=80, @in_use=true>)

Failed Unit test


......F....

Failures:

  1) Oystercard#entry_station commits #entry_station to memory
     Failure/Error:
         def touch_in
           fail "Insufficient funds" if insufficient_funds?

           @in_use = true
           end

ArgumentError:
 wrong number of arguments (given 1, expected 0)
# ./lib/oystercard.rb:29:in `touch_in'
# ./spec/oystercard_spec.rb:60:in `block (3 levels) in <top (required)>'

Finished in 0.01208 seconds (files took 0.11465 seconds to load)
11 examples, 1 failure

Failed examples:

rspec ./spec/oystercard_spec.rb:59 # Oystercard#entry_station commits #entry_station to memory

Green Feature Test

2.6.0 :001 > require './oystercard'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007fe2d80b6478 @balance=0, @in_use=false, @entry_station=nil>
2.6.0 :003 > card.top_up(10)
 => 10
2.6.0 :004 > card.touch_in("Aldgate")
 => "Aldgate"
2.6.0 :005 > card.in_journey?
 => true
2.6.0 :006 > card.touch_out
 => nil
2.6.0 :007 > card.in_journey?
=> false
2.6.0 :008 > card.entry_station
=> nil


Chapter 12 User Story

In order to know where I have been
As a customer
I want to see all my previous trips

RED feature test

2.6.0 :001 > require './oystercard'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007fc97d8e5be0 @balance=0, @in_use=false, @entry_station=nil>
=> #<Oystercard:0x00007fc97d8e5be0 @balance=0, @in_use=false, @entry_station=nil>
2.6.0 :003 > card.top_up(10)
=> 10
2.6.0 :004 > card.touch_in("Aldgate")
=> "Aldgate"
2.6.0 :005 > card.touch_out
=> nil
2.6.0 :006 > card.history
Traceback (most recent call last):
       4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
       3: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
       2: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
       1: from (irb):6
NoMethodError (undefined method `history' for #<Oystercard:0x00007fc97d8e5be0>)

Green Feature test

2.6.0 :001 > require './oystercard'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007ff10e1ee310 @balance=0, @journeys={}>
2.6.0 :003 > card.history
 => [{}]
2.6.0 :004 > card.top_up(10)
 => 10
2.6.0 :005 > card.touch_in("Aldgate")
 => "Aldgate"
2.6.0 :006 > card.history
 => [[{}]]
2.6.0 :007 > card.touch_out("Moorgate")
=> "Moorgate"
2.6.0 :008 > card.history
=> [{:entry_station=>"Aldgate", :exit_station=>"Moorgate"}]
2.6.0 :009 > card.in_journey?
=> false

Chapter 13 User Story

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

Failed Feature Test







Green Feature Test







RED Unit Test







GREEN Unit Test


Chapter 14 User Story

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

Failed Feature Test

2.6.0 :001 > station = Station.new
Traceback (most recent call last):
        4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (uninitialized constant Station)


Green Feature Test

2.6.0 :003 > require './station'
 => true
2.6.0 :004 > station = Station.new
 => #<Station:0x00007faff5237ad8>


RED Unit Test

Failure/Error:
  describe Station do
    let(:station) { Station.new }
    it "creates a new station" do
      expect(station).to include station
    end
  end

NameError:
  uninitialized constant Station


GREEN Unit Test

...............

Finished in 0.02012 seconds (files took 0.14139 seconds to load)
15 examples, 0 failures
