cpu = [1, 2, 3]
p "Please select 1) scissors  2) rock  3)paper"
my_select = gets.to_s.chomp
cpu_select = cpu.sample

game = case
	when my_select.to_i == cpu_select
		p "pass"
	when my_select.to_i + cpu_select == 3
		p my_select.to_i==1? "You select scissors, cpu select rock, so you lose" : "You select rock, cpu select scissors, so you win"
	when my_select.to_i + cpu_select == 4
		p my_select.to_i==1? "You select scissors, cpu select paper, so you win" : "You select paper, cpu select scissors, so you lose"
	when my_select.to_i + cpu_select == 5
		p my_select.to_i==2? "You select rock, cpu select paper, so you lose" : "You select paper, cpu select rock, so you win"
	else
		"enter 1 - 3, please."
end

game