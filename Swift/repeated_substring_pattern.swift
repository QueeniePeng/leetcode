// Given a string s, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.

 

// Example 1:

// Input: s = "abab"
// Output: true
// Explanation: It is the substring "ab" twice.
// Example 2:

// Input: s = "aba"
// Output: false
// Example 3:

// Input: s = "abcabcabcabc"
// Output: true
// Explanation: It is the substring "abc" four times or the substring "abcabc" twice.
 

// Constraints:

// 1 <= s.length <= 104
// s consists of lowercase English letters.

// class Solution {
//     func repeatedSubstringPattern(_ s: String) -> Bool {
//        if s.count == 1 { return false }

//         let se = NSOrderedSet(Array(s))
//         let count: Int = se.count

//         if s.count % count != 0 { return false }

//         let arr: Array = Array(se)
//         print(se)
//         for (i, c) in s.enumerated() {
//           if arr[i % count] != c {
//             print(c)
//             return false
//           }
//         }
//         return true
//     }
// }

class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        var newstr = s + s
        newstr.removeLast()
        newstr.removeFirst()
        return newstr.contains(s) ? true : false
    }
}

print(Solution().repeatedSubstringPattern("abab"))

"abcabcabcabc"
"abcabcabcabcabcabcabcabc"
"bcabcabcabcabcabcabcab"

"abedsakdisls"

"abedsakdislsabedsakdisls"
"bedsakdislsabedsakdisl"

"abedsakdislsabedsakdisls"

"abedsakdislsabedsakdislsabedsakdislsabedsakdisls"
"bedsakdislsabedsakdislsabedsakdislsabedsakdisl"