# 100000.times { print rand(30..120).chr }
# print 'Введите строку: '
# str = gets.chomp

# 10.times do
#   str.size.times do |x|
#     print str[x]
#     d = (1 + rand(30)).to_f / 100
#     sleep d
#     print '-'
#   end

#   print ' '
# end
print 'Какую сумму будем откладывать в месяц:'
deposit = gets.to_f

print 'Сколько месяцев:'
total_month = gets.to_i

sum = 0
0.upto(total_month) do |current_month|
  puts "Рік: #{current_month/12+1}, місяць: #{current_month%12+1}, накопичення: #{sum += deposit};"
end
