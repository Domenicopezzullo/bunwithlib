.PHONY all: create regen-libs build

create:
	@rm -rf build
	@echo "Folder Cleaned!"
	@mkdir -p build/linux/lib build/macos/lib build/windows/lib

	@echo "Folder Created!"

regen-libs: lib/f.zig
	@zig build-lib lib/f.zig -dynamic -OReleaseFast -target x86_64-linux -femit-bin=build/linux/lib/libf.so
	@zig build-lib lib/f.zig -dynamic -OReleaseFast -target x86_64-macos -femit-bin=build/macos/lib/libf.dylib
	@zig build-lib lib/f.zig -dynamic -OReleaseFast -target x86_64-windows -femit-bin=build/windows/lib/libf.dll

build: index.ts
	bun build index.ts --target=bun-windows-x64 --compile --minify --bytecode --sourcemap --outfile build/windows/index
	bun build index.ts --target=bun-linux-x64 --compile --minify --bytecode --sourcemap --outfile build/linux/index
	bun build index.ts --target=bun-darwin-x64 --compile --minify --bytecode --sourcemap --outfile build/macos/index
