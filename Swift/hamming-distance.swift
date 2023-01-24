// The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

// Given two integers x and y, return the Hamming distance between them.

 

// Example 1:

// Input: x = 1, y = 4
// Output: 2
// Explanation:
// 1   (0 0 0 1)
// 4   (0 1 0 0)
//        ↑   ↑
// The above arrows point to positions where the corresponding bits are different.
// Example 2:

// Input: x = 3, y = 1
// Output: 1
 

// Constraints:

// 0 <= x, y <= 231 - 1

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var result = 0
        var x = x
        var y = y
        
        while (x > 0 || y > 0) {
            result += (x % 2) ^ (y % 2)
            print(result)
            x >>= 1
            y >>= 1
        }
        return result
    }
}

print(Solution().hammingDistance(3, 1))