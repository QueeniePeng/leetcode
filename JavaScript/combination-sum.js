// Given an array of distinct integers candidates and a target integer target, 
// return a list of all unique combinations of candidates where the chosen numbers sum to target.
// You may return the combinations in any order.

// The same number may be chosen from candidates an unlimited number of times.
// Two combinations are unique if the frequency of at least one of the chosen numbers is different.

// The test cases are generated such that the number of unique combinations that sum up
// to target is less than 150 combinations for the given input.

// Input: candidates = [2,3,6,7], target = 7
// Output: [[2,2,3],[7]]
// Explanation:
// 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
// 7 is a candidate, and 7 = 7.
// These are the only two combinations.

var combinationSum = function(candidates, target) {
    candidates.sort((a, b) => a - b);

    const length = candidates.length;
    var result = [];
    search(0, [], target);

    function search(index, sum, target) {
      if (target === 0) { result.push(sum.slice()) };
      if (index === length) { return; }
      if (target <= 0) { return; }

      sum.push(candidates[index]);
      search(index, sum, target - candidates[index]);
      sum.pop();
      search(index + 1, sum, target);
    }
    return result;
};








// function combinationSum(candidates, target) {
//   candidates.sort((a, b) => a - b);

//   var length = candidates.length;
//   var res = [];
//   search(0, [], target);
//   return res;

//   function search(idx, prefix, target) {
//     if (target === 0) res.push(prefix.slice());
//     if (idx === length) return;
//     if (target <= 0) return;

//     prefix.push(candidates[idx]);
//     search(idx, prefix, target - candidates[idx]);
//     prefix.pop();
//     search(idx + 1, prefix, target);
//   }
// };

const result = combinationSum([2,3,6,7], 7)
console.log(result);