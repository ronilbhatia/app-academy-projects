function sum (...args) {
  let sum = 0;
  for (let i = 0; i < args.length; i++) {
    sum += args[i];
  }
  return sum;
}

Function.prototype.myBind = function (receiver, ...args) {
  return (...args2) => this.apply(receiver, args.concat(args2));
};

Function.prototype.myBindOld = function(receiver) {
  let args = Array.prototype.slice.call(arguments, 1);
  let that = this;
  return function() {
    let callArgs = Array.prototype.slice.call(arguments);
    that.apply(receiver, args.concat(callArgs));
  };
};

function curriedSum(numArgs) {
  let numbers = [];
  let _curriedSum = (arg) => {
    numbers.push(arg);
    if (numbers.length === numArgs) {
      let sum = numbers.reduce(function(acc, el) {
        return acc + el;
      });
      return sum;
    } else {
      return _curriedSum;
    }
  };
  return _curriedSum;
}

Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let _curriedSum = (arg) => {
    numbers.push(arg);
    if (numbers.length === numArgs) {
      return this.apply(null, numbers);
    } else {
      return _curriedSum;
    }
  };
  return _curriedSum;
};

// let summation = sum.curry(4);
