// Given a string s, return the longest palindromic substring in s.

 

// Example 1:

// Input: s = "babad"
// Output: "bab"
// Explanation: "aba" is also a valid answer.
// Example 2:

// Input: s = "cbbd"
// Output: "bb"
 

// Constraints:

// 1 <= s.length <= 1000
// s consist of only digits and English letters.

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let reverse: String = String(s.reversed())
        var dict: [Character : [Int]] = [:]
        var ans: String = ""

        for (j, c) in s.enumerated() {
          dict[c, default: []].append(j)

          for i in dict[c]! {
            let
            let a = s.index
            if (s[i...j] == reverse[(-j - 1)...(-i - 1)]) && (ans.count < j - i + 1) {
              ans = s[i..j]
              break
            }
          }
        }
        return ans
    }
}

print(Solution().longestPalindrome("babad"))