const std = @import("std");

const c = @cImport({
    @cInclude("lua.h");
    @cInclude("lauxlib.h");
});

// Função: add(a, b)
export fn l_add(L: ?*c.lua_State) c_int {
    const a = c.luaL_checknumber(L, 1);
    const b = c.luaL_checknumber(L, 2);
    c.lua_pushnumber(L, a + b);
    return 1;
}

// Função: subtract(a, b)
export fn l_subtract(L: ?*c.lua_State) c_int {
    const a = c.luaL_checknumber(L, 1);
    const b = c.luaL_checknumber(L, 2);
    c.lua_pushnumber(L, a - b);
    return 1;
}

// Função: multiply(a, b)
export fn l_multiply(L: ?*c.lua_State) c_int {
    const a = c.luaL_checknumber(L, 1);
    const b = c.luaL_checknumber(L, 2);
    c.lua_pushnumber(L, a * b);
    return 1;
}

// Função: divide(a, b)
export fn l_divide(L: ?*c.lua_State) c_int {
    const a = c.luaL_checknumber(L, 1);
    const b = c.luaL_checknumber(L, 2);
    if (b == 0) {
        _ = c.luaL_error(L, "division by zero");
        return 0;
    }
    c.lua_pushnumber(L, a / b);
    return 1;
}

// Função: power(base, exp)
export fn l_power(L: ?*c.lua_State) c_int {
    const base = c.luaL_checknumber(L, 1);
    const exp = c.luaL_checknumber(L, 2);
    const result = std.math.pow(f64, base, exp);
    c.lua_pushnumber(L, result);
    return 1;
}

// Função: sqrt(x)
export fn l_sqrt(L: ?*c.lua_State) c_int {
    const x = c.luaL_checknumber(L, 1);
    if (x < 0) {
        _ = c.luaL_error(L, "square root of negative number");
        return 0;
    }
    c.lua_pushnumber(L, @sqrt(x));
    return 1;
}

// Registro das funções
const funcs = [_]c.luaL_Reg{
    .{ .name = "add", .func = l_add },
    .{ .name = "subtract", .func = l_subtract },
    .{ .name = "multiply", .func = l_multiply },
    .{ .name = "divide", .func = l_divide },
    .{ .name = "power", .func = l_power },
    .{ .name = "sqrt", .func = l_sqrt },
    .{ .name = null, .func = null },
};

// Função de inicialização do módulo
export fn luaopen_zigmodule(L: ?*c.lua_State) c_int {
    // Criar nova tabela
    c.lua_createtable(L, 0, @intCast(funcs.len - 1));
    
    // Registrar funções na tabela
    c.luaL_setfuncs(L, &funcs, 0);
    
    return 1;
}
