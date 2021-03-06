
const em = require('./lapack');

let saxpy = em.cwrap('f2c_saxpy',
    'number', // Function return void
    // Integers, Floating point numbers and pointers all
    // are considered 'number'
    ['number','number','number','number','number','number']
  );

let n = 3;

let pn = em._malloc(4);

let psa = em._malloc(4);

let psx = em._malloc(n*4);
let pincx = em._malloc(4);

let psy = em._malloc(n*4);
let pincy = em._malloc(4);

em.setValue(pn, n, 'i32');
em.setValue(psa, 20, 'float');
em.setValue(pincx, 1, 'i32');
em.setValue(pincy, 1, 'i32');

let sx = new Float32Array(em.HEAPF32.buffer, psx, n);
let sy = new Float32Array(em.HEAPF32.buffer, psy, n);

sx.set([2,4,6]);
sy.set([3,7,1]);

let result = saxpy(pn, psa, psx, pincx, psy, pincy);

console.log(sy);


