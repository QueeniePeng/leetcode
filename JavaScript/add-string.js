
// Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

// You must solve the problem without using any built-in library for handling large integers (such as BigInteger).
// You must also not convert the inputs to integers directly.

// Example 1:

// Input: num1 = "11", num2 = "123"
// Output: "134"
// Example 2:

// Input: num1 = "456", num2 = "77"
// Output: "533"
// Example 3:

// Input: num1 = "0", num2 = "0"
// Output: "0"
 

// Constraints:

// 1 <= num1.length, num2.length <= 104
// num1 and num2 consist of only digits.
// num1 and num2 don't have any leading zeros except for the zero itself.

/**
 * @param {string} num1
 * @param {string} num2
 * @return {string}
 */
var addStrings = function(num1, num2) {
  
  var result = '';
  var extra = 0;
  
  const lengthA = num1.length;
  const lengthB = num2.length;
  const gap = Math.abs(lengthA - lengthB);

  const length = lengthA > lengthB ? lengthA : lengthB;
  const numL = lengthA > lengthB ? num1 : num2;
  const numS = num1 === numL ? num2 : num1;

  for (let a = length - 1; a >= 0; a--) {
      const numA = parseInt(numL[a]) || 0;
      const numB = parseInt(numS[a - gap]) || 0;

      result = (((numA + numB + extra) % 10)).toString() + result;
      extra = (numA + numB + extra) >= 10 ? 1 : 0;
  }

  if (gap === 0 && extra > 0) {
    return `1${result}`;
  }
  return result;
};

console.log(addStrings('18', '584'))
console.log(addStrings('11', '123'))