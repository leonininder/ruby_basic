class Player

  attr_accessor :name

  def initialize(name)
    @name=name
  end

  def total_num(poker)
    num=0
    a_count=0

    poker.count.times {|times|   
    if poker[times][1]=="J"||poker[times][1]=="Q"||poker[times][1]=="K"
      num += 10
    elsif poker[times][1]=="A"
      num += 11
      a_count += 1
    else
      num += poker[times][1].to_i
    end
    }

    a_count.times { num -= 10 if num > 21 }
    num

  end

end
#==================================================================
class Human < Player

  def pick_poker
    num=total_num(Game::Human_poker)

    if num < 21
      puts "You Have: #{Game::Human_poker}"
      puts "Point: #{num}, Please Enter your select:  1)Hits  2)Stay"
      choice = gets.chomp
      Game::Human_poker.push Game::Pokers.shuffle!.pop if choice == "1"
      pick_poker if choice == "1" or choice != "2"
    elsif num > 21
      puts  "Your point: #{num}, Bust!, Lose!"
    elsif num == 21
      puts "You Have: #{Game::Human_poker}, point #{num}"
    end
  num=total_num(Game::Human_poker)
  end

end
#==================================================================
class Computer < Player

  def pick_poker
    human_num=total_num(Game::Human_poker)

    begin
      Game::Computer_poker.push Game::Pokers.shuffle!.pop
      computer_num=total_num(Game::Computer_poker)
      puts "Computer Have: #{Game::Computer_poker}\nPoint: #{computer_num}"
    end until computer_num >= 17 && computer_num >= human_num
  computer_num=total_num(Game::Computer_poker)
  end

end

class Game
  attr_accessor :human,:computer

  point=%w(A 2 3 4 5 6 7 8 9 10 J Q K)
  Pokers=["Black-Spades", "Red-Hearts", "Red-Diamonds", "Black-Clubs"].product(point)
  
  Human_poker=[]
  Computer_poker=[]

  def initialize
    @human=Human.new("Joe")
    @computer=Computer.new("CPU3000")
  end

  def compare(human_num,computer_num)
    puts "Draw!" if computer_num == human_num
    puts "Bust!, You Win!" if computer_num > 21
    puts "You Lose!" if computer_num > human_num && computer_num <= 21
  end

  def start

    2.times {Human_poker << Pokers.shuffle!.pop}
    2.times {Computer_poker << Pokers.shuffle!.pop}

    human_num=human.total_num(Human_poker)
    computer_num=computer.total_num(Computer_poker)

    if human_num == 21
      puts "You Have: #{Human_poker}"
      puts  "Black Jack, You win!"
    elsif computer_num == 21
      puts "Computer Have: #{Computer_poker}"
      puts  "Black Jack, You Lose!"
    else
      puts "Computer Have: #{Computer_poker[0]}, [Hide!]"
      human_num=human.pick_poker
    end

    if human_num <= 21 or computer_num != 21
      puts "Computer Have: #{Computer_poker}, Point: #{computer_num}"
      computer_num=computer.pick_poker
      compare(human_num,computer_num)
    end

  end

end
#==================================================================

the_game=Game.new
the_game.start