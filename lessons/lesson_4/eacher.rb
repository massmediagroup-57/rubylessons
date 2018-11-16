str = Proc.new {|num| "i = #{num}, четное: #{num.even?}" }

(0..50).each {|num| p str.call(num) }
# 51.times { |num| p str.call(num) }
