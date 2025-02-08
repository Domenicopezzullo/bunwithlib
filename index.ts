import {dlopen, FFIType, suffix} from "bun:ffi"
const { i32, f32 } = FFIType;


const path = `lib/libf.${suffix}`

const lib = dlopen(path, {
  cos: {
    args: [f32],
    returns: f32
  },
  add: {
    args: [i32, i32],
    returns: i32
  },
  subtract: {
    args: [i32, i32],
    returns: i32
  },
  multiply: {
    args: [i32, i32],
    returns: i32
  },
  divide: {
    args: [i32, i32],
    returns: i32
  }
})

console.log(lib.symbols.add(5, 10))
console.log(lib.symbols.subtract(5, 10))
console.log(lib.symbols.multiply(5, 10))
console.log(lib.symbols.divide(10, 5))
console.log(lib.symbols.cos(3))
