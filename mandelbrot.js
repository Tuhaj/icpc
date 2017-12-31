const rootFromSumOfSquares = (a, b) => {
  return Math.sqrt((a * a) + (b * b));
};


const isInSet = (a, b, maxIterations) => {
  DIVERGE_LIMIT = 2;
  var modulus;
  var realPart = 0;
  var iPart = 0;

  for(var index = 0; index < maxIterations; index++) {
    realPart = realPart + a;
    iPart = iPart + b;
    modulus = rootFromSumOfSquares(realPart, iPart);
    if(modulus >= DIVERGE_LIMIT) {
      return 'OUT';
    }
    realPart = Math.pow(realPart, 2) - Math.pow(iPart, 2);
    iPart = 2 * realPart * iPart;
  }
  return 'IN'
};

exports.isInSet = isInSet;
