# Write the FizzBuzz algorithm which returns an array of strings from 1 to N, but:
# For multiples of 3, prints “Fizz”
# For multiples of 5, prints “Buzz”
# For multiples of both 3 and 5 prints “FizzBuzz”

def response(input)
  # Insert your code here
  $response = []
  $i = 1
  1.upto(input) do |_i|
    if $i % 15 == 0 then $response.push 'FizzBuzz'
    elsif $i % 3  == 0 then $response.push 'Fizz'
    elsif $i % 5  == 0 then $response.push 'Buzz'
    else $response.push $i
    end
    $i = $i + 1
  end
  $response
end
