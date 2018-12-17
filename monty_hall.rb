require 'pry'
require 'nyaplot'

def monty_hall_doors
  x = Random.new
  y = Random.new

  doors = []

  1000000.times do
    doors << [x.rand(1..3), y.rand(1..3)]
  end

  doors

  #The first number in each array in doors represents
  #which door you have chosen.
  #The second number in each array in doors represents
  #which door contains the car.
  #Therefore an array of [2,3] would mean you
  #chose door 2, but the car was behind door 3,
  #and an array of [1,1] would mean you chose
  #door 1 and the car was behind door 1.
end

def win_or_loss(array_of_doors)
  wins = 0
  losses = 0

  array_of_doors.each do |array|
    if array[0] == winning_door
      wins += 1
    else
      losses += 1
    end
  end

  puts wins
  puts losses
end

def monty_hall(array_of_doors)
  doors = [1, 2, 3]
  switching_door = nil
  switch = 0
  no_switch = 0

  array_of_doors.each do |array|
    selected_door = array[0]
    winning_door = array[1]

    if selected_door == winning_door

      #If you chose the winning door, one of the other
      #doors (both containing goats) are chosen at random,
      doors.delete(selected_door)
      revealed_door = doors.sample
      doors.delete(revealed_door)

      #and the door you switched to contains a goat.
      switching_door = doors[0]

      #If you didn't switch, you would have won the car.
      no_switch += 1
    else

      #If you chose a door that did not contain the car,
      #then it must have contained a goat.
      #Then a goat is revealed, leaving behind the
      #door that contains the car.
      doors.delete(selected_door)
      doors.delete(winning_door)
      revealed_door = doors[0]

      switching_door = winning_door

      #If you switched, you won the car.
      switch += 1
    end
  end

  puts "If you switched every time, you won #{switch} times."
  puts "If you never switched, you won #{no_switch} times."
end

# def plot
#   plot = Nyaplot::Plot.new
#   sc = plot.add(:scatter, [0, 1, 2, 3, 4], [-1, -2, -3, -4, -5])
# end
