#include "ysyx3.h"

#include <format>
#include <fstream>
#include <iostream>
#include <memory>
#include <string>
#include <vector>

static std::vector<uint8_t> Program;

void loadMemory(std::string Path) {
  std::fstream fs(Path, std::ios::binary | std::ios::in | std::ios::ate);
  if (!fs.is_open())
    throw std::logic_error(std::format("Failed to open: {}\n", Path));

  std::cout << std::format("Using image: {}\n", Path);

  std::size_t Size = fs.tellg();
  fs.seekg(0, std::ios::beg);

  Program.resize(Size);
  if (!fs.read((char *)Program.data(), Size))
    throw std::logic_error("Failed to read");

  fs.close();
}

int main(int argc, char **argv) {
  auto end = std::atoi(argv[1]);
  auto img = std::string(argv[2]);

  loadMemory(img);

  //===--------------------------------------------------------------------===//
  // Model initialization and reset
  //===--------------------------------------------------------------------===//
  for (int i = 0; i < Program.size(); ++i) {
    io_initMemEn = true;
    io_initMemAddr = i;
    io_initMemData = Program[i];

    newtop();
  }

  for (int i = 0; i < 100; ++i) {
    reset = i < 10;
    newtop();
  }
  //===--------------------------------------------------------------------===//
  // Simulation loop
  //===--------------------------------------------------------------------===//
  std::size_t Counter{0};

  while (true) {
    newtop();

    if (io_uart_valid)
      printf("%c", io_uart_ch);

    if (Counter >= end)
      break;

    ++Counter;
  }

  return 0;
}