const range = (start, end) => {
  if (start === end) {
    return [start];
  }
  
  let rangeArr = [start];
  rangeArr = rangeArr.concat(range(start + 1, end));
  
  return rangeArr;
};

const sumRec = (arr) => {
  if (arr.length === 1) {
    return arr[0];
  }
  
  return arr[0] + sumRec(arr.slice(1, arr.length));
};

const exponent = (base, exp) => {
  if (exp === 1) {
    return base;
  }
  
  if (exp === 0) {
    return 1;
  }
  
  return ((base * exponent(base, exp - 1)));
};

const fibonacci = (n) => {
  if (n === 0 || n === 1) {
    return n;
  }
  
  return fibonacci(n-1) + fibonacci(n-2);
};

const deepDup = (arr) => {
  const deepDuped = [];
  
  arr.forEach(function(el) {
    if(Array.isArray(el)) {
      deepDuped.push(deepDup(el));
    } else {
      deepDuped.push(el);
    }
  });
  
  return deepDuped;
};

const bsearch = (arr, target) => {
  const mid = ~~(arr.length / 2);
  
  if (arr.length === 0) {
    return -1;
  }
  
  if (arr[mid] === target) {
    return mid;
  } else if (target < arr[mid]) {
    return bsearch(arr.slice(0, mid), target);
  } else {
    const searchResult = bsearch(arr.slice(mid + 1, arr.length), target);
    return ((searchResult === -1) ? -1 : searchResult + 1 + mid);
  }
};

const mergesort = (arr, callback) => {
  if (arr.length <= 1) {
    return arr;
  }
  const mid = ~~(arr.length / 2);
  const left = mergesort(arr.slice(0, mid), callback);
  const right = mergesort(arr.slice(mid, arr.length), callback);
  
  const merge = (left, right, callback) => {
    const mergedArr = [];
    while (left.length > 0 && right.length > 0) {
      if (callback(left[0], right[0]) === 1) {
        mergedArr.push(right.shift());
      } else {
        mergedArr.push(left.shift());
      }
    }
    return mergedArr.concat(left).concat(right);
  };
  return merge(left, right, callback);
};

const subsets = (arr) => {
  let subsets = [];
  for(let i = 0; i < arr.length; i++) {
    for (let j = i; j < arr.length; j++) {
      subsets.push(arr.slice(i, j+1));
    }
  }
  return subsets;
};











