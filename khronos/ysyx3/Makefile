BUILD_DIR = build
BUILD_MODEL = $(BUILD_DIR)/ysyx3

$(shell [ -d $(BUILD_DIR) ] || mkdir -p $(BUILD_DIR))

$(BUILD_MODEL).ll: ysyx3.mlir
	ksim $< -o $@ --out-header=$(BUILD_MODEL).h

$(BUILD_MODEL).o: $(BUILD_MODEL).ll
	opt -O3 --march=native -S $< | llc -O3 --filetype=obj --relocation-model=dynamic-no-pic -o $@

$(BUILD_MODEL): $(BUILD_MODEL).o $(BUILD_MODEL).h emu.cpp
	clang++ -std=c++2a -O3 -march=native -no-pie -Ibuild $< emu.cpp -o $@

build: $(BUILD_MODEL)