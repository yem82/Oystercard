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

1) 2.6.0 :001 > station = Station.new
Traceback (most recent call last):
        4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (uninitialized constant Station)

2) => #<Station:0x00007fb7f09c94d8>
2.6.0 :003 > station.name
Traceback (most recent call last):
        4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):3
NoMethodError (undefined method `name' for #<Station:0x00007fb7f09c94d8>)
2.6.0 :004 > station.zone
Traceback (most recent call last):
        5: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):4


**Green Feature Test**

2.6.0 :003 > require './station'
 => true
2.6.0 :004 > station = Station.new
 => #<Station:0x00007faff5237ad8>

2)
2.6.0 :004 > station = Station.new("Aldgate", 1)
 => #<Station:0x00007f8b379ebbb8 @name="Aldgate", @zone=1>
2.6.0 :005 > station.name
 => "Aldgate"
2.6.0 :006 > station.zone
 => 1

**RED Unit Test**

Failure/Error:
  describe Station do
    let(:station) { Station.new }
    it "creates a new station" do
      expect(station).to include station
    end
  end

NameError:
  uninitialized constant Station

2) Failures:

  1) Station station can have a name
     Failure/Error: expect(station.name).to eq name

     NoMethodError:
       undefined method `name' for #<Station:0x00007fae76819f08>
     # ./spec/station_spec.rb:11:in `block (2 levels) in <top (required)>'

  2) Station station can have a zone
     Failure/Error: expect(station.zone).to eq zone

     NoMethodError:
            undefined method `zone' for #<Station:0x00007fae76818ec8>
          # ./spec/station_spec.rb:15:in `block (2 levels) in <top (required)>'

     Finished in 0.01957 seconds (files took 0.19123 seconds to load)
     17 examples, 2 failures

GREEN Unit Test

...............

Finished in 0.02012 seconds (files took 0.14139 seconds to load)
15 examples, 0 failures

2) .................

Finished in 0.01623 seconds (files took 0.13682 seconds to load)
17 examples, 0 failures

Chapter 14 User Story

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

Create Journey class as journey becoming repetitive in Oystercard class

Feature test for touch_out with no touch_in
2.6.0 :001 > require './oystercard'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007fa6161d1b90 @balance=0, @journeys={}>
2.6.0 :003 > card.top_up(5)
 => 5
2.6.0 :004 > card.touch_out("Aldgate")
 => "Aldgate"
2.6.0 :005 > card.history
 => [{:entry_station=>nil, :exit_station=>"Aldgate"}]
2.6.0 :006 > exit

Failed Feature Test

1) 2.6.0 :002 > journey = Journey.new
Traceback (most recent call last):
        5: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):2
        1: from (irb):2:in `rescue in irb_binding'
NameError (uninitialized constant Journey)

2) 2.6.0 :001 > require './journey'
 => true
2.6.0 :002 > journey = Journey.new
 => #<Journey:0x00007fd8481efb40>
2.6.0 :003 > journey.complete?
Traceback (most recent call last):
        4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):3
NoMethodError (undefined method `complete?' for #<Journey:0x00007fd8481efb40>)

3) 2.6.0 :001 > require './journey'
 => true
2.6.0 :002 > journey = Journey.new
 => #<Journey:0x00007f8fba02bf88>
2.6.0 :003 > journey.fare
Traceback (most recent call last):
        4: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/yems/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/yems/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):3
NoMethodError (undefined method `fare' for #<Journey:0x00007f8fba02bf88>)

Green Feature Test

1) Yems-Macbook-Pro:lib yems$ irb
2.6.0 :001 > require './journey'
 => true
2.6.0 :002 > journey = Journey.new
 => #<Journey:0x00007f85ff8c86b0>

2) 2.6.0 :001 > require './journey'
 => true
2.6.0 :002 > journey = Journey.new
 => #<Journey:0x00007ffcb3084550>
2.6.0 :003 > journey.complete?
 => true

 3) 2.6.0 :001 > require './journey'
 => true
2.6.0 :002 > journey = Journey.new
 => #<Journey:0x00007f88531302f8>
2.6.0 :003 > journey.fare
 => 6

 4) 2.6.0 :001 > require './journey'
  => true
 2.6.0 :002 > journey = Journey.new
  => #<Journey:0x00007fceb10434b8 @journey={:entry_station=>nil, :exit_station=>nil}>
 2.6.0 :003 > journey.fare
  => 6
 2.6.0 :004 > journey.finish("Moorgate")
  => #<Journey:0x00007fceb10434b8 @journey={:entry_station=>nil, :exit_station=>nil}>

RED Unit Test

1) Failure/Error:
  describe Journey do

  end

NameError:
  uninitialized constant Journey
# ./spec/journey_spec.rb:3:in `<top (required)>'


Finished in 0.00022 seconds (files took 0.23096 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples

2)   1) Journey completed journey
     Failure/Error: expect(subject).to be_complete
       expected #<Journey:0x00007fa9c8370838> to respond to `complete?`
     # ./spec/journey_spec.rb:6:in `block (2 levels) in <top (required)>'

Finished in 0.04429 seconds (files took 0.19626 seconds to load)
18 examples, 1 failure

Failed examples:

rspec ./spec/journey_spec.rb:5 # Journey completed journey

3)     Failure/Error: expect(subject.fare).to eq Journey::PENALTY_FARE

     NoMethodError:
       undefined method `fare' for #<Journey:0x00007fc4ea19c560>
     # ./spec/journey_spec.rb:12:in `block (3 levels) in <top (required)>'

Finished in 0.02235 seconds (files took 0.1966 seconds to load)
19 examples, 1 failure

Failed examples:

rspec ./spec/journey_spec.rb:11 # Journey#fare has a pentalty fare by default



GREEN Unit Test

1) Yems-Macbook-Pro:oystercard_challenge yems$ rspec
.................

Finished in 0.02136 seconds (files took 0.18689 seconds to load)
17 examples, 0 failures

2) Yems-Macbook-Pro:oystercard_challenge yems$ rspec
..................

Finished in 0.0165 seconds (files took 0.11561 seconds to load)
18 examples, 0 failures

3) Yems-Macbook-Pro:oystercard_challenge yems$ rspec
...................

Finished in 0.01461 seconds (files took 0.11564 seconds to load)
19 examples, 0 failures

4) Finished in 0.02725 seconds (files took 0.19135 seconds to load)
17 examples, 0 failures
