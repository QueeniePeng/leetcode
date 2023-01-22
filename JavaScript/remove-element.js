
// Input: nums = [3,2,2,3], val = 3
// Output: 2, nums = [2,2,_,_]
// Explanation: Your function should return k = 2, with the first two elements of nums being 2.
// It does not matter what you leave beyond the returned k (hence they are underscores).

var removeElement = function(nums, val) {
    
  const numLength = nums.slice().length;
  
  nums = nums.filter(num => num !== val);
  console.log(numLength - nums.length);
  return [numLength - nums.length, nums]
};

// var removeElement = function(nums, val) {
//   for (let i = 0; i < nums.length; i++) {
//     if (nums[i] === val) {
//       nums.splice(i, 1);
//       console.log(nums);
//       i--;
//     }
//   }
//   return nums.length;
// };

const result = removeElement([3,2,2,3], 3);

console.log(result);