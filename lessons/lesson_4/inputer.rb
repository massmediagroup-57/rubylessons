result = %w{x y z}.inject({}) do |var, val| 
	p "Введите #{val}:"
	var[val] = case val 
		when 'x'
			 gets.chomp.to_s
		when 'y'
			 gets.to_i
		when 'z'
			 gets.to_f
		end
	var
end.map{|a, b| "#{a} = #{b}"}.join(', ')

p result
