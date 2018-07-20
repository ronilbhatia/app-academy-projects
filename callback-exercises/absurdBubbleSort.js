const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function absurdBubbleSort(arr, sortCompletionCallback) {
  function askIfGreaterThan(el1, el2, callback) {
    reader.question(`Is ${el1} greater than ${el2}? (enter 'yes' or 'no')`, function(answer) {
      if (answer === 'yes') {
        callback(true);
        // reader.close();
      } else {
        callback(false);
        // reader.close();
      }
    });
    reader.close();
  }
  
  let is_sorted = false;
  while (!is_sorted) {
    is_sorted = true;
    for (let i = 0; i < arr.length - 1; i++) {
      console.log(arr[i], i, arr);
      askIfGreaterThan(arr[i], arr[i+1], function(bool) {
        if (bool) {
          [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
          is_sorted = false;
        }
      });
    }
  }
}


absurdBubbleSort([1, 7, 2, 4, 3], function() {
  console.log('ello');
});

