class Player
  attr_accessor :name,:hand

  def initialize(name)
    @name=name
  end

end

class Human < Player

  def pick_hand
    begin
      puts "Please choose type:  P)Paper  R)Rock  S)Scissors"
      choose=gets.chomp.downcase
    end until Game::Hand_choose.keys.include? choose
    self.hand=Hand.new(choose)
  end

end

class Computer < Player

  def pick_hand
    choose=Game::Hand_choose.keys.sample
    self.hand=Hand.new(choose)
  end

end

class Hand
  attr_accessor :hand

  def initialize(hand)
    @hand=hand
  end

  def to_s
    hand
  end
end

class Game
  Hand_choose={'p'=>'Paper','r'=>'Rock','s'=>'Scissors'}

  attr_accessor :human,:computer

  def initialize
    @human=Human.new("Joe")
    @computer=Computer.new("CPU")
  end

  def start
    draw_pair=[['p','p'],['s','s'],['r','r']]
    winning_pair=[['p','r'],['s','p'],['r','s']]
    losing_pair=[['p','s'],['s','r'],['r','p']]

    human.pick_hand
    computer.pick_hand

    current_pair= [human.hand.to_s, computer.hand.to_s]

    puts "#{self.human.name} choose #{Hand_choose[current_pair[0]]}."
    puts "#{self.computer.name} choose #{Hand_choose[current_pair[1]]}."

    puts "Draw." if draw_pair.include? current_pair
    puts "#{self.human.name} win." if winning_pair.include? current_pair
    puts "#{self.computer.name} win." if losing_pair.include? current_pair
  end

end

the_game=Game.new
the_game.start