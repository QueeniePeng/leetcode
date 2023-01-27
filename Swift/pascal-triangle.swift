// Given an integer numRows, return the first numRows of Pascal's triangle.

// In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:


 

// Example 1:

// Input: numRows = 5
// Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
// Example 2:

// Input: numRows = 1
// Output: [[1]]
 

// Constraints:

// 1 <= numRows <= 30

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var ans: [[Int]] = []
        for i in 0..<numRows {
            if i < 2 {
                ans.append(Array(repeating: 1, count: i + 1))
            } else {
                var arr = ans[i-1]
                var j = 0
                var newArr = [1]
                while j < arr.count - 1 {
                    newArr.append(arr[j] + arr[j+1])
                    j += 1
                }
                newArr.append(1)
                ans.append(newArr)
            }
        }
        return ans
    }
}