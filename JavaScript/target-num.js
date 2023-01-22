// Given a sorted array of distinct integers and a target value,
// return the index if the target is found. If not, return the index where it would be if it were inserted in order.

// You must write an algorithm with O(log n) runtime complexity.

// Input: nums = [1,3,5,6], target = 5
// Output: 2


searchInsert = (nums, target) => {
  for(let [i, j] = [0, nums.length - 1]; i <= j;) {
      if (nums[i] >= target) {
        return i;
      }
      if (nums[j] === target) {
        return j;
      }
      if ((j - i === 1) && nums[j] > target && nums[i] < target) {
        return j;
      }
      if (i === 0) {
        if (nums[j] < target) {
          return j + 1;
        }
        if (nums[i] > target) {
            return i;
        }
      }
      if (nums[i] > target) {
        return i + 1;
    }
    if (nums[j] < target) {
        return j + 1;
    }
      i++;
      j--;
  }
  return nums.length
};

const result = searchInsert([0, 3, 5, 7], 1)
console.log(result);