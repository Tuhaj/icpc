const assert = require('assert');
const Mandelbrot = require('./mandelbrot.js');

describe('Mandelbrot', function() {
  describe('#isInSet(real1, real2, integer)', function() {
    it('should return in set for 0 0 100', function() {
      assert.equal(Mandelbrot.isInSet(0, 0, 100), 'IN');
    });
    it('should return out of set for 1.264 -1.109 10', function() {
      assert.equal(Mandelbrot.isInSet(1.264, -1.109, 10), 'OUT');
    });
    it('should return out of set for 1.264 -1.109 100', function() {
      assert.equal(Mandelbrot.isInSet(1.264, -1.109, 100), 'OUT');
    });
    it('should return in set for 0.124 0.369 200', function() {
      assert.equal(Mandelbrot.isInSet(0.124, 0.369, 200), 'IN');
    });
    it('should return out of set for -2.914 -1.783 200', function() {
      assert.equal(Mandelbrot.isInSet(-2.914, -1.783, 200), 'OUT');
    });
    it('should return in set for 1.264 -1.109 1', function() {
      assert.equal(Mandelbrot.isInSet(1.264, -1.109, 1), 'IN');
    });
  })
});

