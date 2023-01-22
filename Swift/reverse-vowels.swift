// Given a string s, reverse only all the vowels in the string and return it.

// The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.

 

// Example 1:

// Input: s = "hello"
// Output: "holle"
// Example 2:

// Input: s = "leetcode"
// Output: "leotcede"
 

// Constraints:

// 1 <= s.length <= 3 * 105
// s consist of printable ASCII characters.



// class Solution {
//     func reverseVowels(_ s: String) -> String {
//         let vowelSet: Set<String> = ["a", "e", "i", "o", "u"]
//         var dict: [Int:Character] = [:]
//         var result: String = ""

//         for (i, c) in s.enumerated() {
//           if vowelSet.contains(String(c).lowercased()) {
//             if dict.isEmpty {
//               dict[i] = c
//               result += String(s.prefix(i + 1))
//                           print(dict)
//             } else {
//               let first = dict.first!
//               let middle = String(s.dropFirst(first.key + 1).dropLast(s.count - i))
//               result.removeLast()
//               result += String(c) + middle + String(first.value)
  
//               dict.removeAll()
//               dict[i] = first.value
//             }
//           }
//         }

//         if (result.count != s.count && !result.isEmpty) {
//           return result + s.dropFirst(dict.first!.key + 1)
//         }
//         return result.isEmpty ? s : result
//     }
// }


class Solution {
    func reverseVowels(_ s: String) -> String {
        let vowelSet: Set<String> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var p1 = 0
        var p2 = s.count - 1

        var chars = Array(s)
        while p1 < p2 {
          if (!vowelSet.contains(String(chars[p1]))) { p1 += 1; continue }
          if (!vowelSet.contains(String(chars[p2]))) { p2 -= 1; continue }

          chars.swapAt(p1, p2)
          p1 += 1
          p2 -= 1
        }
        return String(chars)
    }
}

print(Solution().reverseVowels("leetcode"))
print(Solution().reverseVowels("hello"))
print(Solution().reverseVowels("a."))
print(Solution().reverseVowels(" "))
print(Solution().reverseVowels("EO"))
print(Solution().reverseVowels("race car")) // expected race car?
// leotcede