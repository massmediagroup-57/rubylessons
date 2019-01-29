@win_params = {
  first: [7, 13, 28, 99],
  first_rate: 10,
  first_type: 'щасливе',
  second: [66, 77, 55, 44, 22, 11, 88],
  second_rate: 5,
  second_type: 'супер',
  third: [1, 3, 5, 7, 11, 13, 15, 17, 19, 23, 27, 29, 31, 37, 41, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97],
  third_rate: 2,
  third_type: 'просте'
}

@messages = {
  ask_to: 'Хочете зіграти?',
  ask_to_more: 'Хочете зіграти ще?',
  ask_to_input: 'Хочете внести кошти?',
  put_yes: 'Введіть "y":',
  ask_make_a_bet: 'Скільки ви хочете поставити?:',
  make_a_bet_error: 'Ви не зробили ставку!',
  roulette_lost: 'Ви програєте і втрачаєте ставку',
  roulette_error: 'Я не уявляю як ти сюди дістався! Вирубай комп тікай з села. Я тебе вже шукаю',
  goodbuy: 'О ні!! Ви більше не хочете грати!?. Ну що зробиш бувай',
  dont_set_bet: 'Ви не зробили ставку!',
  zero_balance: 'У200 вас на балансі немає грошей',
  how_much: 'Скільки грошей бажаєте внести?:',
  you_dont_play: 'Ви ще не грали!'
}

@mem = {
  last_game: '',
  game_count: 0,
  money: 0,
  old_money: 0,
  bet: 0
}

def win(type)
  win = @mem[:bet] * @win_params[type + 'rate'.to_sym]
  puts "Чудово!! Вам випало #{@win_params[type + 'type'.to_sym]} число ви отримуєте: #{win} грн."
  @mem[:money] += win
  @mem[:last_game] = 'виграли'
end

def random_animate(num)
  time = Time.now
  end_time = time + 2
  while time < end_time
    time = Time.now
    (0..num).each do |a|
      print "\r#{a}"
      sleep 0.01
    end
  end
  puts "\r"
end

def rand_num
  rand_num = rand(1..99)
  random_animate(rand_num)
  puts "Вам випало число: #{rand_num}"
  rand_num
end

def roulette
  num = rand_num
  case num
  when *@win_params[:first]
    win('first')
  when *@win_params[:second]
    win('second')
  when *@win_params[:third]
    win('third')
  when num < 0
    @messages[:roulette_error]
    exit
  else
    @mem[:last_game] = 'програли'
    puts @messages[:roulette_lost]
  end
  ask_to_play
end

def display_mem
  return if @mem[:game_count].zero?

  [
    '________________________________________________________',
    "Зіграно ігор: #{@mem[:game_count]}",
    "Минолого разу ви: #{@mem[:last_game]}",
    "Ваша ставка: #{@mem[:bet]} грн.",
    "Ви #{@mem[:last_game]}: #{(@mem[:money] - @mem[:old_money]).abs} грн.",
    "Ваш баланс: #{@mem[:money]}"
  ].each { |line| puts line }
end

def ask_make_bet
  puts @messages[:ask_make_a_bet]
  @mem[:bet] = gets.to_i
  @mem[:old_money] = @mem[:money]
end

def make_a_bet
  ask_make_bet
  if @mem[:money].zero?
    puts @messages[:zero_balance]
    main
  elsif @mem[:bet].zero?
    puts @messages[:dont_set_bet]
    make_a_bet
  elsif  @mem[:bet] > @mem[:money]
    puts "У вас лише: #{@mem[:money]}"
    make_a_bet
  else
    @mem[:game_count] = @mem[:game_count] += 1
    @mem[:money] = @mem[:money] - @mem[:bet]
    roulette
  end
end

def ask_to_play
  display_mem unless @mem[:money].zero?
  msg = @mem[:game_count].zero? ? (puts @messages[:ask_to]) : (puts @messages[:ask_to_more])
  ask_confirm('make_a_bet', msg)
end

def input_balance
  puts @messages[:how_much]
  @mem[:money] = gets.to_i
  ask_to_play
end

def ask_confirm(next_action, msg = '')
  puts "#{msg} #{@messages[:put_yes]}" if msg != ''
  if %w[y Y Н н].include?(gets.strip)
    send(next_action)
  else
    puts @messages[:goodbuy]
    exit
  end
end

def main
  puts "Щоб зіграти #{'ще' unless @mem[:game_count].zero?} потрібно внести кошти"
  ask_confirm('input_balance', @messages[:ask_to_input])
end

main
