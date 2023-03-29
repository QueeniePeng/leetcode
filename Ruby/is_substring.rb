# return str1 length if str1 is str2
# return starting substring index of str1 if str2 is a substring of str1
# return -1 if none of the above

def is_substring(str1, str2)
  length2 = str2.length
  length1 = str1.length
  return length1 if str1 == str2

  str1.each_char.with_index do |_c, i|
    return -1 if (i + length2 - 1) > length1 - 1
    return i if str1[i, length2] == str2
  end
end

require 'test/unit'

class TestMinEngergy < Test::Unit::TestCase
  def test_
    assert_equal 1, is_substring('sdfagadg', 'dfa')
    assert_equal(-1, is_substring('adfadfadfasf', 'jk'))
  end
end
