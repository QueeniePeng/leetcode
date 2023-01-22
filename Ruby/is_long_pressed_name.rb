# Your friend is typing his name into a keyboard. Sometimes, when typing a character c,
#  the key might get long pressed, and the character will be typed 1 or more times.

# You examine the typed characters of the keyboard. Return True if it is possible 
# that it was your friends name, with some characters (possibly none) being long pressed.

 

# Example 1:

# Input: name = "alex", typed = "aaleex"
# Output: true
# Explanation: 'a' and 'e' in 'alex' were long pressed.
# Example 2:

# Input: name = "saeed", typed = "ssaaedd"
# Output: false
# Explanation: 'e' must have been pressed twice, but it was not in the typed output.
 

# Constraints:

# 1 <= name.length, typed.length <= 1000
# name and typed consist of only lowercase English letters.

# @param {String} name
# @param {String} typed
# @return {Boolean}
# def is_long_pressed_name(name, typed)
#   i = 0
#   j = 0
#   while i < name.length && j < typed.length
#     if name[i] == typed[j]
#       i += 1
#       j += 1
#     elsif typed[j] == typed[j-1]
#       j += 1
#     else
#       return false
#     end
#   end
#   i == name.length
# end

# def is_long_pressed_name(name, typed)
#   i = 0
#   j = 0

#   while i < name.length
#     next_i = name[i+1]
#     while typed[j] == name[i] && next_i != name[i]
#       j += 1
#     end
#     i += 1
#   end
#   return j == typed.length && i == name.length
# end

def is_long_pressed_name(name, typed)
  i = 0

  dict = {}
  while i < typed.length
    
  end
end

puts is_long_pressed_name('alex', "aaleexa")
puts is_long_pressed_name('saeed', 'ssaaedd')
puts is_long_pressed_name('leelee', 'lleeelee')
# true