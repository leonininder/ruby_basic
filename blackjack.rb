def initialize_poker
point=%w(A 2 3 4 5 6 7 8 9 10 J Q K)
["Black-Spades", "Red-Hearts", "Red-Diamonds", "Black-Clubs"].product(point)
end

def pick_poker(poker, player_poker)
  sample = poker.sample
  poker.delete sample
  player_poker.push sample
end

def poker_num(poker)
  num =0
  a_count=0
  poker.count.times {|count|
    if poker[count][1]=="J"||poker[count][1]=="Q"||poker[count][1]=="K"
      num += 10
    elsif poker[count][1]=="A"
      num += 11
      a_count += 1
    else
      num += poker[count][1].to_i
    end
  }

  a_count.times { num -= 10 if num>21 }

  num
end 

def cards(poker)
card=""
poker.count.times {|count| card += "#{poker[count][0]} #{poker[count][1].to_s}, " }
card
end

def start_game(poker, computer_poker, player_poker)
  #
  player_num = poker_num(player_poker)

  if player_num < 21
    puts "You Have: #{cards(player_poker)}"
    puts "Point: #{player_num}, Please Enter your select:  1) hits 2) stay"
    pick = gets.to_s.chomp
    pick_poker(poker, player_poker) if pick =="1"
    start_game(poker, computer_poker, player_poker) if pick =="1" or pick !="2"
    computer_pick(poker, computer_poker, player_num) if pick =="2"
  elsif  player_num > 21
    puts  "Your point: #{player_num}, Bust!, Lose!"
  elsif player_num == 21
    puts "You Have: #{cards(player_poker)}, point #{player_num}"
    computer_pick(poker, computer_poker, player_num) 
  end
end

def computer_pick(poker, computer_poker, player_num)
  #
  begin
    computer_num = poker_num(computer_poker)
    puts "Computer Have: #{cards(computer_poker)}\nPoint: #{computer_num}"
    pick_poker(poker, computer_poker)
  end until computer_num >= 17 && computer_num >= player_num

  puts "Draw!" if computer_num == player_num
  puts "Bust!, You Win!" if computer_num > 21
  puts "You Lose!" if computer_num > player_num && computer_num <= 21
end


poker=initialize_poker
player_poker=[]
computer_poker=[]

2.times {pick_poker(poker, player_poker)}
2.times {pick_poker(poker, computer_poker)}

player_num = poker_num(player_poker)
computer_num = poker_num(computer_poker)

if player_num == 21
  puts "You Have: #{cards(player_poker)}"
  puts  "Black Jack, You win!"
elsif computer_num == 21
  puts "Computer Have: #{cards(computer_poker)}"
  puts  "Black Jack, You Lose!"
else
  puts "Computer Have: #{computer_poker[1][0]+computer_poker[1][1].to_s}, Hide!"
  start_game(poker, computer_poker, player_poker)
end