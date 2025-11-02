.PHONY: build

build:
	gcc -shared -fPIC -o module.so main.c $$(pkg-config --cflags --libs luajit)


# Limpar
clean:
	rm -f module.so

# Build padrão (LuaJIT)
all: build
