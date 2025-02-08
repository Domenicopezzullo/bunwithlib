const std = @import("std");

pub export fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub export fn cos(a: f32) f32 {
    return @cos(a);
}

pub export fn subtract(a: i32, b: i32) i32 {
    return a - b;
}

pub export fn multiply(a: i32, b: i32) i32 {
    return a * b;
}

pub export fn divide(
    a: i32,
    b: i32,
) i32 {
    return @divExact(a, b);
}
