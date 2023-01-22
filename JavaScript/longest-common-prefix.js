// 14. Longest Common Prefix
// Easy
// 12.1K
// 3.7K
// Companies
// Write a function to find the longest common prefix string amongst an array of strings.

// If there is no common prefix, return an empty string "".

 

// Example 1:

// Input: strs = ["flower","flow","flight"]
// Output: "fl"
// Example 2:

// Input: strs = ["dog","racecar","car"]
// Output: ""
// Explanation: There is no common prefix among the input strings.
 

// Constraints:

// 1 <= strs.length <= 200
// 0 <= strs[i].length <= 200
// strs[i] consists of only lowercase English letters.
// Accepted
// 2.1M
// Submissions
// 5.2M
// Acceptance Rate
// 40.8%
// Seen this question in a real interview before?
// 1/4
// Yes
// No

/**
 * @param {string[]} strs
 * @return {string}
 */
var longestCommonPrefix = function(strs) {
  if (strs.length === 0) { return '' }

  var answer = strs[0];
  var minLength = answer.length


  for (let i = 0; i < strs.length; i++) {
    if (minLength === 0) { return ''; }
    while (strs[i].slice(0, minLength) !== answer && minLength > 0) {
      minLength -= 1
      answer = answer.slice(0, minLength)
    }
  }
  return answer
};

console.log(longestCommonPrefix(['flo','flow', 'flo']))
