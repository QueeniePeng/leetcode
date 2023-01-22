// You have n dice, and each die has k faces numbered from 1 to k.

// Given three integers n, k, and target, return the number of possible ways
// (out of the kn total ways) to roll the dice, so the sum of the face-up numbers equals target.
// Since the answer may be too large, return it modulo 109 + 7.


// Input: n = 1, k = 6, target = 3
// Output: 1
// Explanation: You throw one die with 6 faces.
// There is only one way to get a sum of 3.


// Input: n = 2, k = 6, target = 7
// Output: 6
// Explanation: You throw two dice, each with 6 faces.
// There are 6 ways to get a sum of 7: 1+6, 2+5, 3+4, 4+3, 5+2, 6+1.


numRollsToTarget = (n, k, target) => {

	let dp = [];
	dp[0] = [0];
	for (let i = 1; i <= k; i++) {
		dp[0][i] = 1;
	}
  console.log(dp)
	for (let i = 1; i < n; i++) {
		dp[i] = [];
		for (let j = i; j <= (i + 1) * k && j <= target; j++) {

			dp[i][j] = 0;
			for(let m = j - k; m < j; m++) {
								
				dp[i][j] = ((dp[i][j] + (dp[i - 1][m] || 0))) % 1000000007;
			}
		}
	}
	return dp[n-1][target] || 0;
};

let an = numRollsToTarget(2, 6, 7);
console.log(an);