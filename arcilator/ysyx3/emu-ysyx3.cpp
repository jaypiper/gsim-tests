#include "ysyx3.h"
#include <cassert>
#define MAX_PROGRAM_SIZE 0x8000000
uint8_t program[MAX_PROGRAM_SIZE];
int program_sz = 0;
newtop* cpu;

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
  cpu = new newtop();
  load_program("/nfs/home/chenlu/program/simulator/ready-to-run/bin/bbl-hello.bin");
  for (int i = 0; i < program_sz; i ++) {
    cpu->view.io_initMemEn = true;
    cpu->view.io_initMemAddr = i;
    cpu->view.io_initMemData = program[i];
    cpu_clock();
  }
  for (int i = 0; i < 10; i ++) {
    cpu->view.reset = true;
    cpu_clock();
  }
  cpu->view.reset = false;
  cpu_clock();
  size_t cycles = 0;
  while(1) {
    cpu_clock();
    if (cpu->view.io_uart_valid) {
      printf("%c", cpu->view.io_uart_ch);
    }
  }
  return 0;
}