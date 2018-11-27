p 'Введіть ваше ім\'я:'
name = gets.strip.capitalize
puts "Доброго дня, #{name};\nУ вашому імені #{name.size} символів;\nВас звати:\t#{name};\nБукв в імені:\t#{name.size};"


while true
	%w{\\ | / -}.each{|a|  print "\r#{a}"; sleep 0.1}
end