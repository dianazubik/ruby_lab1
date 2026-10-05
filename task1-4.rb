
# Завдання 1: конвертер градусів у радіани 
# Формула: rad = deg * (PI / 180)
puts "Завдання 1"

DEGREES_LIST = [0, 30, 45, 90, 180, 360]

DEGREES_LIST.each do |deg|
  rad = deg * (Math::PI / 180)
  puts "#{deg} градусів = #{rad.round(4)} радіан"
end

# Завдання 2: від'ємні числа множимо на -1 
puts "\nЗавдання 2 "

numbers = Array.new(10) { rand(-20..20) }
puts "Початковий масив: #{numbers.inspect}"

result = numbers.map { |n| n < 0 ? n * -1 : n }
puts "Результат:        #{result.inspect}"

#  Завдання 3: вилучити nil двома способами 
puts "\nЗавдання 3 "

data = [1, nil, 5, nil, "text", 7, nil, 3.5]
puts "Початковий масив: #{data.inspect}"

# Спосіб 1: compact
result1 = data.compact
puts "Спосіб 1 (compact): #{result1.inspect}"

# Спосіб 2: reject(&:nil?)
result2 = data.reject(&:nil?)
puts "Спосіб 2 (reject):  #{result2.inspect}"

# Спосіб 3: select
result3 = data.select { |x| !x.nil? }
puts "Спосіб 3 (select):  #{result3.inspect}"

puts "Результати збігаються: #{result1 == result2 && result2 == result3}"

# Завдання 4: відгуки 
puts "\nЗавдання 4 "

reviews = [
  { author: "Олена",  text: "Чудовий товар, рекомендую!", rating: 5 },
  { author: "Іван",   text: "Непогано, але дорого",       rating: 3 },
  { author: "Марія",  text: "Зламалося через тиждень",    rating: 1 },
  { author: "Андрій", text: "Все добре, швидка доставка", rating: 4 },
  { author: "Софія",  text: "Дуже розчарована якістю",    rating: 2 },
  { author: "Максим", text: "Відмінно!",                  rating: 5 }
]

total = reviews.sum { |r| r[:rating] }
average = total.to_f / reviews.size
puts "Середній рейтинг: #{average.round(2)}"

bad_reviews = reviews.select { |r| r[:rating] <= 2 }
puts "Відгуки з рейтингом <= 2:"
bad_reviews.each do |r|
  puts "- #{r[:author]} (#{r[:rating]}): #{r[:text]}"
end