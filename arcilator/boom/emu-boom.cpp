#include "boom.h"
#include <cassert>
#define MAX_PROGRAM_SIZE 0x8000000
uint64_t program[MAX_PROGRAM_SIZE];
int program_sz = 0;
TestHarness* cpu;

void cpu_clock() {
  cpu->view.clock = false;
  cpu->eval();
  cpu->view.clock = true;
  cpu->eval();
}

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
  cpu = new TestHarness();
  load_program("/nfs/home/chenlu/program/simulator/ready-to-run/bin/coremark-rocket.bin");
  for (int i = 0; i < (program_sz + sizeof(uint64_t)) / sizeof(uint64_t) ; i ++) {
    cpu->view.initMem_en = true;
    cpu->view.initMem_addr = i;
    cpu->view.initMem_data = program[i];
    cpu_clock();
  }
  for (int i = 0; i < 10; i ++) {
    cpu->view.reset = true;
    cpu_clock();
  }
  cpu->view.reset = false;
  printf("start testing...\n");
  cpu_clock();
  size_t cycles = 0;
  while(1) {
    cpu_clock();
    if (cpu->view.uartIO_valid) {
      printf("%c", cpu->view.uartIO_ch);
    }
  }
  return 0;
}