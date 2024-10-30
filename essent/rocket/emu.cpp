#include <iostream>
#include <time.h>
#include <cstring>
#include <cassert>
#include <vector>
#include <numeric>
#include <algorithm>
#include <fstream>
#include "TestHarness.h"

#define MAX_PROGRAM_SIZE 0x8000000
uint8_t program[MAX_PROGRAM_SIZE];
int program_sz = 0;
TestHarness cpu;
size_t cycles = 0;
size_t activeSuper = 0;
size_t activeNum = 0;

void load_program(char* filename){

  memset(&program, 0, sizeof(program));
  if(!filename){
    printf("No input program\n");
    return;
  }

  FILE* fp = fopen(filename, "rb");
  assert(fp);

  fseek(fp, 0, SEEK_END);
  program_sz = ftell(fp);
  assert(program_sz < MAX_PROGRAM_SIZE);

  fseek(fp, 0, SEEK_SET);
  int ret = fread(program, program_sz, 1, fp);
  assert(ret == 1);
  printf("load program size: 0x%x\n", program_sz);
  return;
}

int main(int argc, char** argv) {
  load_program(argv[1]);
  
  std::vector<uint8_t*> memoryList = { \
      (uint8_t*)&cpu.mem.srams.mem_0, (uint8_t*)&cpu.mem.srams.mem_1, \
      (uint8_t*)&cpu.mem.srams.mem_2, (uint8_t*)&cpu.mem.srams.mem_3, \
      (uint8_t*)&cpu.mem.srams.mem_4, (uint8_t*)&cpu.mem.srams.mem_5, \
      (uint8_t*)&cpu.mem.srams.mem_6, (uint8_t*)&cpu.mem.srams.mem_7 };
  for (size_t i = 0; i < program_sz; i ++) {
    *memoryList[i % 8] = program[i];
    memoryList[i % 8] ++;
  }

  cpu.reset = UInt<1>(1);
  cpu.eval(false, false, false);
  for (int i = 0; i < 5; i++) {
    cpu.eval(true, false, false);
    cpu.reset = UInt<1>(0);
    cpu.eval(false, false, false);
  }

  std::cout << "start testing.....\n";

  bool dut_end = false;
  uint64_t cycles = 0;
  clock_t start = clock();
  clock_t prevTime = start;
  size_t max_cycles = 70000000;
  while(cycles <= max_cycles) {
    cycles ++;
    cpu.eval(true, true, true);
    if (cycles % 10000000 == 0 || cycles == max_cycles) {
      clock_t now = clock();
      clock_t dur = now - start;
      printf("cycles %ld (%ld ms, %ld per sec / current %ld ) \n", cycles, dur * 1000 / CLOCKS_PER_SEC, cycles * CLOCKS_PER_SEC / dur, 10000000 * CLOCKS_PER_SEC / (now - prevTime));
      prevTime = now;
    }

  }
}