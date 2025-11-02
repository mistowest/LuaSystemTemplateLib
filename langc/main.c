// main.c
#include <lua.h>
#include <lauxlib.h>

static int l_add(lua_State *L) {
    double a = luaL_checknumber(L, 1);
    double b = luaL_checknumber(L, 2);
    lua_pushnumber(L, a + b);
    return 1;
}

static const luaL_Reg mymath[] = {
    {"add", l_add},
    {NULL, NULL}
};

// luaopen_module
// O Nome interfere (module)
int luaopen_module(lua_State *L) {
    luaL_newlib(L, mymath);
    return 1;
}
