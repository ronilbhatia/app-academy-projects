Array.prototype.uniq = function() {
  let uniqArr = [];
  for (let i = 0; i < this.length; i++) {
    if (!uniqArr.includes(this[i])) {
      uniqArr.push(this[i]);
    }
  }
  return uniqArr;
};

Array.prototype.twoSum = function() {
  let pairs = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++ ) {
      if (this[i] + this[j] === 0) {
        pairs.push([i, j]);
      }
    }
  }
  return pairs;
};

Array.prototype.transpose = function() {
  let transposedArr = [];
  for (let i = 0; i < this[0].length; i++) {
    transposedArr.push([]);
    for (let j = 0; j < this.length; j++) {
      transposedArr[i].push(this[j][i]);
    }
  }
  return transposedArr;
};