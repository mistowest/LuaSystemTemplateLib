extern "C" {
#include <lauxlib.h>
#include <lua.h>
#include <lualib.h>
}

#include <string>

int l_greet(lua_State *L) {
  const char *name = luaL_checkstring(L, 1);
  std::string greeting = "Olá, ";
  greeting += name;
  greeting += "! (vindo do C++)";

  lua_pushstring(L, greeting.c_str());
  return 1;
}

extern "C" int luaopen_mylib(lua_State *L) {
  static const luaL_Reg mylib[] = {{"greet", l_greet}, {NULL, NULL}};

  luaL_register(L, "mylib", mylib);
  return 1;
}
