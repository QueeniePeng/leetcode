// Halfling Woolly Proudhoof is an eminent sheep herder. He wants to build a pen (enclosure) for his new flock of sheep. The pen will be rectangular and built from exactly four pieces of fence (so, the pieces of fence forming the opposite sides of the pen must be of equal length). Woolly can choose these pieces out of N pieces of fence that are stored in his barn. To hold the entire flock, the area of the pen must be greater than or equal to a given threshold X.

// Woolly is interested in the number of different ways in which he can build a pen. Pens are considered different if the sets of lengths of their sides are different. For example, a pen of size 1×4 is different from a pen of size 2×2 (although both have an area of 4), but pens of sizes 1×2 and 2×1 are considered the same.

// Write a function:

// class Solution { public int solution(int[] A, int X); }
// that, given an array A of N integers (containing the lengths of the available pieces of fence) and an integer X, returns the number of different ways of building a rectangular pen satisfying the above conditions. The function should return −1 if the result exceeds 1,000,000,000.

// For example, given X = 5 and the following array A:

//   A[0] = 1
//   A[1] = 2
//   A[2] = 5
//   A[3] = 1
//   A[4] = 1
//   A[5] = 2
//   A[6] = 3
//   A[7] = 5
//   A[8] = 1


// the function should return 2. The figure above shows available pieces of fence (on the left) and possible to build pens (on the right). The pens are of sizes 1x5 and 2x5. Pens of sizes 1×1 and 1×2 can be built, but are too small in area. It is not possible to build pens of sizes 2×3 or 3×5, as there is only one piece of fence of length 3.

// Write an efficient algorithm for the following assumptions:

// N is an integer within the range [0..100,000];
// X is an integer within the range [1..1,000,000,000];
// each element of array A is an integer within the range [1..1,000,000,000].

const solution = (A, X) => {
  var aDict = {};
  var aSet = new Set();
  var result = 0;
  for(let a of A) {
    if (aDict.hasOwnProperty(a)) {
      aDict[a] += 1;
      aSet.add(a);
      if (aDict[a] === 4 && (a * a >= X)) {
        console.log(`${a} * ${a}`)
        console.log('true')
        result += 1;
      }
    } else {
      aDict[a] = 1;
    }
  }
  const aArray = Array.from(aSet).sort();
  var iIndex = 0;
  var jIndex = 0;

  for(let i = 0; i < aArray.length - 1; i++) {
    if (iIndex > 0 || jIndex > 0) {
      break;
    }
    for (let j = i + 1; j < aArray.length; j++) {
      console.log(`${aArray[i]} * ${aArray[j]}`)
      if (aArray[i] * aArray[j] >= X) {
        iIndex = i;
        jIndex = j;
        console.log(`${i}, ${j}`);
        console.log('true')
        // result += 1;
        break;
      }
    }
  }
  result += aArray.length - 1 - jIndex;
  while (iIndex + 1 < aArray.length - 1) {
    const count = aArray.length - 1 - iIndex
    result += count * (count - 1)
    console.log(`${count} ** ${count - 1}`)
    console.log('yes')
    iIndex += 1;
  }

  console.log(aDict);
  console.log(aSet);
  console.log(result);
  return result;
}

// const A = [1, 2, 5, 1, 1, 2, 3, 5, 1, 6, 6, 7, 8, 8, 8, 8];
const A = [1, 2, 5, 1, 1, 2, 3, 5, 1];

solution(A, 5);
