var assert = require('assert');
var Heliocentric = require('./heliocentric.js');

describe('Heliocentric', function() {
  describe('#findPlanetsSync(earthDay, marsDay)', function() {
    it('should 0 when planets are on the starting day', function() {
      assert.equal(Heliocentric.findPlanetsSync(0, 0), 0);
    });

    it('should 1 when planets are on the last day', function() {
      assert.equal(Heliocentric.findPlanetsSync(364, 686), 1);
    });

    it('should 5 when planets have 5 days to the starting point', function() {
      assert.equal(Heliocentric.findPlanetsSync(360, 682), 5);
    });

    it('should give correct result in case of 0, 1', function() {
      assert.equal(Heliocentric.findPlanetsSync(1, 0), 11679);
    });

    it('should take long time in case of 0, 1', function() {
      assert.equal(Heliocentric.findPlanetsSync(0, 1), 239075);
    });
  });
});
