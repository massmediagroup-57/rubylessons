print 'Скільки років будем відкладати:'
total_month = gets.to_i * 12

print 'Яку сумму будем відкладати в місяць:'
deposit = gets.to_f

sum = 0
0.upto(total_month - 1) do |current_month|
  puts "Рік: #{current_month/12+1}, місяць: #{current_month%12+1}, накопичення: #{sum += deposit};"
end
puts "Сумма за весь час: #{sum}"