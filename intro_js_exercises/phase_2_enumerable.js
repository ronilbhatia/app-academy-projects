Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function(callback) {
  const mapped = [];
  
  for (let i = 0; i < this.length; i++) {
    mapped.push(callback(this[i]));
  }
  
  return mapped;
};

Array.prototype.myReduce = function(callback, accumulator) {
  let acc = (accumulator === undefined);
  if (acc) {
    accumulator = this[0];
  }
  
  for (let i = (acc ? 1 : 0); i < this.length; i++) {
    accumulator = callback(accumulator, this[i]);
  }
  
  return accumulator;
};

