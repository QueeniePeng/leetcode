// For two strings s and t, we say "t divides s" 
// if and only if s = t + ... + t (i.e., t is concatenated with itself one or more times).

// Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.


// Input: str1 = "ABCABC", str2 = "ABC"
// Output: "ABC"


var gcdOfStrings = function(str1, str2) {

  const s1 = {};
  const s2 = {};

  [...str1].forEach((c, i) => s1[c] ? s1[c].push(i) : s1[c] = [i]);
  [...str2].forEach((c, i) => s2[c] ? s2[c].push(i): s2[c] = [i]);
  console.log(s1);

  var answer = '';
  for(let i = 0; i < str2.length; i++) {
    const c = str2[i];
    if (s1.hasOwnProperty(c)) {
      for (let j = 0; j < s1[c].length; j++) {
        var m = j;
        var n = i;
        var temp = '';
        while (str1[m] === str2[n]) {
          if (m === str1.length) { break; }
          if (n === str2.length) { break; }
          temp += str1[m];
          m++;
          n++;
        }
        console.log(temp)
        if (answer.length < temp.length && temp.length > 1) {
            answer = temp.slice();
        }
        temp = ''
      }
    }
  }
  if (answer.substring(0, answer.length / 2) === answer.substring(answer.length / 2)) {
    return answer.slice().substring(0, answer.length / 2);
  }
  return answer;
};


const result = gcdOfStrings("ABABAB", 'AB')
console.log(result);