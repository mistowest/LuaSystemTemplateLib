#!/usr/bin/env luajit

-- Adicionar caminho do zig-out
--package.cpath = "./zig-out/lib/?.so;./zig-out/lib/lib?.so;" .. package.cpath

-- Carregar módulo Zig
local zigmodule = require("zigmodule")

print("=== Testing Zig Lua Module ===\n")

-- Testar add
print("add(5, 3) =", zigmodule.add(5, 3))
print("add(10.5, 2.3) =", zigmodule.add(10.5, 2.3))

-- Testar subtract
print("\nsubtract(10, 3) =", zigmodule.subtract(10, 3))
print("subtract(5.5, 2.2) =", zigmodule.subtract(5.5, 2.2))

-- Testar multiply
print("\nmultiply(4, 7) =", zigmodule.multiply(4, 7))
print("multiply(3.5, 2) =", zigmodule.multiply(3.5, 2))

-- Testar divide
print("\ndivide(20, 4) =", zigmodule.divide(20, 4))
print("divide(7, 2) =", zigmodule.divide(7, 2))

-- Testar power
print("\npower(2, 10) =", zigmodule.power(2, 10))
print("power(3, 3) =", zigmodule.power(3, 3))

-- Testar sqrt
print("\nsqrt(16) =", zigmodule.sqrt(16))
print("sqrt(2) =", zigmodule.sqrt(2))

print("\n✓ All tests passed!")
