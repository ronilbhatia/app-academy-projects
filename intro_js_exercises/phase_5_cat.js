function Cat(owner, name) {
  this.owner = owner;
  this.name = name;
}

Cat.prototype.cuteStatement = function() {
  return `${this.owner} loves ${this.name}`;
};

let cat1 = new Cat('Amanda', 'tortured cat');
let cat2 = new Cat('Dustin', 'blessed cat');
let cat3 = new Cat('Amanda', 'fat cat');
let cat4 = new Cat('Amanda', 'sad cat');

console.log(cat1.cuteStatement());

Cat.prototype.cuteStatement = function() {
  return `Everyone loves ${this.name}`;
};

console.log(cat1.cuteStatement());

Cat.prototype.meow = function() {
  return 'meow';
};

cat1.meow = function() {
  return 'Amanda tortures me';
};

console.log(cat1.meow());

