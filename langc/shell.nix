{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gcc
    lua5_1
    zig
    luajit
    pkg-config
  ];
  
  shellHook = ''
    echo "Template Enviorment LuaJitSYSTEM"
    echo "Version: $(luajit -v)"
    echo ""
  '';
}
