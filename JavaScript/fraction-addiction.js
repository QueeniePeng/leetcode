// 592. Fraction Addition and Subtraction
// Medium
// 340
// 476
// Companies
// Given a string expression representing an expression of fraction addition and subtraction, return the calculation result in string format.

// The final result should be an irreducible fraction. If your final result is an integer, 
// change it to the format of a fraction that has a denominator 1. So in this case, 2 should be converted to 2/1.

 

// Example 1:

// Input: expression = "-1/2+1/2"
// Output: "0/1"
// Example 2:

// Input: expression = "-1/2+1/2+1/3"
// Output: "1/3"
// Example 3:

// Input: expression = "1/3-1/2"
// Output: "-1/6"
 

// Constraints:

// The input string only contains '0' to '9', '/', '+' and '-'. So does the output.
// Each fraction (input and output) has the format ±numerator/denominator. If the first input fraction or the output is positive, then '+' will be omitted.
// The input only contains valid irreducible fractions, where the numerator and denominator of each fraction will always be in the range [1, 10]. 
// If the denominator is 1, it means this fraction is actually an integer in a fraction format defined above.
// The number of given fractions will be in the range [1, 10].
// The numerator and denominator of the final result are guaranteed to be valid and in the range of 32-bit int.
// Accepted
// 31.6K
// Submissions
// 60.5K
// Acceptance Rate
// 52.2%
// Seen this question in a real interview before?
// 1/4

/**
 * @param {string} expression
 * @return {string}
 */

var fractionAddition = function(expression) {

  const op = new Set('/', '+', '-')
  var temp = ''

  var nums = []
  var ops = []

  for(let i = 0; i < expression.length; i++) {
    if (op.has(expression[i])) {
      nums.push((temp + expression[i]).parseInt())
      temp = ''
      ops.push(expression[i])
    } else {
      temp += expression[i]
    }
  }

  var newNums = []
  var newOps = []
  for(let i = 0; i < nums.length; i++) {
    if (ops[i] === '/') {
      i = i * 2 + 1
      newNums.push(math.fraction())
    }
  }
};

console.log(fractionAddition("1/3-1/2"))