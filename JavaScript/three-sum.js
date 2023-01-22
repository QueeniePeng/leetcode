// 15. 3Sum
// Medium
// 23.5K
// 2.1K
// Companies
// Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] 
// such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

// Notice that the solution set must not contain duplicate triplets.

 

// Example 1:

// Input: nums = [-1,0,1,2,-1,-4]
// Output: [[-1,-1,2],[-1,0,1]]
// Explanation: 
// nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
// nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
// nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
// The distinct triplets are [-1,0,1] and [-1,-1,2].
// Notice that the order of the output and the order of the triplets does not matter.
// Example 2:

// Input: nums = [0,1,1]
// Output: []
// Explanation: The only possible triplet does not sum up to 0.
// Example 3:

// Input: nums = [0,0,0]
// Output: [[0,0,0]]
// Explanation: The only possible triplet sums up to 0.
 

// Constraints:

// 3 <= nums.length <= 3000
// -105 <= nums[i] <= 105
// Accepted
// 2.5M
// Submissions
// 7.6M
// Acceptance Rate
// 32.4%
// Seen this question in a real interview before?
// 1/4

/**
 * @param {number[]} nums
 * @return {number[][]}
 */
// var threeSum = function(nums) {
//   var result = []

//   for(let i = 0; i < nums.length; i++) {
//     const a = nums[i];
//     for(let [j, k] = [i + 1, nums.length - 1]; j < k;) {
//       const b = nums[j];
//       const c = nums[k];
//       if ((a + b + c) === 0) {

//         var isDuplicated = false
//         for (r of result) {
//           if ([a, b, c].every(n => r.includes(n))) {
//             isDuplicated = true;
//             break;
//           }
//         }
//         !isDuplicated && result.push([a, b, c]);
//       }
//       j++;
//       k--;
//     }
//   }
//   return result
// };

var threeSum = function(nums) {
  var result = []

  for(let i = 0; i < nums.length; i++) {
    const a = nums[i];
    for(let [j, k] = [i + 1, nums.length - 1]; j < k;) {
      const b = nums[j];
      const c = nums[k];
      if ((a + b + c) === 0) {
        var isDuplicated = false
        const arr = [a, b, c].sort()

        for (r of result) {
          if (compareArr(r, arr)) {
            isDuplicated = true;
            break;
          }
        }
        !isDuplicated && result.push(arr);
      }
      j++;
      k--;
    }
  }
  return result
};

compareArr = (a1, a2) => {
  for(let i = 0; i < a1.length; i++) {
    if (a1[i] !== a2[i]) { return false; }
  }
  return true;
}

console.log(threeSum([-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0]))
// [[-5,1,4],[-4,0,4],[-4,1,3],[-2,-2,4],[-2,1,1],[0,0,0]]