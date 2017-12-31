const square = num => Math.pow(num, 2);
const sqrtFromSumOfSquares = (a, b) => ( Math.sqrt( square(a) + square(b) ) );

const isInSet = (a, b, maxIterations) => {
  const DIVERGE_LIMIT = 2;
  let modulus,
      realPart = 0,
      iPart = 0;

  for(let index = 0; index < maxIterations; index++) {
    realPart += a;
    iPart += b;
    modulus = sqrtFromSumOfSquares(realPart, iPart);

    if(modulus >= DIVERGE_LIMIT) {
      return 'OUT';
    }

    realPart = square(realPart) - square(iPart);
    iPart = 2 * realPart * iPart;
  }
  return 'IN'
};

exports.isInSet = isInSet;
