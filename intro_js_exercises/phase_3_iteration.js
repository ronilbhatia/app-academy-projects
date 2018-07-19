Array.prototype.bubbleSort = function(callback) {
  const sortedArray = this.slice();
  let isSorted = false;
  
  while (!isSorted) {
    isSorted = true;
    for (let i = 0; i < sortedArray.length-1; i++) {
      if (callback(sortedArray[i], sortedArray[i + 1]) === 1) {
        const temp = sortedArray[i];
        sortedArray[i] = sortedArray[i + 1];
        sortedArray[i + 1] = temp;
        isSorted = false;
      }
    }
  }
  return sortedArray;
};

String.prototype.substrings = function() {
  let substrings = [];
  for(let i = 0; i < this.length; i++) {
    for (let j = i; j < this.length; j++) {
      substrings.push(this.slice(i, j+1));
    }
  }
  return substrings;
};