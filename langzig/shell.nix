{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    zig
    luajit
    pkg-config
  ];
  
  shellHook = ''
    echo "=== Zig + Lua Module Environment ==="
    echo "Zig:    $(zig version)"
    echo "LuaJIT: $(luajit -v)"
    echo ""
    echo "Commands:"
    echo "  zig build        - Build module"
    echo "  zig build test   - Build and test"
    echo ""
    
    export LUA_CPATH="./zig-out/lib/?.so;./zig-out/lib/lib?.so;;"
  '';
}
