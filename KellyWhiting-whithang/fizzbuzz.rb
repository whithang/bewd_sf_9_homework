#print numbers
#evaluate whether multiple of 5 && 3, then 5, then 3

def fizzbuzz_alt
  1.upto(100) {|number| puts number}
end

def fizzbuzz
  1.upto(100) do |number|
    if number % 5 == 0 && number % 3 == 0
      puts "Fizzbuzz"
    elsif number % 5 == 0 && number % 3 != 0
      puts "Fizz"
    elsif number % 3 == 00 && number % 5 != 0
      puts "buzz"
    else
      puts number
    end
  end
end

fizzbuzz
