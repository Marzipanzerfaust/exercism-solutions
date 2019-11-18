//
// This is only a SKELETON file for the "Leap" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Year = function(input) {
  this.value = input
};

Year.prototype.isLeap = function() {
  return this.isDivisible(4) && !this.isDivisible(100) || this.isDivisible(400)
};

Year.prototype.isDivisible = function(x) {
  // Is the year's value divisible by x?
  return !(this.value % x)
}

module.exports = Year;