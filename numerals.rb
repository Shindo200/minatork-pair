num1 = [
  :zero,
  :one,
  :two,
  :three,
  :four,
  :five,
  :six,
  :seven,
  :eight,
  :nine,
]

num2 = [
  :ten,
  :eleven,
  :twenty,
  :thirty,
  :forty,
  :fifty,
  :sixty,
  :seventy,
  :eighty,
  :ninety,
]

num3 = [
  "",
  "",
  :twelve,
  :thirtteen,
  :fourteen,
  :fifteen,
  :sixteen,
  :seventeen,
  :eightteen,
  :nineteen
]

high_digit = ARGV[0].to_i / 100
low_digit = ARGV[0].to_i % 100
english_num = num1[0]

if high_digit > 0
  case high_digit
    when 1...10
      english_num = "#{num1[high_digit]} hundred "
    when 11...20
      english_num = "#{num2[(high_digit % 10)]} hundred "
    else
      if (high_digit % 10) == 0
        english_num = "#{num1[(high_digit / 10)]} thousand "
      else
        english_num = "#{num3[(high_digit / 10)]}-#{num1[(high_digit % 10)]} hundred "
      end
  end

  english_num += "and " if low_digit > 0
end

if low_digit > 0
  case low_digit
    when 1...10
      english_num += "#{num1[low_digit]}"
    when 10...20
      english_num += "#{num2[(low_digit % 10)]}"
    else
      english_num += "#{num3[(low_digit / 10)]}"
      english_num += "-#{num1[(low_digit % 10)]}" unless (low_digit % 10) == 0
  end
end

puts english_num
