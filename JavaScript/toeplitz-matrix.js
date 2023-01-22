// 766. Toeplitz Matrix
// Easy
// 3.2K
// 152
// Companies
// Given an m x n matrix, return true if the matrix is Toeplitz. Otherwise, return false.

// A matrix is Toeplitz if every diagonal from top-left to bottom-right has the same elements.

 

// Example 1:


// Input: matrix = [[1,2,3,4],[5,1,2,3],[9,5,1,2]]
// Output: true
// Explanation:
// In the above grid, the diagonals are:
// "[9]", "[5, 5]", "[1, 1, 1]", "[2, 2, 2]", "[3, 3]", "[4]".
// In each diagonal all elements are the same, so the answer is True.
// Example 2:


// Input: matrix = [[1,2],[2,2]]
// Output: false
// Explanation:
// The diagonal "[1, 2]" has different elements.
 

// Constraints:

// m == matrix.length
// n == matrix[i].length
// 1 <= m, n <= 20
// 0 <= matrix[i][j] <= 99
 

// Follow up:

// What if the matrix is stored on disk, and the memory is limited such that you can only load at most one row of the matrix into the memory at once?
// What if the matrix is so large that you can only load up a partial row into the memory at once?
// Accepted
// 268.3K
// Submissions
// 390.2K
// Acceptance Rate
// 68.8%
// Seen this question in a real interview before?
// 1/4
// Yes
// No

/**
 * @param {number[][]} matrix
 * @return {boolean}
 */


// [0][0]
// [1][1]
// [2][2]

// [0][1]
// [1][2]
// [2][3]

// [0][2]
// [1][3]

// [0][3]

// [1][1]
// [2][2]

// [2][1]

var isToeplitzMatrix = function(matrix) {

    for(let y = 0; y < matrix.length; y++) {
      for (let x = 0; x < matrix[y].length; x++) {
        const num = matrix[y][x];
        var nextX = x + 1;
        var nextY = y + 1;
        while (nextX < matrix[y].length && nextY < matrix.length) {
          if (matrix[nextY][nextX] !== num) {
            return false;
          }
          console.log(`[${nextY}, ${nextX}]`)
          nextX++;
          nextY++;
        }
      }
    }
    return true;
};

console.log(isToeplitzMatrix([[1,2,3,4],[5,1,2,3],[9,5,1,2]]))
console.log(isToeplitzMatrix([[36,59,71,15,26,82,87],[56,36,59,71,15,26,82],[15,0,36,59,71,15,26]]))