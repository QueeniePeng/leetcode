# You are for a customer support center and have been asked to help update the company's extensive phone directory.

# In order to check which phone numbers are still valid and which need updating, you need to write a short program that:

# Checks wether a phone number (given as string str) in the database is in the format (XXX) XXX-XXXX. And then

# If the number is in the correct format, returns it as a continues 10-digit string (called convertNumber)
# If the number is not in the correct format, returns "No"

# Input: 
# (123) 456-7890
# Output: 1234567890

# Since the input is in the correct format, your code will convert it into a continuous 10-digit string. The outcome, therefore, is 1234567890

def convertNumber(str)
  if str =~ /\A\(\d{3}\)\s\d{3}-\d{4}\z/
    str.scan(/\d/).join('')
  else
    'No'
  end
end

require 'test/unit'

class TestConvertNumber < Test::Unit::TestCase
  def test_
    assert_equal '1234567890', convertNumber('(123) 456-7890')
    assert_equal 'No', convertNumber('0151-319723')
  end
end
