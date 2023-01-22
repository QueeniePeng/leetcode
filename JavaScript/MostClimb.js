
// You are given an integer array cost where cost[i] is the 
// cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

// You can either start from the step with index 0, or the step with index 1.

// Return the minimum cost to reach the top of the floor.


// Input: cost = [10,15,20]
// Output: 15
// Explanation: You will start at index 1.
// - Pay 15 and climb two steps to reach the top.
// The total cost is 15.


// Input: cost = [0,1,2,2]
// Output: 3


var minCostClimbingStairs = function(cost) {
  if (!cost || cost.length <= 1) { return 0; }
  if (cost.length === 2) { return Math.min(cost[0], cost[1]); }
  if (cost.length === 3) { return cost[1]; }
  
  var step = cost[0] < cost[1] ? 0 : 1;
  var total = cost[step];

  for (let i = step; i < cost.length; i++) {

      var tempA = 0;
      var tempB = 0;
      var tempC = 0;

      if (i + 1 < cost.length) {
          tempA += cost[i+1];
      } else {
          return total;
      }

      if (i + 2 < cost.length) {
          tempB += cost[i+2];
      } else {
          return total;
      }

      if (i + 3 === cost.length - 1) {
        tempC += cost[i+3];
        total += tempB;
        return total;
      }
      
      if (tempA < tempB) {
          total += tempA;
      } else {
          total += tempB;
          i += 1;
      }
  }
  return total;
};

const result = minCostClimbingStairs([0, 1, 2, 2]);
console.log(result);