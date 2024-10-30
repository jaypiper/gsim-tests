module {
  sv.verbatim "// Standard header to adapt well known macros to our needs."
  sv.ifdef  "RANDOMIZE" {
  } else {
    sv.ifdef  "RANDOMIZE_REG_INIT" {
      sv.verbatim "`define RANDOMIZE"
    }
  }
  sv.ifdef  "RANDOMIZE" {
  } else {
    sv.ifdef  "RANDOMIZE_MEM_INIT" {
      sv.verbatim "`define RANDOMIZE"
    }
  }
  sv.verbatim "\0A// RANDOM may be set to an expression that produces a 32-bit random unsigned value."
  sv.ifdef  "RANDOM" {
  } else {
    sv.verbatim "`define RANDOM $random"
  }
  sv.verbatim "\0A// Users can define 'PRINTF_COND' to add an extra gate to prints."
  sv.ifdef  "PRINTF_COND_" {
  } else {
    sv.ifdef  "PRINTF_COND" {
      sv.verbatim "`define PRINTF_COND_ (`PRINTF_COND)"
    } else {
      sv.verbatim "`define PRINTF_COND_ 1"
    }
  }
  sv.verbatim "\0A// Users can define INIT_RANDOM as general code that gets injected into the\0A// initializer block for modules with registers."
  sv.ifdef  "INIT_RANDOM" {
  } else {
    sv.verbatim "`define INIT_RANDOM"
  }
  sv.verbatim "\0A// If using random initialization, you can also define RANDOMIZE_DELAY to\0A// customize the delay used, otherwise 0.002 is used."
  sv.ifdef  "RANDOMIZE_DELAY" {
  } else {
    sv.verbatim "`define RANDOMIZE_DELAY 0.002"
  }
  sv.verbatim "\0A// Define INIT_RANDOM_PROLOG_ for use in our modules below."
  sv.ifdef  "INIT_RANDOM_PROLOG_" {
  } else {
    sv.ifdef  "RANDOMIZE" {
      sv.ifdef  "VERILATOR" {
        sv.verbatim "`define INIT_RANDOM_PROLOG_ `INIT_RANDOM"
      } else {
        sv.verbatim "`define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end"
      }
    } else {
      sv.verbatim "`define INIT_RANDOM_PROLOG_"
    }
  }
  sv.verbatim ""
  hw.generator.schema @FIRRTLMem, "FIRRTL_Memory", ["depth", "numReadPorts", "numWritePorts", "numReadWritePorts", "readLatency", "writeLatency", "width", "maskGran", "readUnderWrite", "writeUnderWrite", "writeClockIDs", "initFilename", "initIsBinary", "initIsInline"]
  hw.module.generated @ram_combMem, @FIRRTLMem(%R0_addr: i6, %R0_en: i1, %R0_clk: i1, %R1_addr: i6, %R1_en: i1, %R1_clk: i1, %W0_addr: i6, %W0_en: i1, %W0_clk: i1, %W0_data: i128) -> (R0_data: i128, R1_data: i128) attributes {depth = 64 : i64, initFilename = "", initIsBinary = false, initIsInline = false, maskGran = 128 : ui32, numReadPorts = 2 : ui32, numReadWritePorts = 0 : ui32, numWritePorts = 1 : ui32, readLatency = 0 : ui32, readUnderWrite = 0 : i32, width = 128 : ui32, writeClockIDs = [0 : i32], writeLatency = 1 : ui32, writeUnderWrite = 1 : i32}
  hw.module.generated @disk_combMem, @FIRRTLMem(%R0_addr: i26, %R0_en: i1, %R0_clk: i1, %R1_addr: i26, %R1_en: i1, %R1_clk: i1, %R2_addr: i26, %R2_en: i1, %R2_clk: i1, %R3_addr: i26, %R3_en: i1, %R3_clk: i1, %R4_addr: i26, %R4_en: i1, %R4_clk: i1, %R5_addr: i26, %R5_en: i1, %R5_clk: i1, %R6_addr: i26, %R6_en: i1, %R6_clk: i1, %R7_addr: i26, %R7_en: i1, %R7_clk: i1, %W0_addr: i26, %W0_en: i1, %W0_clk: i1, %W0_data: i8, %W1_addr: i26, %W1_en: i1, %W1_clk: i1, %W1_data: i8, %W2_addr: i26, %W2_en: i1, %W2_clk: i1, %W2_data: i8, %W3_addr: i26, %W3_en: i1, %W3_clk: i1, %W3_data: i8, %W4_addr: i26, %W4_en: i1, %W4_clk: i1, %W4_data: i8, %W5_addr: i26, %W5_en: i1, %W5_clk: i1, %W5_data: i8, %W6_addr: i26, %W6_en: i1, %W6_clk: i1, %W6_data: i8, %W7_addr: i26, %W7_en: i1, %W7_clk: i1, %W7_data: i8) -> (R0_data: i8, R1_data: i8, R2_data: i8, R3_data: i8, R4_data: i8, R5_data: i8, R6_data: i8, R7_data: i8) attributes {depth = 67108864 : i64, initFilename = "", initIsBinary = false, initIsInline = false, maskGran = 8 : ui32, numReadPorts = 8 : ui32, numReadWritePorts = 0 : ui32, numWritePorts = 8 : ui32, readLatency = 0 : ui32, readUnderWrite = 0 : i32, width = 8 : ui32, writeClockIDs = [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32], writeLatency = 1 : ui32, writeUnderWrite = 1 : i32}
  hw.module.generated @ram_combMem_0, @FIRRTLMem(%R0_addr: i28, %R0_en: i1, %R0_clk: i1, %R1_addr: i28, %R1_en: i1, %R1_clk: i1, %R2_addr: i28, %R2_en: i1, %R2_clk: i1, %R3_addr: i28, %R3_en: i1, %R3_clk: i1, %R4_addr: i28, %R4_en: i1, %R4_clk: i1, %R5_addr: i28, %R5_en: i1, %R5_clk: i1, %R6_addr: i28, %R6_en: i1, %R6_clk: i1, %R7_addr: i28, %R7_en: i1, %R7_clk: i1, %R8_addr: i28, %R8_en: i1, %R8_clk: i1, %R9_addr: i28, %R9_en: i1, %R9_clk: i1, %R10_addr: i28, %R10_en: i1, %R10_clk: i1, %R11_addr: i28, %R11_en: i1, %R11_clk: i1, %R12_addr: i28, %R12_en: i1, %R12_clk: i1, %R13_addr: i28, %R13_en: i1, %R13_clk: i1, %R14_addr: i28, %R14_en: i1, %R14_clk: i1, %R15_addr: i28, %R15_en: i1, %R15_clk: i1, %W0_addr: i28, %W0_en: i1, %W0_clk: i1, %W0_data: i8, %W1_addr: i28, %W1_en: i1, %W1_clk: i1, %W1_data: i8, %W2_addr: i28, %W2_en: i1, %W2_clk: i1, %W2_data: i8, %W3_addr: i28, %W3_en: i1, %W3_clk: i1, %W3_data: i8, %W4_addr: i28, %W4_en: i1, %W4_clk: i1, %W4_data: i8, %W5_addr: i28, %W5_en: i1, %W5_clk: i1, %W5_data: i8, %W6_addr: i28, %W6_en: i1, %W6_clk: i1, %W6_data: i8, %W7_addr: i28, %W7_en: i1, %W7_clk: i1, %W7_data: i8, %W8_addr: i28, %W8_en: i1, %W8_clk: i1, %W8_data: i8) -> (R0_data: i8, R1_data: i8, R2_data: i8, R3_data: i8, R4_data: i8, R5_data: i8, R6_data: i8, R7_data: i8, R8_data: i8, R9_data: i8, R10_data: i8, R11_data: i8, R12_data: i8, R13_data: i8, R14_data: i8, R15_data: i8) attributes {depth = 268435456 : i64, initFilename = "", initIsBinary = false, initIsInline = false, maskGran = 8 : ui32, numReadPorts = 16 : ui32, numReadWritePorts = 0 : ui32, numWritePorts = 9 : ui32, readLatency = 0 : ui32, readUnderWrite = 0 : i32, width = 8 : ui32, writeClockIDs = [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32], writeLatency = 1 : ui32, writeUnderWrite = 1 : i32}
  hw.module private @Fetch(%clock: i1, %reset: i1, %io_instRead_inst: i64, %io_instRead_rvalid: i1, %io_va2pa_paddr: i32, %io_va2pa_pvalid: i1, %io_va2pa_tlb_excep_cause: i64, %io_va2pa_tlb_excep_tval: i64, %io_va2pa_tlb_excep_en: i1, %io_reg2if_seq_pc: i64, %io_reg2if_valid: i1, %io_wb2if_seq_pc: i64, %io_wb2if_valid: i1, %io_recov: i1, %io_intr_in_en: i1, %io_intr_in_cause: i64, %io_branchFail_seq_pc: i64, %io_branchFail_valid: i1, %io_if2id_drop: i1, %io_if2id_stall: i1, %io_if2id_ready: i1) -> (io_instRead_addr: i32, io_instRead_arvalid: i1, io_va2pa_vaddr: i64, io_va2pa_vvalid: i1, io_if2id_inst: i32, io_if2id_pc: i64, io_if2id_excep_cause: i64, io_if2id_excep_tval: i64, io_if2id_excep_en: i1, io_if2id_excep_pc: i64, io_if2id_excep_etype: i2, io_if2id_recov: i1, io_if2id_valid: i1) {
    %c0_i64 = hw.constant 0 : i64
    %true = hw.constant true
    %c8_i64 = hw.constant 8 : i64
    %false = hw.constant false
    %c0_i61 = hw.constant 0 : i61
    %c2_i64 = hw.constant 2 : i64
    %c0_i16 = hw.constant 0 : i16
    %c5_i64 = hw.constant 5 : i64
    %c12_i64 = hw.constant 12 : i64
    %c6_i64 = hw.constant 6 : i64
    %c0_i122 = hw.constant 0 : i122
    %c2147483648_i64 = hw.constant 2147483648 : i64
    %c0_i128 = hw.constant 0 : i128
    %c-1_i2 = hw.constant -1 : i2
    %c0_i3 = hw.constant 0 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c1_i2 = hw.constant 1 : i2
    %c0_i32 = hw.constant 0 : i32
    %c2_i3 = hw.constant 2 : i3
    %c0_i2 = hw.constant 0 : i2
    %pc = seq.firreg %27 clock %clock reset sync %reset, %c2147483648_i64 {firrtl.random_init_start = 0 : ui64} : i64
    %drop1_r = seq.firreg %30 clock %clock reset sync %reset, %false {firrtl.random_init_start = 64 : ui64} : i1
    %drop2_r = seq.firreg %59 clock %clock reset sync %reset, %false {firrtl.random_init_start = 65 : ui64} : i1
    %drop3_r = seq.firreg %235 clock %clock reset sync %reset, %false {firrtl.random_init_start = 66 : ui64} : i1
    %stall1_r = seq.firreg %30 clock %clock reset sync %reset, %false {firrtl.random_init_start = 67 : ui64} : i1
    %stall2_r = seq.firreg %59 clock %clock reset sync %reset, %false {firrtl.random_init_start = 68 : ui64} : i1
    %stall3_r = seq.firreg %235 clock %clock reset sync %reset, %false {firrtl.random_init_start = 69 : ui64} : i1
    %recov3_r = seq.firreg %236 clock %clock reset sync %reset, %false {firrtl.random_init_start = 72 : ui64} : i1
    %0 = comb.or bin %drop3_r, %io_if2id_drop {sv.namehint = "drop3_in"} : i1
    %1 = comb.or bin %drop2_r, %0 {sv.namehint = "drop2_in"} : i1
    %2 = comb.or bin %drop1_r, %1 {sv.namehint = "drop1_in"} : i1
    %3 = comb.xor bin %io_if2id_drop, %true {sv.namehint = "_T_28"} : i1
    %4 = comb.and bin %stall3_r, %3 {sv.namehint = "_stall3_in_T_1"} : i1
    %5 = comb.xor bin %0, %true {sv.namehint = "_T_13"} : i1
    %6 = comb.and bin %stall2_r, %5 {sv.namehint = "_stall2_in_T_1"} : i1
    %7 = comb.xor bin %1, %true {sv.namehint = "_T_7"} : i1
    %8 = comb.and bin %stall1_r, %7 {sv.namehint = "_stall1_in_T_1"} : i1
    %9 = comb.or bin %8, %6, %4, %io_if2id_stall {sv.namehint = "stall1_in"} : i1
    %state = seq.firreg %18 clock %clock reset sync %reset, %false {firrtl.random_init_start = 73 : ui64} : i1
    %10 = comb.xor bin %state, %true {sv.namehint = "_hs_in_T"} : i1
    %11 = comb.or %9, %state : i1
    %12 = comb.xor bin %9, %true {sv.namehint = "_T_2"} : i1
    %13 = comb.and bin %2, %12 {sv.namehint = "_T_3"} : i1
    %14 = comb.or bin %13, %io_recov {sv.namehint = "_T_4"} : i1
    %15 = comb.and bin %state, %14 : i1
    %16 = comb.xor %15, %true : i1
    %17 = comb.and %16, %state : i1
    %18 = comb.mux bin %state, %17, %11 : i1
    %pc1_r = seq.firreg %22 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 74 : ui64} : i64
    %excep1_r_cause = seq.firreg %29 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 139 : ui64} : i64
    %excep1_r_en = seq.firreg %28 clock %clock reset sync %reset, %false {firrtl.random_init_start = 267 : ui64} : i1
    %valid1_r = seq.firreg %34 clock %clock reset sync %reset, %false {firrtl.random_init_start = 334 : ui64} : i1
    %19 = comb.xor bin %2, %true {sv.namehint = "_hs_in_T_1"} : i1
    %20 = comb.and bin %10, %19 {sv.namehint = "hs_in"} : i1
    %21 = comb.add %pc, %c8_i64 {sv.namehint = "_cur_pc_T_1"} : i64
    %22 = comb.mux bin %46, %21, %pc {sv.namehint = "cur_pc"} : i64
    %23 = comb.xor %io_branchFail_valid, %true : i1
    %24 = comb.or %io_intr_in_en, %23 : i1
    %25 = comb.mux bin %24, %22, %io_branchFail_seq_pc {sv.namehint = "_next_pc_T_1"} : i64
    %26 = comb.mux bin %io_wb2if_valid, %io_wb2if_seq_pc, %25 {sv.namehint = "_next_pc_T_2"} : i64
    %27 = comb.mux bin %io_reg2if_valid, %io_reg2if_seq_pc, %26 {sv.namehint = "next_pc"} : i64
    %28 = comb.mux bin %20, %io_intr_in_en, %excep1_r_en : i1
    %29 = comb.mux bin %20, %io_intr_in_cause, %excep1_r_cause : i64
    %30 = comb.and %20, %io_intr_in_en : i1
    %31 = comb.xor %46, %true : i1
    %32 = comb.and %31, %valid1_r : i1
    %33 = comb.or %20, %32 : i1
    %34 = comb.and %7, %33 : i1
    %35 = comb.xor bin %io_intr_in_en, %true {sv.namehint = "_io_va2pa_vvalid_T"} : i1
    %36 = comb.and bin %20, %35 {sv.namehint = "_io_va2pa_vvalid_T_1"} : i1
    %pc2_r = seq.firreg %48 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 335 : ui64} : i64
    %paddr2_r = seq.firreg %56 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 399 : ui64} : i32
    %valid2_r = seq.firreg %77 clock %clock reset sync %reset, %false {firrtl.random_init_start = 431 : ui64} : i1
    %excep2_r_cause = seq.firreg %76 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 432 : ui64} : i64
    %excep2_r_tval = seq.firreg %73 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 496 : ui64} : i64
    %excep2_r_en = seq.firreg %70 clock %clock reset sync %reset, %false {firrtl.random_init_start = 560 : ui64} : i1
    %excep2_r_pc = seq.firreg %64 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 561 : ui64} : i64
    %excep2_r_etype = seq.firreg %61 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 625 : ui64} : i2
    %reset_tlb = seq.firreg %79 clock %clock reset sync %reset, %false {firrtl.random_init_start = 692 : ui64} : i1
    %37 = comb.or bin %io_va2pa_pvalid, %io_va2pa_tlb_excep_en {sv.namehint = "_reset_tlb_T"} : i1
    %38 = comb.xor %37, %true : i1
    %39 = comb.and %38, %reset_tlb : i1
    %40 = comb.xor bin %reset_tlb, %true {sv.namehint = "_tlb_inp_valid_T"} : i1
    %41 = comb.and bin %40, %37 {sv.namehint = "tlb_inp_valid"} : i1
    %42 = comb.xor bin %116, %true {sv.namehint = "_T_8"} : i1
    %43 = comb.and bin %valid2_r, %42 {sv.namehint = "_T_9"} : i1
    %44 = comb.or bin %41, %excep1_r_en {sv.namehint = "_T_10"} : i1
    %45 = comb.xor %43, %true : i1
    %46 = comb.and %7, %45, %44, %valid1_r {sv.namehint = "hs1"} : i1
    %47 = comb.and bin %5, %46 : i1
    %48 = comb.mux bin %47, %pc1_r, %pc2_r : i64
    %49 = comb.xor %116, %true : i1
    %50 = comb.and %49, %valid2_r : i1
    %51 = comb.or %46, %50 : i1
    %52 = comb.xor bin %46, %true {sv.namehint = "_T_12"} : i1
    %53 = comb.and %46, %io_va2pa_pvalid : i1
    %54 = comb.xor %53, %true : i1
    %55 = comb.or %0, %54 : i1
    %56 = comb.mux bin %55, %paddr2_r, %io_va2pa_paddr : i32
    %57 = comb.or bin %52, %io_va2pa_pvalid : i1
    %58 = comb.xor %57, %true : i1
    %59 = comb.and %5, %58, %io_va2pa_tlb_excep_en : i1
    %60 = comb.or %0, %52, %io_va2pa_pvalid, %io_va2pa_tlb_excep_en : i1
    %61 = comb.mux bin %60, %excep2_r_etype, %c0_i2 : i2
    %62 = comb.mux bin %io_va2pa_tlb_excep_en, %pc1_r, %c0_i64 : i64
    %63 = comb.or %0, %57 : i1
    %64 = comb.mux bin %63, %excep2_r_pc, %62 : i64
    %65 = comb.or %io_va2pa_tlb_excep_en, %excep1_r_en : i1
    %66 = comb.xor %io_va2pa_pvalid, %true : i1
    %67 = comb.and %66, %65 : i1
    %68 = comb.xor %46, %true : i1
    %69 = comb.or %0, %68 : i1
    %70 = comb.mux bin %69, %excep2_r_en, %67 : i1
    %71 = comb.mux bin %io_va2pa_tlb_excep_en, %io_va2pa_tlb_excep_tval, %c0_i64 : i64
    %72 = comb.or %0, %57 : i1
    %73 = comb.mux bin %72, %excep2_r_tval, %71 : i64
    %74 = comb.mux bin %io_va2pa_tlb_excep_en, %io_va2pa_tlb_excep_cause, %excep1_r_cause : i64
    %75 = comb.or %0, %57 : i1
    %76 = comb.mux bin %75, %excep2_r_cause, %74 : i64
    %77 = comb.and %5, %51 : i1
    %78 = comb.xor bin %37, %true {sv.namehint = "_reset_tlb_T_1"} : i1
    %79 = comb.mux bin %0, %78, %39 : i1
    %80 = comb.mux bin %46, %io_va2pa_paddr, %paddr2_r {sv.namehint = "_io_instRead_addr_T"} : i32
    %81 = comb.or bin %io_va2pa_tlb_excep_en, %excep1_r_en {sv.namehint = "_cur_excep_en_T"} : i1
    %82 = comb.mux bin %46, %81, %excep2_r_en {sv.namehint = "cur_excep_en"} : i1
    %83 = comb.or bin %46, %valid2_r {sv.namehint = "_io_instRead_arvalid_T"} : i1
    %84 = comb.xor bin %82, %true {sv.namehint = "_io_instRead_arvalid_T_3"} : i1
    %85 = comb.and bin %83, %3, %84 {sv.namehint = "_io_instRead_arvalid_T_4"} : i1
    %pc3_r = seq.firreg %212 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 693 : ui64} : i64
    %valid3_r = seq.firreg %240 clock %clock reset sync %reset, %false {firrtl.random_init_start = 757 : ui64, sv.namehint = ".io_if2id_valid.output"} : i1
    %excep3_r_cause = seq.firreg %202 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 758 : ui64} : i64
    %excep3_r_tval = seq.firreg %211 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 822 : ui64} : i64
    %excep3_r_en = seq.firreg %201 clock %clock reset sync %reset, %false {firrtl.random_init_start = 886 : ui64} : i1
    %excep3_r_pc = seq.firreg %206 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 887 : ui64} : i64
    %excep3_r_etype = seq.firreg %200 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 951 : ui64} : i2
    %next_pc_r = seq.firreg %218 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 953 : ui64} : i64
    %wait_jmp_pc = seq.firreg %152 clock %clock reset sync %reset, %true {firrtl.random_init_start = 1017 : ui64} : i1
    %inst_buf = seq.firreg %227 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 1018 : ui64} : i128
    %buf_start_pc = seq.firreg %225 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1146 : ui64} : i64
    %buf_bitmap = seq.firreg %230 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1210 : ui64} : i2
    %excep_buf_cause = seq.firreg %107 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1212 : ui64} : i64
    %excep_buf_tval = seq.firreg %104 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1276 : ui64} : i64
    %excep_buf_en = seq.firreg %234 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1340 : ui64} : i1
    %excep_buf_pc = seq.firreg %98 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1341 : ui64} : i64
    %excep_buf_etype = seq.firreg %95 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1405 : ui64} : i2
    %inst_r = seq.firreg %204 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1407 : ui64} : i32
    %reset_ic = seq.firreg %151 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1439 : ui64} : i1
    %update_excep_pc = seq.firreg %111 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1440 : ui64} : i1
    %86 = comb.xor %io_instRead_rvalid, %true : i1
    %87 = comb.and %86, %reset_ic : i1
    %88 = comb.sub %next_pc_r, %buf_start_pc {sv.namehint = "buf_offset"} : i64
    %89 = comb.and bin %io_if2id_ready, %valid3_r {sv.namehint = "hs_out"} : i1
    %90 = comb.icmp bin eq %buf_bitmap, %c-1_i2 {sv.namehint = "_T_14"} : i2
    %91 = comb.or bin %90, %excep_buf_en {sv.namehint = "_T_15"} : i1
    %92 = comb.and bin %excep2_r_en, %valid2_r {sv.namehint = "_T_16"} : i1
    %93 = comb.xor %92, %true : i1
    %94 = comb.or %0, %91, %93 : i1
    %95 = comb.mux bin %94, %excep_buf_etype, %excep2_r_etype : i2
    %96 = comb.xor %92, %true : i1
    %97 = comb.or %0, %91, %96 : i1
    %98 = comb.mux bin %97, %excep_buf_pc, %excep2_r_pc : i64
    %99 = comb.xor %92, %true : i1
    %100 = comb.or %91, %99 : i1
    %101 = comb.mux bin %100, %excep_buf_en, %excep2_r_en : i1
    %102 = comb.xor %92, %true : i1
    %103 = comb.or %0, %91, %102 : i1
    %104 = comb.mux bin %103, %excep_buf_tval, %excep2_r_tval : i64
    %105 = comb.xor %92, %true : i1
    %106 = comb.or %0, %91, %105 : i1
    %107 = comb.mux bin %106, %excep_buf_cause, %excep2_r_cause : i64
    %108 = comb.xor bin %wait_jmp_pc, %true {sv.namehint = "_update_excep_pc_T"} : i1
    %109 = comb.xor %92, %true : i1
    %110 = comb.or %0, %91, %109 : i1
    %111 = comb.mux bin %110, %update_excep_pc, %108 : i1
    %112 = comb.xor bin %reset_ic, %true {sv.namehint = "_T_18"} : i1
    %113 = comb.and bin %valid2_r, %io_instRead_rvalid, %112 {sv.namehint = "_T_19"} : i1
    %114 = comb.or %92, %113 : i1
    %115 = comb.xor %91, %true : i1
    %116 = comb.and %5, %115, %114 {sv.namehint = "hs2"} : i1
    %117 = comb.extract %buf_bitmap from 0 {sv.namehint = "_T_20"} : (i2) -> i1
    %118 = comb.extract %inst_buf from 0 {sv.namehint = "next_inst_buf_lo"} : (i128) -> i64
    %119 = comb.concat %io_instRead_inst, %118 {sv.namehint = "_next_inst_buf_T"} : i64, i64
    %120 = comb.concat %c0_i64, %io_instRead_inst {sv.namehint = "_next_inst_buf_T_1"} : i64, i64
    %121 = comb.mux bin %117, %119, %120 : i128
    %122 = comb.or bin %91, %92 : i1
    %123 = comb.xor %113, %true : i1
    %124 = comb.or %0, %122, %123 : i1
    %125 = comb.extract %inst_buf from 64 : (i128) -> i64
    %126 = comb.extract %121 from 64 : (i128) -> i64
    %127 = comb.mux %124, %125, %126 {sv.namehint = "inst_buf_lo"} : i64
    %128 = comb.concat %117, %true : i1, i1
    %129 = comb.xor %113, %true : i1
    %130 = comb.or %0, %122, %129 : i1
    %131 = comb.mux bin %130, %buf_bitmap, %128 {sv.namehint = "next_buf_bitmap"} : i2
    %132 = comb.extract %pc2_r from 3 {sv.namehint = "buf_start_pc_hi"} : (i64) -> i61
    %133 = comb.concat %132, %c0_i3 {sv.namehint = "_buf_start_pc_T"} : i61, i3
    %134 = comb.xor %113, %true : i1
    %135 = comb.or %0, %122, %134, %117 : i1
    %136 = comb.mux bin %135, %buf_start_pc, %133 : i64
    %137 = comb.xor %wait_jmp_pc, %true : i1
    %138 = comb.xor %113, %true : i1
    %139 = comb.or %0, %122, %138, %117, %137 : i1
    %140 = comb.mux bin %139, %next_pc_r, %pc2_r : i64
    %141 = comb.xor %113, %true : i1
    %142 = comb.or %122, %141, %117 : i1
    %143 = comb.and %142, %wait_jmp_pc : i1
    %144 = comb.or %0, %124 : i1
    %145 = comb.mux bin %144, %inst_buf, %121 : i128
    %146 = comb.mux bin %0, %c0_i2, %131 : i2
    %147 = comb.xor bin %excep2_r_en, %true {sv.namehint = "_reset_ic_T"} : i1
    %148 = comb.xor bin %io_instRead_rvalid, %true {sv.namehint = "_reset_ic_T_2"} : i1
    %149 = comb.and bin %valid2_r, %147, %148 {sv.namehint = "_reset_ic_T_3"} : i1
    %150 = comb.or bin %reset_ic, %149 {sv.namehint = "_reset_ic_T_4"} : i1
    %151 = comb.mux bin %0, %150, %87 : i1
    %152 = comb.or %0, %143 : i1
    %153 = comb.extract %88 from 0 {sv.namehint = "top_inst32_hi"} : (i64) -> i3
    %154 = comb.concat %c0_i122, %153, %c0_i3 : i122, i3, i3
    %155 = comb.shru bin %inst_buf, %154 {sv.namehint = "top_inst32"} : i128
    %156 = comb.icmp bin eq %buf_bitmap, %c-1_i2 {sv.namehint = "_T_21"} : i2
    %157 = comb.extract %155 from 0 {sv.namehint = "_top_inst_T"} : (i128) -> i2
    %158 = comb.icmp bin eq %157, %c-1_i2 {sv.namehint = "_top_inst_T_1"} : i2
    %159 = comb.extract %155 from 0 {sv.namehint = "top_inst_lo"} : (i128) -> i16
    %160 = comb.extract %155 from 0 : (i128) -> i32
    %161 = comb.concat %c0_i16, %159 : i16, i16
    %162 = comb.mux %158, %160, %161 : i32
    %163 = comb.icmp bin eq %buf_bitmap, %c1_i2 {sv.namehint = "_T_22"} : i2
    %164 = comb.icmp bin eq %88, %c6_i64 {sv.namehint = "_T_23"} : i64
    %165 = comb.extract %155 from 0 {sv.namehint = "_top_inst_T_5"} : (i128) -> i2
    %166 = comb.icmp bin ne %165, %c-1_i2 {sv.namehint = "_T_25"} : i2
    %167 = comb.and bin %164, %166 {sv.namehint = "_T_26"} : i1
    %168 = comb.extract %155 from 0 {sv.namehint = "top_inst_lo_1"} : (i128) -> i16
    %169 = comb.concat %c0_i16, %168 {sv.namehint = "_top_inst_T_4"} : i16, i16
    %170 = comb.icmp bin ult %88, %c5_i64 {sv.namehint = "_T_27"} : i64
    %171 = comb.or %167, %170 : i1
    %172 = comb.and %163, %171 : i1
    %173 = comb.or %156, %172 {sv.namehint = "inst_valid"} : i1
    %174 = comb.icmp bin eq %165, %c-1_i2 {sv.namehint = "_top_inst_T_6"} : i2
    %175 = comb.extract %155 from 0 {sv.namehint = "top_inst_lo_2"} : (i128) -> i16
    %176 = comb.extract %155 from 0 : (i128) -> i32
    %177 = comb.concat %c0_i16, %175 : i16, i16
    %178 = comb.mux %174, %176, %177 : i32
    %179 = comb.mux bin %170, %178, %c0_i32 : i32
    %180 = comb.mux bin %167, %169, %179 : i32
    %181 = comb.mux bin %163, %180, %c0_i32 : i32
    %182 = comb.mux bin %156, %162, %181 {sv.namehint = "top_inst"} : i32
    %183 = comb.icmp bin eq %excep_buf_cause, %c12_i64 {sv.namehint = "fetch_page_fault_excep"} : i64
    %184 = comb.icmp bin eq %buf_bitmap, %c1_i2 {sv.namehint = "_cross_page_excep_T"} : i2
    %185 = comb.icmp bin eq %88, %c6_i64 {sv.namehint = "_cross_page_excep_T_2"} : i64
    %186 = comb.extract %155 from 0 {sv.namehint = "_cross_page_excep_T_4"} : (i128) -> i2
    %187 = comb.icmp bin eq %186, %c-1_i2 {sv.namehint = "_cross_page_excep_T_5"} : i2
    %188 = comb.and bin %183, %184, %185, %187 {sv.namehint = "cross_page_excep"} : i1
    %189 = comb.or bin %173, %excep_buf_en {sv.namehint = "_T_29"} : i1
    %190 = comb.xor bin %valid3_r, %true {sv.namehint = "_T_30"} : i1
    %191 = comb.or bin %190, %89 {sv.namehint = "_T_31"} : i1
    %192 = comb.and bin %189, %191 {sv.namehint = "_T_32"} : i1
    %193 = comb.mux bin %173, %c0_i64, %excep_buf_cause {sv.namehint = "_excep3_r_T_cause"} : i64
    %194 = comb.mux bin %173, %c0_i64, %excep_buf_tval {sv.namehint = "_excep3_r_T_tval"} : i64
    %195 = comb.xor %173, %true : i1
    %196 = comb.and %195, %excep_buf_en {sv.namehint = "_excep3_r_T_en"} : i1
    %197 = comb.mux bin %173, %c0_i64, %excep_buf_pc {sv.namehint = "_excep3_r_T_pc"} : i64
    %198 = comb.mux bin %173, %c0_i2, %excep_buf_etype {sv.namehint = "_excep3_r_T_etype"} : i2
    %199 = comb.and bin %3, %192 : i1
    %200 = comb.mux bin %199, %198, %excep3_r_etype : i2
    %201 = comb.mux bin %199, %196, %excep3_r_en : i1
    %202 = comb.mux bin %199, %193, %excep3_r_cause : i64
    %203 = comb.mux bin %173, %182, %c0_i32 {sv.namehint = "_inst_r_T"} : i32
    %204 = comb.mux bin %199, %203, %inst_r : i32
    %205 = comb.mux bin %update_excep_pc, %next_pc_r, %197 : i64
    %206 = comb.mux bin %199, %205, %excep3_r_pc : i64
    %207 = comb.add %next_pc_r, %c2_i64 {sv.namehint = "_excep3_r_tval_T_1"} : i64
    %208 = comb.mux bin %183, %next_pc_r, %excep_buf_tval {sv.namehint = "_excep3_r_tval_T_2"} : i64
    %209 = comb.mux bin %188, %207, %208 {sv.namehint = "_excep3_r_tval_T_3"} : i64
    %210 = comb.mux bin %update_excep_pc, %209, %194 : i64
    %211 = comb.mux bin %199, %210, %excep3_r_tval : i64
    %212 = comb.mux bin %199, %next_pc_r, %pc3_r : i64
    %213 = comb.extract %182 from 0 {sv.namehint = "_next_pc_w_T"} : (i32) -> i2
    %214 = comb.icmp bin eq %213, %c-1_i2 {sv.namehint = "_next_pc_w_T_1"} : i2
    %215 = comb.mux bin %214, %c-4_i3, %c2_i3 {sv.namehint = "_next_pc_w_T_2"} : i3
    %216 = comb.concat %c0_i61, %215 : i61, i3
    %217 = comb.add %next_pc_r, %216 {sv.namehint = "next_pc_w"} : i64
    %218 = comb.mux bin %199, %217, %140 : i64
    %219 = comb.sub %217, %buf_start_pc {sv.namehint = "_T_34"} : i64
    %220 = comb.extract %219 from 3 : (i64) -> i61
    %221 = comb.icmp bin ne %220, %c0_i61 {sv.namehint = "_T_35"} : i61
    %222 = comb.icmp bin ne %buf_bitmap, %c0_i2 {sv.namehint = "_T_36"} : i2
    %223 = comb.add %buf_start_pc, %c8_i64 {sv.namehint = "_buf_start_pc_T_2"} : i64
    %224 = comb.and bin %3, %192, %221, %222 : i1
    %225 = comb.mux bin %224, %223, %136 : i64
    %226 = comb.concat %c0_i64, %127 {sv.namehint = "_inst_buf_T"} : i64, i64
    %227 = comb.mux bin %224, %226, %145 : i128
    %228 = comb.extract %131 from 1 {sv.namehint = "buf_bitmap_lo"} : (i2) -> i1
    %229 = comb.concat %false, %228 {sv.namehint = "_buf_bitmap_T"} : i1, i1
    %230 = comb.mux bin %224, %229, %146 : i2
    %231 = comb.xor bin %173, %true {sv.namehint = "_T_38"} : i1
    %232 = comb.and bin %3, %192, %231 : i1
    %233 = comb.xor %232, %true : i1
    %234 = comb.and %233, %5, %101 : i1
    %235 = comb.and %199, %231 : i1
    %236 = comb.mux bin %199, %231, %recov3_r : i1
    %237 = comb.xor %89, %true : i1
    %238 = comb.and %237, %valid3_r : i1
    %239 = comb.or %192, %238 : i1
    %240 = comb.and %3, %239 : i1
    hw.output %80, %85, %22, %36, %inst_r, %pc3_r, %excep3_r_cause, %excep3_r_tval, %excep3_r_en, %excep3_r_pc, %excep3_r_etype, %recov3_r, %valid3_r : i32, i1, i64, i1, i32, i64, i64, i64, i1, i64, i2, i1, i1
  }
  hw.module private @Decode(%clock: i1, %reset: i1, %io_if2id_inst: i32, %io_if2id_pc: i64, %io_if2id_excep_cause: i64, %io_if2id_excep_tval: i64, %io_if2id_excep_en: i1, %io_if2id_excep_pc: i64, %io_if2id_excep_etype: i2, %io_if2id_recov: i1, %io_if2id_valid: i1, %io_id2df_drop: i1, %io_id2df_stall: i1, %io_id2df_ready: i1, %io_idState_priv: i2) -> (io_if2id_drop: i1, io_if2id_stall: i1, io_if2id_ready: i1, io_id2df_inst: i32, io_id2df_pc: i64, io_id2df_excep_cause: i64, io_id2df_excep_tval: i64, io_id2df_excep_en: i1, io_id2df_excep_pc: i64, io_id2df_excep_etype: i2, io_id2df_ctrl_aluOp: i5, io_id2df_ctrl_aluWidth: i1, io_id2df_ctrl_dcMode: i5, io_id2df_ctrl_writeRegEn: i1, io_id2df_ctrl_writeCSREn: i1, io_id2df_ctrl_brType: i3, io_id2df_rs1: i5, io_id2df_rrs1: i1, io_id2df_rs1_d: i64, io_id2df_rs2: i12, io_id2df_rrs2: i1, io_id2df_rs2_d: i64, io_id2df_dst: i5, io_id2df_dst_d: i64, io_id2df_jmp_type: i2, io_id2df_special: i2, io_id2df_swap: i6, io_id2df_indi: i2, io_id2df_recov: i1, io_id2df_valid: i1) {
    %true = hw.constant true
    %c-3_i5 = hw.constant -3 : i5
    %c-7_i5 = hw.constant -7 : i5
    %c1_i2 = hw.constant 1 : i2
    %false = hw.constant false
    %c1_i9 = hw.constant 1 : i9
    %c14_i5 = hw.constant 14 : i5
    %c10_i5 = hw.constant 10 : i5
    %c2_i64 = hw.constant 2 : i64
    %c-894_i11 = hw.constant -894 : i11
    %c-1022_i11 = hw.constant -1022 : i11
    %c0_i48 = hw.constant 0 : i48
    %c0_i16 = hw.constant 0 : i16
    %c295027_i22 = hw.constant 295027 : i22
    %c-251_i9 = hw.constant -251 : i9
    %c-4_i3 = hw.constant -4 : i3
    %c4_i64 = hw.constant 4 : i64
    %c13_i5 = hw.constant 13 : i5
    %c65967_i20 = hw.constant 65967 : i20
    %c65839_i20 = hw.constant 65839 : i20
    %c3503_i15 = hw.constant 3503 : i15
    %c3375_i15 = hw.constant 3375 : i15
    %c-2_i5 = hw.constant -2 : i5
    %c-6_i5 = hw.constant -6 : i5
    %c-26_i6 = hw.constant -26 : i6
    %c-30_i6 = hw.constant -30 : i6
    %c2_i5 = hw.constant 2 : i5
    %c-11_i5 = hw.constant -11 : i5
    %c-395_i10 = hw.constant -395 : i10
    %c-399_i10 = hw.constant -399 : i10
    %c-451_i10 = hw.constant -451 : i10
    %c-455_i10 = hw.constant -455 : i10
    %c-459_i10 = hw.constant -459 : i10
    %c-463_i10 = hw.constant -463 : i10
    %c-55_i7 = hw.constant -55 : i7
    %c-59_i7 = hw.constant -59 : i7
    %c-63_i7 = hw.constant -63 : i7
    %c393_i10 = hw.constant 393 : i10
    %c9_i5 = hw.constant 9 : i5
    %c5_i5 = hw.constant 5 : i5
    %c1_i5 = hw.constant 1 : i5
    %c-4_i5 = hw.constant -4 : i5
    %c-8_i5 = hw.constant -8 : i5
    %c12_i5 = hw.constant 12 : i5
    %c8_i5 = hw.constant 8 : i5
    %c0_i5 = hw.constant 0 : i5
    %c0_i4 = hw.constant 0 : i4
    %c15_i24 = hw.constant 15 : i24
    %c-3665_i15 = hw.constant -3665 : i15
    %c-7761_i15 = hw.constant -7761 : i15
    %c-11857_i15 = hw.constant -11857 : i15
    %c-15953_i15 = hw.constant -15953 : i15
    %c12719_i15 = hw.constant 12719 : i15
    %c4527_i15 = hw.constant 4527 : i15
    %c8623_i15 = hw.constant 8623 : i15
    %c431_i15 = hw.constant 431 : i15
    %c1455_i15 = hw.constant 1455 : i15
    %c-3793_i15 = hw.constant -3793 : i15
    %c-7889_i15 = hw.constant -7889 : i15
    %c-11985_i15 = hw.constant -11985 : i15
    %c-16081_i15 = hw.constant -16081 : i15
    %c8495_i15 = hw.constant 8495 : i15
    %c12591_i15 = hw.constant 12591 : i15
    %c4399_i15 = hw.constant 4399 : i15
    %c303_i15 = hw.constant 303 : i15
    %c1327_i15 = hw.constant 1327 : i15
    %c-13_i10 = hw.constant -13 : i10
    %c-141_i10 = hw.constant -141 : i10
    %c-269_i10 = hw.constant -269 : i10
    %c499_i10 = hw.constant 499 : i10
    %c371_i10 = hw.constant 371 : i10
    %c243_i10 = hw.constant 243 : i10
    %c33467_i17 = hw.constant 33467 : i17
    %c699_i17 = hw.constant 699 : i17
    %c187_i17 = hw.constant 187 : i17
    %c32827_i17 = hw.constant 32827 : i17
    %c59_i17 = hw.constant 59 : i17
    %c33435_i17 = hw.constant 33435 : i17
    %c667_i17 = hw.constant 667 : i17
    %c155_i17 = hw.constant 155 : i17
    %c27_i10 = hw.constant 27 : i10
    %c1979_i17 = hw.constant 1979 : i17
    %c1851_i17 = hw.constant 1851 : i17
    %c1723_i17 = hw.constant 1723 : i17
    %c1595_i17 = hw.constant 1595 : i17
    %c1083_i17 = hw.constant 1083 : i17
    %c1971_i17 = hw.constant 1971 : i17
    %c1843_i17 = hw.constant 1843 : i17
    %c1715_i17 = hw.constant 1715 : i17
    %c1587_i17 = hw.constant 1587 : i17
    %c1331_i17 = hw.constant 1331 : i17
    %c1459_i17 = hw.constant 1459 : i17
    %c1203_i17 = hw.constant 1203 : i17
    %c1075_i17 = hw.constant 1075 : i17
    %c947_i17 = hw.constant 947 : i17
    %c819_i17 = hw.constant 819 : i17
    %c33459_i17 = hw.constant 33459 : i17
    %c691_i17 = hw.constant 691 : i17
    %c563_i17 = hw.constant 563 : i17
    %c435_i17 = hw.constant 435 : i17
    %c307_i17 = hw.constant 307 : i17
    %c179_i17 = hw.constant 179 : i17
    %c32819_i17 = hw.constant 32819 : i17
    %c51_i17 = hw.constant 51 : i17
    %c17043_i16 = hw.constant 17043 : i16
    %c659_i16 = hw.constant 659 : i16
    %c147_i16 = hw.constant 147 : i16
    %c-109_i10 = hw.constant -109 : i10
    %c-237_i10 = hw.constant -237 : i10
    %c-493_i10 = hw.constant -493 : i10
    %c403_i10 = hw.constant 403 : i10
    %c275_i10 = hw.constant 275 : i10
    %c19_i10 = hw.constant 19 : i10
    %c419_i10 = hw.constant 419 : i10
    %c291_i10 = hw.constant 291 : i10
    %c163_i10 = hw.constant 163 : i10
    %c35_i10 = hw.constant 35 : i10
    %c-253_i10 = hw.constant -253 : i10
    %c-381_i10 = hw.constant -381 : i10
    %c-509_i10 = hw.constant -509 : i10
    %c387_i10 = hw.constant 387 : i10
    %c259_i10 = hw.constant 259 : i10
    %c131_i10 = hw.constant 131 : i10
    %c3_i10 = hw.constant 3 : i10
    %c-29_i10 = hw.constant -29 : i10
    %c-157_i10 = hw.constant -157 : i10
    %c-285_i10 = hw.constant -285 : i10
    %c-413_i10 = hw.constant -413 : i10
    %c227_i10 = hw.constant 227 : i10
    %c99_i10 = hw.constant 99 : i10
    %c103_i10 = hw.constant 103 : i10
    %c-17_i7 = hw.constant -17 : i7
    %c23_i7 = hw.constant 23 : i7
    %c55_i7 = hw.constant 55 : i7
    %c807403635_i32 = hw.constant 807403635 : i32
    %c270532723_i32 = hw.constant 270532723 : i32
    %c115_i32 = hw.constant 115 : i32
    %c107_i32 = hw.constant 107 : i32
    %c273678451_i32 = hw.constant 273678451 : i32
    %c4111_i32 = hw.constant 4111 : i32
    %c0_i60 = hw.constant 0 : i60
    %c0_i59 = hw.constant 0 : i59
    %c0_i7 = hw.constant 0 : i7
    %c0_i32 = hw.constant 0 : i32
    %c0_i12 = hw.constant 0 : i12
    %c0_i6 = hw.constant 0 : i6
    %c-1_i2 = hw.constant -1 : i2
    %c-13_i5 = hw.constant -13 : i5
    %c-1_i3 = hw.constant -1 : i3
    %c1_i3 = hw.constant 1 : i3
    %c2_i3 = hw.constant 2 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c7_i5 = hw.constant 7 : i5
    %c3_i5 = hw.constant 3 : i5
    %c-12_i5 = hw.constant -12 : i5
    %c-14_i5 = hw.constant -14 : i5
    %c-15_i5 = hw.constant -15 : i5
    %c-16_i5 = hw.constant -16 : i5
    %c15_i5 = hw.constant 15 : i5
    %c6_i5 = hw.constant 6 : i5
    %c4_i5 = hw.constant 4 : i5
    %c11_i5 = hw.constant 11 : i5
    %c-10_i5 = hw.constant -10 : i5
    %c-2_i2 = hw.constant -2 : i2
    %c3_i4 = hw.constant 3 : i4
    %c1_i4 = hw.constant 1 : i4
    %c2_i4 = hw.constant 2 : i4
    %c7_i4 = hw.constant 7 : i4
    %c-8_i4 = hw.constant -8 : i4
    %c6_i4 = hw.constant 6 : i4
    %c5_i4 = hw.constant 5 : i4
    %c4_i4 = hw.constant 4 : i4
    %c-3_i4 = hw.constant -3 : i4
    %c-4_i4 = hw.constant -4 : i4
    %c-5_i4 = hw.constant -5 : i4
    %c-6_i4 = hw.constant -6 : i4
    %c-7_i4 = hw.constant -7 : i4
    %c27_i6 = hw.constant 27 : i6
    %c30_i6 = hw.constant 30 : i6
    %c0_i54 = hw.constant 0 : i54
    %c0_i57 = hw.constant 0 : i57
    %c0_i56 = hw.constant 0 : i56
    %c0_i58 = hw.constant 0 : i58
    %c0_i55 = hw.constant 0 : i55
    %c321_i12 = hw.constant 321 : i12
    %c833_i12 = hw.constant 833 : i12
    %c0_i64 = hw.constant 0 : i64
    %c0_i3 = hw.constant 0 : i3
    %c0_i2 = hw.constant 0 : i2
    %drop_r = seq.firreg %1048 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %stall_r = seq.firreg %1048 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %0 = comb.or bin %drop_r, %io_id2df_drop {sv.namehint = "drop_in"} : i1
    %1 = comb.xor bin %io_id2df_drop, %true {sv.namehint = "_T_74"} : i1
    %2 = comb.and bin %stall_r, %1 {sv.namehint = "_io_if2id_stall_T_1"} : i1
    %3 = comb.or bin %2, %io_id2df_stall {sv.namehint = "_io_if2id_stall_T_2"} : i1
    %inst_r = seq.firreg %1155 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 2 : ui64} : i32
    %pc_r = seq.firreg %1157 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 34 : ui64} : i64
    %excep_r_cause = seq.firreg %1162 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 98 : ui64} : i64
    %excep_r_tval = seq.firreg %1161 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 162 : ui64} : i64
    %excep_r_en = seq.firreg %1160 clock %clock reset sync %reset, %false {firrtl.random_init_start = 226 : ui64} : i1
    %excep_r_pc = seq.firreg %1159 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 227 : ui64} : i64
    %excep_r_etype = seq.firreg %1158 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 291 : ui64} : i2
    %ctrl_r_aluOp = seq.firreg %1172 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 293 : ui64} : i5
    %ctrl_r_aluWidth = seq.firreg %1171 clock %clock reset sync %reset, %false {firrtl.random_init_start = 298 : ui64} : i1
    %ctrl_r_dcMode = seq.firreg %1169 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 299 : ui64} : i5
    %ctrl_r_writeRegEn = seq.firreg %1168 clock %clock reset sync %reset, %false {firrtl.random_init_start = 304 : ui64} : i1
    %ctrl_r_writeCSREn = seq.firreg %1166 clock %clock reset sync %reset, %false {firrtl.random_init_start = 305 : ui64} : i1
    %ctrl_r_brType = seq.firreg %1163 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 306 : ui64} : i3
    %rs1_r = seq.firreg %1123 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 309 : ui64} : i5
    %rrs1_r = seq.firreg %1174 clock %clock reset sync %reset, %false {firrtl.random_init_start = 314 : ui64} : i1
    %rs1_d_r = seq.firreg %1149 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 315 : ui64} : i64
    %rs2_r = seq.firreg %1106 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 379 : ui64} : i12
    %rrs2_r = seq.firreg %1176 clock %clock reset sync %reset, %false {firrtl.random_init_start = 391 : ui64} : i1
    %rs2_d_r = seq.firreg %1144 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 392 : ui64} : i64
    %dst_r = seq.firreg %1128 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 456 : ui64} : i5
    %dst_d_r = seq.firreg %1151 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 461 : ui64} : i64
    %jmp_type_r = seq.firreg %1177 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 525 : ui64} : i2
    %special_r = seq.firreg %1178 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 527 : ui64} : i2
    %swap_r = seq.firreg %1180 clock %clock reset sync %reset, %c0_i6 {firrtl.random_init_start = 529 : ui64} : i6
    %indi_r = seq.firreg %1179 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 535 : ui64} : i2
    %recov_r = seq.firreg %1181 clock %clock reset sync %reset, %false {firrtl.random_init_start = 537 : ui64} : i1
    %valid_r = seq.firreg %1190 clock %clock reset sync %reset, %false {firrtl.random_init_start = 538 : ui64, sv.namehint = ".io_id2df_valid.output"} : i1
    %4 = comb.and bin %io_id2df_ready, %valid_r {sv.namehint = "hs_out"} : i1
    %5 = comb.and bin %1186, %io_if2id_valid {sv.namehint = "hs_in"} : i1
    %6 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %7 = comb.icmp bin eq %6, %c55_i7 {sv.namehint = "_instType_T_1"} : i7
    %8 = comb.icmp bin eq %6, %c23_i7 {sv.namehint = "_instType_T_3"} : i7
    %9 = comb.icmp bin eq %6, %c-17_i7 {sv.namehint = "_instType_T_5"} : i7
    %10 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %11 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %12 = comb.concat %10, %11 : i3, i7
    %13 = comb.icmp bin eq %12, %c103_i10 {sv.namehint = "_instType_T_7"} : i10
    %14 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %15 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %16 = comb.concat %14, %15 : i3, i7
    %17 = comb.icmp bin eq %16, %c99_i10 {sv.namehint = "_instType_T_9"} : i10
    %18 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %19 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %20 = comb.concat %18, %19 : i3, i7
    %21 = comb.icmp bin eq %20, %c227_i10 {sv.namehint = "_instType_T_11"} : i10
    %22 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %23 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %24 = comb.concat %22, %23 : i3, i7
    %25 = comb.icmp bin eq %24, %c-413_i10 {sv.namehint = "_instType_T_13"} : i10
    %26 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %27 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %28 = comb.concat %26, %27 : i3, i7
    %29 = comb.icmp bin eq %28, %c-285_i10 {sv.namehint = "_instType_T_15"} : i10
    %30 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %31 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %32 = comb.concat %30, %31 : i3, i7
    %33 = comb.icmp bin eq %32, %c-157_i10 {sv.namehint = "_instType_T_17"} : i10
    %34 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %35 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %36 = comb.concat %34, %35 : i3, i7
    %37 = comb.icmp bin eq %36, %c-29_i10 {sv.namehint = "_instType_T_745"} : i10
    %38 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %39 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %40 = comb.concat %38, %39 : i3, i7
    %41 = comb.icmp bin eq %40, %c3_i10 {sv.namehint = "_instType_T_21"} : i10
    %42 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %43 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %44 = comb.concat %42, %43 : i3, i7
    %45 = comb.icmp bin eq %44, %c131_i10 {sv.namehint = "_instType_T_23"} : i10
    %46 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %47 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %48 = comb.concat %46, %47 : i3, i7
    %49 = comb.icmp bin eq %48, %c259_i10 {sv.namehint = "_instType_T_25"} : i10
    %50 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %51 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %52 = comb.concat %50, %51 : i3, i7
    %53 = comb.icmp bin eq %52, %c387_i10 {sv.namehint = "_instType_T_27"} : i10
    %54 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %55 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %56 = comb.concat %54, %55 : i3, i7
    %57 = comb.icmp bin eq %56, %c-509_i10 {sv.namehint = "_instType_T_29"} : i10
    %58 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %59 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %60 = comb.concat %58, %59 : i3, i7
    %61 = comb.icmp bin eq %60, %c-381_i10 {sv.namehint = "_instType_T_31"} : i10
    %62 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %63 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %64 = comb.concat %62, %63 : i3, i7
    %65 = comb.icmp bin eq %64, %c-253_i10 {sv.namehint = "_instType_T_33"} : i10
    %66 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %67 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %68 = comb.concat %66, %67 : i3, i7
    %69 = comb.icmp bin eq %68, %c35_i10 {sv.namehint = "_instType_T_35"} : i10
    %70 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %71 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %72 = comb.concat %70, %71 : i3, i7
    %73 = comb.icmp bin eq %72, %c163_i10 {sv.namehint = "_instType_T_37"} : i10
    %74 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %75 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %76 = comb.concat %74, %75 : i3, i7
    %77 = comb.icmp bin eq %76, %c291_i10 {sv.namehint = "_instType_T_39"} : i10
    %78 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %79 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %80 = comb.concat %78, %79 : i3, i7
    %81 = comb.icmp bin eq %80, %c419_i10 {sv.namehint = "_instType_T_41"} : i10
    %82 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %83 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %84 = comb.concat %82, %83 : i3, i7
    %85 = comb.icmp bin eq %84, %c19_i10 {sv.namehint = "_instType_T_43"} : i10
    %86 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %87 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %88 = comb.concat %86, %87 : i3, i7
    %89 = comb.icmp bin eq %88, %c275_i10 {sv.namehint = "_instType_T_45"} : i10
    %90 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %91 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %92 = comb.concat %90, %91 : i3, i7
    %93 = comb.icmp bin eq %92, %c403_i10 {sv.namehint = "_instType_T_47"} : i10
    %94 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %95 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %96 = comb.concat %94, %95 : i3, i7
    %97 = comb.icmp bin eq %96, %c-493_i10 {sv.namehint = "_instType_T_49"} : i10
    %98 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %99 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %100 = comb.concat %98, %99 : i3, i7
    %101 = comb.icmp bin eq %100, %c-237_i10 {sv.namehint = "_instType_T_51"} : i10
    %102 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %103 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %104 = comb.concat %102, %103 : i3, i7
    %105 = comb.icmp bin eq %104, %c-109_i10 {sv.namehint = "_instType_T_53"} : i10
    %106 = comb.extract %io_if2id_inst from 26 : (i32) -> i6
    %107 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %108 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %109 = comb.concat %106, %107, %108 : i6, i3, i7
    %110 = comb.icmp bin eq %109, %c147_i16 {sv.namehint = "_instType_T_55"} : i16
    %111 = comb.extract %io_if2id_inst from 26 : (i32) -> i6
    %112 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %113 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %114 = comb.concat %111, %112, %113 : i6, i3, i7
    %115 = comb.icmp bin eq %114, %c659_i16 {sv.namehint = "_instType_T_57"} : i16
    %116 = comb.extract %io_if2id_inst from 26 : (i32) -> i6
    %117 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %118 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %119 = comb.concat %116, %117, %118 : i6, i3, i7
    %120 = comb.icmp bin eq %119, %c17043_i16 {sv.namehint = "_instType_T_59"} : i16
    %121 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %122 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %123 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %124 = comb.concat %121, %122, %123 : i7, i3, i7
    %125 = comb.icmp bin eq %124, %c51_i17 {sv.namehint = "_instType_T_61"} : i17
    %126 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %127 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %128 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %129 = comb.concat %126, %127, %128 : i7, i3, i7
    %130 = comb.icmp bin eq %129, %c32819_i17 {sv.namehint = "_instType_T_63"} : i17
    %131 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %132 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %133 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %134 = comb.concat %131, %132, %133 : i7, i3, i7
    %135 = comb.icmp bin eq %134, %c179_i17 {sv.namehint = "_instType_T_65"} : i17
    %136 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %137 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %138 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %139 = comb.concat %136, %137, %138 : i7, i3, i7
    %140 = comb.icmp bin eq %139, %c307_i17 {sv.namehint = "_instType_T_67"} : i17
    %141 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %142 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %143 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %144 = comb.concat %141, %142, %143 : i7, i3, i7
    %145 = comb.icmp bin eq %144, %c435_i17 {sv.namehint = "_instType_T_69"} : i17
    %146 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %147 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %148 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %149 = comb.concat %146, %147, %148 : i7, i3, i7
    %150 = comb.icmp bin eq %149, %c563_i17 {sv.namehint = "_instType_T_71"} : i17
    %151 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %152 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %153 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %154 = comb.concat %151, %152, %153 : i7, i3, i7
    %155 = comb.icmp bin eq %154, %c691_i17 {sv.namehint = "_instType_T_73"} : i17
    %156 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %157 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %158 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %159 = comb.concat %156, %157, %158 : i7, i3, i7
    %160 = comb.icmp bin eq %159, %c33459_i17 {sv.namehint = "_instType_T_75"} : i17
    %161 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %162 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %163 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %164 = comb.concat %161, %162, %163 : i7, i3, i7
    %165 = comb.icmp bin eq %164, %c819_i17 {sv.namehint = "_instType_T_77"} : i17
    %166 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %167 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %168 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %169 = comb.concat %166, %167, %168 : i7, i3, i7
    %170 = comb.icmp bin eq %169, %c947_i17 {sv.namehint = "_instType_T_79"} : i17
    %171 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %172 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %173 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %174 = comb.concat %171, %172, %173 : i7, i3, i7
    %175 = comb.icmp bin eq %174, %c1075_i17 {sv.namehint = "_instType_T_81"} : i17
    %176 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %177 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %178 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %179 = comb.concat %176, %177, %178 : i7, i3, i7
    %180 = comb.icmp bin eq %179, %c1203_i17 {sv.namehint = "_instType_T_83"} : i17
    %181 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %182 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %183 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %184 = comb.concat %181, %182, %183 : i7, i3, i7
    %185 = comb.icmp bin eq %184, %c1459_i17 {sv.namehint = "_instType_T_85"} : i17
    %186 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %187 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %188 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %189 = comb.concat %186, %187, %188 : i7, i3, i7
    %190 = comb.icmp bin eq %189, %c1331_i17 {sv.namehint = "_instType_T_87"} : i17
    %191 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %192 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %193 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %194 = comb.concat %191, %192, %193 : i7, i3, i7
    %195 = comb.icmp bin eq %194, %c1587_i17 {sv.namehint = "_instType_T_89"} : i17
    %196 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %197 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %198 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %199 = comb.concat %196, %197, %198 : i7, i3, i7
    %200 = comb.icmp bin eq %199, %c1715_i17 {sv.namehint = "_instType_T_91"} : i17
    %201 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %202 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %203 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %204 = comb.concat %201, %202, %203 : i7, i3, i7
    %205 = comb.icmp bin eq %204, %c1843_i17 {sv.namehint = "_instType_T_93"} : i17
    %206 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %207 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %208 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %209 = comb.concat %206, %207, %208 : i7, i3, i7
    %210 = comb.icmp bin eq %209, %c1971_i17 {sv.namehint = "_instType_T_95"} : i17
    %211 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %212 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %213 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %214 = comb.concat %211, %212, %213 : i7, i3, i7
    %215 = comb.icmp bin eq %214, %c1083_i17 {sv.namehint = "_instType_T_97"} : i17
    %216 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %217 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %218 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %219 = comb.concat %216, %217, %218 : i7, i3, i7
    %220 = comb.icmp bin eq %219, %c1595_i17 {sv.namehint = "_instType_T_99"} : i17
    %221 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %222 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %223 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %224 = comb.concat %221, %222, %223 : i7, i3, i7
    %225 = comb.icmp bin eq %224, %c1723_i17 {sv.namehint = "_instType_T_101"} : i17
    %226 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %227 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %228 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %229 = comb.concat %226, %227, %228 : i7, i3, i7
    %230 = comb.icmp bin eq %229, %c1851_i17 {sv.namehint = "_instType_T_103"} : i17
    %231 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %232 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %233 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %234 = comb.concat %231, %232, %233 : i7, i3, i7
    %235 = comb.icmp bin eq %234, %c1979_i17 {sv.namehint = "_instType_T_105"} : i17
    %236 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %237 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %238 = comb.concat %236, %237 : i3, i7
    %239 = comb.icmp bin eq %238, %c27_i10 {sv.namehint = "_instType_T_107"} : i10
    %240 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %241 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %242 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %243 = comb.concat %240, %241, %242 : i7, i3, i7
    %244 = comb.icmp bin eq %243, %c155_i17 {sv.namehint = "_instType_T_109"} : i17
    %245 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %246 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %247 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %248 = comb.concat %245, %246, %247 : i7, i3, i7
    %249 = comb.icmp bin eq %248, %c667_i17 {sv.namehint = "_instType_T_111"} : i17
    %250 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %251 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %252 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %253 = comb.concat %250, %251, %252 : i7, i3, i7
    %254 = comb.icmp bin eq %253, %c33435_i17 {sv.namehint = "_instType_T_113"} : i17
    %255 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %256 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %257 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %258 = comb.concat %255, %256, %257 : i7, i3, i7
    %259 = comb.icmp bin eq %258, %c59_i17 {sv.namehint = "_instType_T_115"} : i17
    %260 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %261 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %262 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %263 = comb.concat %260, %261, %262 : i7, i3, i7
    %264 = comb.icmp bin eq %263, %c32827_i17 {sv.namehint = "_instType_T_117"} : i17
    %265 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %266 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %267 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %268 = comb.concat %265, %266, %267 : i7, i3, i7
    %269 = comb.icmp bin eq %268, %c187_i17 {sv.namehint = "_instType_T_119"} : i17
    %270 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %271 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %272 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %273 = comb.concat %270, %271, %272 : i7, i3, i7
    %274 = comb.icmp bin eq %273, %c699_i17 {sv.namehint = "_instType_T_121"} : i17
    %275 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %276 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %277 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %278 = comb.concat %275, %276, %277 : i7, i3, i7
    %279 = comb.icmp bin eq %278, %c33467_i17 {sv.namehint = "_instType_T_411"} : i17
    %280 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %281 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %282 = comb.concat %280, %281 : i3, i7
    %283 = comb.icmp bin eq %282, %c243_i10 {sv.namehint = "_instType_T_125"} : i10
    %284 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %285 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %286 = comb.concat %284, %285 : i3, i7
    %287 = comb.icmp bin eq %286, %c371_i10 {sv.namehint = "_instType_T_127"} : i10
    %288 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %289 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %290 = comb.concat %288, %289 : i3, i7
    %291 = comb.icmp bin eq %290, %c499_i10 {sv.namehint = "_instType_T_129"} : i10
    %292 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %293 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %294 = comb.concat %292, %293 : i3, i7
    %295 = comb.icmp bin eq %294, %c-269_i10 {sv.namehint = "_instType_T_131"} : i10
    %296 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %297 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %298 = comb.concat %296, %297 : i3, i7
    %299 = comb.icmp bin eq %298, %c-141_i10 {sv.namehint = "_instType_T_133"} : i10
    %300 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %301 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %302 = comb.concat %300, %301 : i3, i7
    %303 = comb.icmp bin eq %302, %c-13_i10 {sv.namehint = "_instType_T_969"} : i10
    %304 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %305 = comb.extract %io_if2id_inst from 20 : (i32) -> i5
    %306 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %307 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %308 = comb.concat %304, %305, %306, %307 : i5, i5, i3, i7
    %309 = comb.icmp bin eq %308, %c65839_i20 {sv.namehint = "_instType_T_137"} : i20
    %310 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %311 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %312 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %313 = comb.concat %310, %311, %312 : i5, i3, i7
    %314 = comb.icmp bin eq %313, %c3375_i15 {sv.namehint = "_instType_T_139"} : i15
    %315 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %316 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %317 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %318 = comb.concat %315, %316, %317 : i5, i3, i7
    %319 = comb.icmp bin eq %318, %c1327_i15 {sv.namehint = "_instType_T_141"} : i15
    %320 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %321 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %322 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %323 = comb.concat %320, %321, %322 : i5, i3, i7
    %324 = comb.icmp bin eq %323, %c303_i15 {sv.namehint = "_instType_T_143"} : i15
    %325 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %326 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %327 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %328 = comb.concat %325, %326, %327 : i5, i3, i7
    %329 = comb.icmp bin eq %328, %c4399_i15 {sv.namehint = "_instType_T_145"} : i15
    %330 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %331 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %332 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %333 = comb.concat %330, %331, %332 : i5, i3, i7
    %334 = comb.icmp bin eq %333, %c12591_i15 {sv.namehint = "_instType_T_147"} : i15
    %335 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %336 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %337 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %338 = comb.concat %335, %336, %337 : i5, i3, i7
    %339 = comb.icmp bin eq %338, %c8495_i15 {sv.namehint = "_instType_T_149"} : i15
    %340 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %341 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %342 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %343 = comb.concat %340, %341, %342 : i5, i3, i7
    %344 = comb.icmp bin eq %343, %c-16081_i15 {sv.namehint = "_instType_T_151"} : i15
    %345 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %346 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %347 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %348 = comb.concat %345, %346, %347 : i5, i3, i7
    %349 = comb.icmp bin eq %348, %c-11985_i15 {sv.namehint = "_instType_T_153"} : i15
    %350 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %351 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %352 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %353 = comb.concat %350, %351, %352 : i5, i3, i7
    %354 = comb.icmp bin eq %353, %c-7889_i15 {sv.namehint = "_instType_T_155"} : i15
    %355 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %356 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %357 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %358 = comb.concat %355, %356, %357 : i5, i3, i7
    %359 = comb.icmp bin eq %358, %c-3793_i15 {sv.namehint = "_instType_T_157"} : i15
    %360 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %361 = comb.extract %io_if2id_inst from 20 : (i32) -> i5
    %362 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %363 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %364 = comb.concat %360, %361, %362, %363 : i5, i5, i3, i7
    %365 = comb.icmp bin eq %364, %c65967_i20 {sv.namehint = "_instType_T_159"} : i20
    %366 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %367 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %368 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %369 = comb.concat %366, %367, %368 : i5, i3, i7
    %370 = comb.icmp bin eq %369, %c3503_i15 {sv.namehint = "_instType_T_161"} : i15
    %371 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %372 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %373 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %374 = comb.concat %371, %372, %373 : i5, i3, i7
    %375 = comb.icmp bin eq %374, %c1455_i15 {sv.namehint = "_instType_T_163"} : i15
    %376 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %377 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %378 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %379 = comb.concat %376, %377, %378 : i5, i3, i7
    %380 = comb.icmp bin eq %379, %c431_i15 {sv.namehint = "_instType_T_165"} : i15
    %381 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %382 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %383 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %384 = comb.concat %381, %382, %383 : i5, i3, i7
    %385 = comb.icmp bin eq %384, %c8623_i15 {sv.namehint = "_instType_T_167"} : i15
    %386 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %387 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %388 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %389 = comb.concat %386, %387, %388 : i5, i3, i7
    %390 = comb.icmp bin eq %389, %c4527_i15 {sv.namehint = "_instType_T_169"} : i15
    %391 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %392 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %393 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %394 = comb.concat %391, %392, %393 : i5, i3, i7
    %395 = comb.icmp bin eq %394, %c12719_i15 {sv.namehint = "_instType_T_171"} : i15
    %396 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %397 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %398 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %399 = comb.concat %396, %397, %398 : i5, i3, i7
    %400 = comb.icmp bin eq %399, %c-15953_i15 {sv.namehint = "_instType_T_173"} : i15
    %401 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %402 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %403 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %404 = comb.concat %401, %402, %403 : i5, i3, i7
    %405 = comb.icmp bin eq %404, %c-11857_i15 {sv.namehint = "_instType_T_175"} : i15
    %406 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %407 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %408 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %409 = comb.concat %406, %407, %408 : i5, i3, i7
    %410 = comb.icmp bin eq %409, %c-7761_i15 {sv.namehint = "_instType_T_177"} : i15
    %411 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %412 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %413 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %414 = comb.concat %411, %412, %413 : i5, i3, i7
    %415 = comb.icmp bin eq %414, %c-3665_i15 {sv.namehint = "_instType_T_571"} : i15
    %416 = comb.extract %io_if2id_inst from 28 : (i32) -> i4
    %417 = comb.extract %io_if2id_inst from 0 : (i32) -> i20
    %418 = comb.concat %416, %417 : i4, i20
    %419 = comb.icmp bin eq %418, %c15_i24 {sv.namehint = "_instType_T_181"} : i24
    %420 = comb.icmp bin eq %io_if2id_inst, %c4111_i32 {sv.namehint = "_instType_T_183"} : i32
    %421 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %422 = comb.extract %io_if2id_inst from 0 : (i32) -> i15
    %423 = comb.concat %421, %422 : i7, i15
    %424 = comb.icmp bin eq %423, %c295027_i22 {sv.namehint = "_instType_T_185"} : i22
    %425 = comb.icmp bin eq %io_if2id_inst, %c273678451_i32 {sv.namehint = "_instType_T_187"} : i32
    %426 = comb.icmp bin eq %io_if2id_inst, %c107_i32 {sv.namehint = "_instType_T_189"} : i32
    %427 = comb.or bin %419, %420, %424, %425, %426 : i1
    %428 = comb.mux bin %427, %c0_i3, %c-1_i3 {sv.namehint = "_instType_T_194"} : i3
    %429 = comb.or bin %375, %380, %385, %390, %395, %400, %405, %410, %415 : i1
    %430 = comb.or bin %309, %314, %319, %324, %329, %334, %339, %344, %349, %354, %359, %365, %370, %429 : i1
    %431 = comb.mux bin %430, %c1_i3, %428 {sv.namehint = "_instType_T_216"} : i3
    %432 = comb.or bin %283, %287, %291, %295, %299, %303 : i1
    %433 = comb.mux bin %432, %c2_i3, %431 {sv.namehint = "_instType_T_222"} : i3
    %434 = comb.or bin %259, %264, %269, %274, %279 : i1
    %435 = comb.mux bin %434, %c1_i3, %433 {sv.namehint = "_instType_T_227"} : i3
    %436 = comb.or bin %239, %244, %249, %254 : i1
    %437 = comb.mux bin %436, %c2_i3, %435 {sv.namehint = "_instType_T_231"} : i3
    %438 = comb.or bin %125, %130, %135, %140, %145, %150, %155, %160, %165, %170, %175, %180, %185, %190, %195, %200, %205, %210, %215, %220, %225, %230, %235 : i1
    %439 = comb.mux bin %438, %c1_i3, %437 {sv.namehint = "_instType_T_254"} : i3
    %440 = comb.or bin %85, %89, %93, %97, %101, %105, %110, %115, %120 : i1
    %441 = comb.mux bin %440, %c2_i3, %439 {sv.namehint = "_instType_T_263"} : i3
    %442 = comb.or bin %69, %73, %77, %81 : i1
    %443 = comb.mux bin %442, %c3_i3, %441 {sv.namehint = "_instType_T_267"} : i3
    %444 = comb.or bin %41, %45, %49, %53, %57, %61, %65 : i1
    %445 = comb.mux bin %444, %c2_i3, %443 {sv.namehint = "_instType_T_274"} : i3
    %446 = comb.or bin %17, %21, %25, %29, %33, %37 : i1
    %447 = comb.mux bin %446, %c-4_i3, %445 {sv.namehint = "_instType_T_280"} : i3
    %448 = comb.mux bin %13, %c2_i3, %447 {sv.namehint = "_instType_T_281"} : i3
    %449 = comb.mux bin %9, %c-2_i3, %448 {sv.namehint = "_instType_T_282"} : i3
    %450 = comb.or bin %7, %8 : i1
    %451 = comb.mux bin %450, %c-3_i3, %449 {sv.namehint = "dType"} : i3
    %452 = comb.concat %c0_i4, %430 {sv.namehint = "_instType_T_310"} : i4, i1
    %453 = comb.mux bin %303, %c-11_i5, %452 {sv.namehint = "_instType_T_311"} : i5
    %454 = comb.mux bin %299, %c5_i5, %453 {sv.namehint = "_instType_T_312"} : i5
    %455 = comb.mux bin %295, %c1_i5, %454 {sv.namehint = "_instType_T_313"} : i5
    %456 = comb.mux bin %291, %c-11_i5, %455 {sv.namehint = "_instType_T_314"} : i5
    %457 = comb.mux bin %287, %c5_i5, %456 {sv.namehint = "_instType_T_315"} : i5
    %458 = comb.mux bin %283, %c1_i5, %457 {sv.namehint = "_instType_T_316"} : i5
    %459 = comb.mux bin %279, %c9_i5, %458 {sv.namehint = "_instType_T_317"} : i5
    %460 = comb.mux bin %274, %c8_i5, %459 {sv.namehint = "_instType_T_318"} : i5
    %461 = comb.mux bin %269, %c7_i5, %460 {sv.namehint = "_instType_T_319"} : i5
    %462 = comb.mux bin %264, %c10_i5, %461 {sv.namehint = "_instType_T_320"} : i5
    %463 = comb.mux bin %259, %c3_i5, %462 {sv.namehint = "_instType_T_321"} : i5
    %464 = comb.mux bin %254, %c9_i5, %463 {sv.namehint = "_instType_T_322"} : i5
    %465 = comb.mux bin %249, %c8_i5, %464 {sv.namehint = "_instType_T_323"} : i5
    %466 = comb.mux bin %244, %c7_i5, %465 {sv.namehint = "_instType_T_324"} : i5
    %467 = comb.mux bin %239, %c3_i5, %466 {sv.namehint = "_instType_T_325"} : i5
    %468 = comb.mux bin %235, %c-12_i5, %467 {sv.namehint = "_instType_T_326"} : i5
    %469 = comb.mux bin %230, %c-13_i5, %468 {sv.namehint = "_instType_T_327"} : i5
    %470 = comb.mux bin %225, %c-14_i5, %469 {sv.namehint = "_instType_T_328"} : i5
    %471 = comb.mux bin %220, %c-15_i5, %470 {sv.namehint = "_instType_T_329"} : i5
    %472 = comb.mux bin %215, %c13_i5, %471 {sv.namehint = "_instType_T_330"} : i5
    %473 = comb.mux bin %210, %c-12_i5, %472 {sv.namehint = "_instType_T_331"} : i5
    %474 = comb.mux bin %205, %c-13_i5, %473 {sv.namehint = "_instType_T_332"} : i5
    %475 = comb.mux bin %200, %c-14_i5, %474 {sv.namehint = "_instType_T_333"} : i5
    %476 = comb.mux bin %195, %c-15_i5, %475 {sv.namehint = "_instType_T_334"} : i5
    %477 = comb.mux bin %190, %c-16_i5, %476 {sv.namehint = "_instType_T_335"} : i5
    %478 = comb.mux bin %185, %c15_i5, %477 {sv.namehint = "_instType_T_336"} : i5
    %479 = comb.mux bin %180, %c14_i5, %478 {sv.namehint = "_instType_T_337"} : i5
    %480 = comb.mux bin %175, %c13_i5, %479 {sv.namehint = "_instType_T_338"} : i5
    %481 = comb.mux bin %170, %c6_i5, %480 {sv.namehint = "_instType_T_339"} : i5
    %482 = comb.mux bin %165, %c5_i5, %481 {sv.namehint = "_instType_T_340"} : i5
    %483 = comb.mux bin %160, %c9_i5, %482 {sv.namehint = "_instType_T_341"} : i5
    %484 = comb.mux bin %155, %c8_i5, %483 {sv.namehint = "_instType_T_342"} : i5
    %485 = comb.mux bin %150, %c4_i5, %484 {sv.namehint = "_instType_T_343"} : i5
    %486 = comb.mux bin %145, %c12_i5, %485 {sv.namehint = "_instType_T_344"} : i5
    %487 = comb.mux bin %140, %c11_i5, %486 {sv.namehint = "_instType_T_345"} : i5
    %488 = comb.mux bin %135, %c7_i5, %487 {sv.namehint = "_instType_T_346"} : i5
    %489 = comb.mux bin %130, %c10_i5, %488 {sv.namehint = "_instType_T_347"} : i5
    %490 = comb.mux bin %125, %c3_i5, %489 {sv.namehint = "_instType_T_348"} : i5
    %491 = comb.mux bin %120, %c9_i5, %490 {sv.namehint = "_instType_T_349"} : i5
    %492 = comb.mux bin %115, %c8_i5, %491 {sv.namehint = "_instType_T_350"} : i5
    %493 = comb.mux bin %110, %c7_i5, %492 {sv.namehint = "_instType_T_351"} : i5
    %494 = comb.mux bin %105, %c6_i5, %493 {sv.namehint = "_instType_T_352"} : i5
    %495 = comb.mux bin %101, %c5_i5, %494 {sv.namehint = "_instType_T_353"} : i5
    %496 = comb.mux bin %97, %c4_i5, %495 {sv.namehint = "_instType_T_354"} : i5
    %497 = comb.mux bin %93, %c12_i5, %496 {sv.namehint = "_instType_T_355"} : i5
    %498 = comb.mux bin %89, %c11_i5, %497 {sv.namehint = "_instType_T_356"} : i5
    %499 = comb.or bin %41, %45, %49, %53, %57, %61, %65, %69, %73, %77, %81, %85 : i1
    %500 = comb.mux bin %499, %c3_i5, %498 {sv.namehint = "_instType_T_368"} : i5
    %501 = comb.mux bin %446, %c0_i5, %500 {sv.namehint = "_instType_T_374"} : i5
    %502 = comb.or bin %9, %13 : i1
    %503 = comb.mux bin %502, %c2_i5, %501 {sv.namehint = "_instType_T_376"} : i5
    %504 = comb.mux bin %8, %c3_i5, %503 {sv.namehint = "_instType_T_377"} : i5
    %505 = comb.mux bin %7, %c1_i5, %504 {sv.namehint = "instType_1"} : i5
    %506 = comb.or %215, %220, %225, %230, %235, %239, %244, %249, %254, %259, %264, %269, %274, %279 {sv.namehint = "_instType_T_424"} : i1
    %507 = comb.or bin %7, %8, %9, %13, %17, %21, %25, %29, %33, %37, %41, %45, %49, %53, %57, %61, %65, %69, %73, %77, %81, %85, %89, %93, %97, %101, %105, %110, %115, %120, %125, %130, %135, %140, %145, %150, %155, %160, %165, %170, %175, %180, %185, %190, %195, %200, %205, %210 : i1
    %508 = comb.xor %507, %true : i1
    %509 = comb.and %508, %506 {sv.namehint = "instType_2"} : i1
    %510 = comb.mux bin %429, %c15_i5, %c0_i5 {sv.namehint = "_instType_T_485"} : i5
    %511 = comb.mux bin %370, %c11_i5, %510 {sv.namehint = "_instType_T_486"} : i5
    %512 = comb.mux bin %365, %c7_i5, %511 {sv.namehint = "_instType_T_487"} : i5
    %513 = comb.or bin %319, %324, %329, %334, %339, %344, %349, %354, %359 : i1
    %514 = comb.mux bin %513, %c14_i5, %512 {sv.namehint = "_instType_T_496"} : i5
    %515 = comb.mux bin %314, %c10_i5, %514 {sv.namehint = "_instType_T_497"} : i5
    %516 = comb.mux bin %309, %c6_i5, %515 {sv.namehint = "_instType_T_498"} : i5
    %517 = comb.or bin %85, %89, %93, %97, %101, %105, %110, %115, %120, %125, %130, %135, %140, %145, %150, %155, %160, %165, %170, %175, %180, %185, %190, %195, %200, %205, %210, %215, %220, %225, %230, %235, %239, %244, %249, %254, %259, %264, %269, %274, %279, %432 : i1
    %518 = comb.mux bin %517, %c0_i5, %516 {sv.namehint = "_instType_T_545"} : i5
    %519 = comb.mux bin %81, %c11_i5, %518 {sv.namehint = "_instType_T_546"} : i5
    %520 = comb.mux bin %77, %c10_i5, %519 {sv.namehint = "_instType_T_547"} : i5
    %521 = comb.mux bin %73, %c9_i5, %520 {sv.namehint = "_instType_T_548"} : i5
    %522 = comb.mux bin %69, %c8_i5, %521 {sv.namehint = "_instType_T_549"} : i5
    %523 = comb.mux bin %65, %c-10_i5, %522 {sv.namehint = "_instType_T_550"} : i5
    %524 = comb.mux bin %61, %c-11_i5, %523 {sv.namehint = "_instType_T_551"} : i5
    %525 = comb.mux bin %57, %c-12_i5, %524 {sv.namehint = "_instType_T_552"} : i5
    %526 = comb.mux bin %53, %c7_i5, %525 {sv.namehint = "_instType_T_553"} : i5
    %527 = comb.mux bin %49, %c6_i5, %526 {sv.namehint = "_instType_T_554"} : i5
    %528 = comb.mux bin %45, %c5_i5, %527 {sv.namehint = "_instType_T_555"} : i5
    %529 = comb.mux bin %41, %c4_i5, %528 {sv.namehint = "_instType_T_556"} : i5
    %530 = comb.or bin %7, %8, %9, %13, %446 : i1
    %531 = comb.mux bin %530, %c0_i5, %529 {sv.namehint = "instType_3"} : i5
    %532 = comb.or %85, %89, %93, %97, %101, %105, %110, %115, %120, %125, %130, %135, %140, %145, %150, %155, %160, %165, %170, %175, %180, %185, %190, %195, %200, %205, %210, %215, %220, %225, %230, %235, %239, %244, %249, %254, %259, %264, %269, %274, %279, %283, %287, %291, %295, %299, %303, %309, %314, %319, %324, %329, %334, %339, %344, %349, %354, %359, %365, %370, %375, %380, %385, %390, %395, %400, %405, %410, %415 {sv.namehint = "_instType_T_639"} : i1
    %533 = comb.xor %442, %true : i1
    %534 = comb.and %533, %532 {sv.namehint = "_instType_T_643"} : i1
    %535 = comb.or %444, %534 {sv.namehint = "_instType_T_650"} : i1
    %536 = comb.xor %446, %true : i1
    %537 = comb.and %536, %535 {sv.namehint = "_instType_T_656"} : i1
    %538 = comb.or %7, %8, %502, %537 {sv.namehint = "instType_4"} : i1
    %539 = comb.or %9, %13, %17, %21, %25, %29, %33, %37 {sv.namehint = "_instType_T_752"} : i1
    %540 = comb.xor %450, %true : i1
    %541 = comb.and %540, %539 {sv.namehint = "instType_5"} : i1
    %542 = comb.or bin %295, %299 : i1
    %543 = comb.or %283, %287, %291, %542, %303 {sv.namehint = "_instType_T_786"} : i1
    %544 = comb.or bin %7, %8, %9, %13, %17, %21, %25, %29, %33, %37, %41, %45, %49, %53, %57, %61, %65, %69, %73, %77, %81, %85, %89, %93, %97, %101, %105, %110, %115, %120, %125, %130, %135, %140, %145, %150, %155, %160, %165, %170, %175, %180, %185, %190, %195, %200, %205, %210, %215, %220, %225, %230, %235, %239, %244, %249, %254, %434 : i1
    %545 = comb.xor %544, %true : i1
    %546 = comb.and %545, %543 {sv.namehint = "instType_6"} : i1
    %547 = comb.or %542, %303 {sv.namehint = "_instType_T_971"} : i1
    %548 = comb.or bin %7, %8, %9, %13, %17, %21, %25, %29, %33, %37, %41, %45, %49, %53, %57, %61, %65, %69, %73, %77, %81, %85, %89, %93, %97, %101, %105, %110, %115, %120, %125, %130, %135, %140, %145, %150, %155, %160, %165, %170, %175, %180, %185, %190, %195, %200, %205, %210, %215, %220, %225, %230, %235, %239, %244, %249, %254, %259, %264, %269, %274, %279, %283, %287, %291 : i1
    %549 = comb.xor %548, %true : i1
    %550 = comb.and %549, %547 {sv.namehint = "instType_8"} : i1
    %551 = comb.extract %io_if2id_inst from 0 {sv.namehint = "inst_c"} : (i32) -> i16
    %552 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %553 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %554 = comb.concat %552, %553 : i3, i2
    %555 = comb.icmp bin eq %554, %c0_i5 {sv.namehint = "_instType_c_T_2"} : i5
    %556 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %557 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %558 = comb.concat %556, %557 : i3, i2
    %559 = comb.icmp bin eq %558, %c8_i5 {sv.namehint = "_instType_c_T_4"} : i5
    %560 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %561 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %562 = comb.concat %560, %561 : i3, i2
    %563 = comb.icmp bin eq %562, %c12_i5 {sv.namehint = "_instType_c_T_6"} : i5
    %564 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %565 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %566 = comb.concat %564, %565 : i3, i2
    %567 = comb.icmp bin eq %566, %c-8_i5 {sv.namehint = "_instType_c_T_8"} : i5
    %568 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %569 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %570 = comb.concat %568, %569 : i3, i2
    %571 = comb.icmp bin eq %570, %c-4_i5 {sv.namehint = "_instType_c_T_10"} : i5
    %572 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %573 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %574 = comb.concat %572, %573 : i3, i2
    %575 = comb.icmp bin eq %574, %c1_i5 {sv.namehint = "_instType_c_T_12"} : i5
    %576 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %577 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %578 = comb.concat %576, %577 : i3, i2
    %579 = comb.icmp bin eq %578, %c5_i5 {sv.namehint = "_instType_c_T_14"} : i5
    %580 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %581 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %582 = comb.concat %580, %581 : i3, i2
    %583 = comb.icmp bin eq %582, %c9_i5 {sv.namehint = "_instType_c_T_16"} : i5
    %584 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %585 = comb.extract %io_if2id_inst from 7 : (i32) -> i5
    %586 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %587 = comb.concat %584, %585, %586 : i3, i5, i2
    %588 = comb.icmp bin eq %587, %c393_i10 {sv.namehint = "_instType_c_T_18"} : i10
    %589 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %590 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %591 = comb.concat %589, %590 : i3, i2
    %592 = comb.icmp bin eq %591, %c13_i5 {sv.namehint = "_instType_c_T_20"} : i5
    %593 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %594 = comb.extract %io_if2id_inst from 10 : (i32) -> i2
    %595 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %596 = comb.concat %593, %594, %595 : i3, i2, i2
    %597 = comb.icmp bin eq %596, %c-63_i7 {sv.namehint = "_instType_c_T_22"} : i7
    %598 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %599 = comb.extract %io_if2id_inst from 10 : (i32) -> i2
    %600 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %601 = comb.concat %598, %599, %600 : i3, i2, i2
    %602 = comb.icmp bin eq %601, %c-59_i7 {sv.namehint = "_instType_c_T_24"} : i7
    %603 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %604 = comb.extract %io_if2id_inst from 10 : (i32) -> i2
    %605 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %606 = comb.concat %603, %604, %605 : i3, i2, i2
    %607 = comb.icmp bin eq %606, %c-55_i7 {sv.namehint = "_instType_c_T_26"} : i7
    %608 = comb.extract %io_if2id_inst from 10 : (i32) -> i6
    %609 = comb.extract %io_if2id_inst from 5 : (i32) -> i2
    %610 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %611 = comb.concat %608, %609, %610 : i6, i2, i2
    %612 = comb.icmp bin eq %611, %c-463_i10 {sv.namehint = "_instType_c_T_28"} : i10
    %613 = comb.extract %io_if2id_inst from 10 : (i32) -> i6
    %614 = comb.extract %io_if2id_inst from 5 : (i32) -> i2
    %615 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %616 = comb.concat %613, %614, %615 : i6, i2, i2
    %617 = comb.icmp bin eq %616, %c-459_i10 {sv.namehint = "_instType_c_T_30"} : i10
    %618 = comb.extract %io_if2id_inst from 10 : (i32) -> i6
    %619 = comb.extract %io_if2id_inst from 5 : (i32) -> i2
    %620 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %621 = comb.concat %618, %619, %620 : i6, i2, i2
    %622 = comb.icmp bin eq %621, %c-455_i10 {sv.namehint = "_instType_c_T_32"} : i10
    %623 = comb.extract %io_if2id_inst from 10 : (i32) -> i6
    %624 = comb.extract %io_if2id_inst from 5 : (i32) -> i2
    %625 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %626 = comb.concat %623, %624, %625 : i6, i2, i2
    %627 = comb.icmp bin eq %626, %c-451_i10 {sv.namehint = "_instType_c_T_34"} : i10
    %628 = comb.extract %io_if2id_inst from 10 : (i32) -> i6
    %629 = comb.extract %io_if2id_inst from 5 : (i32) -> i2
    %630 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %631 = comb.concat %628, %629, %630 : i6, i2, i2
    %632 = comb.icmp bin eq %631, %c-399_i10 {sv.namehint = "_instType_c_T_36"} : i10
    %633 = comb.extract %io_if2id_inst from 10 : (i32) -> i6
    %634 = comb.extract %io_if2id_inst from 5 : (i32) -> i2
    %635 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %636 = comb.concat %633, %634, %635 : i6, i2, i2
    %637 = comb.icmp bin eq %636, %c-395_i10 {sv.namehint = "_instType_c_T_165"} : i10
    %638 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %639 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %640 = comb.concat %638, %639 : i3, i2
    %641 = comb.icmp bin eq %640, %c-11_i5 {sv.namehint = "_instType_c_T_40"} : i5
    %642 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %643 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %644 = comb.concat %642, %643 : i3, i2
    %645 = comb.icmp bin eq %644, %c-7_i5 {sv.namehint = "_instType_c_T_42"} : i5
    %646 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %647 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %648 = comb.concat %646, %647 : i3, i2
    %649 = comb.icmp bin eq %648, %c-3_i5 {sv.namehint = "_instType_c_T_44"} : i5
    %650 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %651 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %652 = comb.concat %650, %651 : i3, i2
    %653 = comb.icmp bin eq %652, %c2_i5 {sv.namehint = "_instType_c_T_46"} : i5
    %654 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %655 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %656 = comb.concat %654, %655 : i3, i2
    %657 = comb.icmp bin eq %656, %c10_i5 {sv.namehint = "_instType_c_T_48"} : i5
    %658 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %659 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %660 = comb.concat %658, %659 : i3, i2
    %661 = comb.icmp bin eq %660, %c14_i5 {sv.namehint = "_instType_c_T_50"} : i5
    %662 = comb.extract %io_if2id_inst from 12 : (i32) -> i4
    %663 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %664 = comb.concat %662, %663 : i4, i7
    %665 = comb.icmp bin eq %664, %c-1022_i11 {sv.namehint = "_instType_c_T_52"} : i11
    %666 = comb.extract %io_if2id_inst from 12 : (i32) -> i4
    %667 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %668 = comb.concat %666, %667 : i4, i2
    %669 = comb.icmp bin eq %668, %c-30_i6 {sv.namehint = "_instType_c_T_54"} : i6
    %670 = comb.extract %io_if2id_inst from 12 : (i32) -> i4
    %671 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %672 = comb.concat %670, %671 : i4, i7
    %673 = comb.icmp bin eq %672, %c-894_i11 {sv.namehint = "_instType_c_T_56"} : i11
    %674 = comb.extract %io_if2id_inst from 12 : (i32) -> i4
    %675 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %676 = comb.concat %674, %675 : i4, i2
    %677 = comb.icmp bin eq %676, %c-26_i6 {sv.namehint = "_instType_c_T_215"} : i6
    %678 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %679 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %680 = comb.concat %678, %679 : i3, i2
    %681 = comb.icmp bin eq %680, %c-6_i5 {sv.namehint = "_instType_c_T_60"} : i5
    %682 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %683 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %684 = comb.concat %682, %683 : i3, i2
    %685 = comb.icmp bin eq %684, %c-2_i5 {sv.namehint = "_instType_c_T_62"} : i5
    %686 = comb.or bin %681, %685 : i1
    %687 = comb.mux bin %686, %c3_i4, %c0_i4 {sv.namehint = "_instType_c_T_64"} : i4
    %688 = comb.or bin %665, %669, %673, %677 : i1
    %689 = comb.mux bin %688, %c1_i4, %687 {sv.namehint = "_instType_c_T_68"} : i4
    %690 = comb.or bin %657, %661 : i1
    %691 = comb.or bin %653, %690 : i1
    %692 = comb.mux bin %691, %c2_i4, %689 {sv.namehint = "_instType_c_T_71"} : i4
    %693 = comb.or bin %645, %649 : i1
    %694 = comb.mux bin %693, %c7_i4, %692 {sv.namehint = "_instType_c_T_73"} : i4
    %695 = comb.mux bin %641, %c-8_i4, %694 {sv.namehint = "_instType_c_T_74"} : i4
    %696 = comb.or bin %612, %617, %622, %627, %632, %637 : i1
    %697 = comb.mux bin %696, %c6_i4, %695 {sv.namehint = "_instType_c_T_80"} : i4
    %698 = comb.or bin %597, %602, %607 : i1
    %699 = comb.mux bin %698, %c7_i4, %697 {sv.namehint = "_instType_c_T_83"} : i4
    %700 = comb.or bin %575, %579, %583, %588, %592 : i1
    %701 = comb.mux bin %700, %c2_i4, %699 {sv.namehint = "_instType_c_T_88"} : i4
    %702 = comb.or bin %567, %571 : i1
    %703 = comb.mux bin %702, %c6_i4, %701 {sv.namehint = "_instType_c_T_90"} : i4
    %704 = comb.or bin %559, %563 : i1
    %705 = comb.mux bin %704, %c5_i4, %703 {sv.namehint = "_instType_c_T_92"} : i4
    %706 = comb.mux bin %555, %c4_i4, %705 {sv.namehint = "instType_c_0"} : i4
    %707 = comb.mux bin %685, %c-3_i4, %c0_i4 {sv.namehint = "_instType_c_T_93"} : i4
    %708 = comb.mux bin %681, %c-4_i4, %707 {sv.namehint = "_instType_c_T_94"} : i4
    %709 = comb.mux bin %688, %c0_i4, %708 {sv.namehint = "_instType_c_T_98"} : i4
    %710 = comb.mux bin %661, %c7_i4, %709 {sv.namehint = "_instType_c_T_99"} : i4
    %711 = comb.mux bin %657, %c6_i4, %710 {sv.namehint = "_instType_c_T_100"} : i4
    %712 = comb.mux bin %653, %c4_i4, %711 {sv.namehint = "_instType_c_T_101"} : i4
    %713 = comb.mux bin %693, %c-5_i4, %712 {sv.namehint = "_instType_c_T_103"} : i4
    %714 = comb.mux bin %641, %c-6_i4, %713 {sv.namehint = "_instType_c_T_104"} : i4
    %715 = comb.mux bin %696, %c0_i4, %714 {sv.namehint = "_instType_c_T_110"} : i4
    %716 = comb.mux bin %607, %c5_i4, %715 {sv.namehint = "_instType_c_T_111"} : i4
    %717 = comb.or bin %597, %602 : i1
    %718 = comb.mux bin %717, %c4_i4, %716 {sv.namehint = "_instType_c_T_113"} : i4
    %719 = comb.mux bin %592, %c-7_i4, %718 {sv.namehint = "_instType_c_T_114"} : i4
    %720 = comb.mux bin %588, %c-8_i4, %719 {sv.namehint = "_instType_c_T_115"} : i4
    %721 = comb.or bin %575, %579, %583 : i1
    %722 = comb.mux bin %721, %c5_i4, %720 {sv.namehint = "_instType_c_T_118"} : i4
    %723 = comb.mux bin %571, %c3_i4, %722 {sv.namehint = "_instType_c_T_119"} : i4
    %724 = comb.mux bin %567, %c2_i4, %723 {sv.namehint = "_instType_c_T_120"} : i4
    %725 = comb.mux bin %563, %c3_i4, %724 {sv.namehint = "_instType_c_T_121"} : i4
    %726 = comb.mux bin %559, %c2_i4, %725 {sv.namehint = "_instType_c_T_122"} : i4
    %727 = comb.mux bin %555, %c1_i4, %726 {sv.namehint = "instType_c_1"} : i4
    %728 = comb.or bin %677, %686 : i1
    %729 = comb.mux bin %728, %c3_i5, %c0_i5 {sv.namehint = "_instType_c_T_125"} : i5
    %730 = comb.or bin %669, %673 : i1
    %731 = comb.mux bin %730, %c2_i5, %729 {sv.namehint = "_instType_c_T_127"} : i5
    %732 = comb.mux bin %665, %c1_i5, %731 {sv.namehint = "_instType_c_T_128"} : i5
    %733 = comb.mux bin %690, %c3_i5, %732 {sv.namehint = "_instType_c_T_130"} : i5
    %734 = comb.mux bin %653, %c7_i5, %733 {sv.namehint = "_instType_c_T_131"} : i5
    %735 = comb.mux bin %693, %c0_i5, %734 {sv.namehint = "_instType_c_T_133"} : i5
    %736 = comb.mux bin %641, %c2_i5, %735 {sv.namehint = "_instType_c_T_134"} : i5
    %737 = comb.mux bin %637, %c3_i5, %736 {sv.namehint = "_instType_c_T_135"} : i5
    %738 = comb.mux bin %632, %c10_i5, %737 {sv.namehint = "_instType_c_T_136"} : i5
    %739 = comb.mux bin %627, %c6_i5, %738 {sv.namehint = "_instType_c_T_137"} : i5
    %740 = comb.mux bin %622, %c5_i5, %739 {sv.namehint = "_instType_c_T_138"} : i5
    %741 = comb.mux bin %617, %c4_i5, %740 {sv.namehint = "_instType_c_T_139"} : i5
    %742 = comb.mux bin %612, %c10_i5, %741 {sv.namehint = "_instType_c_T_140"} : i5
    %743 = comb.mux bin %607, %c6_i5, %742 {sv.namehint = "_instType_c_T_141"} : i5
    %744 = comb.mux bin %602, %c9_i5, %743 {sv.namehint = "_instType_c_T_142"} : i5
    %745 = comb.mux bin %597, %c8_i5, %744 {sv.namehint = "_instType_c_T_143"} : i5
    %746 = comb.mux bin %592, %c2_i5, %745 {sv.namehint = "_instType_c_T_144"} : i5
    %747 = comb.mux bin %588, %c3_i5, %746 {sv.namehint = "_instType_c_T_145"} : i5
    %748 = comb.mux bin %583, %c2_i5, %747 {sv.namehint = "_instType_c_T_146"} : i5
    %749 = comb.or bin %555, %559, %563, %567, %571, %575, %579 : i1
    %750 = comb.mux bin %749, %c3_i5, %748 {sv.namehint = "instType_c_2"} : i5
    %751 = comb.or %632, %637 {sv.namehint = "_instType_c_T_166"} : i1
    %752 = comb.or bin %583, %588, %592, %597, %602, %607, %612, %617, %622, %627 : i1
    %753 = comb.xor %752, %true : i1
    %754 = comb.and %753, %751 {sv.namehint = "_instType_c_T_176"} : i1
    %755 = comb.or %579, %754 {sv.namehint = "_instType_c_T_177"} : i1
    %756 = comb.or bin %555, %559, %563, %567, %571, %575 : i1
    %757 = comb.xor %756, %true : i1
    %758 = comb.and %757, %755 {sv.namehint = "instType_c_3"} : i1
    %759 = comb.mux bin %685, %c11_i5, %c0_i5 {sv.namehint = "_instType_c_T_183"} : i5
    %760 = comb.mux bin %681, %c10_i5, %759 {sv.namehint = "_instType_c_T_184"} : i5
    %761 = comb.mux bin %688, %c0_i5, %760 {sv.namehint = "_instType_c_T_188"} : i5
    %762 = comb.mux bin %661, %c7_i5, %761 {sv.namehint = "_instType_c_T_189"} : i5
    %763 = comb.mux bin %657, %c6_i5, %762 {sv.namehint = "_instType_c_T_190"} : i5
    %764 = comb.or bin %575, %579, %583, %588, %592, %597, %602, %607, %612, %617, %622, %627, %632, %637, %641, %645, %649, %653 : i1
    %765 = comb.mux bin %764, %c0_i5, %763 {sv.namehint = "_instType_c_T_208"} : i5
    %766 = comb.mux bin %571, %c11_i5, %765 {sv.namehint = "_instType_c_T_209"} : i5
    %767 = comb.mux bin %567, %c10_i5, %766 {sv.namehint = "_instType_c_T_210"} : i5
    %768 = comb.mux bin %563, %c7_i5, %767 {sv.namehint = "_instType_c_T_211"} : i5
    %769 = comb.mux bin %559, %c6_i5, %768 {sv.namehint = "_instType_c_T_212"} : i5
    %770 = comb.mux bin %555, %c0_i5, %769 {sv.namehint = "instType_c_4"} : i5
    %771 = comb.or %730, %677 {sv.namehint = "_instType_c_T_217"} : i1
    %772 = comb.xor %665, %true : i1
    %773 = comb.and %772, %771 {sv.namehint = "_instType_c_T_218"} : i1
    %774 = comb.or %691, %773 {sv.namehint = "_instType_c_T_221"} : i1
    %775 = comb.or bin %641, %693 : i1
    %776 = comb.xor %775, %true : i1
    %777 = comb.and %776, %774 {sv.namehint = "_instType_c_T_224"} : i1
    %778 = comb.or %575, %579, %583, %588, %592, %597, %602, %607, %696, %777 {sv.namehint = "_instType_c_T_238"} : i1
    %779 = comb.xor %702, %true : i1
    %780 = comb.and %779, %778 {sv.namehint = "_instType_c_T_240"} : i1
    %781 = comb.or %555, %704, %780 {sv.namehint = "instType_c_5"} : i1
    %782 = comb.extract %io_if2id_inst from 0 {sv.namehint = "_is_compress_T"} : (i32) -> i2
    %783 = comb.icmp bin eq %782, %c-1_i2 {sv.namehint = "_T_5"} : i2
    %784 = comb.xor bin %783, %true {sv.namehint = "is_compress"} : i1
    %785 = comb.icmp bin eq %451, %c2_i3 {sv.namehint = "_T_13"} : i3
    %786 = comb.extract %io_if2id_inst from 20 {sv.namehint = "_imm_T"} : (i32) -> i12
    %787 = comb.extract %io_if2id_inst from 31 : (i32) -> i1
    %788 = comb.replicate %787 : (i1) -> i52
    %789 = comb.concat %788, %786 : i52, i12
    %790 = comb.extract %io_if2id_inst from 25 {sv.namehint = "imm_hi"} : (i32) -> i7
    %791 = comb.extract %io_if2id_inst from 7 {sv.namehint = "imm_lo"} : (i32) -> i5
    %792 = comb.extract %io_if2id_inst from 31 : (i32) -> i1
    %793 = comb.replicate %792 : (i1) -> i52
    %794 = comb.concat %793, %790, %791 : i52, i7, i5
    %795 = comb.extract %io_if2id_inst from 31 {sv.namehint = "imm_hi_hi_hi"} : (i32) -> i1
    %796 = comb.extract %io_if2id_inst from 7 {sv.namehint = "imm_hi_hi_lo"} : (i32) -> i1
    %797 = comb.extract %io_if2id_inst from 25 {sv.namehint = "imm_hi_lo"} : (i32) -> i6
    %798 = comb.extract %io_if2id_inst from 8 {sv.namehint = "imm_lo_hi"} : (i32) -> i4
    %799 = comb.replicate %795 : (i1) -> i52
    %800 = comb.concat %799, %796, %797, %798, %false : i52, i1, i6, i4, i1
    %801 = comb.extract %io_if2id_inst from 12 {sv.namehint = "imm_hi_2"} : (i32) -> i20
    %802 = comb.extract %io_if2id_inst from 31 : (i32) -> i1
    %803 = comb.replicate %802 : (i1) -> i32
    %804 = comb.concat %803, %801, %c0_i12 : i32, i20, i12
    %805 = comb.extract %io_if2id_inst from 31 {sv.namehint = "imm_hi_hi_hi_1"} : (i32) -> i1
    %806 = comb.extract %io_if2id_inst from 12 {sv.namehint = "imm_hi_hi_lo_1"} : (i32) -> i8
    %807 = comb.extract %io_if2id_inst from 20 {sv.namehint = "imm_hi_lo_1"} : (i32) -> i1
    %808 = comb.extract %io_if2id_inst from 21 {sv.namehint = "imm_lo_hi_1"} : (i32) -> i10
    %809 = comb.replicate %805 : (i1) -> i44
    %810 = comb.concat %809, %806, %807, %808, %false : i44, i8, i1, i10, i1
    %811 = hw.array_create %c0_i64, %810, %804, %800, %794, %789, %c0_i64, %c0_i64 : i64
    %812 = hw.array_get %811[%451] {sv.namehint = "imm"} : !hw.array<8xi64>, i3
    %813 = comb.xor bin %io_if2id_excep_en, %true {sv.namehint = "_T_45"} : i1
    %814 = comb.and bin %5, %783, %813 {sv.namehint = "_T_8"} : i1
    %815 = comb.mux bin %814, %io_if2id_inst, %inst_r : i32
    %816 = comb.mux bin %814, %505, %ctrl_r_aluOp : i5
    %817 = comb.mux bin %814, %509, %ctrl_r_aluWidth : i1
    %818 = comb.mux bin %814, %531, %ctrl_r_dcMode : i5
    %819 = comb.mux bin %814, %538, %ctrl_r_writeRegEn : i1
    %820 = comb.mux bin %814, %546, %ctrl_r_writeCSREn : i1
    %821 = comb.extract %io_if2id_inst from 15 {sv.namehint = "_rs1_d_r_T"} : (i32) -> i5
    %822 = comb.mux bin %814, %821, %rs1_r : i5
    %823 = comb.extract %io_if2id_inst from 20 {sv.namehint = "_rs2_r_T"} : (i32) -> i12
    %824 = comb.extract %io_if2id_inst from 20 {sv.namehint = "_rs2_r_T_1"} : (i32) -> i5
    %825 = comb.concat %c0_i7, %824 : i7, i5
    %826 = comb.mux bin %546, %823, %825 {sv.namehint = "_rs2_r_T_2"} : i12
    %827 = comb.extract %io_if2id_inst from 7 {sv.namehint = "_dst_r_T"} : (i32) -> i5
    %828 = comb.mux bin %814, %827, %dst_r : i5
    %829 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %830 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %831 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %832 = comb.concat %829, %830, %831 : i5, i3, i7
    %833 = comb.icmp bin eq %832, %c3375_i15 {sv.namehint = "_indi_r_T_1"} : i15
    %834 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %835 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %836 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %837 = comb.concat %834, %835, %836 : i5, i3, i7
    %838 = comb.icmp bin eq %837, %c3503_i15 {sv.namehint = "_indi_r_T_3"} : i15
    %839 = comb.or bin %833, %838 {sv.namehint = "indi_r_hi"} : i1
    %840 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %841 = comb.extract %io_if2id_inst from 20 : (i32) -> i5
    %842 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %843 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %844 = comb.concat %840, %841, %842, %843 : i5, i5, i3, i7
    %845 = comb.icmp bin eq %844, %c65839_i20 {sv.namehint = "_indi_r_T_5"} : i20
    %846 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %847 = comb.extract %io_if2id_inst from 20 : (i32) -> i5
    %848 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %849 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %850 = comb.concat %846, %847, %848, %849 : i5, i5, i3, i7
    %851 = comb.icmp bin eq %850, %c65967_i20 {sv.namehint = "_indi_r_T_7"} : i20
    %852 = comb.or bin %845, %851 {sv.namehint = "indi_r_lo"} : i1
    %853 = comb.concat %839, %852 {sv.namehint = "_indi_r_T_8"} : i1, i1
    %854 = comb.mux bin %814, %853, %indi_r : i2
    %855 = comb.icmp bin eq %451, %c-1_i3 {sv.namehint = "_T_9"} : i3
    %856 = comb.and bin %855, %813 {sv.namehint = "_T_11"} : i1
    %857 = comb.mux bin %856, %c2_i64, %io_if2id_excep_cause : i64
    %858 = comb.concat %c0_i32, %io_if2id_inst : i32, i32
    %859 = comb.mux bin %856, %858, %io_if2id_excep_tval : i64
    %860 = comb.mux bin %856, %c0_i2, %io_if2id_excep_etype : i2
    %861 = comb.or %856, %io_if2id_recov : i1
    %862 = comb.icmp bin eq %451, %c1_i3 {sv.namehint = "_T_12"} : i3
    %863 = comb.xor %862, %true : i1
    %864 = comb.concat %c13_i5, %863 : i5, i1
    %865 = comb.and bin %785, %541 : i1
    %866 = comb.concat %false, %865 : i1, i1
    %867 = comb.add %io_if2id_pc, %c4_i64 {sv.namehint = "_rs2_d_r_T_1"} : i64
    %868 = comb.concat %c0_i59, %821 : i59, i5
    %869 = comb.xor %546, %true : i1
    %870 = comb.xor %785, %true : i1
    %871 = comb.or %870, %541, %869 : i1
    %872 = comb.mux bin %871, %rs1_d_r, %868 : i64
    %873 = comb.xor bin %550, %true {sv.namehint = "_rrs1_r_T"} : i1
    %874 = comb.xor %541, %true : i1
    %875 = comb.and %785, %874, %546 : i1
    %876 = comb.xor %541, %true : i1
    %877 = comb.and %785, %876, %546 : i1
    %878 = comb.or %546, %856, %io_if2id_recov : i1
    %879 = comb.xor %785, %true : i1
    %880 = comb.or %879, %541 : i1
    %881 = comb.mux bin %880, %861, %878 : i1
    %882 = comb.xor %546, %true : i1
    %883 = comb.or %541, %882, %873 : i1
    %884 = comb.mux bin %785, %883, %862 : i1
    %885 = comb.mux bin %546, %rs2_d_r, %812 : i64
    %886 = comb.mux bin %541, %867, %885 : i64
    %887 = comb.mux bin %785, %886, %rs2_d_r : i64
    %888 = comb.icmp bin eq %451, %c3_i3 {sv.namehint = "_T_14"} : i3
    %889 = comb.mux bin %888, %c30_i6, %864 : i6
    %890 = comb.mux bin %814, %889, %swap_r : i6
    %891 = comb.or %888, %865 : i1
    %892 = comb.mux bin %891, %812, %dst_d_r : i64
    %893 = comb.icmp bin eq %451, %c-4_i3 {sv.namehint = "_T_15"} : i3
    %894 = comb.or bin %893, %888 : i1
    %895 = comb.or %894, %884 : i1
    %896 = comb.mux bin %814, %895, %rrs1_r : i1
    %897 = comb.or %894, %875, %862 : i1
    %898 = comb.mux bin %814, %897, %rrs2_r : i1
    %899 = comb.add %io_if2id_pc, %812 {sv.namehint = "_dst_d_r_T_4"} : i64
    %900 = comb.mux bin %893, %899, %892 : i64
    %901 = comb.extract %io_if2id_inst from 12 {sv.namehint = "_ctrl_r_brType_T"} : (i32) -> i3
    %902 = comb.and bin %814, %893 : i1
    %903 = comb.mux bin %902, %901, %ctrl_r_brType : i3
    %904 = comb.mux bin %893, %c-2_i2, %866 : i2
    %905 = comb.icmp bin eq %451, %c-3_i3 {sv.namehint = "_T_16"} : i3
    %906 = comb.mux bin %905, %812, %872 : i64
    %907 = comb.mux bin %905, %io_if2id_pc, %887 : i64
    %908 = comb.icmp bin eq %451, %c-2_i3 {sv.namehint = "_T_17"} : i3
    %909 = comb.add %io_if2id_pc, %812 {sv.namehint = "_rs1_d_r_T_4"} : i64
    %910 = comb.mux bin %908, %909, %906 : i64
    %911 = comb.mux bin %814, %910, %rs1_d_r : i64
    %912 = comb.add %io_if2id_pc, %c4_i64 {sv.namehint = "_rs2_d_r_T_4"} : i64
    %913 = comb.mux bin %908, %912, %907 : i64
    %914 = comb.mux bin %814, %913, %rs2_d_r : i64
    %915 = comb.mux bin %908, %c0_i64, %900 : i64
    %916 = comb.mux bin %814, %915, %dst_d_r : i64
    %917 = comb.mux bin %908, %c1_i2, %904 : i2
    %918 = comb.icmp bin eq %io_if2id_inst, %c115_i32 {sv.namehint = "_T_19"} : i32
    %919 = comb.icmp bin eq %io_idState_priv, %c-1_i2 {sv.namehint = "_rs2_r_T_3"} : i2
    %920 = comb.icmp bin eq %io_idState_priv, %c1_i2 {sv.namehint = "_excep_r_cause_T_1"} : i2
    %921 = comb.concat %c-4_i3, %920 {sv.namehint = "_excep_r_cause_T_2"} : i3, i1
    %922 = comb.mux bin %919, %c-5_i4, %921 {sv.namehint = "_excep_r_cause_T_3"} : i4
    %923 = comb.concat %c0_i60, %922 : i60, i4
    %924 = comb.mux bin %918, %923, %857 : i64
    %925 = comb.concat %c0_i2, %919, %c-251_i9 : i2, i1, i9
    %926 = comb.mux bin %918, %925, %826 : i12
    %927 = comb.icmp bin eq %io_if2id_inst, %c270532723_i32 {sv.namehint = "_T_21"} : i32
    %928 = comb.mux bin %927, %c-2_i2, %860 : i2
    %929 = comb.mux bin %927, %c321_i12, %926 : i12
    %930 = comb.icmp bin eq %io_if2id_inst, %c807403635_i32 {sv.namehint = "_T_23"} : i32
    %931 = comb.or bin %930, %927, %918, %856 : i1
    %932 = comb.mux bin %931, %io_if2id_pc, %io_if2id_excep_pc : i64
    %933 = comb.mux bin %814, %932, %excep_r_pc : i64
    %934 = comb.or %931, %io_if2id_excep_en : i1
    %935 = comb.mux bin %814, %934, %excep_r_en : i1
    %936 = comb.mux bin %930, %c-1_i2, %928 : i2
    %937 = comb.mux bin %814, %936, %excep_r_etype : i2
    %938 = comb.or bin %930, %927 : i1
    %939 = comb.mux bin %938, %c0_i64, %924 : i64
    %940 = comb.mux bin %814, %939, %excep_r_cause : i64
    %941 = comb.or bin %930, %927, %918 : i1
    %942 = comb.mux bin %941, %c0_i64, %859 : i64
    %943 = comb.mux bin %814, %942, %excep_r_tval : i64
    %944 = comb.mux bin %941, %c-1_i2, %917 : i2
    %945 = comb.mux bin %814, %944, %jmp_type_r : i2
    %946 = comb.mux bin %930, %c833_i12, %929 : i12
    %947 = comb.mux bin %814, %946, %rs2_r : i12
    %948 = comb.icmp bin eq %io_if2id_inst, %c4111_i32 {sv.namehint = "_T_25"} : i32
    %949 = comb.concat %false, %948 : i1, i1
    %950 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %951 = comb.extract %io_if2id_inst from 0 : (i32) -> i15
    %952 = comb.concat %950, %951 : i7, i15
    %953 = comb.icmp bin eq %952, %c295027_i22 {sv.namehint = "_T_27"} : i22
    %954 = comb.mux bin %953, %c-2_i2, %949 : i2
    %955 = comb.mux bin %814, %954, %special_r : i2
    %956 = comb.or bin %953, %948, %941 : i1
    %957 = comb.or %956, %877, %856 : i1
    %958 = comb.and %814, %957 : i1
    %959 = comb.or %956, %881 : i1
    %960 = comb.mux bin %814, %959, %recov_r : i1
    %961 = comb.extract %io_if2id_inst from 7 {sv.namehint = "imm_c_hi_hi_lo"} : (i32) -> i4
    %962 = comb.extract %io_if2id_inst from 11 {sv.namehint = "imm_c_hi_lo"} : (i32) -> i2
    %963 = comb.extract %io_if2id_inst from 5 {sv.namehint = "imm_c_lo_hi_hi"} : (i32) -> i1
    %964 = comb.extract %io_if2id_inst from 6 {sv.namehint = "imm_c_lo_hi_lo"} : (i32) -> i1
    %965 = comb.concat %c0_i54, %961, %962, %963, %964, %c0_i2 {sv.namehint = "_imm_c_T"} : i54, i4, i2, i1, i1, i2
    %966 = comb.extract %io_if2id_inst from 5 {sv.namehint = "imm_c_hi_hi_lo_1"} : (i32) -> i1
    %967 = comb.extract %io_if2id_inst from 10 {sv.namehint = "imm_c_hi_lo_1"} : (i32) -> i3
    %968 = comb.extract %io_if2id_inst from 6 {sv.namehint = "imm_c_lo_hi_1"} : (i32) -> i1
    %969 = comb.concat %c0_i57, %966, %967, %968, %c0_i2 {sv.namehint = "_imm_c_T_2"} : i57, i1, i3, i1, i2
    %970 = comb.extract %io_if2id_inst from 5 {sv.namehint = "imm_c_hi_lo_2"} : (i32) -> i2
    %971 = comb.extract %io_if2id_inst from 10 {sv.namehint = "imm_c_lo_hi_2"} : (i32) -> i3
    %972 = comb.concat %c0_i56, %970, %971, %c0_i3 {sv.namehint = "_imm_c_T_4"} : i56, i2, i3, i3
    %973 = comb.extract %io_if2id_inst from 12 {sv.namehint = "imm_c_hi_lo_3"} : (i32) -> i1
    %974 = comb.extract %io_if2id_inst from 2 {sv.namehint = "imm_c_lo_3"} : (i32) -> i5
    %975 = comb.concat %c0_i58, %973, %974 {sv.namehint = "_imm_c_T_6"} : i58, i1, i5
    %976 = comb.extract %io_if2id_inst from 12 {sv.namehint = "imm_c_hi_4"} : (i32) -> i1
    %977 = comb.extract %io_if2id_inst from 2 {sv.namehint = "imm_c_lo_4"} : (i32) -> i5
    %978 = comb.replicate %976 : (i1) -> i59
    %979 = comb.concat %978, %977 : i59, i5
    %980 = comb.extract %io_if2id_inst from 2 {sv.namehint = "imm_c_hi_hi_lo_2"} : (i32) -> i2
    %981 = comb.extract %io_if2id_inst from 12 {sv.namehint = "imm_c_hi_lo_4"} : (i32) -> i1
    %982 = comb.extract %io_if2id_inst from 4 {sv.namehint = "imm_c_lo_hi_3"} : (i32) -> i3
    %983 = comb.concat %c0_i56, %980, %981, %982, %c0_i2 {sv.namehint = "_imm_c_T_10"} : i56, i2, i1, i3, i2
    %984 = comb.extract %io_if2id_inst from 2 {sv.namehint = "imm_c_hi_hi_lo_3"} : (i32) -> i3
    %985 = comb.extract %io_if2id_inst from 12 {sv.namehint = "imm_c_hi_lo_5"} : (i32) -> i1
    %986 = comb.extract %io_if2id_inst from 5 {sv.namehint = "imm_c_lo_hi_4"} : (i32) -> i2
    %987 = comb.concat %c0_i55, %984, %985, %986, %c0_i3 {sv.namehint = "_imm_c_T_12"} : i55, i3, i1, i2, i3
    %988 = comb.extract %io_if2id_inst from 12 {sv.namehint = "imm_c_hi_hi_hi"} : (i32) -> i1
    %989 = comb.extract %io_if2id_inst from 3 {sv.namehint = "imm_c_hi_hi_lo_4"} : (i32) -> i2
    %990 = comb.extract %io_if2id_inst from 5 {sv.namehint = "imm_c_hi_lo_6"} : (i32) -> i1
    %991 = comb.extract %io_if2id_inst from 2 {sv.namehint = "imm_c_lo_hi_hi_1"} : (i32) -> i1
    %992 = comb.extract %io_if2id_inst from 6 {sv.namehint = "imm_c_lo_hi_lo_1"} : (i32) -> i1
    %993 = comb.replicate %988 : (i1) -> i55
    %994 = comb.concat %993, %989, %990, %991, %992, %c0_i4 : i55, i2, i1, i1, i1, i4
    %995 = comb.extract %io_if2id_inst from 12 {sv.namehint = "imm_c_hi_hi_5"} : (i32) -> i1
    %996 = comb.extract %io_if2id_inst from 2 {sv.namehint = "imm_c_hi_lo_7"} : (i32) -> i5
    %997 = comb.replicate %995 : (i1) -> i47
    %998 = comb.concat %997, %996, %c0_i12 : i47, i5, i12
    %999 = comb.extract %io_if2id_inst from 12 {sv.namehint = "imm_c_hi_hi_hi_hi"} : (i32) -> i1
    %1000 = comb.extract %io_if2id_inst from 8 {sv.namehint = "imm_c_hi_hi_hi_lo"} : (i32) -> i1
    %1001 = comb.extract %io_if2id_inst from 9 {sv.namehint = "imm_c_hi_hi_lo_5"} : (i32) -> i2
    %1002 = comb.extract %io_if2id_inst from 6 {sv.namehint = "imm_c_hi_lo_hi"} : (i32) -> i1
    %1003 = comb.extract %io_if2id_inst from 7 {sv.namehint = "imm_c_hi_lo_lo"} : (i32) -> i1
    %1004 = comb.extract %io_if2id_inst from 2 {sv.namehint = "imm_c_lo_hi_hi_2"} : (i32) -> i1
    %1005 = comb.extract %io_if2id_inst from 11 {sv.namehint = "imm_c_lo_hi_lo_2"} : (i32) -> i1
    %1006 = comb.extract %io_if2id_inst from 3 {sv.namehint = "imm_c_lo_lo_hi"} : (i32) -> i3
    %1007 = comb.replicate %999 : (i1) -> i53
    %1008 = comb.concat %1007, %1000, %1001, %1002, %1003, %1004, %1005, %1006, %false : i53, i1, i2, i1, i1, i1, i1, i3, i1
    %1009 = comb.extract %io_if2id_inst from 12 {sv.namehint = "imm_c_hi_hi_hi_2"} : (i32) -> i1
    %1010 = comb.extract %io_if2id_inst from 5 {sv.namehint = "imm_c_hi_hi_lo_6"} : (i32) -> i2
    %1011 = comb.extract %io_if2id_inst from 2 {sv.namehint = "imm_c_hi_lo_9"} : (i32) -> i1
    %1012 = comb.extract %io_if2id_inst from 10 {sv.namehint = "imm_c_lo_hi_hi_3"} : (i32) -> i2
    %1013 = comb.extract %io_if2id_inst from 3 {sv.namehint = "imm_c_lo_hi_lo_3"} : (i32) -> i2
    %1014 = comb.replicate %1009 : (i1) -> i56
    %1015 = comb.concat %1014, %1010, %1011, %1012, %1013, %false : i56, i2, i1, i2, i2, i1
    %1016 = comb.extract %io_if2id_inst from 7 {sv.namehint = "imm_c_hi_lo_10"} : (i32) -> i2
    %1017 = comb.extract %io_if2id_inst from 9 {sv.namehint = "imm_c_lo_hi_8"} : (i32) -> i4
    %1018 = comb.concat %c0_i56, %1016, %1017, %c0_i2 {sv.namehint = "_imm_c_T_22"} : i56, i2, i4, i2
    %1019 = comb.extract %io_if2id_inst from 7 {sv.namehint = "imm_c_hi_lo_11"} : (i32) -> i3
    %1020 = comb.extract %io_if2id_inst from 10 {sv.namehint = "imm_c_lo_hi_9"} : (i32) -> i3
    %1021 = comb.concat %c0_i55, %1019, %1020, %c0_i3 {sv.namehint = "_imm_c_T_24"} : i55, i3, i3, i3
    %1022 = hw.array_create %c0_i64, %c0_i64, %1021, %1018, %1015, %1008, %998, %994, %987, %983, %979, %975, %972, %969, %965, %c0_i64 : i64
    %1023 = hw.array_get %1022[%727] {sv.namehint = "imm_c"} : !hw.array<16xi64>, i4
    %1024 = comb.and bin %5, %784, %813 {sv.namehint = "_T_43"} : i1
    %1025 = comb.concat %c0_i16, %551 : i16, i16
    %1026 = comb.mux bin %1024, %1025, %815 : i32
    %1027 = comb.mux bin %1024, %750, %816 : i5
    %1028 = comb.mux bin %1024, %758, %817 : i1
    %1029 = comb.mux bin %1024, %770, %818 : i5
    %1030 = comb.mux bin %1024, %781, %819 : i1
    %1031 = comb.extract %io_if2id_inst from 7 {sv.namehint = "_dst_r_T_1"} : (i32) -> i5
    %1032 = comb.extract %io_if2id_inst from 2 {sv.namehint = "_rs2_r_T_6"} : (i32) -> i5
    %1033 = comb.concat %c0_i7, %1032 : i7, i5
    %1034 = comb.icmp bin eq %706, %c0_i4 {sv.namehint = "_T_44"} : i4
    %1035 = comb.and bin %1034, %813 {sv.namehint = "_T_46"} : i1
    %1036 = comb.or %1035, %io_if2id_excep_en : i1
    %1037 = comb.mux bin %1024, %1036, %935 : i1
    %1038 = comb.mux bin %1035, %c2_i64, %io_if2id_excep_cause : i64
    %1039 = comb.mux bin %1024, %1038, %940 : i64
    %1040 = comb.concat %c0_i48, %551 : i48, i16
    %1041 = comb.mux bin %1035, %1040, %io_if2id_excep_tval : i64
    %1042 = comb.mux bin %1024, %1041, %943 : i64
    %1043 = comb.mux bin %1035, %io_if2id_pc, %io_if2id_excep_pc : i64
    %1044 = comb.mux bin %1024, %1043, %933 : i64
    %1045 = comb.mux bin %1035, %c0_i2, %io_if2id_excep_etype : i2
    %1046 = comb.mux bin %1024, %1045, %937 : i2
    %1047 = comb.and bin %1024, %1035 : i1
    %1048 = comb.or %1047, %958 : i1
    %1049 = comb.or %1035, %io_if2id_recov : i1
    %1050 = comb.mux bin %1024, %1049, %960 : i1
    %1051 = comb.icmp bin eq %706, %c1_i4 {sv.namehint = "_T_47"} : i4
    %1052 = comb.extract %io_if2id_inst from 12 : (i32) -> i4
    %1053 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %1054 = comb.concat %1052, %1053 : i4, i7
    %1055 = comb.icmp bin eq %1054, %c-1022_i11 {sv.namehint = "_T_49"} : i11
    %1056 = comb.extract %io_if2id_inst from 12 : (i32) -> i4
    %1057 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %1058 = comb.concat %1056, %1057 : i4, i7
    %1059 = comb.icmp bin eq %1058, %c-894_i11 {sv.namehint = "_T_51"} : i11
    %1060 = comb.or bin %1059, %1055 : i1
    %1061 = comb.and bin %1051, %1060 : i1
    %1062 = comb.concat %false, %1061 : i1, i1
    %1063 = comb.xor bin %1059, %true : i1
    %1064 = comb.and %1051, %1063 : i1
    %1065 = comb.add %io_if2id_pc, %c2_i64 {sv.namehint = "_rs2_d_r_T_6"} : i64
    %1066 = comb.and bin %1051, %1059 : i1
    %1067 = comb.mux bin %1066, %1065, %914 : i64
    %1068 = comb.mux bin %1061, %c0_i64, %916 : i64
    %1069 = comb.mux bin %1066, %c1_i5, %1031 : i5
    %1070 = comb.icmp bin eq %706, %c2_i4 {sv.namehint = "_T_52"} : i4
    %1071 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %1072 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %1073 = comb.concat %1071, %1072 : i3, i2
    %1074 = comb.icmp bin eq %1073, %c10_i5 {sv.namehint = "_T_54"} : i5
    %1075 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %1076 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %1077 = comb.concat %1075, %1076 : i3, i2
    %1078 = comb.icmp bin eq %1077, %c14_i5 {sv.namehint = "_T_56"} : i5
    %1079 = comb.or bin %1074, %1078 {sv.namehint = "_T_57"} : i1
    %1080 = comb.and bin %1070, %1079 : i1
    %1081 = comb.icmp bin eq %706, %c3_i4 {sv.namehint = "_T_58"} : i4
    %1082 = comb.icmp bin eq %706, %c4_i4 {sv.namehint = "_T_59"} : i4
    %1083 = comb.or bin %1082, %1081, %1080 : i1
    %1084 = comb.mux bin %1083, %c2_i5, %1031 : i5
    %1085 = comb.extract %io_if2id_inst from 2 {sv.namehint = "dst_r_lo"} : (i32) -> i3
    %1086 = comb.concat %c1_i2, %1085 : i2, i3
    %1087 = comb.mux bin %1082, %1086, %1069 : i5
    %1088 = comb.icmp bin eq %706, %c5_i4 {sv.namehint = "_T_60"} : i4
    %1089 = comb.extract %io_if2id_inst from 7 {sv.namehint = "rs1_r_lo"} : (i32) -> i3
    %1090 = comb.concat %c1_i2, %1089 : i2, i3
    %1091 = comb.mux bin %1088, %1090, %1084 : i5
    %1092 = comb.or %1088, %1082, %1070 : i1
    %1093 = comb.mux bin %1092, %1023, %1067 : i64
    %1094 = comb.extract %io_if2id_inst from 2 {sv.namehint = "dst_r_lo_1"} : (i32) -> i3
    %1095 = comb.concat %c1_i2, %1094 : i2, i3
    %1096 = comb.mux bin %1088, %1095, %1087 : i5
    %1097 = comb.icmp bin eq %706, %c6_i4 {sv.namehint = "_T_61"} : i4
    %1098 = comb.extract %io_if2id_inst from 7 {sv.namehint = "rs1_r_lo_1"} : (i32) -> i3
    %1099 = comb.concat %c1_i2, %1098 : i2, i3
    %1100 = comb.mux bin %1097, %1099, %1091 : i5
    %1101 = comb.or %1097, %1081, %1064 : i1
    %1102 = comb.mux bin %1024, %1101, %898 : i1
    %1103 = comb.extract %io_if2id_inst from 2 {sv.namehint = "rs2_r_lo"} : (i32) -> i3
    %1104 = comb.concat %c1_i9, %1103 : i9, i3
    %1105 = comb.mux bin %1097, %1104, %1033 : i12
    %1106 = comb.mux bin %1024, %1105, %947 : i12
    %1107 = comb.or %1097, %1081 : i1
    %1108 = comb.mux bin %1107, %1023, %1068 : i64
    %1109 = comb.concat %c1_i2, %1098 : i2, i3
    %1110 = comb.mux bin %1097, %1109, %1096 : i5
    %1111 = comb.extract %io_if2id_inst from 0 {sv.namehint = "_T_62"} : (i32) -> i2
    %1112 = comb.icmp bin eq %1111, %c0_i2 {sv.namehint = "_T_63"} : i2
    %1113 = comb.and %1097, %1112 : i1
    %1114 = comb.or %1113, %1081 : i1
    %1115 = comb.mux bin %1114, %c30_i6, %c27_i6 : i6
    %1116 = comb.mux bin %1024, %1115, %890 : i6
    %1117 = comb.icmp bin eq %706, %c7_i4 {sv.namehint = "_T_64"} : i4
    %1118 = comb.or %1117, %1097, %1088, %1082, %1081, %1070, %1051 : i1
    %1119 = comb.mux bin %1024, %1118, %896 : i1
    %1120 = comb.extract %io_if2id_inst from 7 {sv.namehint = "rs1_r_lo_2"} : (i32) -> i3
    %1121 = comb.concat %c1_i2, %1120 : i2, i3
    %1122 = comb.mux bin %1117, %1121, %1100 : i5
    %1123 = comb.mux bin %1024, %1122, %822 : i5
    %1124 = comb.add %io_if2id_pc, %1023 {sv.namehint = "_dst_d_r_T_11"} : i64
    %1125 = comb.mux bin %1117, %1124, %1108 : i64
    %1126 = comb.concat %c1_i2, %1120 : i2, i3
    %1127 = comb.mux bin %1117, %1126, %1110 : i5
    %1128 = comb.mux bin %1024, %1127, %828 : i5
    %1129 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %1130 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %1131 = comb.concat %1129, %1130 : i3, i2
    %1132 = comb.icmp bin eq %1131, %c-7_i5 {sv.namehint = "_T_66"} : i5
    %1133 = comb.mux bin %1132, %c0_i3, %903 : i3
    %1134 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %1135 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %1136 = comb.concat %1134, %1135 : i3, i2
    %1137 = comb.icmp bin eq %1136, %c-3_i5 {sv.namehint = "_T_68"} : i5
    %1138 = comb.mux bin %1137, %c1_i3, %1133 : i3
    %1139 = comb.and bin %1024, %1117 : i1
    %1140 = comb.mux bin %1139, %1138, %903 : i3
    %1141 = comb.or bin %1137, %1132 : i1
    %1142 = comb.mux bin %1141, %c0_i64, %1023 : i64
    %1143 = comb.mux bin %1117, %1142, %1093 : i64
    %1144 = comb.mux bin %1024, %1143, %914 : i64
    %1145 = comb.and bin %1117, %1141 : i1
    %1146 = comb.mux bin %1145, %c-2_i2, %1062 : i2
    %1147 = comb.icmp bin eq %706, %c-8_i4 {sv.namehint = "_T_69"} : i4
    %1148 = comb.and bin %1024, %1147 : i1
    %1149 = comb.mux bin %1148, %io_if2id_pc, %911 : i64
    %1150 = comb.mux bin %1147, %1023, %1125 : i64
    %1151 = comb.mux bin %1024, %1150, %916 : i64
    %1152 = comb.mux bin %1147, %c1_i2, %1146 : i2
    %1153 = comb.mux bin %1024, %1152, %945 : i2
    %1154 = comb.and bin %5, %io_if2id_excep_en {sv.namehint = "_T_70"} : i1
    %1155 = comb.mux bin %1154, %io_if2id_inst, %1026 : i32
    %1156 = comb.or bin %1154, %1024, %814 : i1
    %1157 = comb.mux bin %1156, %io_if2id_pc, %pc_r : i64
    %1158 = comb.mux bin %1154, %io_if2id_excep_etype, %1046 : i2
    %1159 = comb.mux bin %1154, %io_if2id_excep_pc, %1044 : i64
    %1160 = comb.mux bin %1154, %io_if2id_excep_en, %1037 : i1
    %1161 = comb.mux bin %1154, %io_if2id_excep_tval, %1042 : i64
    %1162 = comb.mux bin %1154, %io_if2id_excep_cause, %1039 : i64
    %1163 = comb.mux bin %1154, %c0_i3, %1140 : i3
    %1164 = comb.or bin %1154, %1024 : i1
    %1165 = comb.xor %1164, %true : i1
    %1166 = comb.and %1165, %820 : i1
    %1167 = comb.xor %1154, %true : i1
    %1168 = comb.and %1167, %1030 : i1
    %1169 = comb.mux bin %1154, %c0_i5, %1029 : i5
    %1170 = comb.xor %1154, %true : i1
    %1171 = comb.and %1170, %1028 : i1
    %1172 = comb.mux bin %1154, %c0_i5, %1027 : i5
    %1173 = comb.xor %1154, %true : i1
    %1174 = comb.and %1173, %1119 : i1
    %1175 = comb.xor %1154, %true : i1
    %1176 = comb.and %1175, %1102 : i1
    %1177 = comb.mux bin %1154, %c0_i2, %1153 : i2
    %1178 = comb.mux bin %1164, %c0_i2, %955 : i2
    %1179 = comb.mux bin %1164, %c0_i2, %854 : i2
    %1180 = comb.mux bin %1154, %c27_i6, %1116 : i6
    %1181 = comb.mux bin %1154, %io_if2id_recov, %1050 : i1
    %1182 = comb.xor bin %0, %true {sv.namehint = "_T_71"} : i1
    %1183 = comb.xor bin %4, %true {sv.namehint = "_T_72"} : i1
    %1184 = comb.and bin %valid_r, %1183 {sv.namehint = "_T_73"} : i1
    %1185 = comb.xor %1184, %true : i1
    %1186 = comb.and %1182, %1185, %io_if2id_valid {sv.namehint = ".io_if2id_ready.output"} : i1
    %1187 = comb.xor %4, %true : i1
    %1188 = comb.and %1187, %valid_r : i1
    %1189 = comb.or %5, %1188 : i1
    %1190 = comb.and %1, %1189 : i1
    hw.output %0, %3, %1186, %inst_r, %pc_r, %excep_r_cause, %excep_r_tval, %excep_r_en, %excep_r_pc, %excep_r_etype, %ctrl_r_aluOp, %ctrl_r_aluWidth, %ctrl_r_dcMode, %ctrl_r_writeRegEn, %ctrl_r_writeCSREn, %ctrl_r_brType, %rs1_r, %rrs1_r, %rs1_d_r, %rs2_r, %rrs2_r, %rs2_d_r, %dst_r, %dst_d_r, %jmp_type_r, %special_r, %swap_r, %indi_r, %recov_r, %valid_r : i1, i1, i1, i32, i64, i64, i64, i1, i64, i2, i5, i1, i5, i1, i1, i3, i5, i1, i64, i12, i1, i64, i5, i64, i2, i2, i6, i2, i1, i1
  }
  hw.module private @Forwarding(%clock: i1, %reset: i1, %io_id2df_inst: i32, %io_id2df_pc: i64, %io_id2df_excep_cause: i64, %io_id2df_excep_tval: i64, %io_id2df_excep_en: i1, %io_id2df_excep_pc: i64, %io_id2df_excep_etype: i2, %io_id2df_ctrl_aluOp: i5, %io_id2df_ctrl_aluWidth: i1, %io_id2df_ctrl_dcMode: i5, %io_id2df_ctrl_writeRegEn: i1, %io_id2df_ctrl_writeCSREn: i1, %io_id2df_ctrl_brType: i3, %io_id2df_rs1: i5, %io_id2df_rrs1: i1, %io_id2df_rs1_d: i64, %io_id2df_rs2: i12, %io_id2df_rrs2: i1, %io_id2df_rs2_d: i64, %io_id2df_dst: i5, %io_id2df_dst_d: i64, %io_id2df_jmp_type: i2, %io_id2df_special: i2, %io_id2df_swap: i6, %io_id2df_indi: i2, %io_id2df_recov: i1, %io_id2df_valid: i1, %io_df2rr_drop: i1, %io_df2rr_stall: i1, %io_df2rr_ready: i1, %io_d_rr_id: i5, %io_d_rr_data: i64, %io_d_rr_state: i2, %io_d_ex_id: i5, %io_d_ex_data: i64, %io_d_ex_state: i2, %io_d_mem1_id: i5, %io_d_mem1_data: i64, %io_d_mem1_state: i2, %io_d_mem2_id: i5, %io_d_mem2_data: i64, %io_d_mem2_state: i2, %io_d_mem3_id: i5, %io_d_mem3_data: i64, %io_d_mem3_state: i2) -> (io_id2df_drop: i1, io_id2df_stall: i1, io_id2df_ready: i1, io_df2rr_inst: i32, io_df2rr_pc: i64, io_df2rr_excep_cause: i64, io_df2rr_excep_tval: i64, io_df2rr_excep_en: i1, io_df2rr_excep_pc: i64, io_df2rr_excep_etype: i2, io_df2rr_ctrl_aluOp: i5, io_df2rr_ctrl_aluWidth: i1, io_df2rr_ctrl_dcMode: i5, io_df2rr_ctrl_writeRegEn: i1, io_df2rr_ctrl_writeCSREn: i1, io_df2rr_ctrl_brType: i3, io_df2rr_rs1: i5, io_df2rr_rrs1: i1, io_df2rr_rs1_d: i64, io_df2rr_rs2: i12, io_df2rr_rrs2: i1, io_df2rr_rs2_d: i64, io_df2rr_dst: i5, io_df2rr_dst_d: i64, io_df2rr_jmp_type: i2, io_df2rr_special: i2, io_df2rr_swap: i6, io_df2rr_indi: i2, io_df2rr_recov: i1, io_df2rr_valid: i1) {
    %true = hw.constant true
    %c0_i7 = hw.constant 0 : i7
    %c0_i32 = hw.constant 0 : i32
    %c0_i12 = hw.constant 0 : i12
    %c0_i6 = hw.constant 0 : i6
    %c1_i2 = hw.constant 1 : i2
    %c0_i2 = hw.constant 0 : i2
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %c0_i5 = hw.constant 0 : i5
    %c0_i64 = hw.constant 0 : i64
    %0 = comb.xor bin %io_df2rr_drop, %true {sv.namehint = "_T_52"} : i1
    %inst_r = seq.firreg %125 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 2 : ui64} : i32
    %pc_r = seq.firreg %126 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 34 : ui64} : i64
    %excep_r_cause = seq.firreg %131 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 98 : ui64} : i64
    %excep_r_tval = seq.firreg %130 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 162 : ui64} : i64
    %excep_r_en = seq.firreg %129 clock %clock reset sync %reset, %false {firrtl.random_init_start = 226 : ui64} : i1
    %excep_r_pc = seq.firreg %128 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 227 : ui64} : i64
    %excep_r_etype = seq.firreg %127 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 291 : ui64} : i2
    %ctrl_r_aluOp = seq.firreg %137 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 293 : ui64} : i5
    %ctrl_r_aluWidth = seq.firreg %136 clock %clock reset sync %reset, %false {firrtl.random_init_start = 298 : ui64} : i1
    %ctrl_r_dcMode = seq.firreg %135 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 299 : ui64} : i5
    %ctrl_r_writeRegEn = seq.firreg %134 clock %clock reset sync %reset, %false {firrtl.random_init_start = 304 : ui64} : i1
    %ctrl_r_writeCSREn = seq.firreg %133 clock %clock reset sync %reset, %false {firrtl.random_init_start = 305 : ui64} : i1
    %ctrl_r_brType = seq.firreg %132 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 306 : ui64} : i3
    %rs1_r = seq.firreg %138 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 309 : ui64} : i5
    %rrs1_r = seq.firreg %154 clock %clock reset sync %reset, %false {firrtl.random_init_start = 314 : ui64} : i1
    %rs1_d_r = seq.firreg %155 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 315 : ui64} : i64
    %rs2_r = seq.firreg %141 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 379 : ui64} : i12
    %rrs2_r = seq.firreg %158 clock %clock reset sync %reset, %false {firrtl.random_init_start = 391 : ui64} : i1
    %rs2_d_r = seq.firreg %159 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 392 : ui64} : i64
    %dst_r = seq.firreg %144 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 456 : ui64} : i5
    %dst_d_r = seq.firreg %145 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 461 : ui64} : i64
    %jmp_type_r = seq.firreg %146 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 525 : ui64} : i2
    %special_r = seq.firreg %147 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 527 : ui64} : i2
    %indi_r = seq.firreg %148 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 529 : ui64} : i2
    %swap_r = seq.firreg %149 clock %clock reset sync %reset, %c0_i6 {firrtl.random_init_start = 531 : ui64} : i6
    %recov_r = seq.firreg %150 clock %clock reset sync %reset, %false {firrtl.random_init_start = 537 : ui64} : i1
    %valid_r = seq.firreg %186 clock %clock reset sync %reset, %false {firrtl.random_init_start = 538 : ui64, sv.namehint = ".io_df2rr_valid.output"} : i1
    %pre_dst = seq.firreg %160 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 539 : ui64} : i5
    %pre_wr = seq.firreg %163 clock %clock reset sync %reset, %false {firrtl.random_init_start = 544 : ui64} : i1
    %state = seq.firreg %185 clock %clock reset sync %reset, %false {firrtl.random_init_start = 545 : ui64} : i1
    %1 = comb.and bin %168, %io_id2df_valid {sv.namehint = "hs_in"} : i1
    %2 = comb.and bin %io_df2rr_ready, %valid_r {sv.namehint = "hs_out"} : i1
    %3 = comb.mux bin %1, %io_id2df_rs1, %rs1_r {sv.namehint = "cur_rs1"} : i5
    %4 = comb.mux bin %1, %io_id2df_rrs1, %rrs1_r {sv.namehint = "cur_rrs1"} : i1
    %5 = comb.mux bin %1, %io_id2df_rs2, %rs2_r {sv.namehint = "cur_rs2"} : i12
    %6 = comb.mux bin %1, %io_id2df_rrs2, %rrs2_r {sv.namehint = "cur_rrs2"} : i1
    %7 = comb.icmp bin eq %3, %c0_i5 {sv.namehint = "_T"} : i5
    %8 = comb.icmp bin eq %3, %pre_dst {sv.namehint = "_T_2"} : i5
    %9 = comb.and bin %valid_r, %pre_wr, %8 {sv.namehint = "_T_3"} : i1
    %10 = comb.icmp bin eq %3, %io_d_rr_id {sv.namehint = "_T_4"} : i5
    %11 = comb.icmp bin ne %io_d_rr_state, %c0_i2 {sv.namehint = "_T_5"} : i2
    %12 = comb.and bin %10, %11 {sv.namehint = "_T_6"} : i1
    %13 = comb.icmp bin eq %io_d_rr_state, %c1_i2 {sv.namehint = "_T_7"} : i2
    %14 = comb.mux bin %13, %io_d_rr_data, %c0_i64 : i64
    %15 = comb.xor bin %13, %true : i1
    %16 = comb.icmp bin eq %3, %io_d_ex_id {sv.namehint = "_T_8"} : i5
    %17 = comb.icmp bin ne %io_d_ex_state, %c0_i2 {sv.namehint = "_T_9"} : i2
    %18 = comb.and bin %16, %17 {sv.namehint = "_T_10"} : i1
    %19 = comb.icmp bin eq %io_d_ex_state, %c1_i2 {sv.namehint = "_T_11"} : i2
    %20 = comb.mux bin %19, %io_d_ex_data, %c0_i64 : i64
    %21 = comb.xor bin %19, %true : i1
    %22 = comb.icmp bin eq %3, %io_d_mem1_id {sv.namehint = "_T_12"} : i5
    %23 = comb.icmp bin ne %io_d_mem1_state, %c0_i2 {sv.namehint = "_T_13"} : i2
    %24 = comb.and bin %22, %23 {sv.namehint = "_T_14"} : i1
    %25 = comb.icmp bin eq %io_d_mem1_state, %c1_i2 {sv.namehint = "_T_15"} : i2
    %26 = comb.mux bin %25, %io_d_mem1_data, %c0_i64 : i64
    %27 = comb.xor bin %25, %true : i1
    %28 = comb.icmp bin eq %3, %io_d_mem2_id {sv.namehint = "_T_16"} : i5
    %29 = comb.icmp bin ne %io_d_mem2_state, %c0_i2 {sv.namehint = "_T_17"} : i2
    %30 = comb.and bin %28, %29 {sv.namehint = "_T_18"} : i1
    %31 = comb.icmp bin eq %io_d_mem2_state, %c1_i2 {sv.namehint = "_T_19"} : i2
    %32 = comb.mux bin %31, %io_d_mem2_data, %c0_i64 : i64
    %33 = comb.xor bin %31, %true : i1
    %34 = comb.icmp bin eq %3, %io_d_mem3_id {sv.namehint = "_T_20"} : i5
    %35 = comb.icmp bin ne %io_d_mem3_state, %c0_i2 {sv.namehint = "_T_21"} : i2
    %36 = comb.and bin %34, %35 {sv.namehint = "_T_22"} : i1
    %37 = comb.icmp bin eq %io_d_mem3_state, %c1_i2 {sv.namehint = "_T_23"} : i2
    %38 = comb.and bin %36, %37 : i1
    %39 = comb.mux bin %38, %io_d_mem3_data, %c0_i64 : i64
    %40 = comb.mux bin %30, %32, %39 : i64
    %41 = comb.mux bin %24, %26, %40 : i64
    %42 = comb.mux bin %18, %20, %41 : i64
    %43 = comb.mux bin %12, %14, %42 : i64
    %44 = comb.or bin %7, %9 : i1
    %45 = comb.xor %4, %true : i1
    %46 = comb.or %45, %44 : i1
    %47 = comb.mux bin %46, %c0_i64, %43 {sv.namehint = "rs1_data"} : i64
    %48 = comb.and %36, %37 : i1
    %49 = comb.mux bin %30, %31, %48 : i1
    %50 = comb.mux bin %24, %25, %49 : i1
    %51 = comb.mux bin %18, %19, %50 : i1
    %52 = comb.mux bin %12, %13, %51 : i1
    %53 = comb.xor %44, %true : i1
    %54 = comb.xor bin %37, %true : i1
    %55 = comb.and %36, %54 : i1
    %56 = comb.mux bin %30, %33, %55 : i1
    %57 = comb.mux bin %24, %27, %56 : i1
    %58 = comb.mux bin %18, %21, %57 : i1
    %59 = comb.mux bin %12, %15, %58 : i1
    %60 = comb.or %9, %59 : i1
    %61 = comb.xor %7, %true : i1
    %62 = comb.and %4, %61, %60 {sv.namehint = "rs1_wait"} : i1
    %63 = comb.icmp bin eq %5, %c0_i12 {sv.namehint = "_T_24"} : i12
    %64 = comb.concat %c0_i7, %pre_dst : i7, i5
    %65 = comb.icmp bin eq %5, %64 {sv.namehint = "_T_26"} : i12
    %66 = comb.and bin %valid_r, %pre_wr, %65 {sv.namehint = "_T_27"} : i1
    %67 = comb.concat %c0_i7, %io_d_rr_id : i7, i5
    %68 = comb.icmp bin eq %5, %67 {sv.namehint = "_T_28"} : i12
    %69 = comb.icmp bin ne %io_d_rr_state, %c0_i2 {sv.namehint = "_T_29"} : i2
    %70 = comb.and bin %68, %69 {sv.namehint = "_T_30"} : i1
    %71 = comb.icmp bin eq %io_d_rr_state, %c1_i2 {sv.namehint = "_T_31"} : i2
    %72 = comb.mux bin %71, %io_d_rr_data, %c0_i64 : i64
    %73 = comb.xor bin %71, %true : i1
    %74 = comb.concat %c0_i7, %io_d_ex_id : i7, i5
    %75 = comb.icmp bin eq %5, %74 {sv.namehint = "_T_32"} : i12
    %76 = comb.icmp bin ne %io_d_ex_state, %c0_i2 {sv.namehint = "_T_33"} : i2
    %77 = comb.and bin %75, %76 {sv.namehint = "_T_34"} : i1
    %78 = comb.icmp bin eq %io_d_ex_state, %c1_i2 {sv.namehint = "_T_35"} : i2
    %79 = comb.mux bin %78, %io_d_ex_data, %c0_i64 : i64
    %80 = comb.xor bin %78, %true : i1
    %81 = comb.concat %c0_i7, %io_d_mem1_id : i7, i5
    %82 = comb.icmp bin eq %5, %81 {sv.namehint = "_T_36"} : i12
    %83 = comb.icmp bin ne %io_d_mem1_state, %c0_i2 {sv.namehint = "_T_37"} : i2
    %84 = comb.and bin %82, %83 {sv.namehint = "_T_38"} : i1
    %85 = comb.icmp bin eq %io_d_mem1_state, %c1_i2 {sv.namehint = "_T_39"} : i2
    %86 = comb.mux bin %85, %io_d_mem1_data, %c0_i64 : i64
    %87 = comb.xor bin %85, %true : i1
    %88 = comb.concat %c0_i7, %io_d_mem2_id : i7, i5
    %89 = comb.icmp bin eq %5, %88 {sv.namehint = "_T_40"} : i12
    %90 = comb.icmp bin ne %io_d_mem2_state, %c0_i2 {sv.namehint = "_T_41"} : i2
    %91 = comb.and bin %89, %90 {sv.namehint = "_T_42"} : i1
    %92 = comb.icmp bin eq %io_d_mem2_state, %c1_i2 {sv.namehint = "_T_43"} : i2
    %93 = comb.mux bin %92, %io_d_mem2_data, %c0_i64 : i64
    %94 = comb.xor bin %92, %true : i1
    %95 = comb.concat %c0_i7, %io_d_mem3_id : i7, i5
    %96 = comb.icmp bin eq %5, %95 {sv.namehint = "_T_44"} : i12
    %97 = comb.icmp bin ne %io_d_mem3_state, %c0_i2 {sv.namehint = "_T_45"} : i2
    %98 = comb.and bin %96, %97 {sv.namehint = "_T_46"} : i1
    %99 = comb.icmp bin eq %io_d_mem3_state, %c1_i2 {sv.namehint = "_T_47"} : i2
    %100 = comb.and bin %98, %99 : i1
    %101 = comb.mux bin %100, %io_d_mem3_data, %c0_i64 : i64
    %102 = comb.mux bin %91, %93, %101 : i64
    %103 = comb.mux bin %84, %86, %102 : i64
    %104 = comb.mux bin %77, %79, %103 : i64
    %105 = comb.mux bin %70, %72, %104 : i64
    %106 = comb.or bin %63, %66 : i1
    %107 = comb.xor %6, %true : i1
    %108 = comb.or %107, %106 : i1
    %109 = comb.mux bin %108, %c0_i64, %105 {sv.namehint = "rs2_data"} : i64
    %110 = comb.and %98, %99 : i1
    %111 = comb.mux bin %91, %92, %110 : i1
    %112 = comb.mux bin %84, %85, %111 : i1
    %113 = comb.mux bin %77, %78, %112 : i1
    %114 = comb.mux bin %70, %71, %113 : i1
    %115 = comb.xor %106, %true : i1
    %116 = comb.xor bin %99, %true : i1
    %117 = comb.and %98, %116 : i1
    %118 = comb.mux bin %91, %94, %117 : i1
    %119 = comb.mux bin %84, %87, %118 : i1
    %120 = comb.mux bin %77, %80, %119 : i1
    %121 = comb.mux bin %70, %73, %120 : i1
    %122 = comb.or %66, %121 : i1
    %123 = comb.xor %63, %true : i1
    %124 = comb.and %6, %123, %122 {sv.namehint = "rs2_wait"} : i1
    %125 = comb.mux bin %1, %io_id2df_inst, %inst_r : i32
    %126 = comb.mux bin %1, %io_id2df_pc, %pc_r : i64
    %127 = comb.mux bin %1, %io_id2df_excep_etype, %excep_r_etype : i2
    %128 = comb.mux bin %1, %io_id2df_excep_pc, %excep_r_pc : i64
    %129 = comb.mux bin %1, %io_id2df_excep_en, %excep_r_en : i1
    %130 = comb.mux bin %1, %io_id2df_excep_tval, %excep_r_tval : i64
    %131 = comb.mux bin %1, %io_id2df_excep_cause, %excep_r_cause : i64
    %132 = comb.mux bin %1, %io_id2df_ctrl_brType, %ctrl_r_brType : i3
    %133 = comb.mux bin %1, %io_id2df_ctrl_writeCSREn, %ctrl_r_writeCSREn : i1
    %134 = comb.mux bin %1, %io_id2df_ctrl_writeRegEn, %ctrl_r_writeRegEn : i1
    %135 = comb.mux bin %1, %io_id2df_ctrl_dcMode, %ctrl_r_dcMode : i5
    %136 = comb.mux bin %1, %io_id2df_ctrl_aluWidth, %ctrl_r_aluWidth : i1
    %137 = comb.mux bin %1, %io_id2df_ctrl_aluOp, %ctrl_r_aluOp : i5
    %138 = comb.mux bin %1, %io_id2df_rs1, %rs1_r : i5
    %139 = comb.mux bin %1, %io_id2df_rrs1, %rrs1_r : i1
    %140 = comb.mux bin %1, %io_id2df_rs1_d, %rs1_d_r : i64
    %141 = comb.mux bin %1, %io_id2df_rs2, %rs2_r : i12
    %142 = comb.mux bin %1, %io_id2df_rrs2, %rrs2_r : i1
    %143 = comb.mux bin %1, %io_id2df_rs2_d, %rs2_d_r : i64
    %144 = comb.mux bin %1, %io_id2df_dst, %dst_r : i5
    %145 = comb.mux bin %1, %io_id2df_dst_d, %dst_d_r : i64
    %146 = comb.mux bin %1, %io_id2df_jmp_type, %jmp_type_r : i2
    %147 = comb.mux bin %1, %io_id2df_special, %special_r : i2
    %148 = comb.mux bin %1, %io_id2df_indi, %indi_r : i2
    %149 = comb.mux bin %1, %io_id2df_swap, %swap_r : i6
    %150 = comb.mux bin %1, %io_id2df_recov, %recov_r : i1
    %151 = comb.or bin %1, %state {sv.namehint = "_T_49"} : i1
    %152 = comb.and %151, %4, %53, %52 : i1
    %153 = comb.xor %152, %true : i1
    %154 = comb.and %153, %139 : i1
    %155 = comb.mux bin %152, %47, %140 : i64
    %156 = comb.and %151, %6, %115, %114 : i1
    %157 = comb.xor %156, %true : i1
    %158 = comb.and %157, %142 : i1
    %159 = comb.mux bin %156, %109, %143 : i64
    %160 = comb.mux bin %1, %io_id2df_dst, %pre_dst : i5
    %161 = comb.xor %2, %true : i1
    %162 = comb.and %161, %pre_wr : i1
    %163 = comb.mux bin %1, %io_id2df_ctrl_writeRegEn, %162 : i1
    %164 = comb.or bin %valid_r, %state {sv.namehint = "_T_54"} : i1
    %165 = comb.xor bin %2, %true {sv.namehint = "_T_55"} : i1
    %166 = comb.and bin %164, %165 {sv.namehint = "_T_56"} : i1
    %167 = comb.xor %166, %true : i1
    %168 = comb.and %0, %167, %io_id2df_valid {sv.namehint = ".io_id2df_ready.output"} : i1
    %169 = comb.xor bin %state, %true {sv.namehint = "_T_57"} : i1
    %170 = comb.or bin %62, %124 {sv.namehint = "_T_58"} : i1
    %171 = comb.and bin %1, %170 {sv.namehint = "_T_59"} : i1
    %172 = comb.and bin %169, %171 : i1
    %173 = comb.or %172, %state : i1
    %174 = comb.xor %2, %true : i1
    %175 = comb.and %174, %valid_r : i1
    %176 = comb.or %1, %175 : i1
    %177 = comb.xor %171, %true : i1
    %178 = comb.and %177, %176 : i1
    %179 = comb.mux bin %state, %valid_r, %178 : i1
    %180 = comb.xor bin %62, %true {sv.namehint = "_T_61"} : i1
    %181 = comb.xor bin %124, %true {sv.namehint = "_T_62"} : i1
    %182 = comb.and bin %state, %180, %181 : i1
    %183 = comb.xor %182, %true : i1
    %184 = comb.or %182, %179 : i1
    %185 = comb.and %0, %183, %173 : i1
    %186 = comb.and %0, %184 : i1
    hw.output %io_df2rr_drop, %io_df2rr_stall, %168, %inst_r, %pc_r, %excep_r_cause, %excep_r_tval, %excep_r_en, %excep_r_pc, %excep_r_etype, %ctrl_r_aluOp, %ctrl_r_aluWidth, %ctrl_r_dcMode, %ctrl_r_writeRegEn, %ctrl_r_writeCSREn, %ctrl_r_brType, %rs1_r, %rrs1_r, %rs1_d_r, %rs2_r, %rrs2_r, %rs2_d_r, %dst_r, %dst_d_r, %jmp_type_r, %special_r, %swap_r, %indi_r, %recov_r, %valid_r : i1, i1, i1, i32, i64, i64, i64, i1, i64, i2, i5, i1, i5, i1, i1, i3, i5, i1, i64, i12, i1, i64, i5, i64, i2, i2, i6, i2, i1, i1
  }
  hw.module private @ReadRegs(%clock: i1, %reset: i1, %io_df2rr_inst: i32, %io_df2rr_pc: i64, %io_df2rr_excep_cause: i64, %io_df2rr_excep_tval: i64, %io_df2rr_excep_en: i1, %io_df2rr_excep_pc: i64, %io_df2rr_excep_etype: i2, %io_df2rr_ctrl_aluOp: i5, %io_df2rr_ctrl_aluWidth: i1, %io_df2rr_ctrl_dcMode: i5, %io_df2rr_ctrl_writeRegEn: i1, %io_df2rr_ctrl_writeCSREn: i1, %io_df2rr_ctrl_brType: i3, %io_df2rr_rs1: i5, %io_df2rr_rrs1: i1, %io_df2rr_rs1_d: i64, %io_df2rr_rs2: i12, %io_df2rr_rrs2: i1, %io_df2rr_rs2_d: i64, %io_df2rr_dst: i5, %io_df2rr_dst_d: i64, %io_df2rr_jmp_type: i2, %io_df2rr_special: i2, %io_df2rr_swap: i6, %io_df2rr_indi: i2, %io_df2rr_recov: i1, %io_df2rr_valid: i1, %io_rr2ex_drop: i1, %io_rr2ex_stall: i1, %io_rr2ex_ready: i1, %io_rs1Read_data: i64, %io_rs2Read_data: i64, %io_csrRead_data: i64, %io_csrRead_is_err: i1) -> (io_df2rr_drop: i1, io_df2rr_stall: i1, io_df2rr_ready: i1, io_rr2ex_inst: i32, io_rr2ex_pc: i64, io_rr2ex_excep_cause: i64, io_rr2ex_excep_tval: i64, io_rr2ex_excep_en: i1, io_rr2ex_excep_pc: i64, io_rr2ex_excep_etype: i2, io_rr2ex_ctrl_aluOp: i5, io_rr2ex_ctrl_aluWidth: i1, io_rr2ex_ctrl_dcMode: i5, io_rr2ex_ctrl_writeRegEn: i1, io_rr2ex_ctrl_writeCSREn: i1, io_rr2ex_ctrl_brType: i3, io_rr2ex_rs1_d: i64, io_rr2ex_rs2: i12, io_rr2ex_rs2_d: i64, io_rr2ex_dst: i5, io_rr2ex_dst_d: i64, io_rr2ex_jmp_type: i2, io_rr2ex_special: i2, io_rr2ex_indi: i2, io_rr2ex_recov: i1, io_rr2ex_valid: i1, io_rs1Read_id: i5, io_rs2Read_id: i5, io_csrRead_id: i12, io_d_rr_id: i5, io_d_rr_data: i64, io_d_rr_state: i2) {
    %false = hw.constant false
    %true = hw.constant true
    %c0_i32 = hw.constant 0 : i32
    %c0_i64 = hw.constant 0 : i64
    %c0_i12 = hw.constant 0 : i12
    %c2_i64 = hw.constant 2 : i64
    %c0_i2 = hw.constant 0 : i2
    %c0_i3 = hw.constant 0 : i3
    %c0_i5 = hw.constant 0 : i5
    %drop_r = seq.firreg %40 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %stall_r = seq.firreg %40 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %recov_r = seq.firreg %42 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2 : ui64} : i1
    %0 = comb.or bin %io_rr2ex_drop, %drop_r {sv.namehint = "drop_in"} : i1
    %1 = comb.xor bin %io_rr2ex_drop, %true {sv.namehint = "_T_4"} : i1
    %2 = comb.and bin %stall_r, %1 {sv.namehint = "_io_df2rr_stall_T_1"} : i1
    %3 = comb.or bin %2, %io_rr2ex_stall {sv.namehint = "_io_df2rr_stall_T_2"} : i1
    %inst_r = seq.firreg %11 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 3 : ui64} : i32
    %pc_r = seq.firreg %12 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 35 : ui64} : i64
    %excep_r_cause = seq.firreg %30 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 99 : ui64} : i64
    %excep_r_tval = seq.firreg %33 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 163 : ui64} : i64
    %excep_r_en = seq.firreg %35 clock %clock reset sync %reset, %false {firrtl.random_init_start = 227 : ui64} : i1
    %excep_r_pc = seq.firreg %37 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 228 : ui64} : i64
    %excep_r_etype = seq.firreg %39 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 292 : ui64} : i2
    %ctrl_r_aluOp = seq.firreg %57 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 294 : ui64} : i5
    %ctrl_r_aluWidth = seq.firreg %55 clock %clock reset sync %reset, %false {firrtl.random_init_start = 299 : ui64} : i1
    %ctrl_r_dcMode = seq.firreg %52 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 300 : ui64} : i5
    %ctrl_r_writeRegEn = seq.firreg %50 clock %clock reset sync %reset, %false {firrtl.random_init_start = 305 : ui64} : i1
    %ctrl_r_writeCSREn = seq.firreg %47 clock %clock reset sync %reset, %false {firrtl.random_init_start = 306 : ui64} : i1
    %ctrl_r_brType = seq.firreg %44 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 307 : ui64} : i3
    %rs1_d_r = seq.firreg %16 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 315 : ui64} : i64
    %rs2_r = seq.firreg %17 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 379 : ui64} : i12
    %rs2_d_r = seq.firreg %21 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 391 : ui64} : i64
    %dst_r = seq.firreg %22 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 455 : ui64} : i5
    %dst_d_r = seq.firreg %26 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 460 : ui64} : i64
    %jmp_type_r = seq.firreg %59 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 536 : ui64} : i2
    %special_r = seq.firreg %61 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 538 : ui64} : i2
    %indi_r = seq.firreg %27 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 540 : ui64} : i2
    %valid_r = seq.firreg %70 clock %clock reset sync %reset, %false {firrtl.random_init_start = 542 : ui64, sv.namehint = ".io_rr2ex_valid.output"} : i1
    %4 = comb.and bin %66, %io_df2rr_valid {sv.namehint = "hs_in"} : i1
    %5 = comb.and bin %io_rr2ex_ready, %valid_r {sv.namehint = "hs_out"} : i1
    %6 = comb.extract %io_df2rr_rs2 from 0 {sv.namehint = "_io_rs2Read_id_T"} : (i12) -> i5
    %7 = comb.mux bin %io_df2rr_rrs1, %io_rs1Read_data, %io_df2rr_rs1_d {sv.namehint = "rs1_bef"} : i64
    %8 = comb.or bin %io_df2rr_ctrl_writeCSREn, %io_df2rr_excep_en {sv.namehint = "_rs2_bef_T_1"} : i1
    %9 = comb.mux bin %io_df2rr_rrs2, %io_rs2Read_data, %io_df2rr_rs2_d {sv.namehint = "_rs2_bef_T_2"} : i64
    %10 = comb.mux bin %8, %io_csrRead_data, %9 {sv.namehint = "rs2_bef"} : i64
    %11 = comb.mux bin %4, %io_df2rr_inst, %inst_r : i32
    %12 = comb.mux bin %4, %io_df2rr_pc, %pc_r : i64
    %13 = comb.extract %io_df2rr_swap from 4 {sv.namehint = "_rs1_d_r_T"} : (i6) -> i2
    %14 = hw.array_create %io_df2rr_dst_d, %10, %7, %c0_i64 : i64
    %15 = hw.array_get %14[%13] {sv.namehint = "_rs1_d_r_T_6"} : !hw.array<4xi64>, i2
    %16 = comb.mux bin %4, %15, %rs1_d_r : i64
    %17 = comb.mux bin %4, %io_df2rr_rs2, %rs2_r : i12
    %18 = comb.extract %io_df2rr_swap from 2 {sv.namehint = "_rs2_d_r_T"} : (i6) -> i2
    %19 = hw.array_create %io_df2rr_dst_d, %10, %7, %c0_i64 : i64
    %20 = hw.array_get %19[%18] {sv.namehint = "_rs2_d_r_T_6"} : !hw.array<4xi64>, i2
    %21 = comb.mux bin %4, %20, %rs2_d_r : i64
    %22 = comb.mux bin %4, %io_df2rr_dst, %dst_r : i5
    %23 = comb.extract %io_df2rr_swap from 0 {sv.namehint = "_dst_d_r_T"} : (i6) -> i2
    %24 = hw.array_create %io_df2rr_dst_d, %10, %7, %c0_i64 : i64
    %25 = hw.array_get %24[%23] {sv.namehint = "_dst_d_r_T_6"} : !hw.array<4xi64>, i2
    %26 = comb.mux bin %4, %25, %dst_d_r : i64
    %27 = comb.mux bin %4, %io_df2rr_indi, %indi_r : i2
    %28 = comb.and bin %io_df2rr_ctrl_writeCSREn, %io_csrRead_is_err {sv.namehint = "_T"} : i1
    %29 = comb.mux bin %28, %c2_i64, %io_df2rr_excep_cause : i64
    %30 = comb.mux bin %4, %29, %excep_r_cause : i64
    %31 = comb.concat %c0_i32, %io_df2rr_inst : i32, i32
    %32 = comb.mux bin %28, %31, %io_df2rr_excep_tval : i64
    %33 = comb.mux bin %4, %32, %excep_r_tval : i64
    %34 = comb.or %28, %io_df2rr_excep_en : i1
    %35 = comb.mux bin %4, %34, %excep_r_en : i1
    %36 = comb.mux bin %28, %io_df2rr_pc, %io_df2rr_excep_pc : i64
    %37 = comb.mux bin %4, %36, %excep_r_pc : i64
    %38 = comb.mux bin %28, %c0_i2, %io_df2rr_excep_etype : i2
    %39 = comb.mux bin %4, %38, %excep_r_etype : i2
    %40 = comb.and %4, %28 : i1
    %41 = comb.or %28, %io_df2rr_recov : i1
    %42 = comb.mux bin %4, %41, %recov_r : i1
    %43 = comb.mux bin %28, %c0_i3, %io_df2rr_ctrl_brType : i3
    %44 = comb.mux bin %4, %43, %ctrl_r_brType : i3
    %45 = comb.xor %28, %true : i1
    %46 = comb.and %45, %io_df2rr_ctrl_writeCSREn : i1
    %47 = comb.mux bin %4, %46, %ctrl_r_writeCSREn : i1
    %48 = comb.xor %28, %true : i1
    %49 = comb.and %48, %io_df2rr_ctrl_writeRegEn : i1
    %50 = comb.mux bin %4, %49, %ctrl_r_writeRegEn : i1
    %51 = comb.mux bin %28, %c0_i5, %io_df2rr_ctrl_dcMode : i5
    %52 = comb.mux bin %4, %51, %ctrl_r_dcMode : i5
    %53 = comb.xor %28, %true : i1
    %54 = comb.and %53, %io_df2rr_ctrl_aluWidth : i1
    %55 = comb.mux bin %4, %54, %ctrl_r_aluWidth : i1
    %56 = comb.mux bin %28, %c0_i5, %io_df2rr_ctrl_aluOp : i5
    %57 = comb.mux bin %4, %56, %ctrl_r_aluOp : i5
    %58 = comb.mux bin %28, %c0_i2, %io_df2rr_jmp_type : i2
    %59 = comb.mux bin %4, %58, %jmp_type_r : i2
    %60 = comb.mux bin %28, %c0_i2, %io_df2rr_special : i2
    %61 = comb.mux bin %4, %60, %special_r : i2
    %62 = comb.xor bin %0, %true {sv.namehint = "_T_1"} : i1
    %63 = comb.xor bin %5, %true {sv.namehint = "_T_2"} : i1
    %64 = comb.and bin %valid_r, %63 {sv.namehint = "_T_3"} : i1
    %65 = comb.xor %64, %true : i1
    %66 = comb.and %62, %65, %io_df2rr_valid {sv.namehint = ".io_df2rr_ready.output"} : i1
    %67 = comb.xor %5, %true : i1
    %68 = comb.and %67, %valid_r : i1
    %69 = comb.or %4, %68 : i1
    %70 = comb.and %1, %69 : i1
    %71 = comb.concat %valid_r, %false {sv.namehint = "_io_d_rr_state_T"} : i1, i1
    hw.output %0, %3, %66, %inst_r, %pc_r, %excep_r_cause, %excep_r_tval, %excep_r_en, %excep_r_pc, %excep_r_etype, %ctrl_r_aluOp, %ctrl_r_aluWidth, %ctrl_r_dcMode, %ctrl_r_writeRegEn, %ctrl_r_writeCSREn, %ctrl_r_brType, %rs1_d_r, %rs2_r, %rs2_d_r, %dst_r, %dst_d_r, %jmp_type_r, %special_r, %indi_r, %recov_r, %valid_r, %io_df2rr_rs1, %6, %io_df2rr_rs2, %dst_r, %dst_d_r, %71 : i1, i1, i1, i32, i64, i64, i64, i1, i64, i2, i5, i1, i5, i1, i1, i3, i64, i12, i64, i5, i64, i2, i2, i2, i1, i1, i5, i5, i12, i5, i64, i2
  }
  hw.module private @MUL(%clock: i1, %reset: i1, %io_a: i64, %io_b: i64, %io_aluop: i5, %io_en: i1) -> (io_out: i64, io_valid: i1) {
    %true = hw.constant true
    %c0_i64 = hw.constant 0 : i64
    %false = hw.constant false
    %c0_i5 = hw.constant 0 : i5
    %c0_i2 = hw.constant 0 : i2
    %c1_i2 = hw.constant 1 : i2
    %c13_i5 = hw.constant 13 : i5
    %c14_i5 = hw.constant 14 : i5
    %c15_i5 = hw.constant 15 : i5
    %c-16_i5 = hw.constant -16 : i5
    %out_r = seq.firreg %35 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 0 : ui64} : i64
    %val1 = seq.firreg %3 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 64 : ui64} : i64
    %val2 = seq.firreg %4 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 128 : ui64} : i64
    %aluop_r = seq.firreg %5 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 192 : ui64} : i5
    %valid_r = seq.firreg %38 clock %clock reset sync %reset, %false {firrtl.random_init_start = 197 : ui64} : i1
    %state = seq.firreg %40 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 198 : ui64} : i2
    %0 = comb.icmp bin eq %state, %c0_i2 {sv.namehint = "_T"} : i2
    %1 = comb.mux bin %io_en, %c1_i2, %state : i2
    %2 = comb.and bin %0, %io_en : i1
    %3 = comb.mux bin %2, %io_a, %val1 : i64
    %4 = comb.mux bin %2, %io_b, %val2 : i64
    %5 = comb.mux bin %2, %io_aluop, %aluop_r : i5
    %6 = comb.icmp bin eq %state, %c1_i2 {sv.namehint = "_T_1"} : i2
    %7 = comb.concat %c0_i64, %val1 : i64, i64
    %8 = comb.concat %c0_i64, %val2 : i64, i64
    %9 = comb.mul bin %7, %8 {sv.namehint = "_out_r_T_6"} : i128
    %10 = comb.extract %9 from 0 {sv.namehint = "_out_r_T_1"} : (i128) -> i64
    %11 = comb.extract %val1 from 63 : (i64) -> i1
    %12 = comb.replicate %11 : (i1) -> i64
    %13 = comb.concat %12, %val1 : i64, i64
    %14 = comb.extract %val2 from 63 : (i64) -> i1
    %15 = comb.replicate %14 : (i1) -> i64
    %16 = comb.concat %15, %val2 : i64, i64
    %17 = comb.mul bin %13, %16 {sv.namehint = "_out_r_T_4"} : i128
    %18 = comb.extract %17 from 64 {sv.namehint = "_out_r_T_5"} : (i128) -> i64
    %19 = comb.extract %9 from 64 {sv.namehint = "_out_r_T_7"} : (i128) -> i64
    %20 = comb.replicate %11 : (i1) -> i64
    %21 = comb.concat %20, %val1 : i64, i64
    %22 = comb.concat %c0_i64, %val2 : i64, i64
    %23 = comb.mul %21, %22 {sv.namehint = "_out_r_T_11"} : i128
    %24 = comb.extract %23 from 64 {sv.namehint = "_out_r_T_13"} : (i128) -> i64
    %25 = comb.icmp bin eq %aluop_r, %c13_i5 {sv.namehint = "_out_r_T_16"} : i5
    %26 = comb.mux bin %25, %10, %c0_i64 {sv.namehint = "_out_r_T_17"} : i64
    %27 = comb.icmp bin eq %aluop_r, %c14_i5 {sv.namehint = "_out_r_T_18"} : i5
    %28 = comb.mux bin %27, %18, %26 {sv.namehint = "_out_r_T_19"} : i64
    %29 = comb.icmp bin eq %aluop_r, %c15_i5 {sv.namehint = "_out_r_T_20"} : i5
    %30 = comb.mux bin %29, %19, %28 {sv.namehint = "_out_r_T_21"} : i64
    %31 = comb.icmp bin eq %aluop_r, %c-16_i5 {sv.namehint = "_out_r_T_22"} : i5
    %32 = comb.mux bin %31, %24, %30 {sv.namehint = "_out_r_T_23"} : i64
    %33 = comb.xor %6, %true : i1
    %34 = comb.or %0, %33 : i1
    %35 = comb.mux bin %34, %out_r, %32 : i64
    %36 = comb.or %6, %valid_r : i1
    %37 = comb.xor %0, %true : i1
    %38 = comb.and %37, %36 : i1
    %39 = comb.mux bin %6, %c0_i2, %state : i2
    %40 = comb.mux bin %0, %1, %39 : i2
    hw.output %out_r, %valid_r : i64, i1
  }
  hw.module private @DIV(%clock: i1, %reset: i1, %io_alu64: i1, %io_a: i64, %io_b: i64, %io_sign: i1, %io_en: i1) -> (io_qua: i64, io_rem: i64, io_valid: i1) {
    %true = hw.constant true
    %c1_i64 = hw.constant 1 : i64
    %false = hw.constant false
    %c1_i7 = hw.constant 1 : i7
    %c-63_i7 = hw.constant -63 : i7
    %c-1_i64 = hw.constant -1 : i64
    %c0_i128 = hw.constant 0 : i128
    %c0_i2 = hw.constant 0 : i2
    %c1_i2 = hw.constant 1 : i2
    %c0_i64 = hw.constant 0 : i64
    %c0_i7 = hw.constant 0 : i7
    %quatient = seq.firreg %45 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 0 : ui64} : i64
    %val1 = seq.firreg %38 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 64 : ui64} : i128
    %val2 = seq.firreg %47 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 192 : ui64} : i128
    %qua_sign = seq.firreg %20 clock %clock reset sync %reset, %false {firrtl.random_init_start = 320 : ui64} : i1
    %rem_sign = seq.firreg %22 clock %clock reset sync %reset, %false {firrtl.random_init_start = 321 : ui64} : i1
    %iter = seq.firreg %31 clock %clock reset sync %reset, %c0_i7 {firrtl.random_init_start = 322 : ui64} : i7
    %pre_alu64 = seq.firreg %23 clock %clock reset sync %reset, %false {firrtl.random_init_start = 329 : ui64} : i1
    %state = seq.firreg %51 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 330 : ui64} : i2
    %0 = comb.icmp bin eq %state, %c0_i2 {sv.namehint = "_T"} : i2
    %1 = comb.mux bin %io_en, %c1_i2, %state : i2
    %2 = comb.extract %io_a from 63 {sv.namehint = "_rem_sign_T_1"} : (i64) -> i1
    %3 = comb.and bin %io_sign, %2 {sv.namehint = "_val1_T_2"} : i1
    %4 = comb.xor bin %io_a, %c-1_i64 {sv.namehint = "_val1_T_3"} : i64
    %5 = comb.add %4, %c1_i64 {sv.namehint = "_val1_T_5"} : i64
    %6 = comb.mux bin %3, %5, %io_a {sv.namehint = "val1_lo"} : i64
    %7 = comb.concat %c0_i64, %6 {sv.namehint = "_val1_T_6"} : i64, i64
    %8 = comb.mux bin %io_en, %7, %val1 : i128
    %9 = comb.extract %io_b from 63 {sv.namehint = "_qua_sign_T_1"} : (i64) -> i1
    %10 = comb.and bin %io_sign, %9 {sv.namehint = "_val2_T_2"} : i1
    %11 = comb.xor bin %io_b, %c-1_i64 {sv.namehint = "_val2_T_3"} : i64
    %12 = comb.add %11, %c1_i64 {sv.namehint = "_val2_T_5"} : i64
    %13 = comb.mux bin %10, %12, %io_b {sv.namehint = "val2_hi"} : i64
    %14 = comb.concat %13, %c0_i64 {sv.namehint = "_val2_T_6"} : i64, i64
    %15 = comb.mux bin %io_en, %14, %val2 : i128
    %16 = comb.icmp bin ne %2, %9 {sv.namehint = "_qua_sign_T_2"} : i1
    %17 = comb.icmp bin ne %io_b, %c0_i64 {sv.namehint = "_qua_sign_T_3"} : i64
    %18 = comb.and %io_sign, %16, %17 {sv.namehint = "_qua_sign_T_5"} : i1
    %19 = comb.and bin %0, %io_en : i1
    %20 = comb.mux bin %19, %18, %qua_sign : i1
    %21 = comb.and %io_sign, %2 {sv.namehint = "_rem_sign_T_2"} : i1
    %22 = comb.mux bin %19, %21, %rem_sign : i1
    %23 = comb.mux bin %19, %io_alu64, %pre_alu64 : i1
    %24 = comb.mux bin %io_en, %c0_i64, %quatient : i64
    %25 = comb.mux bin %io_en, %c0_i7, %iter : i7
    %26 = comb.icmp bin eq %state, %c1_i2 {sv.namehint = "_T_1"} : i2
    %27 = comb.icmp bin ult %iter, %c-63_i7 {sv.namehint = "_T_2"} : i7
    %28 = comb.add %iter, %c1_i7 {sv.namehint = "_iter_T_1"} : i7
    %29 = comb.and bin %26, %27 : i1
    %30 = comb.mux bin %29, %28, %iter : i7
    %31 = comb.mux bin %0, %25, %30 : i7
    %32 = comb.icmp bin uge %val1, %val2 {sv.namehint = "_T_3"} : i128
    %33 = comb.extract %quatient from 0 {sv.namehint = "quatient_hi"} : (i64) -> i63
    %34 = comb.concat %33, %true {sv.namehint = "_quatient_T"} : i63, i1
    %35 = comb.sub %val1, %val2 {sv.namehint = "_val1_T_8"} : i128
    %36 = comb.and bin %26, %27, %32 : i1
    %37 = comb.mux bin %36, %35, %val1 : i128
    %38 = comb.mux bin %0, %8, %37 : i128
    %39 = comb.extract %val2 from 1 : (i128) -> i127
    %40 = comb.concat %false, %39 : i1, i127
    %41 = comb.extract %quatient from 0 {sv.namehint = "quatient_hi_1"} : (i64) -> i63
    %42 = comb.concat %41, %false {sv.namehint = "_quatient_T_1"} : i63, i1
    %43 = comb.mux bin %32, %34, %42 : i64
    %44 = comb.mux bin %29, %43, %quatient : i64
    %45 = comb.mux bin %0, %24, %44 : i64
    %46 = comb.mux bin %29, %40, %val2 : i128
    %47 = comb.mux bin %0, %15, %46 : i128
    %48 = comb.xor %26, %true : i1
    %49 = comb.or %48, %27 : i1
    %50 = comb.mux bin %49, %state, %c0_i2 : i2
    %51 = comb.mux bin %0, %1, %50 : i2
    %52 = comb.xor bin %27, %true : i1
    %53 = comb.xor %0, %true : i1
    %54 = comb.and %53, %26, %52 : i1
    %55 = comb.xor bin %quatient, %c-1_i64 {sv.namehint = "_sign_qua_T"} : i64
    %56 = comb.add %55, %c1_i64 {sv.namehint = "_sign_qua_T_2"} : i64
    %57 = comb.mux bin %qua_sign, %56, %quatient {sv.namehint = "sign_qua"} : i64
    %58 = comb.extract %val1 from 0 {sv.namehint = "_sign_rem_T_4"} : (i128) -> i64
    %59 = comb.xor bin %58, %c-1_i64 {sv.namehint = "_sign_rem_T_1"} : i64
    %60 = comb.add %59, %c1_i64 {sv.namehint = "_sign_rem_T_3"} : i64
    %61 = comb.mux bin %rem_sign, %60, %58 {sv.namehint = "sign_rem"} : i64
    %62 = comb.extract %57 from 31 {sv.namehint = "_io_qua_T_1"} : (i64) -> i1
    %63 = comb.replicate %62 {sv.namehint = "io_qua_hi"} : (i1) -> i32
    %64 = comb.extract %57 from 0 {sv.namehint = "io_qua_lo"} : (i64) -> i32
    %65 = comb.concat %63, %64 {sv.namehint = "_io_qua_T_2"} : i32, i32
    %66 = comb.mux bin %pre_alu64, %57, %65 {sv.namehint = "_io_qua_T_3"} : i64
    %67 = comb.xor %26, %true : i1
    %68 = comb.or %0, %67, %27 : i1
    %69 = comb.mux bin %68, %c0_i64, %66 : i64
    %70 = comb.extract %61 from 31 {sv.namehint = "_io_rem_T_1"} : (i64) -> i1
    %71 = comb.replicate %70 {sv.namehint = "io_rem_hi"} : (i1) -> i32
    %72 = comb.extract %61 from 0 {sv.namehint = "io_rem_lo"} : (i64) -> i32
    %73 = comb.concat %71, %72 {sv.namehint = "_io_rem_T_2"} : i32, i32
    %74 = comb.mux bin %pre_alu64, %61, %73 {sv.namehint = "_io_rem_T_3"} : i64
    %75 = comb.xor %26, %true : i1
    %76 = comb.or %0, %75, %27 : i1
    %77 = comb.mux bin %76, %c0_i64, %74 : i64
    hw.output %69, %77, %54 : i64, i64, i1
  }
  hw.module private @ALU(%clock: i1, %reset: i1, %io_alu_op: i5, %io_val1: i64, %io_val2: i64, %io_alu64: i1, %io_en: i1) -> (io_out: i64, io_valid: i1) {
    %c0_i63 = hw.constant 0 : i63
    %true = hw.constant true
    %c-1_i64 = hw.constant -1 : i64
    %c0_i32 = hw.constant 0 : i32
    %c0_i26 = hw.constant 0 : i26
    %c0_i58 = hw.constant 0 : i58
    %c0_i121 = hw.constant 0 : i121
    %c0_i5 = hw.constant 0 : i5
    %c0_i2 = hw.constant 0 : i2
    %c-15_i5 = hw.constant -15 : i5
    %c-14_i5 = hw.constant -14 : i5
    %c-13_i5 = hw.constant -13 : i5
    %c-12_i5 = hw.constant -12 : i5
    %c13_i5 = hw.constant 13 : i5
    %c14_i5 = hw.constant 14 : i5
    %c15_i5 = hw.constant 15 : i5
    %c-16_i5 = hw.constant -16 : i5
    %c1_i2 = hw.constant 1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %c1_i5 = hw.constant 1 : i5
    %c2_i5 = hw.constant 2 : i5
    %c3_i5 = hw.constant 3 : i5
    %c4_i5 = hw.constant 4 : i5
    %c5_i5 = hw.constant 5 : i5
    %c6_i5 = hw.constant 6 : i5
    %c7_i5 = hw.constant 7 : i5
    %c8_i5 = hw.constant 8 : i5
    %c9_i5 = hw.constant 9 : i5
    %c10_i5 = hw.constant 10 : i5
    %c11_i5 = hw.constant 11 : i5
    %c12_i5 = hw.constant 12 : i5
    %c-11_i5 = hw.constant -11 : i5
    %c0_i64 = hw.constant 0 : i64
    %multiplier.io_out, %multiplier.io_valid = hw.instance "multiplier" @MUL(clock: %clock: i1, reset: %reset: i1, io_a: %io_val1: i64, io_b: %io_val2: i64, io_aluop: %io_alu_op: i5, io_en: %13: i1) -> (io_out: i64, io_valid: i1)
    %divider.io_qua, %divider.io_rem, %divider.io_valid = hw.instance "divider" @DIV(clock: %clock: i1, reset: %reset: i1, io_alu64: %io_alu64: i1, io_a: %io_val1: i64, io_b: %io_val2: i64, io_sign: %4: i1, io_en: %20: i1) -> (io_qua: i64, io_rem: i64, io_valid: i1)
    %pre_aluop = seq.firreg %7 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 0 : ui64} : i5
    %state = seq.firreg %99 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 5 : ui64} : i2
    %0 = comb.icmp bin eq %io_alu_op, %c-15_i5 {sv.namehint = "_div_type_T_1"} : i5
    %1 = comb.icmp bin eq %io_alu_op, %c-13_i5 {sv.namehint = "_div_type_T_12"} : i5
    %2 = comb.icmp bin ne %io_alu_op, %c-14_i5 : i5
    %3 = comb.and %2, %1 {sv.namehint = "_div_type_T_13"} : i1
    %4 = comb.or %0, %3 {sv.namehint = "div_type_1"} : i1
    %5 = comb.icmp bin eq %state, %c0_i2 {sv.namehint = "_T"} : i2
    %6 = comb.and bin %5, %io_en : i1
    %7 = comb.mux bin %6, %io_alu_op, %pre_aluop : i5
    %8 = comb.icmp bin eq %io_alu_op, %c13_i5 {sv.namehint = "_T_1"} : i5
    %9 = comb.icmp bin eq %io_alu_op, %c14_i5 {sv.namehint = "_T_2"} : i5
    %10 = comb.icmp bin eq %io_alu_op, %c15_i5 {sv.namehint = "_T_4"} : i5
    %11 = comb.icmp bin eq %io_alu_op, %c-16_i5 {sv.namehint = "_T_6"} : i5
    %12 = comb.or bin %8, %9, %10, %11 {sv.namehint = "_T_7"} : i1
    %13 = comb.and %6, %12 : i1
    %14 = comb.icmp bin eq %io_alu_op, %c-15_i5 {sv.namehint = "_T_8"} : i5
    %15 = comb.icmp bin eq %io_alu_op, %c-14_i5 {sv.namehint = "_T_9"} : i5
    %16 = comb.icmp bin eq %io_alu_op, %c-13_i5 {sv.namehint = "_T_11"} : i5
    %17 = comb.icmp bin eq %io_alu_op, %c-12_i5 {sv.namehint = "_T_13"} : i5
    %18 = comb.or bin %14, %15, %16, %17 {sv.namehint = "_T_14"} : i1
    %19 = comb.xor %12, %true : i1
    %20 = comb.and %6, %19, %18 : i1
    %21 = comb.mux bin %18, %c-2_i2, %state : i2
    %22 = comb.mux bin %12, %c1_i2, %21 : i2
    %23 = comb.mux bin %io_en, %22, %state : i2
    %24 = comb.add %io_val1, %io_val2 {sv.namehint = "_alu_val_T_1"} : i64
    %25 = comb.xor bin %io_val1, %io_val2 {sv.namehint = "_alu_val_T_2"} : i64
    %26 = comb.or bin %io_val1, %io_val2 {sv.namehint = "_alu_val_T_3"} : i64
    %27 = comb.and bin %io_val1, %io_val2 {sv.namehint = "_alu_val_T_4"} : i64
    %28 = comb.extract %io_val2 from 0 {sv.namehint = "_alu_val_T_19"} : (i64) -> i6
    %29 = comb.concat %c0_i63, %io_val1 : i63, i64
    %30 = comb.concat %c0_i121, %28 : i121, i6
    %31 = comb.shl bin %29, %30 {sv.namehint = "_alu_val_T_6"} : i127
    %32 = comb.concat %c0_i58, %28 : i58, i6
    %33 = comb.shru bin %io_val1, %32 {sv.namehint = "_alu_val_T_8"} : i64
    %34 = comb.extract %io_val1 from 0 {sv.namehint = "_alu_val_T_17"} : (i64) -> i32
    %35 = comb.concat %c0_i26, %28 : i26, i6
    %36 = comb.shru bin %34, %35 {sv.namehint = "_alu_val_T_11"} : i32
    %37 = comb.concat %c0_i32, %36 : i32, i32
    %38 = comb.mux bin %io_alu64, %33, %37 {sv.namehint = "_alu_val_T_12"} : i64
    %39 = comb.shrs bin %io_val1, %32 {sv.namehint = "_alu_val_T_15"} : i64
    %40 = comb.shrs bin %34, %35 {sv.namehint = "_alu_val_T_20"} : i32
    %41 = comb.concat %c0_i32, %40 : i32, i32
    %42 = comb.mux bin %io_alu64, %39, %41 {sv.namehint = "_alu_val_T_22"} : i64
    %43 = comb.sub %io_val1, %io_val2 {sv.namehint = "_alu_val_T_24"} : i64
    %44 = comb.icmp bin slt %io_val1, %io_val2 {sv.namehint = "_alu_val_T_28"} : i64
    %45 = comb.icmp bin ult %io_val1, %io_val2 {sv.namehint = "_alu_val_T_30"} : i64
    %46 = comb.xor bin %io_val1, %c-1_i64 {sv.namehint = "_alu_val_T_31"} : i64
    %47 = comb.and bin %46, %io_val2 {sv.namehint = "_alu_val_T_32"} : i64
    %48 = comb.icmp bin eq %io_alu_op, %c1_i5 {sv.namehint = "_alu_val_T_35"} : i5
    %49 = comb.mux bin %48, %io_val1, %c0_i64 {sv.namehint = "_alu_val_T_36"} : i64
    %50 = comb.icmp bin eq %io_alu_op, %c2_i5 {sv.namehint = "_alu_val_T_37"} : i5
    %51 = comb.mux bin %50, %io_val2, %49 {sv.namehint = "_alu_val_T_38"} : i64
    %52 = comb.icmp bin eq %io_alu_op, %c3_i5 {sv.namehint = "_alu_val_T_39"} : i5
    %53 = comb.mux bin %52, %24, %51 {sv.namehint = "_alu_val_T_40"} : i64
    %54 = comb.icmp bin eq %io_alu_op, %c4_i5 {sv.namehint = "_alu_val_T_41"} : i5
    %55 = comb.mux bin %54, %25, %53 {sv.namehint = "_alu_val_T_42"} : i64
    %56 = comb.icmp bin eq %io_alu_op, %c5_i5 {sv.namehint = "_alu_val_T_43"} : i5
    %57 = comb.mux bin %56, %26, %55 {sv.namehint = "_alu_val_T_44"} : i64
    %58 = comb.icmp bin eq %io_alu_op, %c6_i5 {sv.namehint = "_alu_val_T_45"} : i5
    %59 = comb.mux bin %58, %27, %57 {sv.namehint = "_alu_val_T_46"} : i64
    %60 = comb.icmp bin eq %io_alu_op, %c7_i5 {sv.namehint = "_alu_val_T_47"} : i5
    %61 = comb.extract %31 from 0 : (i127) -> i64
    %62 = comb.mux %60, %61, %59 : i64
    %63 = comb.icmp bin eq %io_alu_op, %c8_i5 {sv.namehint = "_alu_val_T_49"} : i5
    %64 = comb.mux %63, %38, %62 : i64
    %65 = comb.icmp bin eq %io_alu_op, %c9_i5 {sv.namehint = "_alu_val_T_51"} : i5
    %66 = comb.mux %65, %42, %64 : i64
    %67 = comb.icmp bin eq %io_alu_op, %c10_i5 {sv.namehint = "_alu_val_T_53"} : i5
    %68 = comb.mux %67, %43, %66 : i64
    %69 = comb.icmp bin eq %io_alu_op, %c11_i5 {sv.namehint = "_alu_val_T_55"} : i5
    %70 = comb.concat %c0_i63, %44 : i63, i1
    %71 = comb.mux %69, %70, %68 : i64
    %72 = comb.icmp bin eq %io_alu_op, %c12_i5 {sv.namehint = "_alu_val_T_57"} : i5
    %73 = comb.concat %c0_i63, %45 : i63, i1
    %74 = comb.mux %72, %73, %71 : i64
    %75 = comb.icmp bin eq %io_alu_op, %c-11_i5 {sv.namehint = "_alu_val_T_59"} : i5
    %76 = comb.mux %75, %47, %74 : i64
    %77 = comb.xor %io_en, %true : i1
    %78 = comb.or %77, %12, %18 : i1
    %79 = comb.mux bin %78, %c0_i64, %76 : i64
    %80 = comb.xor bin %18, %true : i1
    %81 = comb.xor %12, %true : i1
    %82 = comb.and %io_en, %81, %80 : i1
    %83 = comb.icmp bin eq %state, %c1_i2 {sv.namehint = "_T_15"} : i2
    %84 = comb.mux bin %multiplier.io_valid, %multiplier.io_out, %c0_i64 : i64
    %85 = comb.icmp bin eq %state, %c-2_i2 {sv.namehint = "_T_16"} : i2
    %86 = comb.icmp bin eq %pre_aluop, %c-15_i5 {sv.namehint = "_io_out_T"} : i5
    %87 = comb.icmp bin eq %pre_aluop, %c-14_i5 {sv.namehint = "_io_out_T_1"} : i5
    %88 = comb.or bin %86, %87 {sv.namehint = "_io_out_T_2"} : i1
    %89 = comb.mux bin %88, %divider.io_qua, %divider.io_rem {sv.namehint = "_io_out_T_3"} : i64
    %90 = comb.and bin %85, %divider.io_valid : i1
    %91 = comb.mux bin %90, %89, %c0_i64 : i64
    %92 = comb.mux bin %83, %84, %91 : i64
    %93 = comb.mux bin %5, %79, %92 : i64
    %94 = comb.and %85, %divider.io_valid : i1
    %95 = comb.mux bin %83, %multiplier.io_valid, %94 : i1
    %96 = comb.mux bin %5, %82, %95 : i1
    %97 = comb.mux %83, %multiplier.io_valid, %90 : i1
    %98 = comb.mux bin %97, %c0_i2, %state : i2
    %99 = comb.mux bin %5, %23, %98 : i2
    hw.output %93, %96 : i64, i1
  }
  hw.module private @BranchALU(%io_val1: i64, %io_val2: i64, %io_brType: i3) -> (io_is_jmp: i1) {
    %c0_i3 = hw.constant 0 : i3
    %0 = comb.icmp bin eq %io_val1, %io_val2 {sv.namehint = "_io_is_jmp_T"} : i64
    %1 = comb.icmp bin ne %io_val1, %io_val2 {sv.namehint = "_io_is_jmp_T_1"} : i64
    %2 = comb.icmp bin slt %io_val1, %io_val2 {sv.namehint = "_io_is_jmp_T_4"} : i64
    %3 = comb.icmp bin sge %io_val1, %io_val2 {sv.namehint = "_io_is_jmp_T_7"} : i64
    %4 = comb.icmp bin ult %io_val1, %io_val2 {sv.namehint = "_io_is_jmp_T_8"} : i64
    %5 = comb.icmp bin uge %io_val1, %io_val2 {sv.namehint = "_io_is_jmp_T_9"} : i64
    %6 = comb.icmp bin eq %io_brType, %c0_i3 {sv.namehint = "_io_is_jmp_T_10"} : i3
    %7 = comb.and %6, %0 {sv.namehint = "_io_is_jmp_T_11"} : i1
    %8 = hw.array_create %5, %4, %3, %2, %7, %7, %1, %7 : i1
    %9 = hw.array_get %8[%io_brType] {sv.namehint = "_io_is_jmp_T_21"} : !hw.array<8xi1>, i3
    hw.output %9 : i1
  }
  hw.module private @Execute(%clock: i1, %reset: i1, %io_rr2ex_inst: i32, %io_rr2ex_pc: i64, %io_rr2ex_excep_cause: i64, %io_rr2ex_excep_tval: i64, %io_rr2ex_excep_en: i1, %io_rr2ex_excep_pc: i64, %io_rr2ex_excep_etype: i2, %io_rr2ex_ctrl_aluOp: i5, %io_rr2ex_ctrl_aluWidth: i1, %io_rr2ex_ctrl_dcMode: i5, %io_rr2ex_ctrl_writeRegEn: i1, %io_rr2ex_ctrl_writeCSREn: i1, %io_rr2ex_ctrl_brType: i3, %io_rr2ex_rs1_d: i64, %io_rr2ex_rs2: i12, %io_rr2ex_rs2_d: i64, %io_rr2ex_dst: i5, %io_rr2ex_dst_d: i64, %io_rr2ex_jmp_type: i2, %io_rr2ex_special: i2, %io_rr2ex_indi: i2, %io_rr2ex_recov: i1, %io_rr2ex_valid: i1, %io_ex2mem_drop: i1, %io_ex2mem_stall: i1, %io_ex2mem_ready: i1, %io_updateNextPc_seq_pc: i64, %io_updateNextPc_valid: i1) -> (io_rr2ex_drop: i1, io_rr2ex_stall: i1, io_rr2ex_ready: i1, io_ex2mem_inst: i32, io_ex2mem_pc: i64, io_ex2mem_excep_cause: i64, io_ex2mem_excep_tval: i64, io_ex2mem_excep_en: i1, io_ex2mem_excep_pc: i64, io_ex2mem_excep_etype: i2, io_ex2mem_ctrl_dcMode: i5, io_ex2mem_ctrl_writeRegEn: i1, io_ex2mem_ctrl_writeCSREn: i1, io_ex2mem_mem_addr: i64, io_ex2mem_mem_data: i64, io_ex2mem_csr_id: i12, io_ex2mem_csr_d: i64, io_ex2mem_dst: i5, io_ex2mem_dst_d: i64, io_ex2mem_special: i2, io_ex2mem_indi: i2, io_ex2mem_recov: i1, io_ex2mem_valid: i1, io_d_ex_id: i5, io_d_ex_data: i64, io_d_ex_state: i2, io_ex2if_seq_pc: i64, io_ex2if_valid: i1) {
    %false = hw.constant false
    %c0_i61 = hw.constant 0 : i61
    %true = hw.constant true
    %c1_i62 = hw.constant 1 : i62
    %c0_i3 = hw.constant 0 : i3
    %c0_i2 = hw.constant 0 : i2
    %c-1_i2 = hw.constant -1 : i2
    %c0_i58 = hw.constant 0 : i58
    %c0_i32 = hw.constant 0 : i32
    %c0_i12 = hw.constant 0 : i12
    %c-15_i5 = hw.constant -15 : i5
    %c-13_i5 = hw.constant -13 : i5
    %c-14_i5 = hw.constant -14 : i5
    %c-12_i5 = hw.constant -12 : i5
    %c7_i5 = hw.constant 7 : i5
    %c8_i5 = hw.constant 8 : i5
    %c9_i5 = hw.constant 9 : i5
    %c-2_i2 = hw.constant -2 : i2
    %c-4_i3 = hw.constant -4 : i3
    %c1_i2 = hw.constant 1 : i2
    %c0_i5 = hw.constant 0 : i5
    %c0_i64 = hw.constant 0 : i64
    %c2_i3 = hw.constant 2 : i3
    %drop_r = seq.firreg %149 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %stall_r = seq.firreg %96 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %0 = comb.or bin %drop_r, %io_ex2mem_drop {sv.namehint = "drop_in"} : i1
    %1 = comb.xor bin %io_ex2mem_drop, %true {sv.namehint = "_io_ex2if_valid_T"} : i1
    %2 = comb.and bin %stall_r, %1 {sv.namehint = "_io_rr2ex_stall_T_1"} : i1
    %3 = comb.or bin %io_ex2mem_stall, %2 {sv.namehint = "_io_rr2ex_stall_T_2"} : i1
    %alu.io_out, %alu.io_valid = hw.instance "alu" @ALU(clock: %clock: i1, reset: %reset: i1, io_alu_op: %io_rr2ex_ctrl_aluOp: i5, io_val1: %21: i64, io_val2: %38: i64, io_alu64: %6: i1, io_en: %104: i1) -> (io_out: i64, io_valid: i1)
    %inst_r = seq.firreg %64 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 2 : ui64} : i32
    %pc_r = seq.firreg %65 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 34 : ui64} : i64
    %excep_r_cause = seq.firreg %87 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 98 : ui64} : i64
    %excep_r_tval = seq.firreg %89 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 162 : ui64} : i64
    %excep_r_en = seq.firreg %91 clock %clock reset sync %reset, %false {firrtl.random_init_start = 226 : ui64} : i1
    %excep_r_pc = seq.firreg %93 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 227 : ui64} : i64
    %excep_r_etype = seq.firreg %95 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 291 : ui64} : i2
    %ctrl_r_dcMode = seq.firreg %82 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 299 : ui64} : i5
    %ctrl_r_writeRegEn = seq.firreg %80 clock %clock reset sync %reset, %false {firrtl.random_init_start = 304 : ui64} : i1
    %ctrl_r_writeCSREn = seq.firreg %78 clock %clock reset sync %reset, %false {firrtl.random_init_start = 305 : ui64} : i1
    %mem_addr_r = seq.firreg %66 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 309 : ui64} : i64
    %mem_data_r = seq.firreg %67 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 373 : ui64} : i64
    %csr_id_r = seq.firreg %68 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 437 : ui64} : i12
    %csr_d_r = seq.firreg %69 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 449 : ui64} : i64
    %dst_r = seq.firreg %70 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 513 : ui64} : i5
    %dst_d_r = seq.firreg %121 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 518 : ui64} : i64
    %special_r = seq.firreg %72 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 594 : ui64} : i2
    %alu64_r = seq.firreg %73 clock %clock reset sync %reset, %false {firrtl.random_init_start = 596 : ui64} : i1
    %indi_r = seq.firreg %84 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 597 : ui64} : i2
    %next_pc_r = seq.firreg %142 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 599 : ui64} : i64
    %recov_r = seq.firreg %98 clock %clock reset sync %reset, %false {firrtl.random_init_start = 663 : ui64} : i1
    %valid_r = seq.firreg %126 clock %clock reset sync %reset, %false {firrtl.random_init_start = 664 : ui64, sv.namehint = ".io_ex2mem_valid.output"} : i1
    %4 = comb.and bin %104, %io_rr2ex_valid {sv.namehint = "hs_in"} : i1
    %5 = comb.and bin %io_ex2mem_ready, %valid_r {sv.namehint = "hs_out"} : i1
    %6 = comb.xor bin %io_rr2ex_ctrl_aluWidth, %true {sv.namehint = "alu64"} : i1
    %7 = comb.icmp bin eq %io_rr2ex_ctrl_aluOp, %c-15_i5 {sv.namehint = "_signed_dr_T_1"} : i5
    %8 = comb.icmp bin eq %io_rr2ex_ctrl_aluOp, %c-13_i5 {sv.namehint = "_signed_dr_T_2"} : i5
    %9 = comb.or bin %7, %8 {sv.namehint = "_signed_dr_T_3"} : i1
    %10 = comb.and bin %io_rr2ex_ctrl_aluWidth, %9 {sv.namehint = "signed_dr"} : i1
    %11 = comb.icmp bin eq %io_rr2ex_ctrl_aluOp, %c-14_i5 {sv.namehint = "_unsigned_dr_T_1"} : i5
    %12 = comb.icmp bin eq %io_rr2ex_ctrl_aluOp, %c-12_i5 {sv.namehint = "_unsigned_dr_T_2"} : i5
    %13 = comb.or bin %11, %12 {sv.namehint = "_unsigned_dr_T_3"} : i1
    %14 = comb.and bin %io_rr2ex_ctrl_aluWidth, %13 {sv.namehint = "unsigned_dr"} : i1
    %15 = comb.extract %io_rr2ex_rs1_d from 0 {sv.namehint = "val1_lo"} : (i64) -> i32
    %16 = comb.concat %c0_i32, %15 {sv.namehint = "_val1_T"} : i32, i32
    %17 = comb.extract %io_rr2ex_rs1_d from 31 {sv.namehint = "_val1_T_2"} : (i64) -> i1
    %18 = comb.replicate %17 {sv.namehint = "val1_hi"} : (i1) -> i32
    %19 = comb.concat %18, %15 {sv.namehint = "_val1_T_3"} : i32, i32
    %20 = comb.mux bin %10, %19, %io_rr2ex_rs1_d {sv.namehint = "_val1_T_4"} : i64
    %21 = comb.mux bin %14, %16, %20 {sv.namehint = "val1"} : i64
    %22 = comb.icmp bin eq %io_rr2ex_ctrl_aluOp, %c7_i5 {sv.namehint = "_is_shift_T"} : i5
    %23 = comb.icmp bin eq %io_rr2ex_ctrl_aluOp, %c8_i5 {sv.namehint = "_is_shift_T_1"} : i5
    %24 = comb.icmp bin eq %io_rr2ex_ctrl_aluOp, %c9_i5 {sv.namehint = "_is_shift_T_3"} : i5
    %25 = comb.or bin %22, %23, %24 {sv.namehint = "is_shift"} : i1
    %26 = comb.extract %io_rr2ex_rs2_d from 0 {sv.namehint = "val2_lo"} : (i64) -> i32
    %27 = comb.concat %c0_i32, %26 {sv.namehint = "_val2_T"} : i32, i32
    %28 = comb.extract %io_rr2ex_rs2_d from 31 {sv.namehint = "_val2_T_2"} : (i64) -> i1
    %29 = comb.replicate %28 {sv.namehint = "val2_hi"} : (i1) -> i32
    %30 = comb.concat %29, %26 {sv.namehint = "_val2_T_3"} : i32, i32
    %31 = comb.extract %io_rr2ex_rs2_d from 0 {sv.namehint = "_val2_T_4"} : (i64) -> i6
    %32 = comb.extract %io_rr2ex_rs2_d from 0 {sv.namehint = "val2_lo_2"} : (i64) -> i5
    %33 = comb.concat %false, %32 {sv.namehint = "_val2_T_5"} : i1, i5
    %34 = comb.mux bin %io_rr2ex_ctrl_aluWidth, %33, %31 {sv.namehint = "_val2_T_6"} : i6
    %35 = comb.concat %c0_i58, %34 : i58, i6
    %36 = comb.mux bin %25, %35, %io_rr2ex_rs2_d {sv.namehint = "_val2_T_7"} : i64
    %37 = comb.mux bin %10, %30, %36 {sv.namehint = "_val2_T_8"} : i64
    %38 = comb.mux bin %14, %27, %37 {sv.namehint = "val2"} : i64
    %39 = comb.mux bin %4, %6, %alu64_r {sv.namehint = "cur_alu64"} : i1
    %40 = comb.extract %alu.io_out from 31 {sv.namehint = "_alu_out_T_2"} : (i64) -> i1
    %41 = comb.replicate %40 {sv.namehint = "alu_out_hi"} : (i1) -> i32
    %42 = comb.extract %alu.io_out from 0 {sv.namehint = "alu_out_lo"} : (i64) -> i32
    %43 = comb.concat %41, %42 {sv.namehint = "_alu_out_T_3"} : i32, i32
    %44 = comb.mux bin %39, %alu.io_out, %43 {sv.namehint = "alu_out"} : i64
    %45 = comb.extract %io_rr2ex_ctrl_dcMode from 3 {sv.namehint = "_excep_r_cause_T"} : (i5) -> i1
    %46 = comb.mux bin %io_rr2ex_ctrl_writeCSREn, %io_rr2ex_rs2_d, %44 {sv.namehint = "_wdata_T_1"} : i64
    %47 = comb.mux bin %45, %io_rr2ex_dst_d, %46 {sv.namehint = "wdata"} : i64
    %48 = comb.mux bin %io_updateNextPc_valid, %io_updateNextPc_seq_pc, %next_pc_r : i64
    %49 = comb.icmp bin eq %io_rr2ex_ctrl_dcMode, %c0_i5 {sv.namehint = "_memAlign_T"} : i5
    %50 = comb.extract %io_rr2ex_ctrl_dcMode from 0 {sv.namehint = "_memAlign_T_1"} : (i5) -> i2
    %51 = comb.extract %44 from 0 : (i64) -> i1
    %52 = comb.xor bin %51, %true {sv.namehint = "_memAlign_ans_T_1"} : i1
    %53 = comb.extract %44 from 0 : (i64) -> i2
    %54 = comb.icmp bin eq %53, %c0_i2 {sv.namehint = "_memAlign_ans_T_3"} : i2
    %55 = comb.extract %44 from 0 : (i64) -> i3
    %56 = comb.icmp bin eq %55, %c0_i3 {sv.namehint = "_memAlign_ans_T_5"} : i3
    %57 = comb.icmp bin ne %50, %c1_i2 : i2
    %58 = comb.or %57, %52 {sv.namehint = "_memAlign_ans_T_7"} : i1
    %59 = comb.icmp bin eq %50, %c-2_i2 {sv.namehint = "_memAlign_ans_T_8"} : i2
    %60 = comb.mux bin %59, %54, %58 {sv.namehint = "_memAlign_ans_T_9"} : i1
    %61 = comb.icmp bin eq %50, %c-1_i2 {sv.namehint = "_memAlign_ans_T_10"} : i2
    %62 = comb.mux bin %61, %56, %60 {sv.namehint = "memAlign_ans"} : i1
    %63 = comb.or bin %49, %62 {sv.namehint = "memAlign"} : i1
    %64 = comb.mux bin %4, %io_rr2ex_inst, %inst_r : i32
    %65 = comb.mux bin %4, %io_rr2ex_pc, %pc_r : i64
    %66 = comb.mux bin %4, %44, %mem_addr_r : i64
    %67 = comb.mux bin %4, %47, %mem_data_r : i64
    %68 = comb.mux bin %4, %io_rr2ex_rs2, %csr_id_r : i12
    %69 = comb.mux bin %4, %44, %csr_d_r : i64
    %70 = comb.mux bin %4, %io_rr2ex_dst, %dst_r : i5
    %71 = comb.mux bin %4, %47, %dst_d_r : i64
    %72 = comb.mux bin %4, %io_rr2ex_special, %special_r : i2
    %73 = comb.mux bin %4, %6, %alu64_r : i1
    %74 = comb.extract %io_rr2ex_excep_cause from 63 {sv.namehint = "_T"} : (i64) -> i1
    %75 = comb.mux bin %74, %next_pc_r, %io_rr2ex_excep_pc : i64
    %76 = comb.xor bin %63, %true {sv.namehint = "_T_1"} : i1
    %77 = comb.and %63, %io_rr2ex_ctrl_writeCSREn : i1
    %78 = comb.mux bin %4, %77, %ctrl_r_writeCSREn : i1
    %79 = comb.and %63, %io_rr2ex_ctrl_writeRegEn : i1
    %80 = comb.mux bin %4, %79, %ctrl_r_writeRegEn : i1
    %81 = comb.mux bin %63, %io_rr2ex_ctrl_dcMode, %c0_i5 : i5
    %82 = comb.mux bin %4, %81, %ctrl_r_dcMode : i5
    %83 = comb.mux bin %63, %io_rr2ex_indi, %c0_i2 : i2
    %84 = comb.mux bin %4, %83, %indi_r : i2
    %85 = comb.concat %c1_i62, %45, %false : i62, i1, i1
    %86 = comb.mux bin %63, %io_rr2ex_excep_cause, %85 : i64
    %87 = comb.mux bin %4, %86, %excep_r_cause : i64
    %88 = comb.mux bin %63, %io_rr2ex_excep_tval, %44 : i64
    %89 = comb.mux bin %4, %88, %excep_r_tval : i64
    %90 = comb.or %76, %io_rr2ex_excep_en : i1
    %91 = comb.mux bin %4, %90, %excep_r_en : i1
    %92 = comb.mux bin %63, %75, %io_rr2ex_pc : i64
    %93 = comb.mux bin %4, %92, %excep_r_pc : i64
    %94 = comb.mux bin %63, %io_rr2ex_excep_etype, %c0_i2 : i2
    %95 = comb.mux bin %4, %94, %excep_r_etype : i2
    %96 = comb.and %4, %76 : i1
    %97 = comb.or %76, %io_rr2ex_recov : i1
    %98 = comb.mux bin %4, %97, %recov_r : i1
    %state = seq.firreg %119 clock %clock reset sync %reset, %false {firrtl.random_init_start = 665 : ui64} : i1
    %drop_alu = seq.firreg %128 clock %clock reset sync %reset, %false {firrtl.random_init_start = 666 : ui64} : i1
    %99 = comb.xor bin %0, %true {sv.namehint = "_T_13"} : i1
    %100 = comb.or bin %valid_r, %state {sv.namehint = "_T_4"} : i1
    %101 = comb.xor bin %5, %true {sv.namehint = "_T_5"} : i1
    %102 = comb.and bin %100, %101 {sv.namehint = "_T_6"} : i1
    %103 = comb.xor %102, %true : i1
    %104 = comb.and %99, %103, %io_rr2ex_valid {sv.namehint = ".io_rr2ex_ready.output"} : i1
    %105 = comb.xor bin %state, %true {sv.namehint = "_T_8"} : i1
    %106 = comb.xor bin %alu.io_valid, %true {sv.namehint = "_T_9"} : i1
    %107 = comb.and bin %4, %106 {sv.namehint = "_T_10"} : i1
    %108 = comb.and bin %105, %107 : i1
    %109 = comb.or %108, %state : i1
    %110 = comb.xor %5, %true : i1
    %111 = comb.and %110, %valid_r : i1
    %112 = comb.or %4, %111 : i1
    %113 = comb.xor %107, %true : i1
    %114 = comb.and %113, %112 : i1
    %115 = comb.mux bin %state, %valid_r, %114 : i1
    %116 = comb.and bin %state, %alu.io_valid : i1
    %117 = comb.xor %116, %true : i1
    %118 = comb.and %117, %109 : i1
    %119 = comb.mux bin %io_ex2mem_drop, %state, %118 : i1
    %120 = comb.and bin %1, %116 : i1
    %121 = comb.mux bin %120, %44, %71 : i64
    %122 = comb.xor bin %drop_alu, %true {sv.namehint = "_valid_r_T"} : i1
    %123 = comb.mux bin %116, %122, %115 : i1
    %124 = comb.xor %116, %true : i1
    %125 = comb.and %124, %drop_alu : i1
    %126 = comb.and %1, %123 : i1
    %127 = comb.or %state, %drop_alu : i1
    %128 = comb.mux bin %io_ex2mem_drop, %127, %125 : i1
    %branchAlu.io_is_jmp = hw.instance "branchAlu" @BranchALU(io_val1: %21: i64, io_val2: %38: i64, io_brType: %io_rr2ex_ctrl_brType: i3) -> (io_is_jmp: i1)
    %forceJmp_seq_pc = seq.firreg %147 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 667 : ui64} : i64
    %forceJmp_valid = seq.firreg %148 clock %clock reset sync %reset, %false {firrtl.random_init_start = 731 : ui64} : i1
    %129 = comb.icmp bin eq %io_rr2ex_jmp_type, %c1_i2 {sv.namehint = "_real_target_T_7"} : i2
    %130 = comb.icmp bin eq %io_rr2ex_jmp_type, %c-2_i2 {sv.namehint = "_real_is_target_T_2"} : i2
    %131 = comb.mux bin %130, %branchAlu.io_is_jmp, %129 {sv.namehint = "real_is_target"} : i1
    %132 = comb.icmp bin eq %io_rr2ex_jmp_type, %c-1_i2 {sv.namehint = "_real_target_T"} : i2
    %133 = comb.extract %io_rr2ex_inst from 0 {sv.namehint = "_real_target_T_2"} : (i32) -> i2
    %134 = comb.icmp bin eq %133, %c-1_i2 {sv.namehint = "_real_target_T_3"} : i2
    %135 = comb.mux bin %134, %c-4_i3, %c2_i3 {sv.namehint = "_real_target_T_4"} : i3
    %136 = comb.concat %c0_i61, %135 : i61, i3
    %137 = comb.add %io_rr2ex_pc, %136 {sv.namehint = "_real_target_T_6"} : i64
    %138 = comb.add %io_rr2ex_rs1_d, %io_rr2ex_dst_d {sv.namehint = "_real_target_T_9"} : i64
    %139 = comb.mux bin %129, %138, %io_rr2ex_dst_d {sv.namehint = "_real_target_T_10"} : i64
    %140 = comb.mux bin %131, %139, %137 {sv.namehint = "_real_target_T_11"} : i64
    %141 = comb.mux bin %132, %io_rr2ex_rs2_d, %140 {sv.namehint = "real_target"} : i64
    %142 = comb.mux bin %4, %141, %48 : i64
    %143 = comb.xor bin %io_rr2ex_excep_en, %true {sv.namehint = "_T_14"} : i1
    %144 = comb.icmp bin ne %io_rr2ex_jmp_type, %c0_i2 {sv.namehint = "_T_17"} : i2
    %145 = comb.and bin %4, %143, %131, %144 {sv.namehint = "_T_18"} : i1
    %146 = comb.and bin %99, %145 : i1
    %147 = comb.mux bin %146, %141, %forceJmp_seq_pc : i64
    %148 = comb.and %99, %145 : i1
    %149 = comb.or %146, %96 : i1
    %150 = comb.and bin %forceJmp_valid, %1 {sv.namehint = "_io_ex2if_valid_T_1"} : i1
    %151 = comb.extract %ctrl_r_dcMode from 2 {sv.namehint = "_io_d_ex_state_T"} : (i5) -> i1
    %152 = comb.extract %indi_r from 1 {sv.namehint = "_io_d_ex_state_T_1"} : (i2) -> i1
    %153 = comb.or bin %151, %152 {sv.namehint = "_io_d_ex_state_T_2"} : i1
    %154 = comb.concat %false, %ctrl_r_writeRegEn {sv.namehint = "_io_d_ex_state_T_3"} : i1, i1
    %155 = comb.mux bin %153, %c-2_i2, %154 {sv.namehint = "_io_d_ex_state_T_4"} : i2
    %156 = comb.concat %state, %false : i1, i1
    %157 = comb.mux bin %valid_r, %155, %156 : i2
    hw.output %0, %3, %104, %inst_r, %pc_r, %excep_r_cause, %excep_r_tval, %excep_r_en, %excep_r_pc, %excep_r_etype, %ctrl_r_dcMode, %ctrl_r_writeRegEn, %ctrl_r_writeCSREn, %mem_addr_r, %mem_data_r, %csr_id_r, %csr_d_r, %dst_r, %dst_d_r, %special_r, %indi_r, %recov_r, %valid_r, %dst_r, %dst_d_r, %157, %forceJmp_seq_pc, %150 : i1, i1, i1, i32, i64, i64, i64, i1, i64, i2, i5, i1, i1, i64, i64, i12, i64, i5, i64, i2, i2, i1, i1, i5, i64, i2, i64, i1
  }
  hw.module private @Memory(%clock: i1, %reset: i1, %io_ex2mem_inst: i32, %io_ex2mem_pc: i64, %io_ex2mem_excep_cause: i64, %io_ex2mem_excep_tval: i64, %io_ex2mem_excep_en: i1, %io_ex2mem_excep_pc: i64, %io_ex2mem_excep_etype: i2, %io_ex2mem_ctrl_dcMode: i5, %io_ex2mem_ctrl_writeRegEn: i1, %io_ex2mem_ctrl_writeCSREn: i1, %io_ex2mem_mem_addr: i64, %io_ex2mem_mem_data: i64, %io_ex2mem_csr_id: i12, %io_ex2mem_csr_d: i64, %io_ex2mem_dst: i5, %io_ex2mem_dst_d: i64, %io_ex2mem_special: i2, %io_ex2mem_indi: i2, %io_ex2mem_recov: i1, %io_ex2mem_valid: i1, %io_mem2rb_drop: i1, %io_mem2rb_stall: i1, %io_mem2rb_ready: i1, %io_dataRW_rdata: i64, %io_dataRW_rvalid: i1, %io_dataRW_ready: i1, %io_va2pa_paddr: i32, %io_va2pa_pvalid: i1, %io_va2pa_tlb_excep_cause: i64, %io_va2pa_tlb_excep_tval: i64, %io_va2pa_tlb_excep_en: i1) -> (io_ex2mem_drop: i1, io_ex2mem_stall: i1, io_ex2mem_ready: i1, io_mem2rb_pc: i64, io_mem2rb_excep_cause: i64, io_mem2rb_excep_tval: i64, io_mem2rb_excep_en: i1, io_mem2rb_excep_pc: i64, io_mem2rb_excep_etype: i2, io_mem2rb_csr_id: i12, io_mem2rb_csr_d: i64, io_mem2rb_csr_en: i1, io_mem2rb_dst: i5, io_mem2rb_dst_d: i64, io_mem2rb_dst_en: i1, io_mem2rb_special: i2, io_mem2rb_recov: i1, io_mem2rb_valid: i1, io_dataRW_addr: i32, io_dataRW_wdata: i64, io_dataRW_dc_mode: i5, io_dataRW_amo: i5, io_va2pa_vaddr: i64, io_va2pa_vvalid: i1, io_va2pa_m_type: i2, io_d_mem1_id: i5, io_d_mem1_data: i64, io_d_mem1_state: i2, io_d_mem2_id: i5, io_d_mem2_data: i64, io_d_mem2_state: i2, io_d_mem3_id: i5, io_d_mem3_data: i64, io_d_mem3_state: i2) {
    %false = hw.constant false
    %true = hw.constant true
    %c0_i32 = hw.constant 0 : i32
    %c0_i12 = hw.constant 0 : i12
    %c1_i2 = hw.constant 1 : i2
    %c1_i64 = hw.constant 1 : i64
    %c0_i5 = hw.constant 0 : i5
    %c0_i2 = hw.constant 0 : i2
    %c0_i64 = hw.constant 0 : i64
    %drop2_r = seq.firreg %141 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %stall2_r = seq.firreg %141 clock %clock reset sync %reset, %false {firrtl.random_init_start = 4 : ui64} : i1
    %0 = comb.or bin %drop2_r, %io_mem2rb_drop {sv.namehint = "drop2_in"} : i1
    %1 = comb.xor bin %io_mem2rb_drop, %true {sv.namehint = "_T_35"} : i1
    %2 = comb.xor bin %io_mem2rb_drop, %true {sv.namehint = "_T_31"} : i1
    %3 = comb.and bin %stall2_r, %2 {sv.namehint = "_stall2_in_T_1"} : i1
    %4 = comb.or bin %3, %io_mem2rb_stall {sv.namehint = "stall2_in"} : i1
    %5 = comb.xor bin %0, %true {sv.namehint = "_T_20"} : i1
    %inst1_r = seq.firreg %7 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 6 : ui64} : i32
    %pc1_r = seq.firreg %8 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 38 : ui64} : i64
    %excep1_r_cause = seq.firreg %13 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 102 : ui64} : i64
    %excep1_r_tval = seq.firreg %12 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 166 : ui64} : i64
    %excep1_r_en = seq.firreg %11 clock %clock reset sync %reset, %false {firrtl.random_init_start = 230 : ui64} : i1
    %excep1_r_pc = seq.firreg %10 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 231 : ui64} : i64
    %excep1_r_etype = seq.firreg %9 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 295 : ui64} : i2
    %ctrl1_r_dcMode = seq.firreg %14 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 303 : ui64} : i5
    %mem_addr1_r = seq.firreg %15 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 313 : ui64} : i64
    %mem_data1_r = seq.firreg %16 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 377 : ui64} : i64
    %dst1_r = seq.firreg %17 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 441 : ui64} : i5
    %dst_d1_r = seq.firreg %18 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 446 : ui64} : i64
    %dst_en1_r = seq.firreg %19 clock %clock reset sync %reset, %false {firrtl.random_init_start = 510 : ui64} : i1
    %csr_id1_r = seq.firreg %20 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 511 : ui64} : i12
    %csr_d1_r = seq.firreg %21 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 523 : ui64} : i64
    %csr_en1_r = seq.firreg %22 clock %clock reset sync %reset, %false {firrtl.random_init_start = 587 : ui64} : i1
    %special1_r = seq.firreg %24 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 600 : ui64} : i2
    %indi1_r = seq.firreg %23 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 602 : ui64} : i2
    %recov1_r = seq.firreg %25 clock %clock reset sync %reset, %false {firrtl.random_init_start = 604 : ui64} : i1
    %valid1_r = seq.firreg %46 clock %clock reset sync %reset, %false {firrtl.random_init_start = 605 : ui64} : i1
    %is_tlb_r = seq.firreg %50 clock %clock reset sync %reset, %false {firrtl.random_init_start = 606 : ui64} : i1
    %drop_tlb = seq.firreg %62 clock %clock reset sync %reset, %false {firrtl.random_init_start = 607 : ui64} : i1
    %6 = comb.and bin %37, %io_ex2mem_valid {sv.namehint = "hs_in"} : i1
    %7 = comb.mux bin %6, %io_ex2mem_inst, %inst1_r : i32
    %8 = comb.mux bin %6, %io_ex2mem_pc, %pc1_r : i64
    %9 = comb.mux bin %6, %io_ex2mem_excep_etype, %excep1_r_etype : i2
    %10 = comb.mux bin %6, %io_ex2mem_excep_pc, %excep1_r_pc : i64
    %11 = comb.mux bin %6, %io_ex2mem_excep_en, %excep1_r_en : i1
    %12 = comb.mux bin %6, %io_ex2mem_excep_tval, %excep1_r_tval : i64
    %13 = comb.mux bin %6, %io_ex2mem_excep_cause, %excep1_r_cause : i64
    %14 = comb.mux bin %6, %io_ex2mem_ctrl_dcMode, %ctrl1_r_dcMode : i5
    %15 = comb.mux bin %6, %io_ex2mem_mem_addr, %mem_addr1_r : i64
    %16 = comb.mux bin %6, %io_ex2mem_mem_data, %mem_data1_r : i64
    %17 = comb.mux bin %6, %io_ex2mem_dst, %dst1_r : i5
    %18 = comb.mux bin %6, %io_ex2mem_dst_d, %dst_d1_r : i64
    %19 = comb.mux bin %6, %io_ex2mem_ctrl_writeRegEn, %dst_en1_r : i1
    %20 = comb.mux bin %6, %io_ex2mem_csr_id, %csr_id1_r : i12
    %21 = comb.mux bin %6, %io_ex2mem_csr_d, %csr_d1_r : i64
    %22 = comb.mux bin %6, %io_ex2mem_ctrl_writeCSREn, %csr_en1_r : i1
    %23 = comb.mux bin %6, %io_ex2mem_indi, %indi1_r : i2
    %24 = comb.mux bin %6, %io_ex2mem_special, %special1_r : i2
    %25 = comb.mux bin %6, %io_ex2mem_recov, %recov1_r : i1
    %26 = comb.icmp bin ne %io_ex2mem_ctrl_dcMode, %c0_i5 {sv.namehint = "access_tlb"} : i5
    %27 = comb.mux bin %6, %io_ex2mem_mem_addr, %mem_addr1_r {sv.namehint = "_io_va2pa_vaddr_T"} : i64
    %28 = comb.xor bin %0, %true {sv.namehint = "_T"} : i1
    %29 = comb.xor bin %128, %true {sv.namehint = "_T_1"} : i1
    %30 = comb.and bin %28, %is_tlb_r, %29 {sv.namehint = "_io_va2pa_vvalid_T_3"} : i1
    %31 = comb.extract %io_ex2mem_ctrl_dcMode from 3 : (i5) -> i1
    %32 = comb.extract %ctrl1_r_dcMode from 3 : (i5) -> i1
    %33 = comb.mux %6, %31, %32 {sv.namehint = "_io_va2pa_m_type_T"} : i1
    %34 = comb.concat %true, %33 {sv.namehint = "_io_va2pa_m_type_T_1"} : i1, i1
    %35 = comb.and bin %valid1_r, %29 {sv.namehint = "_T_2"} : i1
    %36 = comb.xor %35, %true : i1
    %37 = comb.and %28, %36, %io_ex2mem_valid {sv.namehint = ".io_ex2mem_ready.output"} : i1
    %38 = comb.and bin %5, %6 : i1
    %39 = comb.mux bin %38, %26, %30 : i1
    %40 = comb.xor %128, %true : i1
    %41 = comb.and %40, %valid1_r : i1
    %42 = comb.or %6, %41 : i1
    %43 = comb.xor %128, %true : i1
    %44 = comb.and %43, %is_tlb_r : i1
    %45 = comb.mux bin %6, %26, %44 : i1
    %46 = comb.and %5, %42 : i1
    %47 = comb.xor bin %io_va2pa_pvalid, %true {sv.namehint = "_drop_tlb_T"} : i1
    %48 = comb.and bin %is_tlb_r, %47 {sv.namehint = "_drop_tlb_T_1"} : i1
    %49 = comb.mux bin %0, %48, %drop_tlb : i1
    %50 = comb.and %5, %45 : i1
    %51 = comb.extract %ctrl1_r_dcMode from 2 {sv.namehint = "_T_5"} : (i5) -> i1
    %52 = comb.extract %indi1_r from 1 {sv.namehint = "_T_6"} : (i2) -> i1
    %53 = comb.or bin %51, %52 {sv.namehint = "_T_7"} : i1
    %54 = comb.xor bin %53, %true {sv.namehint = "_T_8"} : i1
    %55 = comb.and bin %valid1_r, %54 {sv.namehint = "_T_9"} : i1
    %56 = comb.concat %valid1_r, %false : i1, i1
    %57 = comb.mux bin %55, %c1_i2, %56 : i2
    %58 = comb.mux bin %dst_en1_r, %57, %c0_i2 : i2
    %inst2_r = seq.firreg %64 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 608 : ui64} : i32
    %pc2_r = seq.firreg %65 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 640 : ui64} : i64
    %excep2_r_cause = seq.firreg %131 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 704 : ui64} : i64
    %excep2_r_tval = seq.firreg %132 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 768 : ui64} : i64
    %excep2_r_en = seq.firreg %133 clock %clock reset sync %reset, %false {firrtl.random_init_start = 832 : ui64} : i1
    %excep2_r_pc = seq.firreg %134 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 833 : ui64} : i64
    %excep2_r_etype = seq.firreg %135 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 897 : ui64} : i2
    %ctrl2_r_dcMode = seq.firreg %136 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 905 : ui64} : i5
    %mem_data2_r = seq.firreg %71 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 915 : ui64} : i64
    %dst2_r = seq.firreg %72 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 979 : ui64} : i5
    %dst_d2_r = seq.firreg %113 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 984 : ui64} : i64
    %dst_en2_r = seq.firreg %138 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1048 : ui64} : i1
    %csr_id2_r = seq.firreg %73 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 1049 : ui64} : i12
    %csr_d2_r = seq.firreg %74 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1061 : ui64} : i64
    %csr_en2_r = seq.firreg %140 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1125 : ui64} : i1
    %special2_r = seq.firreg %76 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1138 : ui64} : i2
    %paddr2_r = seq.firreg %78 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1140 : ui64} : i32
    %recov2_r = seq.firreg %142 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1174 : ui64} : i1
    %valid2_r = seq.firreg %154 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1175 : ui64} : i1
    %dc_hs_r = seq.firreg %153 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1176 : ui64} : i1
    %lr_addr_r = seq.firreg %84 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1177 : ui64} : i32
    %lr_valid_r = seq.firreg %89 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1209 : ui64} : i1
    %59 = comb.or bin %io_va2pa_pvalid, %io_va2pa_tlb_excep_en {sv.namehint = "inp_tlb_valid2"} : i1
    %60 = comb.and bin %59, %drop_tlb {sv.namehint = "_T_11"} : i1
    %61 = comb.xor %60, %true : i1
    %62 = comb.and %61, %49 : i1
    %63 = comb.or bin %excep1_r_en, %io_va2pa_tlb_excep_en {sv.namehint = "stage2_is_excep"} : i1
    %64 = comb.mux bin %128, %inst1_r, %inst2_r : i32
    %65 = comb.mux bin %128, %pc1_r, %pc2_r : i64
    %66 = comb.mux bin %128, %excep1_r_etype, %excep2_r_etype : i2
    %67 = comb.mux bin %128, %excep1_r_pc, %excep2_r_pc : i64
    %68 = comb.mux bin %128, %excep1_r_en, %excep2_r_en : i1
    %69 = comb.mux bin %128, %excep1_r_tval, %excep2_r_tval : i64
    %70 = comb.mux bin %128, %excep1_r_cause, %excep2_r_cause : i64
    %71 = comb.mux bin %128, %mem_data1_r, %mem_data2_r : i64
    %72 = comb.mux bin %128, %dst1_r, %dst2_r : i5
    %73 = comb.mux bin %128, %csr_id1_r, %csr_id2_r : i12
    %74 = comb.mux bin %128, %csr_d1_r, %csr_d2_r : i64
    %75 = comb.mux bin %128, %csr_en1_r, %csr_en2_r : i1
    %76 = comb.mux bin %128, %special1_r, %special2_r : i2
    %77 = comb.mux bin %128, %recov1_r, %recov2_r : i1
    %78 = comb.mux bin %128, %io_va2pa_paddr, %paddr2_r : i32
    %79 = comb.extract %indi1_r from 0 {sv.namehint = "_T_12"} : (i2) -> i1
    %80 = comb.xor bin %63, %true {sv.namehint = "_T_13"} : i1
    %81 = comb.and bin %79, %80 {sv.namehint = "_T_14"} : i1
    %82 = comb.or %81, %lr_valid_r : i1
    %83 = comb.and bin %128, %81 : i1
    %84 = comb.mux bin %83, %io_va2pa_paddr, %lr_addr_r : i32
    %85 = comb.extract %excep1_r_cause from 63 {sv.namehint = "_T_15"} : (i64) -> i1
    %86 = comb.and bin %excep1_r_en, %85 {sv.namehint = "_T_16"} : i1
    %87 = comb.xor %86, %true : i1
    %88 = comb.and %87, %82 : i1
    %89 = comb.mux bin %128, %88, %lr_valid_r : i1
    %90 = comb.icmp bin ne %ctrl2_r_dcMode, %c0_i5 {sv.namehint = "is_dc_r"} : i5
    %drop_dc = seq.firreg %178 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1210 : ui64} : i1
    %91 = comb.mux bin %128, %io_va2pa_paddr, %paddr2_r {sv.namehint = "_io_dataRW_addr_T"} : i32
    %92 = comb.mux bin %128, %mem_data1_r, %mem_data2_r {sv.namehint = "_io_dataRW_wdata_T"} : i64
    %93 = comb.extract %inst1_r from 27 {sv.namehint = "_io_dataRW_amo_T"} : (i32) -> i5
    %94 = comb.extract %inst2_r from 27 {sv.namehint = "_io_dataRW_amo_T_1"} : (i32) -> i5
    %95 = comb.mux bin %128, %93, %94 {sv.namehint = "_io_dataRW_amo_T_2"} : i5
    %96 = comb.icmp bin eq %io_va2pa_paddr, %lr_addr_r {sv.namehint = "_sc_valid_T"} : i32
    %97 = comb.extract %indi1_r from 1 {sv.namehint = "_T_19"} : (i2) -> i1
    %98 = comb.and bin %97, %96, %lr_valid_r {sv.namehint = "_T_18"} : i1
    %99 = comb.xor %97, %true : i1
    %100 = comb.or %98, %99 : i1
    %101 = comb.xor %100, %true : i1
    %102 = comb.or %63, %101 : i1
    %103 = comb.mux bin %102, %c0_i5, %ctrl1_r_dcMode : i5
    %104 = comb.mux bin %128, %103, %ctrl2_r_dcMode : i5
    %105 = comb.or %98, %97 : i1
    %106 = comb.xor %63, %true : i1
    %107 = comb.and %106, %105 : i1
    %108 = comb.or %107, %dst_en1_r : i1
    %109 = comb.mux bin %128, %108, %dst_en2_r : i1
    %110 = comb.mux bin %97, %c1_i64, %dst_d1_r : i64
    %111 = comb.mux bin %98, %c0_i64, %110 : i64
    %112 = comb.mux bin %63, %dst_d1_r, %111 : i64
    %113 = comb.mux bin %128, %112, %dst_d2_r : i64
    %114 = comb.xor bin %dc_hs_r, %true {sv.namehint = "_io_dataRW_dc_mode_T"} : i1
    %115 = comb.and bin %valid2_r, %114 {sv.namehint = "_io_dataRW_dc_mode_T_1"} : i1
    %116 = comb.mux bin %115, %ctrl2_r_dcMode, %c0_i5 {sv.namehint = "_io_dataRW_dc_mode_T_2"} : i5
    %117 = comb.mux bin %128, %103, %116 {sv.namehint = ".io_dataRW_dc_mode.output"} : i5
    %118 = comb.xor bin %is_tlb_r, %true {sv.namehint = "_tlb_valid2_T"} : i1
    %119 = comb.xor bin %drop_tlb, %true {sv.namehint = "_T_25"} : i1
    %120 = comb.and bin %59, %119 {sv.namehint = "_tlb_valid2_T_2"} : i1
    %121 = comb.or bin %118, %120 {sv.namehint = "tlb_valid2"} : i1
    %122 = comb.icmp bin ne %117, %c0_i5 {sv.namehint = "_dc_hs_T"} : i5
    %123 = comb.and bin %122, %io_dataRW_ready {sv.namehint = "dc_hs"} : i1
    %124 = comb.or %123, %dc_hs_r : i1
    %125 = comb.xor bin %186, %true {sv.namehint = "_T_21"} : i1
    %126 = comb.and bin %valid2_r, %125 {sv.namehint = "_T_22"} : i1
    %127 = comb.xor %126, %true : i1
    %128 = comb.and %5, %127, %valid1_r, %121 {sv.namehint = "hs1"} : i1
    %129 = comb.and bin %io_va2pa_tlb_excep_en, %119 {sv.namehint = "_T_26"} : i1
    %130 = comb.and bin %2, %128, %129 : i1
    %131 = comb.mux bin %130, %io_va2pa_tlb_excep_cause, %70 : i64
    %132 = comb.mux bin %130, %io_va2pa_tlb_excep_tval, %69 : i64
    %133 = comb.or %130, %68 : i1
    %134 = comb.mux bin %130, %pc1_r, %67 : i64
    %135 = comb.mux bin %130, %c0_i2, %66 : i2
    %136 = comb.mux bin %130, %c0_i5, %104 : i5
    %137 = comb.xor %130, %true : i1
    %138 = comb.and %137, %109 : i1
    %139 = comb.xor %130, %true : i1
    %140 = comb.and %139, %75 : i1
    %141 = comb.and %2, %128, %129 : i1
    %142 = comb.or %130, %77 : i1
    %143 = comb.icmp bin eq %ctrl1_r_dcMode, %c0_i5 : i5
    %144 = comb.and %143, %dc_hs_r : i1
    %145 = comb.or %144, %123 : i1
    %146 = comb.mux bin %129, %124, %145 : i1
    %147 = comb.xor %186, %true : i1
    %148 = comb.and %147, %valid2_r : i1
    %149 = comb.or %128, %148 : i1
    %150 = comb.xor %186, %true : i1
    %151 = comb.and %150, %124 : i1
    %152 = comb.mux bin %128, %146, %151 : i1
    %153 = comb.mux bin %io_mem2rb_drop, %124, %152 : i1
    %154 = comb.and %2, %149 : i1
    %155 = comb.xor bin %io_dataRW_rvalid, %true {sv.namehint = "_drop_dc_T"} : i1
    %156 = comb.and bin %90, %155 {sv.namehint = "_drop_dc_T_1"} : i1
    %157 = comb.mux bin %io_mem2rb_drop, %156, %drop_dc : i1
    %158 = comb.xor bin %90, %true {sv.namehint = "_T_29"} : i1
    %159 = comb.and bin %valid2_r, %158 {sv.namehint = "_T_30"} : i1
    %160 = comb.concat %valid2_r, %false : i1, i1
    %161 = comb.mux bin %159, %c1_i2, %160 : i2
    %162 = comb.mux bin %dst_en2_r, %161, %c0_i2 : i2
    %pc3_r = seq.firreg %163 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1243 : ui64} : i64
    %excep3_r_cause = seq.firreg %168 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1307 : ui64} : i64
    %excep3_r_tval = seq.firreg %167 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1371 : ui64} : i64
    %excep3_r_en = seq.firreg %166 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1435 : ui64} : i1
    %excep3_r_pc = seq.firreg %165 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1436 : ui64} : i64
    %excep3_r_etype = seq.firreg %164 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1500 : ui64} : i2
    %dst3_r = seq.firreg %169 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 1502 : ui64} : i5
    %dst_d3_r = seq.firreg %188 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1507 : ui64} : i64
    %dst_en3_r = seq.firreg %171 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1571 : ui64} : i1
    %csr_id3_r = seq.firreg %172 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 1572 : ui64} : i12
    %csr_d3_r = seq.firreg %173 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1584 : ui64} : i64
    %csr_en3_r = seq.firreg %174 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1648 : ui64} : i1
    %special3_r = seq.firreg %175 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1661 : ui64} : i2
    %recov3_r = seq.firreg %176 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1664 : ui64} : i1
    %valid3_r = seq.firreg %192 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1665 : ui64} : i1
    %163 = comb.mux bin %186, %pc2_r, %pc3_r : i64
    %164 = comb.mux bin %186, %excep2_r_etype, %excep3_r_etype : i2
    %165 = comb.mux bin %186, %excep2_r_pc, %excep3_r_pc : i64
    %166 = comb.mux bin %186, %excep2_r_en, %excep3_r_en : i1
    %167 = comb.mux bin %186, %excep2_r_tval, %excep3_r_tval : i64
    %168 = comb.mux bin %186, %excep2_r_cause, %excep3_r_cause : i64
    %169 = comb.mux bin %186, %dst2_r, %dst3_r : i5
    %170 = comb.mux bin %186, %dst_d2_r, %dst_d3_r : i64
    %171 = comb.mux bin %186, %dst_en2_r, %dst_en3_r : i1
    %172 = comb.mux bin %186, %csr_id2_r, %csr_id3_r : i12
    %173 = comb.mux bin %186, %csr_d2_r, %csr_d3_r : i64
    %174 = comb.mux bin %186, %csr_en2_r, %csr_en3_r : i1
    %175 = comb.mux bin %186, %special2_r, %special3_r : i2
    %176 = comb.mux bin %186, %recov2_r, %recov3_r : i1
    %177 = comb.xor %io_dataRW_rvalid, %true : i1
    %178 = comb.and %177, %157 : i1
    %179 = comb.xor bin %90, %true {sv.namehint = "_dc_valid3_T"} : i1
    %180 = comb.xor bin %drop_dc, %true {sv.namehint = "_dc_valid3_T_1"} : i1
    %181 = comb.and bin %io_dataRW_rvalid, %180 {sv.namehint = "_dc_valid3_T_2"} : i1
    %182 = comb.or bin %179, %181 {sv.namehint = "dc_valid3"} : i1
    %183 = comb.xor bin %io_mem2rb_ready, %true {sv.namehint = "_T_32"} : i1
    %184 = comb.and bin %valid3_r, %183 {sv.namehint = "_T_33"} : i1
    %185 = comb.xor %184, %true : i1
    %186 = comb.and %2, %185, %valid2_r, %182 {sv.namehint = "hs2"} : i1
    %187 = comb.and bin %1, %186, %90 : i1
    %188 = comb.mux bin %187, %io_dataRW_rdata, %170 : i64
    %189 = comb.xor %io_mem2rb_ready, %true : i1
    %190 = comb.and %189, %valid3_r : i1
    %191 = comb.or %186, %190 : i1
    %192 = comb.and %1, %191 : i1
    %193 = comb.and bin %valid3_r, %dst_en3_r {sv.namehint = "_T_36"} : i1
    %194 = comb.concat %false, %193 : i1, i1
    hw.output %0, %4, %37, %pc3_r, %excep3_r_cause, %excep3_r_tval, %excep3_r_en, %excep3_r_pc, %excep3_r_etype, %csr_id3_r, %csr_d3_r, %csr_en3_r, %dst3_r, %dst_d3_r, %dst_en3_r, %special3_r, %recov3_r, %valid3_r, %91, %92, %117, %95, %27, %39, %34, %dst1_r, %dst_d1_r, %58, %dst2_r, %dst_d2_r, %162, %dst3_r, %dst_d3_r, %194 : i1, i1, i1, i64, i64, i64, i1, i64, i2, i12, i64, i1, i5, i64, i1, i2, i1, i1, i32, i64, i5, i5, i64, i1, i2, i5, i64, i2, i5, i64, i2, i5, i64, i2
  }
  hw.module private @Writeback(%clock: i1, %reset: i1, %io_mem2rb_pc: i64, %io_mem2rb_excep_cause: i64, %io_mem2rb_excep_tval: i64, %io_mem2rb_excep_en: i1, %io_mem2rb_excep_pc: i64, %io_mem2rb_excep_etype: i2, %io_mem2rb_csr_id: i12, %io_mem2rb_csr_d: i64, %io_mem2rb_csr_en: i1, %io_mem2rb_dst: i5, %io_mem2rb_dst_d: i64, %io_mem2rb_dst_en: i1, %io_mem2rb_special: i2, %io_mem2rb_recov: i1, %io_mem2rb_valid: i1) -> (io_mem2rb_ready: i1, io_wReg_id: i5, io_wReg_data: i64, io_wReg_en: i1, io_wCsr_id: i12, io_wCsr_data: i64, io_wCsr_en: i1, io_excep_cause: i64, io_excep_tval: i64, io_excep_en: i1, io_excep_pc: i64, io_excep_etype: i2, io_wb2if_seq_pc: i64, io_wb2if_valid: i1, io_recov: i1, io_flush_tlb: i1, io_flush_cache: i1) {
    %true = hw.constant true
    %c4_i64 = hw.constant 4 : i64
    %false = hw.constant false
    %c0_i2 = hw.constant 0 : i2
    %c1_i2 = hw.constant 1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %c0_i64 = hw.constant 0 : i64
    %recov_r = seq.firreg %3 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %forceJmp_seq_pc = seq.firreg %11 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 3 : ui64} : i64
    %forceJmp_valid = seq.firreg %8 clock %clock reset sync %reset, %false {firrtl.random_init_start = 67 : ui64} : i1
    %tlb_r = seq.firreg %16 clock %clock reset sync %reset, %false {firrtl.random_init_start = 68 : ui64} : i1
    %cache_r = seq.firreg %13 clock %clock reset sync %reset, %false {firrtl.random_init_start = 69 : ui64} : i1
    %0 = comb.and %io_mem2rb_valid, %io_mem2rb_dst_en : i1
    %1 = comb.and %io_mem2rb_valid, %io_mem2rb_csr_en : i1
    %2 = comb.and %io_mem2rb_valid, %io_mem2rb_excep_en : i1
    %3 = comb.and %io_mem2rb_valid, %io_mem2rb_recov : i1
    %4 = comb.icmp bin ne %io_mem2rb_special, %c0_i2 {sv.namehint = "_T_1"} : i2
    %5 = comb.xor bin %io_mem2rb_excep_en, %true {sv.namehint = "_T_2"} : i1
    %6 = comb.and bin %io_mem2rb_recov, %5 {sv.namehint = "_T_3"} : i1
    %7 = comb.or bin %4, %6 {sv.namehint = "_T_4"} : i1
    %8 = comb.and %io_mem2rb_valid, %7 : i1
    %9 = comb.add %io_mem2rb_pc, %c4_i64 {sv.namehint = "_forceJmp_seq_pc_T_1"} : i64
    %10 = comb.and bin %io_mem2rb_valid, %7 : i1
    %11 = comb.mux bin %10, %9, %forceJmp_seq_pc : i64
    %12 = comb.icmp bin eq %io_mem2rb_special, %c1_i2 {sv.namehint = "_T_5"} : i2
    %13 = comb.and %10, %12 : i1
    %14 = comb.icmp bin eq %io_mem2rb_special, %c-2_i2 {sv.namehint = "_T_6"} : i2
    %15 = comb.xor %12, %true : i1
    %16 = comb.and %10, %15, %14 : i1
    hw.output %io_mem2rb_valid, %io_mem2rb_dst, %io_mem2rb_dst_d, %0, %io_mem2rb_csr_id, %io_mem2rb_csr_d, %1, %io_mem2rb_excep_cause, %io_mem2rb_excep_tval, %2, %io_mem2rb_excep_pc, %io_mem2rb_excep_etype, %forceJmp_seq_pc, %forceJmp_valid, %recov_r, %tlb_r, %cache_r : i1, i5, i64, i1, i12, i64, i1, i64, i64, i1, i64, i2, i64, i1, i1, i1, i1
  }
  hw.module private @Regs(%clock: i1, %reset: i1, %io_rs1_id: i5, %io_rs2_id: i5, %io_dst_id: i5, %io_dst_data: i64, %io_dst_en: i1) -> (io_rs1_data: i64, io_rs2_data: i64) {
    %c-1_i5 = hw.constant -1 : i5
    %c0_i5 = hw.constant 0 : i5
    %c1_i5 = hw.constant 1 : i5
    %c2_i5 = hw.constant 2 : i5
    %c3_i5 = hw.constant 3 : i5
    %c4_i5 = hw.constant 4 : i5
    %c5_i5 = hw.constant 5 : i5
    %c6_i5 = hw.constant 6 : i5
    %c7_i5 = hw.constant 7 : i5
    %c8_i5 = hw.constant 8 : i5
    %c9_i5 = hw.constant 9 : i5
    %c10_i5 = hw.constant 10 : i5
    %c11_i5 = hw.constant 11 : i5
    %c12_i5 = hw.constant 12 : i5
    %c13_i5 = hw.constant 13 : i5
    %c14_i5 = hw.constant 14 : i5
    %c15_i5 = hw.constant 15 : i5
    %c-16_i5 = hw.constant -16 : i5
    %c-15_i5 = hw.constant -15 : i5
    %c-14_i5 = hw.constant -14 : i5
    %c-13_i5 = hw.constant -13 : i5
    %c-12_i5 = hw.constant -12 : i5
    %c-11_i5 = hw.constant -11 : i5
    %c-10_i5 = hw.constant -10 : i5
    %c-9_i5 = hw.constant -9 : i5
    %c-8_i5 = hw.constant -8 : i5
    %c-7_i5 = hw.constant -7 : i5
    %c-6_i5 = hw.constant -6 : i5
    %c-5_i5 = hw.constant -5 : i5
    %c-4_i5 = hw.constant -4 : i5
    %c-3_i5 = hw.constant -3 : i5
    %c-2_i5 = hw.constant -2 : i5
    %c0_i64 = hw.constant 0 : i64
    %regs_0 = seq.firreg %7 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 0 : ui64} : i64
    %regs_1 = seq.firreg %10 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 64 : ui64} : i64
    %regs_2 = seq.firreg %13 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 128 : ui64} : i64
    %regs_3 = seq.firreg %16 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 192 : ui64} : i64
    %regs_4 = seq.firreg %19 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 256 : ui64} : i64
    %regs_5 = seq.firreg %22 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 320 : ui64} : i64
    %regs_6 = seq.firreg %25 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 384 : ui64} : i64
    %regs_7 = seq.firreg %28 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 448 : ui64} : i64
    %regs_8 = seq.firreg %31 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 512 : ui64} : i64
    %regs_9 = seq.firreg %34 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 576 : ui64} : i64
    %regs_10 = seq.firreg %37 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 640 : ui64} : i64
    %regs_11 = seq.firreg %40 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 704 : ui64} : i64
    %regs_12 = seq.firreg %43 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 768 : ui64} : i64
    %regs_13 = seq.firreg %46 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 832 : ui64} : i64
    %regs_14 = seq.firreg %49 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 896 : ui64} : i64
    %regs_15 = seq.firreg %52 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 960 : ui64} : i64
    %regs_16 = seq.firreg %55 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1024 : ui64} : i64
    %regs_17 = seq.firreg %58 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1088 : ui64} : i64
    %regs_18 = seq.firreg %61 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1152 : ui64} : i64
    %regs_19 = seq.firreg %64 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1216 : ui64} : i64
    %regs_20 = seq.firreg %67 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1280 : ui64} : i64
    %regs_21 = seq.firreg %70 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1344 : ui64} : i64
    %regs_22 = seq.firreg %73 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1408 : ui64} : i64
    %regs_23 = seq.firreg %76 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1472 : ui64} : i64
    %regs_24 = seq.firreg %79 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1536 : ui64} : i64
    %regs_25 = seq.firreg %82 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1600 : ui64} : i64
    %regs_26 = seq.firreg %85 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1664 : ui64} : i64
    %regs_27 = seq.firreg %88 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1728 : ui64} : i64
    %regs_28 = seq.firreg %91 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1792 : ui64} : i64
    %regs_29 = seq.firreg %94 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1856 : ui64} : i64
    %regs_30 = seq.firreg %97 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1920 : ui64} : i64
    %regs_31 = seq.firreg %100 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1984 : ui64} : i64
    %0 = hw.array_create %regs_31, %regs_30, %regs_29, %regs_28, %regs_27, %regs_26, %regs_25, %regs_24, %regs_23, %regs_22, %regs_21, %regs_20, %regs_19, %regs_18, %regs_17, %regs_16, %regs_15, %regs_14, %regs_13, %regs_12, %regs_11, %regs_10, %regs_9, %regs_8, %regs_7, %regs_6, %regs_5, %regs_4, %regs_3, %regs_2, %regs_1, %regs_0 : i64
    %1 = hw.array_get %0[%io_rs1_id] : !hw.array<32xi64>, i5
    %2 = hw.array_get %0[%io_rs2_id] : !hw.array<32xi64>, i5
    %3 = comb.icmp bin ne %io_dst_id, %c0_i5 {sv.namehint = "_T"} : i5
    %4 = comb.and bin %io_dst_en, %3 {sv.namehint = "_T_1"} : i1
    %5 = comb.icmp bin eq %io_dst_id, %c0_i5 : i5
    %6 = comb.and bin %4, %5 : i1
    %7 = comb.mux bin %6, %io_dst_data, %regs_0 : i64
    %8 = comb.icmp bin eq %io_dst_id, %c1_i5 : i5
    %9 = comb.and bin %4, %8 : i1
    %10 = comb.mux bin %9, %io_dst_data, %regs_1 : i64
    %11 = comb.icmp bin eq %io_dst_id, %c2_i5 : i5
    %12 = comb.and bin %4, %11 : i1
    %13 = comb.mux bin %12, %io_dst_data, %regs_2 : i64
    %14 = comb.icmp bin eq %io_dst_id, %c3_i5 : i5
    %15 = comb.and bin %4, %14 : i1
    %16 = comb.mux bin %15, %io_dst_data, %regs_3 : i64
    %17 = comb.icmp bin eq %io_dst_id, %c4_i5 : i5
    %18 = comb.and bin %4, %17 : i1
    %19 = comb.mux bin %18, %io_dst_data, %regs_4 : i64
    %20 = comb.icmp bin eq %io_dst_id, %c5_i5 : i5
    %21 = comb.and bin %4, %20 : i1
    %22 = comb.mux bin %21, %io_dst_data, %regs_5 : i64
    %23 = comb.icmp bin eq %io_dst_id, %c6_i5 : i5
    %24 = comb.and bin %4, %23 : i1
    %25 = comb.mux bin %24, %io_dst_data, %regs_6 : i64
    %26 = comb.icmp bin eq %io_dst_id, %c7_i5 : i5
    %27 = comb.and bin %4, %26 : i1
    %28 = comb.mux bin %27, %io_dst_data, %regs_7 : i64
    %29 = comb.icmp bin eq %io_dst_id, %c8_i5 : i5
    %30 = comb.and bin %4, %29 : i1
    %31 = comb.mux bin %30, %io_dst_data, %regs_8 : i64
    %32 = comb.icmp bin eq %io_dst_id, %c9_i5 : i5
    %33 = comb.and bin %4, %32 : i1
    %34 = comb.mux bin %33, %io_dst_data, %regs_9 : i64
    %35 = comb.icmp bin eq %io_dst_id, %c10_i5 : i5
    %36 = comb.and bin %4, %35 : i1
    %37 = comb.mux bin %36, %io_dst_data, %regs_10 : i64
    %38 = comb.icmp bin eq %io_dst_id, %c11_i5 : i5
    %39 = comb.and bin %4, %38 : i1
    %40 = comb.mux bin %39, %io_dst_data, %regs_11 : i64
    %41 = comb.icmp bin eq %io_dst_id, %c12_i5 : i5
    %42 = comb.and bin %4, %41 : i1
    %43 = comb.mux bin %42, %io_dst_data, %regs_12 : i64
    %44 = comb.icmp bin eq %io_dst_id, %c13_i5 : i5
    %45 = comb.and bin %4, %44 : i1
    %46 = comb.mux bin %45, %io_dst_data, %regs_13 : i64
    %47 = comb.icmp bin eq %io_dst_id, %c14_i5 : i5
    %48 = comb.and bin %4, %47 : i1
    %49 = comb.mux bin %48, %io_dst_data, %regs_14 : i64
    %50 = comb.icmp bin eq %io_dst_id, %c15_i5 : i5
    %51 = comb.and bin %4, %50 : i1
    %52 = comb.mux bin %51, %io_dst_data, %regs_15 : i64
    %53 = comb.icmp bin eq %io_dst_id, %c-16_i5 : i5
    %54 = comb.and bin %4, %53 : i1
    %55 = comb.mux bin %54, %io_dst_data, %regs_16 : i64
    %56 = comb.icmp bin eq %io_dst_id, %c-15_i5 : i5
    %57 = comb.and bin %4, %56 : i1
    %58 = comb.mux bin %57, %io_dst_data, %regs_17 : i64
    %59 = comb.icmp bin eq %io_dst_id, %c-14_i5 : i5
    %60 = comb.and bin %4, %59 : i1
    %61 = comb.mux bin %60, %io_dst_data, %regs_18 : i64
    %62 = comb.icmp bin eq %io_dst_id, %c-13_i5 : i5
    %63 = comb.and bin %4, %62 : i1
    %64 = comb.mux bin %63, %io_dst_data, %regs_19 : i64
    %65 = comb.icmp bin eq %io_dst_id, %c-12_i5 : i5
    %66 = comb.and bin %4, %65 : i1
    %67 = comb.mux bin %66, %io_dst_data, %regs_20 : i64
    %68 = comb.icmp bin eq %io_dst_id, %c-11_i5 : i5
    %69 = comb.and bin %4, %68 : i1
    %70 = comb.mux bin %69, %io_dst_data, %regs_21 : i64
    %71 = comb.icmp bin eq %io_dst_id, %c-10_i5 : i5
    %72 = comb.and bin %4, %71 : i1
    %73 = comb.mux bin %72, %io_dst_data, %regs_22 : i64
    %74 = comb.icmp bin eq %io_dst_id, %c-9_i5 : i5
    %75 = comb.and bin %4, %74 : i1
    %76 = comb.mux bin %75, %io_dst_data, %regs_23 : i64
    %77 = comb.icmp bin eq %io_dst_id, %c-8_i5 : i5
    %78 = comb.and bin %4, %77 : i1
    %79 = comb.mux bin %78, %io_dst_data, %regs_24 : i64
    %80 = comb.icmp bin eq %io_dst_id, %c-7_i5 : i5
    %81 = comb.and bin %4, %80 : i1
    %82 = comb.mux bin %81, %io_dst_data, %regs_25 : i64
    %83 = comb.icmp bin eq %io_dst_id, %c-6_i5 : i5
    %84 = comb.and bin %4, %83 : i1
    %85 = comb.mux bin %84, %io_dst_data, %regs_26 : i64
    %86 = comb.icmp bin eq %io_dst_id, %c-5_i5 : i5
    %87 = comb.and bin %4, %86 : i1
    %88 = comb.mux bin %87, %io_dst_data, %regs_27 : i64
    %89 = comb.icmp bin eq %io_dst_id, %c-4_i5 : i5
    %90 = comb.and bin %4, %89 : i1
    %91 = comb.mux bin %90, %io_dst_data, %regs_28 : i64
    %92 = comb.icmp bin eq %io_dst_id, %c-3_i5 : i5
    %93 = comb.and bin %4, %92 : i1
    %94 = comb.mux bin %93, %io_dst_data, %regs_29 : i64
    %95 = comb.icmp bin eq %io_dst_id, %c-2_i5 : i5
    %96 = comb.and bin %4, %95 : i1
    %97 = comb.mux bin %96, %io_dst_data, %regs_30 : i64
    %98 = comb.icmp bin eq %io_dst_id, %c-1_i5 : i5
    %99 = comb.and bin %4, %98 : i1
    %100 = comb.mux bin %99, %io_dst_data, %regs_31 : i64
    hw.output %1, %2 : i64, i64
  }
  hw.module private @Csrs(%clock: i1, %reset: i1, %io_rs_id: i12, %io_rd_id: i12, %io_rd_data: i64, %io_rd_en: i1, %io_excep_cause: i64, %io_excep_tval: i64, %io_excep_en: i1, %io_excep_pc: i64, %io_excep_etype: i2, %io_clint_raise: i1, %io_clint_clear: i1, %io_plic_m_raise: i1, %io_plic_m_clear: i1, %io_plic_s_raise: i1, %io_plic_s_clear: i1, %io_intr_msip_raise: i1, %io_intr_msip_clear: i1) -> (io_rs_data: i64, io_rs_is_err: i1, io_mmuState_priv: i2, io_mmuState_mstatus: i64, io_mmuState_satp: i64, io_idState_priv: i2, io_reg2if_seq_pc: i64, io_reg2if_valid: i1, io_intr_out_en: i1, io_intr_out_cause: i64, io_updateNextPc_seq_pc: i64, io_updateNextPc_valid: i1) {
    %c0_i42 = hw.constant 0 : i42
    %c-69487_i19 = hw.constant -69487 : i19
    %false = hw.constant false
    %c0_i44 = hw.constant 0 : i44
    %c0_i2 = hw.constant 0 : i2
    %c-909603_i62 = hw.constant -909603 : i62
    %c0_i64 = hw.constant 0 : i64
    %true = hw.constant true
    %c0_i63 = hw.constant 0 : i63
    %c-144115188075855872_i58 = hw.constant -144115188075855872 : i58
    %c0_i4 = hw.constant 0 : i4
    %c-17_i7 = hw.constant -17 : i7
    %c0_i5 = hw.constant 0 : i5
    %c8_i11 = hw.constant 8 : i11
    %c64_i12 = hw.constant 64 : i12
    %c928_i12 = hw.constant 928 : i12
    %c947_i12 = hw.constant 947 : i12
    %c946_i12 = hw.constant 946 : i12
    %c945_i12 = hw.constant 945 : i12
    %c944_i12 = hw.constant 944 : i12
    %c324_i12 = hw.constant 324 : i12
    %c260_i12 = hw.constant 260 : i12
    %c256_i12 = hw.constant 256 : i12
    %c322_i12 = hw.constant 322 : i12
    %c384_i12 = hw.constant 384 : i12
    %c261_i12 = hw.constant 261 : i12
    %c320_i12 = hw.constant 320 : i12
    %c323_i12 = hw.constant 323 : i12
    %c321_i12 = hw.constant 321 : i12
    %c262_i12 = hw.constant 262 : i12
    %c774_i12 = hw.constant 774 : i12
    %c771_i12 = hw.constant 771 : i12
    %c770_i12 = hw.constant 770 : i12
    %c834_i12 = hw.constant 834 : i12
    %c836_i12 = hw.constant 836 : i12
    %c772_i12 = hw.constant 772 : i12
    %c773_i12 = hw.constant 773 : i12
    %c832_i12 = hw.constant 832 : i12
    %c835_i12 = hw.constant 835 : i12
    %c833_i12 = hw.constant 833 : i12
    %c768_i12 = hw.constant 768 : i12
    %c769_i12 = hw.constant 769 : i12
    %c0_i9 = hw.constant 0 : i9
    %c-1_i2 = hw.constant -1 : i2
    %c-9223372036853460691_i64 = hw.constant -9223372036853460691 : i64
    %c42949672960_i64 = hw.constant 42949672960 : i64
    %c0_i32 = hw.constant 0 : i32
    %c-2_i2 = hw.constant -2 : i2
    %c-1_i6 = hw.constant -1 : i6
    %c-236_i12 = hw.constant -236 : i12
    %c45833_i64 = hw.constant 45833 : i64
    %c-1152903912420802561_i64 = hw.constant -1152903912420802561 : i64
    %c18014398509481983_i64 = hw.constant 18014398509481983 : i64
    %c546_i64 = hw.constant 546 : i64
    %c-9223372023968964318_i64 = hw.constant -9223372023968964318 : i64
    %c8290218_i64 = hw.constant 8290218 : i64
    %c34_i64 = hw.constant 34 : i64
    %c128_i64 = hw.constant 128 : i64
    %c-129_i64 = hw.constant -129 : i64
    %c2048_i64 = hw.constant 2048 : i64
    %c-2049_i64 = hw.constant -2049 : i64
    %c-1_i64 = hw.constant -1 : i64
    %c8_i64 = hw.constant 8 : i64
    %c-9_i64 = hw.constant -9 : i64
    %c5_i6 = hw.constant 5 : i6
    %c1_i6 = hw.constant 1 : i6
    %c9_i6 = hw.constant 9 : i6
    %c7_i6 = hw.constant 7 : i6
    %c3_i6 = hw.constant 3 : i6
    %c11_i6 = hw.constant 11 : i6
    %c-9223372036846485590_i64 = hw.constant -9223372036846485590 : i64
    %c9223372036846485589_i64 = hw.constant 9223372036846485589 : i64
    %c-35_i64 = hw.constant -35 : i64
    %c1152903912420802560_i64 = hw.constant 1152903912420802560 : i64
    %c-909603_i64 = hw.constant -909603 : i64
    %c-547_i64 = hw.constant -547 : i64
    %priv = seq.firreg %85 clock %clock reset sync %reset, %c-1_i2 {firrtl.random_init_start = 0 : ui64} : i2
    %misa = seq.firreg %209 clock %clock reset sync %reset, %c-9223372036853460691_i64 {firrtl.random_init_start = 2 : ui64} : i64
    %mstatus = seq.firreg %315 clock %clock reset sync %reset, %c42949672960_i64 {firrtl.random_init_start = 66 : ui64} : i64
    %mepc = seq.firreg %225 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 130 : ui64} : i64
    %mtval = seq.firreg %229 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 194 : ui64} : i64
    %mscratch = seq.firreg %233 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 258 : ui64} : i64
    %mcause = seq.firreg %250 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 322 : ui64} : i64
    %mtvec = seq.firreg %237 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 386 : ui64} : i64
    %mie = seq.firreg %325 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 450 : ui64} : i64
    %mip = seq.firreg %335 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 514 : ui64} : i64
    %medeleg = seq.firreg %255 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 578 : ui64} : i64
    %mideleg = seq.firreg %260 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 642 : ui64} : i64
    %mcounteren = seq.firreg %265 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 706 : ui64} : i32
    %scounteren = seq.firreg %269 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 738 : ui64} : i32
    %sepc = seq.firreg %273 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 770 : ui64} : i64
    %stval = seq.firreg %277 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 834 : ui64} : i64
    %sscratch = seq.firreg %281 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 898 : ui64} : i64
    %stvec = seq.firreg %285 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 962 : ui64} : i64
    %satp = seq.firreg %292 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1026 : ui64} : i64
    %scause = seq.firreg %296 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1090 : ui64} : i64
    %pmpaddr0 = seq.firreg %340 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1154 : ui64} : i64
    %pmpaddr1 = seq.firreg %345 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1218 : ui64} : i64
    %pmpaddr2 = seq.firreg %350 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1282 : ui64} : i64
    %pmpaddr3 = seq.firreg %355 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1346 : ui64} : i64
    %uscratch = seq.firreg %360 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1410 : ui64} : i64
    %mhartid = seq.firreg %363 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1538 : ui64} : i64
    %0 = comb.and bin %mstatus, %c-9223372023968964318_i64 {sv.namehint = "sstatus"} : i64
    %forceJmp_seq_pc = seq.firreg %60 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1602 : ui64} : i64
    %forceJmp_valid = seq.firreg %io_excep_en clock %clock reset sync %reset, %false {firrtl.random_init_start = 1666 : ui64} : i1
    %1 = comb.icmp bin eq %io_excep_etype, %c-2_i2 {sv.namehint = "_T"} : i2
    %2 = comb.extract %mstatus from 8 : (i64) -> i1
    %3 = comb.concat %false, %2 {sv.namehint = "_priv_T"} : i1, i1
    %4 = comb.extract %mstatus from 5 : (i64) -> i1
    %5 = comb.and bin %mstatus, %c-909603_i64 {sv.namehint = "_mstatus_T_1"} : i64
    %6 = comb.extract %0 from 13 : (i64) -> i7
    %7 = comb.and %6, %c-17_i7 : i7
    %8 = comb.concat %c0_i44, %7, %c8_i11, %4, %false {sv.namehint = "_mstatus_T_2"} : i44, i7, i11, i1, i1
    %9 = comb.or bin %5, %8 {sv.namehint = "_mstatus_T_3"} : i64
    %10 = comb.icmp bin eq %io_excep_etype, %c-1_i2 {sv.namehint = "_T_1"} : i2
    %11 = comb.extract %mstatus from 11 {sv.namehint = "_priv_T_1"} : (i64) -> i2
    %12 = comb.extract %mstatus from 13 {sv.namehint = "new_mstatus_hi_hi_hi"} : (i64) -> i51
    %13 = comb.extract %mstatus from 8 {sv.namehint = "new_mstatus_hi_lo_hi"} : (i64) -> i3
    %14 = comb.extract %mstatus from 4 {sv.namehint = "new_mstatus_lo_hi_hi"} : (i64) -> i3
    %15 = comb.extract %mstatus from 7 {sv.namehint = "new_mstatus_lo_hi_lo"} : (i64) -> i1
    %16 = comb.extract %mstatus from 0 {sv.namehint = "new_mstatus_lo_lo"} : (i64) -> i3
    %17 = comb.concat %12, %c0_i2, %13, %true, %14, %15, %16 {sv.namehint = "new_mstatus"} : i51, i2, i3, i1, i3, i1, i3
    %18 = comb.extract %io_excep_cause from 63 {sv.namehint = "_deleg_T"} : (i64) -> i1
    %19 = comb.mux bin %18, %mideleg, %medeleg {sv.namehint = "deleg"} : i64
    %20 = comb.extract %priv from 1 : (i2) -> i1
    %21 = comb.xor bin %20, %true {sv.namehint = "_T_2"} : i1
    %22 = comb.extract %io_excep_cause from 0 {sv.namehint = "_T_3"} : (i64) -> i63
    %23 = comb.concat %false, %22 : i1, i63
    %24 = comb.shru bin %19, %23 {sv.namehint = "_T_4"} : i64
    %25 = comb.extract %24 from 0 {sv.namehint = "_T_5"} : (i64) -> i1
    %26 = comb.and bin %21, %25 {sv.namehint = "_T_6"} : i1
    %27 = comb.extract %stvec from 1 {sv.namehint = "_seq_pc_T_1"} : (i64) -> i1
    %28 = comb.extract %io_excep_cause from 0 : (i64) -> i62
    %29 = comb.concat %28, %c0_i2 : i62, i2
    %30 = comb.mux %27, %29, %c0_i64 : i64
    %31 = comb.add %stvec, %30 : i64
    %32 = comb.or bin %1, %10 : i1
    %33 = comb.xor %26, %true : i1
    %34 = comb.xor %io_excep_en, %true : i1
    %35 = comb.or %34, %32, %33 : i1
    %36 = comb.mux bin %35, %scause, %io_excep_cause : i64
    %37 = comb.xor %26, %true : i1
    %38 = comb.xor %io_excep_en, %true : i1
    %39 = comb.or %38, %32, %37 : i1
    %40 = comb.mux bin %39, %sepc, %io_excep_pc : i64
    %41 = comb.extract %priv from 0 {sv.namehint = "new_sstatus_hi_hi_lo"} : (i2) -> i1
    %42 = comb.extract %mstatus from 1 : (i64) -> i1
    %43 = comb.and bin %mstatus, %c-909603_i64 {sv.namehint = "_mstatus_T_5"} : i64
    %44 = comb.extract %0 from 13 : (i64) -> i7
    %45 = comb.and %44, %c-17_i7 : i7
    %46 = comb.concat %c0_i44, %45, %c0_i4, %41, %c0_i2, %42, %c0_i5 {sv.namehint = "_mstatus_T_6"} : i44, i7, i4, i1, i2, i1, i5
    %47 = comb.or bin %43, %46 {sv.namehint = "_mstatus_T_7"} : i64
    %48 = comb.xor %26, %true : i1
    %49 = comb.xor %io_excep_en, %true : i1
    %50 = comb.or %49, %32, %48 : i1
    %51 = comb.mux bin %50, %stval, %io_excep_tval : i64
    %52 = comb.extract %mtvec from 1 {sv.namehint = "_seq_pc_T_5"} : (i64) -> i1
    %53 = comb.extract %io_excep_cause from 0 : (i64) -> i62
    %54 = comb.concat %53, %c0_i2 : i62, i2
    %55 = comb.mux %52, %54, %c0_i64 : i64
    %56 = comb.add %mtvec, %55 : i64
    %57 = comb.mux bin %26, %31, %56 : i64
    %58 = comb.mux bin %10, %mepc, %57 : i64
    %59 = comb.mux bin %1, %sepc, %58 : i64
    %60 = comb.mux bin %io_excep_en, %59, %forceJmp_seq_pc : i64
    %61 = comb.or bin %1, %10, %26 : i1
    %62 = comb.xor %io_excep_en, %true : i1
    %63 = comb.or %62, %61 : i1
    %64 = comb.mux bin %63, %mcause, %io_excep_cause : i64
    %65 = comb.xor %io_excep_en, %true : i1
    %66 = comb.or %65, %61 : i1
    %67 = comb.mux bin %66, %mepc, %io_excep_pc : i64
    %68 = comb.extract %mstatus from 13 {sv.namehint = "new_mstatus_hi_hi_hi_1"} : (i64) -> i51
    %69 = comb.extract %mstatus from 8 {sv.namehint = "new_mstatus_hi_lo_hi_1"} : (i64) -> i3
    %70 = comb.extract %mstatus from 3 {sv.namehint = "new_mstatus_hi_lo_lo"} : (i64) -> i1
    %71 = comb.extract %mstatus from 4 {sv.namehint = "new_mstatus_lo_hi_hi_1"} : (i64) -> i3
    %72 = comb.extract %mstatus from 0 {sv.namehint = "new_mstatus_lo_lo_1"} : (i64) -> i3
    %73 = comb.concat %68, %priv, %69, %70, %71, %false, %72 {sv.namehint = "new_mstatus_1"} : i51, i2, i3, i1, i3, i1, i3
    %74 = comb.mux bin %26, %47, %73 : i64
    %75 = comb.mux bin %10, %17, %74 : i64
    %76 = comb.mux bin %1, %9, %75 : i64
    %77 = comb.mux bin %io_excep_en, %76, %mstatus : i64
    %78 = comb.xor %io_excep_en, %true : i1
    %79 = comb.or %78, %61 : i1
    %80 = comb.mux bin %79, %mtval, %io_excep_tval : i64
    %81 = comb.xor %26, %true : i1
    %82 = comb.concat %81, %true : i1, i1
    %83 = comb.mux bin %10, %11, %82 : i2
    %84 = comb.mux bin %1, %3, %83 : i2
    %85 = comb.mux bin %io_excep_en, %84, %priv : i2
    %intr_out_r_en = seq.firreg %126 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1667 : ui64} : i1
    %intr_out_r_cause = seq.firreg %139 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1668 : ui64} : i64
    %intr_seip = seq.firreg %98 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1732 : ui64} : i1
    %86 = comb.and bin %mip, %c-129_i64 {sv.namehint = "_mip_T_2"} : i64
    %87 = comb.or bin %86, %c128_i64 {sv.namehint = "_mip_T_4"} : i64
    %88 = comb.mux bin %io_clint_raise, %87, %mip : i64
    %89 = comb.and bin %mip, %c-129_i64 {sv.namehint = "_mip_T_8"} : i64
    %90 = comb.mux bin %io_clint_clear, %89, %88 : i64
    %91 = comb.and bin %mip, %c-2049_i64 {sv.namehint = "_mip_T_11"} : i64
    %92 = comb.or bin %91, %c2048_i64 {sv.namehint = "_mip_T_13"} : i64
    %93 = comb.mux bin %io_plic_m_raise, %92, %90 : i64
    %94 = comb.and bin %mip, %c-2049_i64 {sv.namehint = "_mip_T_17"} : i64
    %95 = comb.mux bin %io_plic_m_clear, %94, %93 : i64
    %96 = comb.or %io_plic_s_raise, %intr_seip : i1
    %97 = comb.xor %io_plic_s_clear, %true : i1
    %98 = comb.and %97, %96 : i1
    %99 = comb.and bin %mip, %c-9_i64 {sv.namehint = "_mip_T_20"} : i64
    %100 = comb.or bin %99, %c8_i64 {sv.namehint = "_mip_T_22"} : i64
    %101 = comb.mux bin %io_intr_msip_raise, %100, %95 : i64
    %102 = comb.and bin %mip, %c-9_i64 {sv.namehint = "_mip_T_26"} : i64
    %103 = comb.mux bin %io_intr_msip_clear, %102, %101 : i64
    %104 = comb.concat %intr_seip, %c0_i9 : i1, i9
    %105 = comb.extract %mip from 0 : (i64) -> i10
    %106 = comb.or bin %105, %104 : i10
    %107 = comb.extract %mip from 10 : (i64) -> i54
    %108 = comb.concat %107, %106 {sv.namehint = "_pending_int_T_1"} : i54, i10
    %109 = comb.and bin %108, %mie {sv.namehint = "pending_int"} : i64
    %110 = comb.icmp bin ne %priv, %c-1_i2 {sv.namehint = "_m_enable_T"} : i2
    %111 = comb.icmp bin eq %priv, %c-1_i2 {sv.namehint = "_m_enable_T_1"} : i2
    %112 = comb.extract %mstatus from 3 {sv.namehint = "_m_enable_T_2"} : (i64) -> i1
    %113 = comb.and bin %111, %112 {sv.namehint = "_m_enable_T_3"} : i1
    %114 = comb.or bin %110, %113 {sv.namehint = "m_enable"} : i1
    %115 = comb.xor bin %mideleg, %c-1_i64 {sv.namehint = "_mie_T"} : i64
    %116 = comb.replicate %114 {sv.namehint = "_enable_int_m_T_4"} : (i1) -> i64
    %117 = comb.and bin %109, %115, %116 {sv.namehint = "enable_int_m"} : i64
    %118 = comb.extract %priv from 1 : (i2) -> i1
    %119 = comb.xor bin %118, %true {sv.namehint = "_s_enable_T"} : i1
    %120 = comb.extract %mstatus from 1 {sv.namehint = "_s_enable_T_1"} : (i64) -> i1
    %121 = comb.and bin %119, %120 {sv.namehint = "s_enable"} : i1
    %122 = comb.replicate %121 {sv.namehint = "_enable_int_s_T_3"} : (i1) -> i64
    %123 = comb.and bin %109, %mideleg, %122 {sv.namehint = "enable_int_s"} : i64
    %124 = comb.icmp bin ne %117, %c0_i64 {sv.namehint = "_enable_int_T"} : i64
    %125 = comb.mux bin %124, %117, %123 {sv.namehint = "enable_int"} : i64
    %126 = comb.icmp bin ne %125, %c0_i64 {sv.namehint = "_intr_out_r_en_T"} : i64
    %127 = comb.extract %125 from 11 {sv.namehint = "_intr_out_r_cause_T"} : (i64) -> i1
    %128 = comb.extract %125 from 3 {sv.namehint = "_intr_out_r_cause_T_1"} : (i64) -> i1
    %129 = comb.extract %125 from 7 {sv.namehint = "_intr_out_r_cause_T_2"} : (i64) -> i1
    %130 = comb.extract %125 from 9 {sv.namehint = "_intr_out_r_cause_T_3"} : (i64) -> i1
    %131 = comb.extract %125 from 1 {sv.namehint = "_intr_out_r_cause_T_4"} : (i64) -> i1
    %132 = comb.extract %125 from 5 {sv.namehint = "_intr_out_r_cause_T_5"} : (i64) -> i1
    %133 = comb.mux bin %132, %c5_i6, %c-1_i6 {sv.namehint = "_intr_out_r_cause_T_6"} : i6
    %134 = comb.mux bin %131, %c1_i6, %133 {sv.namehint = "_intr_out_r_cause_T_7"} : i6
    %135 = comb.mux bin %130, %c9_i6, %134 {sv.namehint = "_intr_out_r_cause_T_8"} : i6
    %136 = comb.mux bin %129, %c7_i6, %135 {sv.namehint = "_intr_out_r_cause_T_9"} : i6
    %137 = comb.mux bin %128, %c3_i6, %136 {sv.namehint = "_intr_out_r_cause_T_10"} : i6
    %138 = comb.mux bin %127, %c11_i6, %137 {sv.namehint = "_intr_out_r_cause_T_11"} : i6
    %139 = comb.concat %c-144115188075855872_i58, %138 {sv.namehint = "_intr_out_r_cause_T_13"} : i58, i6
    %140 = comb.icmp bin eq %io_rs_id, %c769_i12 {sv.namehint = "_T_7"} : i12
    %141 = comb.icmp bin eq %io_rs_id, %c768_i12 {sv.namehint = "_T_8"} : i12
    %142 = comb.icmp bin eq %io_rs_id, %c833_i12 {sv.namehint = "_T_9"} : i12
    %143 = comb.icmp bin eq %io_rs_id, %c835_i12 {sv.namehint = "_T_10"} : i12
    %144 = comb.icmp bin eq %io_rs_id, %c832_i12 {sv.namehint = "_T_11"} : i12
    %145 = comb.icmp bin eq %io_rs_id, %c773_i12 {sv.namehint = "_T_12"} : i12
    %146 = comb.icmp bin eq %io_rs_id, %c772_i12 {sv.namehint = "_T_13"} : i12
    %147 = comb.icmp bin eq %io_rs_id, %c836_i12 {sv.namehint = "_T_14"} : i12
    %148 = comb.icmp bin eq %io_rs_id, %c834_i12 {sv.namehint = "_T_15"} : i12
    %149 = comb.icmp bin eq %io_rs_id, %c770_i12 {sv.namehint = "_T_16"} : i12
    %150 = comb.icmp bin eq %io_rs_id, %c771_i12 {sv.namehint = "_T_17"} : i12
    %151 = comb.icmp bin eq %io_rs_id, %c774_i12 {sv.namehint = "_T_18"} : i12
    %152 = comb.concat %c0_i32, %mcounteren : i32, i32
    %153 = comb.icmp bin eq %io_rs_id, %c262_i12 {sv.namehint = "_T_19"} : i12
    %154 = comb.concat %c0_i32, %scounteren : i32, i32
    %155 = comb.icmp bin eq %io_rs_id, %c321_i12 {sv.namehint = "_T_20"} : i12
    %156 = comb.icmp bin eq %io_rs_id, %c323_i12 {sv.namehint = "_T_21"} : i12
    %157 = comb.icmp bin eq %io_rs_id, %c320_i12 {sv.namehint = "_T_22"} : i12
    %158 = comb.icmp bin eq %io_rs_id, %c261_i12 {sv.namehint = "_T_23"} : i12
    %159 = comb.icmp bin eq %io_rs_id, %c384_i12 {sv.namehint = "_T_24"} : i12
    %160 = comb.icmp bin eq %io_rs_id, %c322_i12 {sv.namehint = "_T_25"} : i12
    %161 = comb.icmp bin eq %io_rs_id, %c256_i12 {sv.namehint = "_T_26"} : i12
    %162 = comb.icmp bin eq %io_rs_id, %c260_i12 {sv.namehint = "_T_27"} : i12
    %163 = comb.and bin %mie, %mideleg {sv.namehint = "_io_rs_data_T"} : i64
    %164 = comb.icmp bin eq %io_rs_id, %c324_i12 {sv.namehint = "_T_28"} : i12
    %165 = comb.and bin %mip, %c546_i64 {sv.namehint = "_io_rs_data_T_1"} : i64
    %166 = comb.icmp bin eq %io_rs_id, %c944_i12 {sv.namehint = "_T_29"} : i12
    %167 = comb.icmp bin eq %io_rs_id, %c945_i12 {sv.namehint = "_T_30"} : i12
    %168 = comb.icmp bin eq %io_rs_id, %c946_i12 {sv.namehint = "_T_31"} : i12
    %169 = comb.icmp bin eq %io_rs_id, %c947_i12 {sv.namehint = "_T_32"} : i12
    %170 = comb.icmp bin eq %io_rs_id, %c928_i12 {sv.namehint = "_T_33"} : i12
    %171 = comb.icmp bin eq %io_rs_id, %c64_i12 {sv.namehint = "_T_34"} : i12
    %172 = comb.icmp bin eq %io_rs_id, %c-236_i12 {sv.namehint = "_T_35"} : i12
    %173 = comb.mux bin %172, %mhartid, %c0_i64 : i64
    %174 = comb.mux bin %171, %uscratch, %173 : i64
    %175 = comb.or bin %169, %170 : i1
    %176 = comb.mux bin %175, %pmpaddr3, %174 : i64
    %177 = comb.mux bin %168, %pmpaddr2, %176 : i64
    %178 = comb.mux bin %167, %pmpaddr1, %177 : i64
    %179 = comb.mux bin %166, %pmpaddr0, %178 : i64
    %180 = comb.mux bin %164, %165, %179 : i64
    %181 = comb.mux bin %162, %163, %180 : i64
    %182 = comb.mux bin %161, %0, %181 : i64
    %183 = comb.mux bin %160, %scause, %182 : i64
    %184 = comb.mux bin %159, %satp, %183 : i64
    %185 = comb.mux bin %158, %stvec, %184 : i64
    %186 = comb.mux bin %157, %sscratch, %185 : i64
    %187 = comb.mux bin %156, %stval, %186 : i64
    %188 = comb.mux bin %155, %sepc, %187 : i64
    %189 = comb.mux bin %153, %154, %188 : i64
    %190 = comb.mux bin %151, %152, %189 : i64
    %191 = comb.mux bin %150, %mideleg, %190 : i64
    %192 = comb.mux bin %149, %medeleg, %191 : i64
    %193 = comb.mux bin %148, %mcause, %192 : i64
    %194 = comb.mux bin %147, %mip, %193 : i64
    %195 = comb.mux bin %146, %mie, %194 : i64
    %196 = comb.mux bin %145, %mtvec, %195 : i64
    %197 = comb.mux bin %144, %mscratch, %196 : i64
    %198 = comb.mux bin %143, %mtval, %197 : i64
    %199 = comb.mux bin %142, %mepc, %198 : i64
    %200 = comb.mux bin %141, %mstatus, %199 : i64
    %201 = comb.mux bin %140, %misa, %200 : i64
    %202 = comb.xor bin %172, %true : i1
    %203 = comb.or bin %140, %141, %142, %143, %144, %145, %146, %147, %148, %149, %150, %151, %153, %155, %156, %157, %158, %159, %160, %161, %162, %164, %166, %167, %168, %169, %170, %171 : i1
    %204 = comb.xor %203, %true : i1
    %205 = comb.and %204, %202 : i1
    %206 = comb.xor bin %io_rd_en, %true {sv.namehint = "_T_36"} : i1
    %207 = comb.icmp bin eq %io_rd_id, %c769_i12 {sv.namehint = "_T_37"} : i12
    %208 = comb.and %io_rd_en, %207 : i1
    %209 = comb.mux bin %208, %io_rd_data, %misa : i64
    %210 = comb.icmp bin eq %io_rd_id, %c768_i12 {sv.namehint = "_T_38"} : i12
    %211 = comb.and bin %io_rd_data, %c8290218_i64 {sv.namehint = "new_mstatus_2"} : i64
    %212 = comb.extract %io_rd_data from 13 {sv.namehint = "_sd_T"} : (i64) -> i2
    %213 = comb.icmp bin eq %212, %c-1_i2 {sv.namehint = "_sd_T_1"} : i2
    %214 = comb.extract %io_rd_data from 15 {sv.namehint = "_sd_T_2"} : (i64) -> i2
    %215 = comb.icmp bin eq %214, %c-1_i2 {sv.namehint = "_sd_T_3"} : i2
    %216 = comb.or bin %213, %215 {sv.namehint = "_sd_T_4"} : i1
    %217 = comb.concat %216, %c0_i63 {sv.namehint = "sd"} : i1, i63
    %218 = comb.or bin %211, %217 {sv.namehint = "_mstatus_T_9"} : i64
    %219 = comb.and bin %mstatus, %c9223372036846485589_i64 {sv.namehint = "_mstatus_T_11"} : i64
    %220 = comb.and bin %218, %c-9223372036846485590_i64 {sv.namehint = "_mstatus_T_12"} : i64
    %221 = comb.or bin %219, %220 {sv.namehint = "_mstatus_T_13"} : i64
    %222 = comb.icmp bin eq %io_rd_id, %c833_i12 {sv.namehint = "_T_39"} : i12
    %223 = comb.xor %222, %true : i1
    %224 = comb.or %206, %207, %210, %223 : i1
    %225 = comb.mux bin %224, %67, %io_rd_data : i64
    %226 = comb.icmp bin eq %io_rd_id, %c835_i12 {sv.namehint = "_T_40"} : i12
    %227 = comb.xor %226, %true : i1
    %228 = comb.or %206, %207, %210, %222, %227 : i1
    %229 = comb.mux bin %228, %80, %io_rd_data : i64
    %230 = comb.icmp bin eq %io_rd_id, %c832_i12 {sv.namehint = "_T_41"} : i12
    %231 = comb.xor %230, %true : i1
    %232 = comb.or %206, %207, %210, %222, %226, %231 : i1
    %233 = comb.mux bin %232, %mscratch, %io_rd_data : i64
    %234 = comb.icmp bin eq %io_rd_id, %c773_i12 {sv.namehint = "_T_42"} : i12
    %235 = comb.xor %234, %true : i1
    %236 = comb.or %206, %207, %210, %222, %226, %230, %235 : i1
    %237 = comb.mux bin %236, %mtvec, %io_rd_data : i64
    %238 = comb.icmp bin eq %io_rd_id, %c772_i12 {sv.namehint = "_T_43"} : i12
    %239 = comb.icmp bin eq %io_rd_id, %c836_i12 {sv.namehint = "_T_44"} : i12
    %240 = comb.and bin %mip, %c-35_i64 {sv.namehint = "_mip_T_28"} : i64
    %241 = comb.and bin %io_rd_data, %c34_i64 {sv.namehint = "_mip_T_29"} : i64
    %242 = comb.or bin %240, %241 {sv.namehint = "_mip_T_30"} : i64
    %243 = comb.extract %242 from 0 : (i64) -> i10
    %244 = comb.or bin %243, %104 : i10
    %245 = comb.extract %242 from 10 : (i64) -> i54
    %246 = comb.concat %245, %244 {sv.namehint = "_mip_T_32"} : i54, i10
    %247 = comb.icmp bin eq %io_rd_id, %c834_i12 {sv.namehint = "_T_45"} : i12
    %248 = comb.xor %247, %true : i1
    %249 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %248 : i1
    %250 = comb.mux bin %249, %64, %io_rd_data : i64
    %251 = comb.icmp bin eq %io_rd_id, %c770_i12 {sv.namehint = "_T_46"} : i12
    %252 = comb.and bin %io_rd_data, %c45833_i64 {sv.namehint = "_medeleg_T"} : i64
    %253 = comb.xor %251, %true : i1
    %254 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %253 : i1
    %255 = comb.mux bin %254, %medeleg, %252 : i64
    %256 = comb.icmp bin eq %io_rd_id, %c771_i12 {sv.namehint = "_T_47"} : i12
    %257 = comb.and bin %io_rd_data, %c546_i64 {sv.namehint = "_mideleg_T"} : i64
    %258 = comb.xor %256, %true : i1
    %259 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %258 : i1
    %260 = comb.mux bin %259, %mideleg, %257 : i64
    %261 = comb.icmp bin eq %io_rd_id, %c774_i12 {sv.namehint = "_T_48"} : i12
    %262 = comb.extract %io_rd_data from 0 : (i64) -> i32
    %263 = comb.xor %261, %true : i1
    %264 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %263 : i1
    %265 = comb.mux bin %264, %mcounteren, %262 : i32
    %266 = comb.icmp bin eq %io_rd_id, %c262_i12 {sv.namehint = "_T_49"} : i12
    %267 = comb.xor %266, %true : i1
    %268 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %267 : i1
    %269 = comb.mux bin %268, %scounteren, %262 : i32
    %270 = comb.icmp bin eq %io_rd_id, %c321_i12 {sv.namehint = "_T_50"} : i12
    %271 = comb.xor %270, %true : i1
    %272 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %271 : i1
    %273 = comb.mux bin %272, %40, %io_rd_data : i64
    %274 = comb.icmp bin eq %io_rd_id, %c323_i12 {sv.namehint = "_T_51"} : i12
    %275 = comb.xor %274, %true : i1
    %276 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %275 : i1
    %277 = comb.mux bin %276, %51, %io_rd_data : i64
    %278 = comb.icmp bin eq %io_rd_id, %c320_i12 {sv.namehint = "_T_52"} : i12
    %279 = comb.xor %278, %true : i1
    %280 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %279 : i1
    %281 = comb.mux bin %280, %sscratch, %io_rd_data : i64
    %282 = comb.icmp bin eq %io_rd_id, %c261_i12 {sv.namehint = "_T_53"} : i12
    %283 = comb.xor %282, %true : i1
    %284 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %283 : i1
    %285 = comb.mux bin %284, %stvec, %io_rd_data : i64
    %286 = comb.icmp bin eq %io_rd_id, %c384_i12 {sv.namehint = "_T_54"} : i12
    %287 = comb.and bin %satp, %c1152903912420802560_i64 {sv.namehint = "_satp_T_1"} : i64
    %288 = comb.and bin %io_rd_data, %c-1152903912420802561_i64 {sv.namehint = "_satp_T_2"} : i64
    %289 = comb.or bin %287, %288 {sv.namehint = "_satp_T_3"} : i64
    %290 = comb.xor %286, %true : i1
    %291 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %290 : i1
    %292 = comb.mux bin %291, %satp, %289 : i64
    %293 = comb.icmp bin eq %io_rd_id, %c322_i12 {sv.namehint = "_T_55"} : i12
    %294 = comb.xor %293, %true : i1
    %295 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %294 : i1
    %296 = comb.mux bin %295, %36, %io_rd_data : i64
    %297 = comb.icmp bin eq %io_rd_id, %c256_i12 {sv.namehint = "_T_56"} : i12
    %298 = comb.extract %mstatus from 0 : (i64) -> i62
    %299 = comb.and %298, %c-909603_i62 : i62
    %300 = comb.extract %io_rd_data from 1 : (i64) -> i19
    %301 = comb.and %300, %c-69487_i19 : i19
    %302 = comb.concat %c0_i42, %301, %false : i42, i19, i1
    %303 = comb.or %299, %302 {sv.namehint = "mstatus_lo"} : i62
    %304 = comb.extract %io_rd_data from 13 {sv.namehint = "_sd_T_5"} : (i64) -> i2
    %305 = comb.icmp bin eq %304, %c-1_i2 {sv.namehint = "_sd_T_6"} : i2
    %306 = comb.extract %io_rd_data from 15 {sv.namehint = "_sd_T_7"} : (i64) -> i2
    %307 = comb.icmp bin eq %306, %c-1_i2 {sv.namehint = "_sd_T_8"} : i2
    %308 = comb.or bin %305, %307 {sv.namehint = "_sd_T_9"} : i1
    %309 = comb.concat %308, %false, %303 {sv.namehint = "_mstatus_T_14"} : i1, i1, i62
    %310 = comb.xor %297, %true : i1
    %311 = comb.or %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %310 : i1
    %312 = comb.mux bin %311, %77, %309 : i64
    %313 = comb.mux bin %210, %221, %312 : i64
    %314 = comb.or bin %206, %207 : i1
    %315 = comb.mux bin %314, %77, %313 : i64
    %316 = comb.icmp bin eq %io_rd_id, %c260_i12 {sv.namehint = "_T_57"} : i12
    %317 = comb.and bin %mie, %115 {sv.namehint = "_mie_T_1"} : i64
    %318 = comb.and bin %io_rd_data, %mideleg {sv.namehint = "_mie_T_2"} : i64
    %319 = comb.or bin %317, %318 {sv.namehint = "_mie_T_3"} : i64
    %320 = comb.xor %316, %true : i1
    %321 = comb.or %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %320 : i1
    %322 = comb.mux bin %321, %mie, %319 : i64
    %323 = comb.mux bin %238, %io_rd_data, %322 : i64
    %324 = comb.or bin %206, %207, %210, %222, %226, %230, %234 : i1
    %325 = comb.mux bin %324, %mie, %323 : i64
    %326 = comb.icmp bin eq %io_rd_id, %c324_i12 {sv.namehint = "_T_58"} : i12
    %327 = comb.and bin %mip, %c-547_i64 {sv.namehint = "_mip_T_34"} : i64
    %328 = comb.and bin %io_rd_data, %c546_i64 {sv.namehint = "_mip_T_35"} : i64
    %329 = comb.or bin %327, %328 {sv.namehint = "_mip_T_36"} : i64
    %330 = comb.xor %326, %true : i1
    %331 = comb.or %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %330 : i1
    %332 = comb.mux bin %331, %103, %329 : i64
    %333 = comb.mux bin %239, %246, %332 : i64
    %334 = comb.or bin %206, %207, %210, %222, %226, %230, %234, %238 : i1
    %335 = comb.mux bin %334, %103, %333 : i64
    %336 = comb.icmp bin eq %io_rd_id, %c944_i12 {sv.namehint = "_T_59"} : i12
    %337 = comb.and bin %io_rd_data, %c18014398509481983_i64 {sv.namehint = "_pmpaddr0_T"} : i64
    %338 = comb.xor %336, %true : i1
    %339 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %326, %338 : i1
    %340 = comb.mux bin %339, %pmpaddr0, %337 : i64
    %341 = comb.icmp bin eq %io_rd_id, %c945_i12 {sv.namehint = "_T_60"} : i12
    %342 = comb.and bin %io_rd_data, %c18014398509481983_i64 {sv.namehint = "_pmpaddr1_T"} : i64
    %343 = comb.xor %341, %true : i1
    %344 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %326, %336, %343 : i1
    %345 = comb.mux bin %344, %pmpaddr1, %342 : i64
    %346 = comb.icmp bin eq %io_rd_id, %c946_i12 {sv.namehint = "_T_61"} : i12
    %347 = comb.and bin %io_rd_data, %c18014398509481983_i64 {sv.namehint = "_pmpaddr2_T"} : i64
    %348 = comb.xor %346, %true : i1
    %349 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %326, %336, %341, %348 : i1
    %350 = comb.mux bin %349, %pmpaddr2, %347 : i64
    %351 = comb.icmp bin eq %io_rd_id, %c947_i12 {sv.namehint = "_T_62"} : i12
    %352 = comb.and bin %io_rd_data, %c18014398509481983_i64 {sv.namehint = "_pmpaddr3_T"} : i64
    %353 = comb.xor %351, %true : i1
    %354 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %326, %336, %341, %346, %353 : i1
    %355 = comb.mux bin %354, %pmpaddr3, %352 : i64
    %356 = comb.icmp bin eq %io_rd_id, %c928_i12 {sv.namehint = "_T_63"} : i12
    %357 = comb.icmp bin eq %io_rd_id, %c64_i12 {sv.namehint = "_T_64"} : i12
    %358 = comb.xor %357, %true : i1
    %359 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %326, %336, %341, %346, %351, %356, %358 : i1
    %360 = comb.mux bin %359, %uscratch, %io_rd_data : i64
    %361 = comb.icmp bin ne %io_rd_id, %c-236_i12 : i12
    %362 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %326, %336, %341, %346, %351, %356, %357, %361 : i1
    %363 = comb.mux bin %362, %mhartid, %io_rd_data : i64
    hw.output %201, %205, %priv, %mstatus, %satp, %priv, %forceJmp_seq_pc, %forceJmp_valid, %intr_out_r_en, %intr_out_r_cause, %forceJmp_seq_pc, %forceJmp_valid : i64, i1, i2, i64, i64, i2, i64, i1, i1, i64, i64, i1
  }
  hw.module private @S011HD1P_X32Y2D128_BW(%clock: i1, %reset: i1, %io_CEN: i1, %io_WEN: i1, %io_BWEN: i128, %io_A: i6, %io_D: i128) -> (io_Q: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %c0_i128 = hw.constant 0 : i128
    %ram_ext.R0_data, %ram_ext.R1_data = hw.instance "ram_ext" @ram_combMem(R0_addr: %io_A: i6, R0_en: %2: i1, R0_clk: %clock: i1, R1_addr: %io_A: i6, R1_en: %7: i1, R1_clk: %clock: i1, W0_addr: %io_A: i6, W0_en: %2: i1, W0_clk: %clock: i1, W0_data: %6: i128) -> (R0_data: i128, R1_data: i128)
    %output = seq.firreg %8 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 0 : ui64} : i128
    %0 = comb.xor bin %io_CEN, %true {sv.namehint = "_T"} : i1
    %1 = comb.xor bin %io_WEN, %true {sv.namehint = "_T_1"} : i1
    %2 = comb.and bin %0, %1 {sv.namehint = "_T_2"} : i1
    %3 = comb.xor bin %io_BWEN, %c-1_i128 {sv.namehint = "_T_3"} : i128
    %4 = comb.and bin %io_D, %3 {sv.namehint = "_T_4"} : i128
    %5 = comb.and bin %ram_ext.R0_data, %io_BWEN {sv.namehint = "_T_5"} : i128
    %6 = comb.or bin %4, %5 {sv.namehint = "_T_6"} : i128
    %7 = comb.xor bin %2, %true : i1
    %8 = comb.mux bin %2, %c0_i128, %ram_ext.R1_data : i128
    hw.output %output : i128
  }
  hw.module private @Ram_bw(%clock: i1, %reset: i1, %io_cen: i1, %io_wen: i1, %io_addr: i6, %io_wdata: i128, %io_mask: i128) -> (io_rdata: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %ram.io_Q = hw.instance "ram" @S011HD1P_X32Y2D128_BW(clock: %clock: i1, reset: %reset: i1, io_CEN: %0: i1, io_WEN: %1: i1, io_BWEN: %2: i128, io_A: %io_addr: i6, io_D: %io_wdata: i128) -> (io_Q: i128)
    %0 = comb.xor bin %io_cen, %true {sv.namehint = "_ram_io_CEN_T"} : i1
    %1 = comb.xor bin %io_wen, %true {sv.namehint = "_ram_io_WEN_T"} : i1
    %2 = comb.xor bin %io_mask, %c-1_i128 {sv.namehint = "_ram_io_BWEN_T"} : i128
    hw.output %ram.io_Q : i128
  }
  hw.module private @S011HD1P_X32Y2D128_BW_1(%clock: i1, %reset: i1, %io_CEN: i1, %io_WEN: i1, %io_BWEN: i128, %io_A: i6, %io_D: i128) -> (io_Q: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %c0_i128 = hw.constant 0 : i128
    %ram_ext.R0_data, %ram_ext.R1_data = hw.instance "ram_ext" @ram_combMem(R0_addr: %io_A: i6, R0_en: %2: i1, R0_clk: %clock: i1, R1_addr: %io_A: i6, R1_en: %7: i1, R1_clk: %clock: i1, W0_addr: %io_A: i6, W0_en: %2: i1, W0_clk: %clock: i1, W0_data: %6: i128) -> (R0_data: i128, R1_data: i128)
    %output = seq.firreg %8 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 0 : ui64} : i128
    %0 = comb.xor bin %io_CEN, %true {sv.namehint = "_T"} : i1
    %1 = comb.xor bin %io_WEN, %true {sv.namehint = "_T_1"} : i1
    %2 = comb.and bin %0, %1 {sv.namehint = "_T_2"} : i1
    %3 = comb.xor bin %io_BWEN, %c-1_i128 {sv.namehint = "_T_3"} : i128
    %4 = comb.and bin %io_D, %3 {sv.namehint = "_T_4"} : i128
    %5 = comb.and bin %ram_ext.R0_data, %io_BWEN {sv.namehint = "_T_5"} : i128
    %6 = comb.or bin %4, %5 {sv.namehint = "_T_6"} : i128
    %7 = comb.xor bin %2, %true : i1
    %8 = comb.mux bin %2, %c0_i128, %ram_ext.R1_data : i128
    hw.output %output : i128
  }
  hw.module private @Ram_bw_1(%clock: i1, %reset: i1, %io_cen: i1, %io_wen: i1, %io_addr: i6, %io_wdata: i128, %io_mask: i128) -> (io_rdata: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %ram.io_Q = hw.instance "ram" @S011HD1P_X32Y2D128_BW_1(clock: %clock: i1, reset: %reset: i1, io_CEN: %0: i1, io_WEN: %1: i1, io_BWEN: %2: i128, io_A: %io_addr: i6, io_D: %io_wdata: i128) -> (io_Q: i128)
    %0 = comb.xor bin %io_cen, %true {sv.namehint = "_ram_io_CEN_T"} : i1
    %1 = comb.xor bin %io_wen, %true {sv.namehint = "_ram_io_WEN_T"} : i1
    %2 = comb.xor bin %io_mask, %c-1_i128 {sv.namehint = "_ram_io_BWEN_T"} : i128
    hw.output %ram.io_Q : i128
  }
  hw.module private @S011HD1P_X32Y2D128_BW_2(%clock: i1, %reset: i1, %io_CEN: i1, %io_WEN: i1, %io_BWEN: i128, %io_A: i6, %io_D: i128) -> (io_Q: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %c0_i128 = hw.constant 0 : i128
    %ram_ext.R0_data, %ram_ext.R1_data = hw.instance "ram_ext" @ram_combMem(R0_addr: %io_A: i6, R0_en: %2: i1, R0_clk: %clock: i1, R1_addr: %io_A: i6, R1_en: %7: i1, R1_clk: %clock: i1, W0_addr: %io_A: i6, W0_en: %2: i1, W0_clk: %clock: i1, W0_data: %6: i128) -> (R0_data: i128, R1_data: i128)
    %output = seq.firreg %8 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 0 : ui64} : i128
    %0 = comb.xor bin %io_CEN, %true {sv.namehint = "_T"} : i1
    %1 = comb.xor bin %io_WEN, %true {sv.namehint = "_T_1"} : i1
    %2 = comb.and bin %0, %1 {sv.namehint = "_T_2"} : i1
    %3 = comb.xor bin %io_BWEN, %c-1_i128 {sv.namehint = "_T_3"} : i128
    %4 = comb.and bin %io_D, %3 {sv.namehint = "_T_4"} : i128
    %5 = comb.and bin %ram_ext.R0_data, %io_BWEN {sv.namehint = "_T_5"} : i128
    %6 = comb.or bin %4, %5 {sv.namehint = "_T_6"} : i128
    %7 = comb.xor bin %2, %true : i1
    %8 = comb.mux bin %2, %c0_i128, %ram_ext.R1_data : i128
    hw.output %output : i128
  }
  hw.module private @Ram_bw_2(%clock: i1, %reset: i1, %io_cen: i1, %io_wen: i1, %io_addr: i6, %io_wdata: i128, %io_mask: i128) -> (io_rdata: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %ram.io_Q = hw.instance "ram" @S011HD1P_X32Y2D128_BW_2(clock: %clock: i1, reset: %reset: i1, io_CEN: %0: i1, io_WEN: %1: i1, io_BWEN: %2: i128, io_A: %io_addr: i6, io_D: %io_wdata: i128) -> (io_Q: i128)
    %0 = comb.xor bin %io_cen, %true {sv.namehint = "_ram_io_CEN_T"} : i1
    %1 = comb.xor bin %io_wen, %true {sv.namehint = "_ram_io_WEN_T"} : i1
    %2 = comb.xor bin %io_mask, %c-1_i128 {sv.namehint = "_ram_io_BWEN_T"} : i128
    hw.output %ram.io_Q : i128
  }
  hw.module private @S011HD1P_X32Y2D128_BW_3(%clock: i1, %reset: i1, %io_CEN: i1, %io_WEN: i1, %io_BWEN: i128, %io_A: i6, %io_D: i128) -> (io_Q: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %c0_i128 = hw.constant 0 : i128
    %ram_ext.R0_data, %ram_ext.R1_data = hw.instance "ram_ext" @ram_combMem(R0_addr: %io_A: i6, R0_en: %2: i1, R0_clk: %clock: i1, R1_addr: %io_A: i6, R1_en: %7: i1, R1_clk: %clock: i1, W0_addr: %io_A: i6, W0_en: %2: i1, W0_clk: %clock: i1, W0_data: %6: i128) -> (R0_data: i128, R1_data: i128)
    %output = seq.firreg %8 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 0 : ui64} : i128
    %0 = comb.xor bin %io_CEN, %true {sv.namehint = "_T"} : i1
    %1 = comb.xor bin %io_WEN, %true {sv.namehint = "_T_1"} : i1
    %2 = comb.and bin %0, %1 {sv.namehint = "_T_2"} : i1
    %3 = comb.xor bin %io_BWEN, %c-1_i128 {sv.namehint = "_T_3"} : i128
    %4 = comb.and bin %io_D, %3 {sv.namehint = "_T_4"} : i128
    %5 = comb.and bin %ram_ext.R0_data, %io_BWEN {sv.namehint = "_T_5"} : i128
    %6 = comb.or bin %4, %5 {sv.namehint = "_T_6"} : i128
    %7 = comb.xor bin %2, %true : i1
    %8 = comb.mux bin %2, %c0_i128, %ram_ext.R1_data : i128
    hw.output %output : i128
  }
  hw.module private @Ram_bw_3(%clock: i1, %reset: i1, %io_cen: i1, %io_wen: i1, %io_addr: i6, %io_wdata: i128, %io_mask: i128) -> (io_rdata: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %ram.io_Q = hw.instance "ram" @S011HD1P_X32Y2D128_BW_3(clock: %clock: i1, reset: %reset: i1, io_CEN: %0: i1, io_WEN: %1: i1, io_BWEN: %2: i128, io_A: %io_addr: i6, io_D: %io_wdata: i128) -> (io_Q: i128)
    %0 = comb.xor bin %io_cen, %true {sv.namehint = "_ram_io_CEN_T"} : i1
    %1 = comb.xor bin %io_wen, %true {sv.namehint = "_ram_io_WEN_T"} : i1
    %2 = comb.xor bin %io_mask, %c-1_i128 {sv.namehint = "_ram_io_BWEN_T"} : i128
    hw.output %ram.io_Q : i128
  }
  hw.module private @MaxPeriodFibonacciLFSR(%clock: i1, %reset: i1) -> (io_out_0: i1, io_out_1: i1) {
    %false = hw.constant false
    %true = hw.constant true
    %state_0 = seq.firreg %0 clock %clock reset sync %reset, %true {firrtl.random_init_start = 0 : ui64} : i1
    %state_1 = seq.firreg %state_0 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %0 = comb.xor bin %state_1, %state_0 {sv.namehint = "_T"} : i1
    hw.output %state_0, %state_1 : i1, i1
  }
  hw.module private @InstCache(%clock: i1, %reset: i1, %io_instAxi_ra_ready: i1, %io_instAxi_rd_valid: i1, %io_instAxi_rd_bits_data: i64, %io_instAxi_rd_bits_last: i1, %io_icRead_addr: i32, %io_icRead_arvalid: i1, %io_flush: i1) -> (io_instAxi_ra_valid: i1, io_instAxi_ra_bits_addr: i32, io_icRead_inst: i64, io_icRead_rvalid: i1) {
    %true = hw.constant true
    %c1_i3 = hw.constant 1 : i3
    %false = hw.constant false
    %c0_i30 = hw.constant 0 : i30
    %c-1_i4 = hw.constant -1 : i4
    %c-1_i2 = hw.constant -1 : i2
    %c0_i4 = hw.constant 0 : i4
    %c-2_i2 = hw.constant -2 : i2
    %c1_i2 = hw.constant 1 : i2
    %c-64_i32 = hw.constant -64 : i32
    %c1_i4 = hw.constant 1 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c4_i4 = hw.constant 4 : i4
    %c5_i4 = hw.constant 5 : i4
    %c6_i4 = hw.constant 6 : i4
    %c7_i4 = hw.constant 7 : i4
    %c-8_i4 = hw.constant -8 : i4
    %c-7_i4 = hw.constant -7 : i4
    %c-6_i4 = hw.constant -6 : i4
    %c-5_i4 = hw.constant -5 : i4
    %c-4_i4 = hw.constant -4 : i4
    %c-3_i4 = hw.constant -3 : i4
    %c-2_i4 = hw.constant -2 : i4
    %c0_i22 = hw.constant 0 : i22
    %c0_i6 = hw.constant 0 : i6
    %c0_i128 = hw.constant 0 : i128
    %c0_i32 = hw.constant 0 : i32
    %c0_i3 = hw.constant 0 : i3
    %c0_i2 = hw.constant 0 : i2
    %c0_i64 = hw.constant 0 : i64
    %tag_0_0 = seq.firreg %257 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 0 : ui64} : i22
    %tag_0_1 = seq.firreg %262 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 22 : ui64} : i22
    %tag_0_2 = seq.firreg %267 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 44 : ui64} : i22
    %tag_0_3 = seq.firreg %272 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 66 : ui64} : i22
    %tag_0_4 = seq.firreg %277 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 88 : ui64} : i22
    %tag_0_5 = seq.firreg %282 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 110 : ui64} : i22
    %tag_0_6 = seq.firreg %287 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 132 : ui64} : i22
    %tag_0_7 = seq.firreg %292 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 154 : ui64} : i22
    %tag_0_8 = seq.firreg %297 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 176 : ui64} : i22
    %tag_0_9 = seq.firreg %302 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 198 : ui64} : i22
    %tag_0_10 = seq.firreg %307 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 220 : ui64} : i22
    %tag_0_11 = seq.firreg %312 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 242 : ui64} : i22
    %tag_0_12 = seq.firreg %317 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 264 : ui64} : i22
    %tag_0_13 = seq.firreg %322 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 286 : ui64} : i22
    %tag_0_14 = seq.firreg %327 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 308 : ui64} : i22
    %tag_0_15 = seq.firreg %332 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 330 : ui64} : i22
    %tag_1_0 = seq.firreg %337 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 352 : ui64} : i22
    %tag_1_1 = seq.firreg %341 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 374 : ui64} : i22
    %tag_1_2 = seq.firreg %345 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 396 : ui64} : i22
    %tag_1_3 = seq.firreg %349 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 418 : ui64} : i22
    %tag_1_4 = seq.firreg %353 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 440 : ui64} : i22
    %tag_1_5 = seq.firreg %357 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 462 : ui64} : i22
    %tag_1_6 = seq.firreg %361 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 484 : ui64} : i22
    %tag_1_7 = seq.firreg %365 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 506 : ui64} : i22
    %tag_1_8 = seq.firreg %369 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 528 : ui64} : i22
    %tag_1_9 = seq.firreg %373 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 550 : ui64} : i22
    %tag_1_10 = seq.firreg %377 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 572 : ui64} : i22
    %tag_1_11 = seq.firreg %381 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 594 : ui64} : i22
    %tag_1_12 = seq.firreg %385 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 616 : ui64} : i22
    %tag_1_13 = seq.firreg %389 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 638 : ui64} : i22
    %tag_1_14 = seq.firreg %393 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 660 : ui64} : i22
    %tag_1_15 = seq.firreg %397 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 682 : ui64} : i22
    %tag_2_0 = seq.firreg %402 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 704 : ui64} : i22
    %tag_2_1 = seq.firreg %406 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 726 : ui64} : i22
    %tag_2_2 = seq.firreg %410 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 748 : ui64} : i22
    %tag_2_3 = seq.firreg %414 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 770 : ui64} : i22
    %tag_2_4 = seq.firreg %418 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 792 : ui64} : i22
    %tag_2_5 = seq.firreg %422 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 814 : ui64} : i22
    %tag_2_6 = seq.firreg %426 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 836 : ui64} : i22
    %tag_2_7 = seq.firreg %430 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 858 : ui64} : i22
    %tag_2_8 = seq.firreg %434 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 880 : ui64} : i22
    %tag_2_9 = seq.firreg %438 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 902 : ui64} : i22
    %tag_2_10 = seq.firreg %442 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 924 : ui64} : i22
    %tag_2_11 = seq.firreg %446 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 946 : ui64} : i22
    %tag_2_12 = seq.firreg %450 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 968 : ui64} : i22
    %tag_2_13 = seq.firreg %454 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 990 : ui64} : i22
    %tag_2_14 = seq.firreg %458 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1012 : ui64} : i22
    %tag_2_15 = seq.firreg %462 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1034 : ui64} : i22
    %tag_3_0 = seq.firreg %467 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1056 : ui64} : i22
    %tag_3_1 = seq.firreg %471 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1078 : ui64} : i22
    %tag_3_2 = seq.firreg %475 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1100 : ui64} : i22
    %tag_3_3 = seq.firreg %479 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1122 : ui64} : i22
    %tag_3_4 = seq.firreg %483 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1144 : ui64} : i22
    %tag_3_5 = seq.firreg %487 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1166 : ui64} : i22
    %tag_3_6 = seq.firreg %491 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1188 : ui64} : i22
    %tag_3_7 = seq.firreg %495 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1210 : ui64} : i22
    %tag_3_8 = seq.firreg %499 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1232 : ui64} : i22
    %tag_3_9 = seq.firreg %503 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1254 : ui64} : i22
    %tag_3_10 = seq.firreg %507 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1276 : ui64} : i22
    %tag_3_11 = seq.firreg %511 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1298 : ui64} : i22
    %tag_3_12 = seq.firreg %515 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1320 : ui64} : i22
    %tag_3_13 = seq.firreg %519 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1342 : ui64} : i22
    %tag_3_14 = seq.firreg %523 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1364 : ui64} : i22
    %tag_3_15 = seq.firreg %527 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1386 : ui64} : i22
    %valid_0_0 = seq.firreg %530 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1408 : ui64} : i1
    %valid_0_1 = seq.firreg %533 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1409 : ui64} : i1
    %valid_0_2 = seq.firreg %536 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1410 : ui64} : i1
    %valid_0_3 = seq.firreg %539 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1411 : ui64} : i1
    %valid_0_4 = seq.firreg %542 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1412 : ui64} : i1
    %valid_0_5 = seq.firreg %545 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1413 : ui64} : i1
    %valid_0_6 = seq.firreg %548 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1414 : ui64} : i1
    %valid_0_7 = seq.firreg %551 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1415 : ui64} : i1
    %valid_0_8 = seq.firreg %554 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1416 : ui64} : i1
    %valid_0_9 = seq.firreg %557 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1417 : ui64} : i1
    %valid_0_10 = seq.firreg %560 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1418 : ui64} : i1
    %valid_0_11 = seq.firreg %563 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1419 : ui64} : i1
    %valid_0_12 = seq.firreg %566 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1420 : ui64} : i1
    %valid_0_13 = seq.firreg %569 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1421 : ui64} : i1
    %valid_0_14 = seq.firreg %572 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1422 : ui64} : i1
    %valid_0_15 = seq.firreg %575 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1423 : ui64} : i1
    %valid_1_0 = seq.firreg %578 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1424 : ui64} : i1
    %valid_1_1 = seq.firreg %581 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1425 : ui64} : i1
    %valid_1_2 = seq.firreg %584 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1426 : ui64} : i1
    %valid_1_3 = seq.firreg %587 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1427 : ui64} : i1
    %valid_1_4 = seq.firreg %590 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1428 : ui64} : i1
    %valid_1_5 = seq.firreg %593 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1429 : ui64} : i1
    %valid_1_6 = seq.firreg %596 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1430 : ui64} : i1
    %valid_1_7 = seq.firreg %599 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1431 : ui64} : i1
    %valid_1_8 = seq.firreg %602 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1432 : ui64} : i1
    %valid_1_9 = seq.firreg %605 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1433 : ui64} : i1
    %valid_1_10 = seq.firreg %608 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1434 : ui64} : i1
    %valid_1_11 = seq.firreg %611 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1435 : ui64} : i1
    %valid_1_12 = seq.firreg %614 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1436 : ui64} : i1
    %valid_1_13 = seq.firreg %617 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1437 : ui64} : i1
    %valid_1_14 = seq.firreg %620 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1438 : ui64} : i1
    %valid_1_15 = seq.firreg %623 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1439 : ui64} : i1
    %valid_2_0 = seq.firreg %626 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1440 : ui64} : i1
    %valid_2_1 = seq.firreg %629 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1441 : ui64} : i1
    %valid_2_2 = seq.firreg %632 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1442 : ui64} : i1
    %valid_2_3 = seq.firreg %635 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1443 : ui64} : i1
    %valid_2_4 = seq.firreg %638 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1444 : ui64} : i1
    %valid_2_5 = seq.firreg %641 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1445 : ui64} : i1
    %valid_2_6 = seq.firreg %644 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1446 : ui64} : i1
    %valid_2_7 = seq.firreg %647 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1447 : ui64} : i1
    %valid_2_8 = seq.firreg %650 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1448 : ui64} : i1
    %valid_2_9 = seq.firreg %653 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1449 : ui64} : i1
    %valid_2_10 = seq.firreg %656 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1450 : ui64} : i1
    %valid_2_11 = seq.firreg %659 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1451 : ui64} : i1
    %valid_2_12 = seq.firreg %662 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1452 : ui64} : i1
    %valid_2_13 = seq.firreg %665 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1453 : ui64} : i1
    %valid_2_14 = seq.firreg %668 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1454 : ui64} : i1
    %valid_2_15 = seq.firreg %671 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1455 : ui64} : i1
    %valid_3_0 = seq.firreg %674 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1456 : ui64} : i1
    %valid_3_1 = seq.firreg %677 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1457 : ui64} : i1
    %valid_3_2 = seq.firreg %680 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1458 : ui64} : i1
    %valid_3_3 = seq.firreg %683 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1459 : ui64} : i1
    %valid_3_4 = seq.firreg %686 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1460 : ui64} : i1
    %valid_3_5 = seq.firreg %689 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1461 : ui64} : i1
    %valid_3_6 = seq.firreg %692 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1462 : ui64} : i1
    %valid_3_7 = seq.firreg %695 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1463 : ui64} : i1
    %valid_3_8 = seq.firreg %698 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1464 : ui64} : i1
    %valid_3_9 = seq.firreg %701 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1465 : ui64} : i1
    %valid_3_10 = seq.firreg %704 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1466 : ui64} : i1
    %valid_3_11 = seq.firreg %707 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1467 : ui64} : i1
    %valid_3_12 = seq.firreg %710 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1468 : ui64} : i1
    %valid_3_13 = seq.firreg %713 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1469 : ui64} : i1
    %valid_3_14 = seq.firreg %716 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1470 : ui64} : i1
    %valid_3_15 = seq.firreg %719 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1471 : ui64} : i1
    %Ram_bw.io_rdata = hw.instance "Ram_bw" @Ram_bw(clock: %clock: i1, reset: %reset: i1, io_cen: %194: i1, io_wen: %198: i1, io_addr: %186: i6, io_wdata: %203: i128, io_mask: %207: i128) -> (io_rdata: i128) {sv.namehint = "data_0_rdata"}
    %Ram_bw_1.io_rdata = hw.instance "Ram_bw_1" @Ram_bw_1(clock: %clock: i1, reset: %reset: i1, io_cen: %195: i1, io_wen: %199: i1, io_addr: %188: i6, io_wdata: %204: i128, io_mask: %208: i128) -> (io_rdata: i128) {sv.namehint = "data_1_rdata"}
    %Ram_bw_2.io_rdata = hw.instance "Ram_bw_2" @Ram_bw_2(clock: %clock: i1, reset: %reset: i1, io_cen: %196: i1, io_wen: %200: i1, io_addr: %190: i6, io_wdata: %205: i128, io_mask: %209: i128) -> (io_rdata: i128) {sv.namehint = "data_2_rdata"}
    %Ram_bw_3.io_rdata = hw.instance "Ram_bw_3" @Ram_bw_3(clock: %clock: i1, reset: %reset: i1, io_cen: %197: i1, io_wen: %201: i1, io_addr: %192: i6, io_wdata: %206: i128, io_mask: %210: i128) -> (io_rdata: i128) {sv.namehint = "data_3_rdata"}
    %wait_r = seq.firreg %227 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1472 : ui64} : i1
    %valid_r = seq.firreg %223 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1473 : ui64} : i1
    %0 = comb.xor bin %io_flush, %true {sv.namehint = "_valid_in_T"} : i1
    %1 = comb.and %io_icRead_arvalid, %0, %2 {sv.namehint = "hs_in"} : i1
    %2 = comb.xor bin %wait_r, %true {sv.namehint = "_T_7"} : i1
    %addr_r = seq.firreg %46 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1474 : ui64} : i32
    %matchWay_r = seq.firreg %47 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1506 : ui64} : i32
    %axiOffset = seq.firreg %726 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 1538 : ui64} : i3
    %databuf = seq.firreg %246 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1541 : ui64} : i64
    %3 = comb.mux bin %1, %io_icRead_addr, %addr_r {sv.namehint = "cur_addr"} : i32
    %4 = comb.extract %3 from 10 {sv.namehint = "instTag"} : (i32) -> i22
    %5 = comb.extract %3 from 6 {sv.namehint = "blockIdx"} : (i32) -> i4
    %6 = comb.extract %3 from 4 {sv.namehint = "cur_ram_addr"} : (i32) -> i6
    %7 = comb.extract %axiOffset from 1 {sv.namehint = "cur_raddr_lo"} : (i3) -> i2
    %8 = comb.concat %5, %7 {sv.namehint = "cur_raddr"} : i4, i2
    %9 = hw.array_create %tag_0_15, %tag_0_14, %tag_0_13, %tag_0_12, %tag_0_11, %tag_0_10, %tag_0_9, %tag_0_8, %tag_0_7, %tag_0_6, %tag_0_5, %tag_0_4, %tag_0_3, %tag_0_2, %tag_0_1, %tag_0_0 : i22
    %10 = hw.array_get %9[%5] : !hw.array<16xi22>, i4
    %11 = comb.icmp bin eq %10, %4 {sv.namehint = "_cache_hit_vec_T"} : i22
    %12 = hw.array_create %valid_0_15, %valid_0_14, %valid_0_13, %valid_0_12, %valid_0_11, %valid_0_10, %valid_0_9, %valid_0_8, %valid_0_7, %valid_0_6, %valid_0_5, %valid_0_4, %valid_0_3, %valid_0_2, %valid_0_1, %valid_0_0 : i1
    %13 = hw.array_get %12[%5] : !hw.array<16xi1>, i4
    %14 = comb.and bin %11, %13 {sv.namehint = "cache_hit_vec_0"} : i1
    %15 = hw.array_create %tag_1_15, %tag_1_14, %tag_1_13, %tag_1_12, %tag_1_11, %tag_1_10, %tag_1_9, %tag_1_8, %tag_1_7, %tag_1_6, %tag_1_5, %tag_1_4, %tag_1_3, %tag_1_2, %tag_1_1, %tag_1_0 : i22
    %16 = hw.array_get %15[%5] : !hw.array<16xi22>, i4
    %17 = comb.icmp bin eq %16, %4 {sv.namehint = "_cache_hit_vec_T_2"} : i22
    %18 = hw.array_create %valid_1_15, %valid_1_14, %valid_1_13, %valid_1_12, %valid_1_11, %valid_1_10, %valid_1_9, %valid_1_8, %valid_1_7, %valid_1_6, %valid_1_5, %valid_1_4, %valid_1_3, %valid_1_2, %valid_1_1, %valid_1_0 : i1
    %19 = hw.array_get %18[%5] : !hw.array<16xi1>, i4
    %20 = comb.and bin %17, %19 {sv.namehint = "cache_hit_vec_1"} : i1
    %21 = hw.array_create %tag_2_15, %tag_2_14, %tag_2_13, %tag_2_12, %tag_2_11, %tag_2_10, %tag_2_9, %tag_2_8, %tag_2_7, %tag_2_6, %tag_2_5, %tag_2_4, %tag_2_3, %tag_2_2, %tag_2_1, %tag_2_0 : i22
    %22 = hw.array_get %21[%5] : !hw.array<16xi22>, i4
    %23 = comb.icmp bin eq %22, %4 {sv.namehint = "_cache_hit_vec_T_4"} : i22
    %24 = hw.array_create %valid_2_15, %valid_2_14, %valid_2_13, %valid_2_12, %valid_2_11, %valid_2_10, %valid_2_9, %valid_2_8, %valid_2_7, %valid_2_6, %valid_2_5, %valid_2_4, %valid_2_3, %valid_2_2, %valid_2_1, %valid_2_0 : i1
    %25 = hw.array_get %24[%5] : !hw.array<16xi1>, i4
    %26 = comb.and bin %23, %25 {sv.namehint = "cache_hit_vec_2"} : i1
    %27 = hw.array_create %tag_3_15, %tag_3_14, %tag_3_13, %tag_3_12, %tag_3_11, %tag_3_10, %tag_3_9, %tag_3_8, %tag_3_7, %tag_3_6, %tag_3_5, %tag_3_4, %tag_3_3, %tag_3_2, %tag_3_1, %tag_3_0 : i22
    %28 = hw.array_get %27[%5] : !hw.array<16xi22>, i4
    %29 = comb.icmp bin eq %28, %4 {sv.namehint = "_cache_hit_vec_T_6"} : i22
    %30 = hw.array_create %valid_3_15, %valid_3_14, %valid_3_13, %valid_3_12, %valid_3_11, %valid_3_10, %valid_3_9, %valid_3_8, %valid_3_7, %valid_3_6, %valid_3_5, %valid_3_4, %valid_3_3, %valid_3_2, %valid_3_1, %valid_3_0 : i1
    %31 = hw.array_get %30[%5] : !hw.array<16xi1>, i4
    %32 = comb.and bin %29, %31 {sv.namehint = "cache_hit_vec_3"} : i1
    %33 = comb.concat %32, %26, %20, %14 {sv.namehint = "_cacheHit_T"} : i1, i1, i1, i1
    %34 = comb.icmp bin ne %33, %c0_i4 {sv.namehint = "cacheHit"} : i4
    %35 = comb.concat %32, %26 {sv.namehint = "matchWay_hi_1"} : i1, i1
    %36 = comb.icmp bin ne %35, %c0_i2 {sv.namehint = "matchWay_hi_2"} : i2
    %37 = comb.or %32, %20 {sv.namehint = "matchWay_lo_2"} : i1
    %38 = comb.concat %36, %37 {sv.namehint = "_matchWay_T_2"} : i1, i1
    %matchWay_prng.io_out_0, %matchWay_prng.io_out_1 = hw.instance "matchWay_prng" @MaxPeriodFibonacciLFSR(clock: %clock: i1, reset: %reset: i1) -> (io_out_0: i1, io_out_1: i1)
    %39 = comb.concat %matchWay_prng.io_out_1, %matchWay_prng.io_out_0 {sv.namehint = "_matchWay_T_3"} : i1, i1
    %40 = comb.mux bin %34, %38, %39 {sv.namehint = "matchWay"} : i2
    %41 = comb.concat %c0_i30, %40 : i30, i2
    %42 = comb.extract %matchWay_r from 0 : (i32) -> i2
    %43 = comb.mux %1, %40, %42 {sv.namehint = "_T_4"} : i2
    %44 = comb.extract %addr_r from 6 {sv.namehint = "pre_blockIdx"} : (i32) -> i4
    %45 = comb.extract %addr_r from 10 {sv.namehint = "pre_instTag"} : (i32) -> i22
    %46 = comb.mux bin %1, %io_icRead_addr, %addr_r : i32
    %47 = comb.mux bin %1, %41, %matchWay_r : i32
    %48 = comb.xor %io_flush, %true : i1
    %49 = comb.and %48, %valid_0_0 : i1
    %50 = comb.xor %io_flush, %true : i1
    %51 = comb.and %50, %valid_0_1 : i1
    %52 = comb.xor %io_flush, %true : i1
    %53 = comb.and %52, %valid_0_2 : i1
    %54 = comb.xor %io_flush, %true : i1
    %55 = comb.and %54, %valid_0_3 : i1
    %56 = comb.xor %io_flush, %true : i1
    %57 = comb.and %56, %valid_0_4 : i1
    %58 = comb.xor %io_flush, %true : i1
    %59 = comb.and %58, %valid_0_5 : i1
    %60 = comb.xor %io_flush, %true : i1
    %61 = comb.and %60, %valid_0_6 : i1
    %62 = comb.xor %io_flush, %true : i1
    %63 = comb.and %62, %valid_0_7 : i1
    %64 = comb.xor %io_flush, %true : i1
    %65 = comb.and %64, %valid_0_8 : i1
    %66 = comb.xor %io_flush, %true : i1
    %67 = comb.and %66, %valid_0_9 : i1
    %68 = comb.xor %io_flush, %true : i1
    %69 = comb.and %68, %valid_0_10 : i1
    %70 = comb.xor %io_flush, %true : i1
    %71 = comb.and %70, %valid_0_11 : i1
    %72 = comb.xor %io_flush, %true : i1
    %73 = comb.and %72, %valid_0_12 : i1
    %74 = comb.xor %io_flush, %true : i1
    %75 = comb.and %74, %valid_0_13 : i1
    %76 = comb.xor %io_flush, %true : i1
    %77 = comb.and %76, %valid_0_14 : i1
    %78 = comb.xor %io_flush, %true : i1
    %79 = comb.and %78, %valid_0_15 : i1
    %80 = comb.xor %io_flush, %true : i1
    %81 = comb.and %80, %valid_1_0 : i1
    %82 = comb.xor %io_flush, %true : i1
    %83 = comb.and %82, %valid_1_1 : i1
    %84 = comb.xor %io_flush, %true : i1
    %85 = comb.and %84, %valid_1_2 : i1
    %86 = comb.xor %io_flush, %true : i1
    %87 = comb.and %86, %valid_1_3 : i1
    %88 = comb.xor %io_flush, %true : i1
    %89 = comb.and %88, %valid_1_4 : i1
    %90 = comb.xor %io_flush, %true : i1
    %91 = comb.and %90, %valid_1_5 : i1
    %92 = comb.xor %io_flush, %true : i1
    %93 = comb.and %92, %valid_1_6 : i1
    %94 = comb.xor %io_flush, %true : i1
    %95 = comb.and %94, %valid_1_7 : i1
    %96 = comb.xor %io_flush, %true : i1
    %97 = comb.and %96, %valid_1_8 : i1
    %98 = comb.xor %io_flush, %true : i1
    %99 = comb.and %98, %valid_1_9 : i1
    %100 = comb.xor %io_flush, %true : i1
    %101 = comb.and %100, %valid_1_10 : i1
    %102 = comb.xor %io_flush, %true : i1
    %103 = comb.and %102, %valid_1_11 : i1
    %104 = comb.xor %io_flush, %true : i1
    %105 = comb.and %104, %valid_1_12 : i1
    %106 = comb.xor %io_flush, %true : i1
    %107 = comb.and %106, %valid_1_13 : i1
    %108 = comb.xor %io_flush, %true : i1
    %109 = comb.and %108, %valid_1_14 : i1
    %110 = comb.xor %io_flush, %true : i1
    %111 = comb.and %110, %valid_1_15 : i1
    %112 = comb.xor %io_flush, %true : i1
    %113 = comb.and %112, %valid_2_0 : i1
    %114 = comb.xor %io_flush, %true : i1
    %115 = comb.and %114, %valid_2_1 : i1
    %116 = comb.xor %io_flush, %true : i1
    %117 = comb.and %116, %valid_2_2 : i1
    %118 = comb.xor %io_flush, %true : i1
    %119 = comb.and %118, %valid_2_3 : i1
    %120 = comb.xor %io_flush, %true : i1
    %121 = comb.and %120, %valid_2_4 : i1
    %122 = comb.xor %io_flush, %true : i1
    %123 = comb.and %122, %valid_2_5 : i1
    %124 = comb.xor %io_flush, %true : i1
    %125 = comb.and %124, %valid_2_6 : i1
    %126 = comb.xor %io_flush, %true : i1
    %127 = comb.and %126, %valid_2_7 : i1
    %128 = comb.xor %io_flush, %true : i1
    %129 = comb.and %128, %valid_2_8 : i1
    %130 = comb.xor %io_flush, %true : i1
    %131 = comb.and %130, %valid_2_9 : i1
    %132 = comb.xor %io_flush, %true : i1
    %133 = comb.and %132, %valid_2_10 : i1
    %134 = comb.xor %io_flush, %true : i1
    %135 = comb.and %134, %valid_2_11 : i1
    %136 = comb.xor %io_flush, %true : i1
    %137 = comb.and %136, %valid_2_12 : i1
    %138 = comb.xor %io_flush, %true : i1
    %139 = comb.and %138, %valid_2_13 : i1
    %140 = comb.xor %io_flush, %true : i1
    %141 = comb.and %140, %valid_2_14 : i1
    %142 = comb.xor %io_flush, %true : i1
    %143 = comb.and %142, %valid_2_15 : i1
    %144 = comb.xor %io_flush, %true : i1
    %145 = comb.and %144, %valid_3_0 : i1
    %146 = comb.xor %io_flush, %true : i1
    %147 = comb.and %146, %valid_3_1 : i1
    %148 = comb.xor %io_flush, %true : i1
    %149 = comb.and %148, %valid_3_2 : i1
    %150 = comb.xor %io_flush, %true : i1
    %151 = comb.and %150, %valid_3_3 : i1
    %152 = comb.xor %io_flush, %true : i1
    %153 = comb.and %152, %valid_3_4 : i1
    %154 = comb.xor %io_flush, %true : i1
    %155 = comb.and %154, %valid_3_5 : i1
    %156 = comb.xor %io_flush, %true : i1
    %157 = comb.and %156, %valid_3_6 : i1
    %158 = comb.xor %io_flush, %true : i1
    %159 = comb.and %158, %valid_3_7 : i1
    %160 = comb.xor %io_flush, %true : i1
    %161 = comb.and %160, %valid_3_8 : i1
    %162 = comb.xor %io_flush, %true : i1
    %163 = comb.and %162, %valid_3_9 : i1
    %164 = comb.xor %io_flush, %true : i1
    %165 = comb.and %164, %valid_3_10 : i1
    %166 = comb.xor %io_flush, %true : i1
    %167 = comb.and %166, %valid_3_11 : i1
    %168 = comb.xor %io_flush, %true : i1
    %169 = comb.and %168, %valid_3_12 : i1
    %170 = comb.xor %io_flush, %true : i1
    %171 = comb.and %170, %valid_3_13 : i1
    %172 = comb.xor %io_flush, %true : i1
    %173 = comb.and %172, %valid_3_14 : i1
    %174 = comb.xor %io_flush, %true : i1
    %175 = comb.and %174, %valid_3_15 : i1
    %state = seq.firreg %722 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1605 : ui64} : i2
    %176 = comb.extract %matchWay_r from 0 {sv.namehint = "_T_15"} : (i32) -> i2
    %177 = comb.extract %addr_r from 3 {sv.namehint = "_io_icRead_inst_T_3"} : (i32) -> i1
    %178 = hw.array_create %Ram_bw_3.io_rdata, %Ram_bw_2.io_rdata, %Ram_bw_1.io_rdata, %Ram_bw.io_rdata : i128
    %179 = hw.array_get %178[%176] : !hw.array<4xi128>, i2
    %180 = comb.extract %179 from 0 {sv.namehint = "_io_icRead_inst_T_1"} : (i128) -> i64
    %181 = comb.extract %179 from 64 {sv.namehint = "_io_icRead_inst_T_2"} : (i128) -> i64
    %182 = comb.mux bin %177, %181, %180 {sv.namehint = "_io_icRead_inst_T_4"} : i64
    %183 = comb.icmp bin eq %state, %c-2_i2 {sv.namehint = "_T_11"} : i2
    %184 = comb.mux bin %183, %8, %6 {sv.namehint = "_data_addr_T_1"} : i6
    %185 = comb.icmp bin eq %43, %c0_i2 : i2
    %186 = comb.mux bin %185, %184, %c0_i6 {sv.namehint = "data_0_addr"} : i6
    %187 = comb.icmp bin eq %43, %c1_i2 : i2
    %188 = comb.mux bin %187, %184, %c0_i6 {sv.namehint = "data_1_addr"} : i6
    %189 = comb.icmp bin eq %43, %c-2_i2 : i2
    %190 = comb.mux bin %189, %184, %c0_i6 {sv.namehint = "data_2_addr"} : i6
    %191 = comb.icmp bin eq %43, %c-1_i2 : i2
    %192 = comb.mux bin %191, %184, %c0_i6 {sv.namehint = "data_3_addr"} : i6
    %193 = comb.or bin %wait_r, %1 {sv.namehint = "_data_cen_T"} : i1
    %194 = comb.and %185, %193 {sv.namehint = "data_0_cen"} : i1
    %195 = comb.and %187, %193 {sv.namehint = "data_1_cen"} : i1
    %196 = comb.and %189, %193 {sv.namehint = "data_2_cen"} : i1
    %197 = comb.and %191, %193 {sv.namehint = "data_3_cen"} : i1
    %198 = comb.and %185, %243 {sv.namehint = "data_0_wen"} : i1
    %199 = comb.and %187, %243 {sv.namehint = "data_1_wen"} : i1
    %200 = comb.and %189, %243 {sv.namehint = "data_2_wen"} : i1
    %201 = comb.and %191, %243 {sv.namehint = "data_3_wen"} : i1
    %202 = comb.concat %io_instAxi_rd_bits_data, %databuf {sv.namehint = "_data_wdata_T"} : i64, i64
    %203 = comb.mux bin %185, %202, %c0_i128 {sv.namehint = "data_0_wdata"} : i128
    %204 = comb.mux bin %187, %202, %c0_i128 {sv.namehint = "data_1_wdata"} : i128
    %205 = comb.mux bin %189, %202, %c0_i128 {sv.namehint = "data_2_wdata"} : i128
    %206 = comb.mux bin %191, %202, %c0_i128 {sv.namehint = "data_3_wdata"} : i128
    %207 = comb.replicate %185 {sv.namehint = "data_0_mask"} : (i1) -> i128
    %208 = comb.replicate %187 {sv.namehint = "data_1_mask"} : (i1) -> i128
    %209 = comb.replicate %189 {sv.namehint = "data_2_mask"} : (i1) -> i128
    %210 = comb.replicate %191 {sv.namehint = "data_3_mask"} : (i1) -> i128
    %raddrEn = seq.firreg %234 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1607 : ui64} : i1
    %raddr = seq.firreg %218 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1608 : ui64} : i32
    %rdataEn = seq.firreg %251 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1640 : ui64} : i1
    %211 = comb.icmp bin eq %state, %c0_i2 {sv.namehint = "_T_5"} : i2
    %212 = comb.xor bin %1, %true {sv.namehint = "_T_6"} : i1
    %213 = comb.and bin %212, %2 {sv.namehint = "_T_8"} : i1
    %214 = comb.and bin %3, %c-64_i32 {sv.namehint = "_raddr_T"} : i32
    %215 = comb.or bin %213, %34 : i1
    %216 = comb.xor %211, %true : i1
    %217 = comb.or %216, %215 : i1
    %218 = comb.mux bin %217, %raddr, %214 : i32
    %219 = comb.xor %215, %true : i1
    %220 = comb.or %219, %raddrEn : i1
    %221 = comb.mux bin %215, %state, %c1_i2 : i2
    %222 = comb.xor %213, %true : i1
    %223 = comb.and %211, %222, %34 : i1
    %224 = comb.xor bin %34, %true : i1
    %225 = comb.xor %211, %true : i1
    %226 = comb.or %225, %213 : i1
    %227 = comb.mux bin %226, %wait_r, %224 : i1
    %228 = comb.icmp bin eq %state, %c1_i2 {sv.namehint = "_T_9"} : i2
    %229 = comb.and bin %raddrEn, %io_instAxi_ra_ready {sv.namehint = "_T_10"} : i1
    %230 = comb.mux bin %229, %c-2_i2, %state : i2
    %231 = comb.and bin %228, %229 : i1
    %232 = comb.xor %231, %true : i1
    %233 = comb.and %232, %raddrEn : i1
    %234 = comb.mux bin %211, %220, %233 : i1
    %235 = comb.or %229, %rdataEn : i1
    %236 = comb.mux bin %229, %c0_i3, %axiOffset : i3
    %237 = comb.and bin %rdataEn, %io_instAxi_rd_valid {sv.namehint = "_T_12"} : i1
    %238 = comb.add %axiOffset, %c1_i3 {sv.namehint = "_axiOffset_T_1"} : i3
    %239 = comb.extract %axiOffset from 0 {sv.namehint = "_T_13"} : (i3) -> i1
    %240 = comb.and bin %183, %237 : i1
    %241 = comb.or bin %211, %228 : i1
    %242 = comb.xor %241, %true : i1
    %243 = comb.and %242, %240, %239 {sv.namehint = "wen"} : i1
    %244 = comb.xor %240, %true : i1
    %245 = comb.or %241, %244, %239 : i1
    %246 = comb.mux bin %245, %databuf, %io_instAxi_rd_bits_data : i64
    %247 = comb.and bin %183, %237, %io_instAxi_rd_bits_last : i1
    %248 = comb.xor %247, %true : i1
    %249 = comb.and %248, %rdataEn : i1
    %250 = comb.mux bin %228, %235, %249 : i1
    %251 = comb.mux bin %211, %rdataEn, %250 : i1
    %252 = comb.icmp bin eq %176, %c0_i2 : i2
    %253 = comb.icmp bin eq %44, %c0_i4 : i4
    %254 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %253 : i1
    %255 = comb.xor %254, %true : i1
    %256 = comb.or %241, %255 : i1
    %257 = comb.mux bin %256, %tag_0_0, %45 : i22
    %258 = comb.icmp bin eq %44, %c1_i4 : i4
    %259 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %258 : i1
    %260 = comb.xor %259, %true : i1
    %261 = comb.or %241, %260 : i1
    %262 = comb.mux bin %261, %tag_0_1, %45 : i22
    %263 = comb.icmp bin eq %44, %c2_i4 : i4
    %264 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %263 : i1
    %265 = comb.xor %264, %true : i1
    %266 = comb.or %241, %265 : i1
    %267 = comb.mux bin %266, %tag_0_2, %45 : i22
    %268 = comb.icmp bin eq %44, %c3_i4 : i4
    %269 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %268 : i1
    %270 = comb.xor %269, %true : i1
    %271 = comb.or %241, %270 : i1
    %272 = comb.mux bin %271, %tag_0_3, %45 : i22
    %273 = comb.icmp bin eq %44, %c4_i4 : i4
    %274 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %273 : i1
    %275 = comb.xor %274, %true : i1
    %276 = comb.or %241, %275 : i1
    %277 = comb.mux bin %276, %tag_0_4, %45 : i22
    %278 = comb.icmp bin eq %44, %c5_i4 : i4
    %279 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %278 : i1
    %280 = comb.xor %279, %true : i1
    %281 = comb.or %241, %280 : i1
    %282 = comb.mux bin %281, %tag_0_5, %45 : i22
    %283 = comb.icmp bin eq %44, %c6_i4 : i4
    %284 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %283 : i1
    %285 = comb.xor %284, %true : i1
    %286 = comb.or %241, %285 : i1
    %287 = comb.mux bin %286, %tag_0_6, %45 : i22
    %288 = comb.icmp bin eq %44, %c7_i4 : i4
    %289 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %288 : i1
    %290 = comb.xor %289, %true : i1
    %291 = comb.or %241, %290 : i1
    %292 = comb.mux bin %291, %tag_0_7, %45 : i22
    %293 = comb.icmp bin eq %44, %c-8_i4 : i4
    %294 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %293 : i1
    %295 = comb.xor %294, %true : i1
    %296 = comb.or %241, %295 : i1
    %297 = comb.mux bin %296, %tag_0_8, %45 : i22
    %298 = comb.icmp bin eq %44, %c-7_i4 : i4
    %299 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %298 : i1
    %300 = comb.xor %299, %true : i1
    %301 = comb.or %241, %300 : i1
    %302 = comb.mux bin %301, %tag_0_9, %45 : i22
    %303 = comb.icmp bin eq %44, %c-6_i4 : i4
    %304 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %303 : i1
    %305 = comb.xor %304, %true : i1
    %306 = comb.or %241, %305 : i1
    %307 = comb.mux bin %306, %tag_0_10, %45 : i22
    %308 = comb.icmp bin eq %44, %c-5_i4 : i4
    %309 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %308 : i1
    %310 = comb.xor %309, %true : i1
    %311 = comb.or %241, %310 : i1
    %312 = comb.mux bin %311, %tag_0_11, %45 : i22
    %313 = comb.icmp bin eq %44, %c-4_i4 : i4
    %314 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %313 : i1
    %315 = comb.xor %314, %true : i1
    %316 = comb.or %241, %315 : i1
    %317 = comb.mux bin %316, %tag_0_12, %45 : i22
    %318 = comb.icmp bin eq %44, %c-3_i4 : i4
    %319 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %318 : i1
    %320 = comb.xor %319, %true : i1
    %321 = comb.or %241, %320 : i1
    %322 = comb.mux bin %321, %tag_0_13, %45 : i22
    %323 = comb.icmp bin eq %44, %c-2_i4 : i4
    %324 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %323 : i1
    %325 = comb.xor %324, %true : i1
    %326 = comb.or %241, %325 : i1
    %327 = comb.mux bin %326, %tag_0_14, %45 : i22
    %328 = comb.icmp bin eq %44, %c-1_i4 : i4
    %329 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %252, %328 : i1
    %330 = comb.xor %329, %true : i1
    %331 = comb.or %241, %330 : i1
    %332 = comb.mux bin %331, %tag_0_15, %45 : i22
    %333 = comb.icmp bin eq %176, %c1_i2 : i2
    %334 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %253 : i1
    %335 = comb.xor %334, %true : i1
    %336 = comb.or %241, %335 : i1
    %337 = comb.mux bin %336, %tag_1_0, %45 : i22
    %338 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %258 : i1
    %339 = comb.xor %338, %true : i1
    %340 = comb.or %241, %339 : i1
    %341 = comb.mux bin %340, %tag_1_1, %45 : i22
    %342 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %263 : i1
    %343 = comb.xor %342, %true : i1
    %344 = comb.or %241, %343 : i1
    %345 = comb.mux bin %344, %tag_1_2, %45 : i22
    %346 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %268 : i1
    %347 = comb.xor %346, %true : i1
    %348 = comb.or %241, %347 : i1
    %349 = comb.mux bin %348, %tag_1_3, %45 : i22
    %350 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %273 : i1
    %351 = comb.xor %350, %true : i1
    %352 = comb.or %241, %351 : i1
    %353 = comb.mux bin %352, %tag_1_4, %45 : i22
    %354 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %278 : i1
    %355 = comb.xor %354, %true : i1
    %356 = comb.or %241, %355 : i1
    %357 = comb.mux bin %356, %tag_1_5, %45 : i22
    %358 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %283 : i1
    %359 = comb.xor %358, %true : i1
    %360 = comb.or %241, %359 : i1
    %361 = comb.mux bin %360, %tag_1_6, %45 : i22
    %362 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %288 : i1
    %363 = comb.xor %362, %true : i1
    %364 = comb.or %241, %363 : i1
    %365 = comb.mux bin %364, %tag_1_7, %45 : i22
    %366 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %293 : i1
    %367 = comb.xor %366, %true : i1
    %368 = comb.or %241, %367 : i1
    %369 = comb.mux bin %368, %tag_1_8, %45 : i22
    %370 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %298 : i1
    %371 = comb.xor %370, %true : i1
    %372 = comb.or %241, %371 : i1
    %373 = comb.mux bin %372, %tag_1_9, %45 : i22
    %374 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %303 : i1
    %375 = comb.xor %374, %true : i1
    %376 = comb.or %241, %375 : i1
    %377 = comb.mux bin %376, %tag_1_10, %45 : i22
    %378 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %308 : i1
    %379 = comb.xor %378, %true : i1
    %380 = comb.or %241, %379 : i1
    %381 = comb.mux bin %380, %tag_1_11, %45 : i22
    %382 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %313 : i1
    %383 = comb.xor %382, %true : i1
    %384 = comb.or %241, %383 : i1
    %385 = comb.mux bin %384, %tag_1_12, %45 : i22
    %386 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %318 : i1
    %387 = comb.xor %386, %true : i1
    %388 = comb.or %241, %387 : i1
    %389 = comb.mux bin %388, %tag_1_13, %45 : i22
    %390 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %323 : i1
    %391 = comb.xor %390, %true : i1
    %392 = comb.or %241, %391 : i1
    %393 = comb.mux bin %392, %tag_1_14, %45 : i22
    %394 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %333, %328 : i1
    %395 = comb.xor %394, %true : i1
    %396 = comb.or %241, %395 : i1
    %397 = comb.mux bin %396, %tag_1_15, %45 : i22
    %398 = comb.icmp bin eq %176, %c-2_i2 : i2
    %399 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %253 : i1
    %400 = comb.xor %399, %true : i1
    %401 = comb.or %241, %400 : i1
    %402 = comb.mux bin %401, %tag_2_0, %45 : i22
    %403 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %258 : i1
    %404 = comb.xor %403, %true : i1
    %405 = comb.or %241, %404 : i1
    %406 = comb.mux bin %405, %tag_2_1, %45 : i22
    %407 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %263 : i1
    %408 = comb.xor %407, %true : i1
    %409 = comb.or %241, %408 : i1
    %410 = comb.mux bin %409, %tag_2_2, %45 : i22
    %411 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %268 : i1
    %412 = comb.xor %411, %true : i1
    %413 = comb.or %241, %412 : i1
    %414 = comb.mux bin %413, %tag_2_3, %45 : i22
    %415 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %273 : i1
    %416 = comb.xor %415, %true : i1
    %417 = comb.or %241, %416 : i1
    %418 = comb.mux bin %417, %tag_2_4, %45 : i22
    %419 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %278 : i1
    %420 = comb.xor %419, %true : i1
    %421 = comb.or %241, %420 : i1
    %422 = comb.mux bin %421, %tag_2_5, %45 : i22
    %423 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %283 : i1
    %424 = comb.xor %423, %true : i1
    %425 = comb.or %241, %424 : i1
    %426 = comb.mux bin %425, %tag_2_6, %45 : i22
    %427 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %288 : i1
    %428 = comb.xor %427, %true : i1
    %429 = comb.or %241, %428 : i1
    %430 = comb.mux bin %429, %tag_2_7, %45 : i22
    %431 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %293 : i1
    %432 = comb.xor %431, %true : i1
    %433 = comb.or %241, %432 : i1
    %434 = comb.mux bin %433, %tag_2_8, %45 : i22
    %435 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %298 : i1
    %436 = comb.xor %435, %true : i1
    %437 = comb.or %241, %436 : i1
    %438 = comb.mux bin %437, %tag_2_9, %45 : i22
    %439 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %303 : i1
    %440 = comb.xor %439, %true : i1
    %441 = comb.or %241, %440 : i1
    %442 = comb.mux bin %441, %tag_2_10, %45 : i22
    %443 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %308 : i1
    %444 = comb.xor %443, %true : i1
    %445 = comb.or %241, %444 : i1
    %446 = comb.mux bin %445, %tag_2_11, %45 : i22
    %447 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %313 : i1
    %448 = comb.xor %447, %true : i1
    %449 = comb.or %241, %448 : i1
    %450 = comb.mux bin %449, %tag_2_12, %45 : i22
    %451 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %318 : i1
    %452 = comb.xor %451, %true : i1
    %453 = comb.or %241, %452 : i1
    %454 = comb.mux bin %453, %tag_2_13, %45 : i22
    %455 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %323 : i1
    %456 = comb.xor %455, %true : i1
    %457 = comb.or %241, %456 : i1
    %458 = comb.mux bin %457, %tag_2_14, %45 : i22
    %459 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %398, %328 : i1
    %460 = comb.xor %459, %true : i1
    %461 = comb.or %241, %460 : i1
    %462 = comb.mux bin %461, %tag_2_15, %45 : i22
    %463 = comb.icmp bin eq %176, %c-1_i2 : i2
    %464 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %253 : i1
    %465 = comb.xor %464, %true : i1
    %466 = comb.or %241, %465 : i1
    %467 = comb.mux bin %466, %tag_3_0, %45 : i22
    %468 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %258 : i1
    %469 = comb.xor %468, %true : i1
    %470 = comb.or %241, %469 : i1
    %471 = comb.mux bin %470, %tag_3_1, %45 : i22
    %472 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %263 : i1
    %473 = comb.xor %472, %true : i1
    %474 = comb.or %241, %473 : i1
    %475 = comb.mux bin %474, %tag_3_2, %45 : i22
    %476 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %268 : i1
    %477 = comb.xor %476, %true : i1
    %478 = comb.or %241, %477 : i1
    %479 = comb.mux bin %478, %tag_3_3, %45 : i22
    %480 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %273 : i1
    %481 = comb.xor %480, %true : i1
    %482 = comb.or %241, %481 : i1
    %483 = comb.mux bin %482, %tag_3_4, %45 : i22
    %484 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %278 : i1
    %485 = comb.xor %484, %true : i1
    %486 = comb.or %241, %485 : i1
    %487 = comb.mux bin %486, %tag_3_5, %45 : i22
    %488 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %283 : i1
    %489 = comb.xor %488, %true : i1
    %490 = comb.or %241, %489 : i1
    %491 = comb.mux bin %490, %tag_3_6, %45 : i22
    %492 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %288 : i1
    %493 = comb.xor %492, %true : i1
    %494 = comb.or %241, %493 : i1
    %495 = comb.mux bin %494, %tag_3_7, %45 : i22
    %496 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %293 : i1
    %497 = comb.xor %496, %true : i1
    %498 = comb.or %241, %497 : i1
    %499 = comb.mux bin %498, %tag_3_8, %45 : i22
    %500 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %298 : i1
    %501 = comb.xor %500, %true : i1
    %502 = comb.or %241, %501 : i1
    %503 = comb.mux bin %502, %tag_3_9, %45 : i22
    %504 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %303 : i1
    %505 = comb.xor %504, %true : i1
    %506 = comb.or %241, %505 : i1
    %507 = comb.mux bin %506, %tag_3_10, %45 : i22
    %508 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %308 : i1
    %509 = comb.xor %508, %true : i1
    %510 = comb.or %241, %509 : i1
    %511 = comb.mux bin %510, %tag_3_11, %45 : i22
    %512 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %313 : i1
    %513 = comb.xor %512, %true : i1
    %514 = comb.or %241, %513 : i1
    %515 = comb.mux bin %514, %tag_3_12, %45 : i22
    %516 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %318 : i1
    %517 = comb.xor %516, %true : i1
    %518 = comb.or %241, %517 : i1
    %519 = comb.mux bin %518, %tag_3_13, %45 : i22
    %520 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %323 : i1
    %521 = comb.xor %520, %true : i1
    %522 = comb.or %241, %521 : i1
    %523 = comb.mux bin %522, %tag_3_14, %45 : i22
    %524 = comb.and bin %183, %237, %io_instAxi_rd_bits_last, %463, %328 : i1
    %525 = comb.xor %524, %true : i1
    %526 = comb.or %241, %525 : i1
    %527 = comb.mux bin %526, %tag_3_15, %45 : i22
    %528 = comb.xor %241, %true : i1
    %529 = comb.and %528, %254 : i1
    %530 = comb.or %529, %49 : i1
    %531 = comb.xor %241, %true : i1
    %532 = comb.and %531, %259 : i1
    %533 = comb.or %532, %51 : i1
    %534 = comb.xor %241, %true : i1
    %535 = comb.and %534, %264 : i1
    %536 = comb.or %535, %53 : i1
    %537 = comb.xor %241, %true : i1
    %538 = comb.and %537, %269 : i1
    %539 = comb.or %538, %55 : i1
    %540 = comb.xor %241, %true : i1
    %541 = comb.and %540, %274 : i1
    %542 = comb.or %541, %57 : i1
    %543 = comb.xor %241, %true : i1
    %544 = comb.and %543, %279 : i1
    %545 = comb.or %544, %59 : i1
    %546 = comb.xor %241, %true : i1
    %547 = comb.and %546, %284 : i1
    %548 = comb.or %547, %61 : i1
    %549 = comb.xor %241, %true : i1
    %550 = comb.and %549, %289 : i1
    %551 = comb.or %550, %63 : i1
    %552 = comb.xor %241, %true : i1
    %553 = comb.and %552, %294 : i1
    %554 = comb.or %553, %65 : i1
    %555 = comb.xor %241, %true : i1
    %556 = comb.and %555, %299 : i1
    %557 = comb.or %556, %67 : i1
    %558 = comb.xor %241, %true : i1
    %559 = comb.and %558, %304 : i1
    %560 = comb.or %559, %69 : i1
    %561 = comb.xor %241, %true : i1
    %562 = comb.and %561, %309 : i1
    %563 = comb.or %562, %71 : i1
    %564 = comb.xor %241, %true : i1
    %565 = comb.and %564, %314 : i1
    %566 = comb.or %565, %73 : i1
    %567 = comb.xor %241, %true : i1
    %568 = comb.and %567, %319 : i1
    %569 = comb.or %568, %75 : i1
    %570 = comb.xor %241, %true : i1
    %571 = comb.and %570, %324 : i1
    %572 = comb.or %571, %77 : i1
    %573 = comb.xor %241, %true : i1
    %574 = comb.and %573, %329 : i1
    %575 = comb.or %574, %79 : i1
    %576 = comb.xor %241, %true : i1
    %577 = comb.and %576, %334 : i1
    %578 = comb.or %577, %81 : i1
    %579 = comb.xor %241, %true : i1
    %580 = comb.and %579, %338 : i1
    %581 = comb.or %580, %83 : i1
    %582 = comb.xor %241, %true : i1
    %583 = comb.and %582, %342 : i1
    %584 = comb.or %583, %85 : i1
    %585 = comb.xor %241, %true : i1
    %586 = comb.and %585, %346 : i1
    %587 = comb.or %586, %87 : i1
    %588 = comb.xor %241, %true : i1
    %589 = comb.and %588, %350 : i1
    %590 = comb.or %589, %89 : i1
    %591 = comb.xor %241, %true : i1
    %592 = comb.and %591, %354 : i1
    %593 = comb.or %592, %91 : i1
    %594 = comb.xor %241, %true : i1
    %595 = comb.and %594, %358 : i1
    %596 = comb.or %595, %93 : i1
    %597 = comb.xor %241, %true : i1
    %598 = comb.and %597, %362 : i1
    %599 = comb.or %598, %95 : i1
    %600 = comb.xor %241, %true : i1
    %601 = comb.and %600, %366 : i1
    %602 = comb.or %601, %97 : i1
    %603 = comb.xor %241, %true : i1
    %604 = comb.and %603, %370 : i1
    %605 = comb.or %604, %99 : i1
    %606 = comb.xor %241, %true : i1
    %607 = comb.and %606, %374 : i1
    %608 = comb.or %607, %101 : i1
    %609 = comb.xor %241, %true : i1
    %610 = comb.and %609, %378 : i1
    %611 = comb.or %610, %103 : i1
    %612 = comb.xor %241, %true : i1
    %613 = comb.and %612, %382 : i1
    %614 = comb.or %613, %105 : i1
    %615 = comb.xor %241, %true : i1
    %616 = comb.and %615, %386 : i1
    %617 = comb.or %616, %107 : i1
    %618 = comb.xor %241, %true : i1
    %619 = comb.and %618, %390 : i1
    %620 = comb.or %619, %109 : i1
    %621 = comb.xor %241, %true : i1
    %622 = comb.and %621, %394 : i1
    %623 = comb.or %622, %111 : i1
    %624 = comb.xor %241, %true : i1
    %625 = comb.and %624, %399 : i1
    %626 = comb.or %625, %113 : i1
    %627 = comb.xor %241, %true : i1
    %628 = comb.and %627, %403 : i1
    %629 = comb.or %628, %115 : i1
    %630 = comb.xor %241, %true : i1
    %631 = comb.and %630, %407 : i1
    %632 = comb.or %631, %117 : i1
    %633 = comb.xor %241, %true : i1
    %634 = comb.and %633, %411 : i1
    %635 = comb.or %634, %119 : i1
    %636 = comb.xor %241, %true : i1
    %637 = comb.and %636, %415 : i1
    %638 = comb.or %637, %121 : i1
    %639 = comb.xor %241, %true : i1
    %640 = comb.and %639, %419 : i1
    %641 = comb.or %640, %123 : i1
    %642 = comb.xor %241, %true : i1
    %643 = comb.and %642, %423 : i1
    %644 = comb.or %643, %125 : i1
    %645 = comb.xor %241, %true : i1
    %646 = comb.and %645, %427 : i1
    %647 = comb.or %646, %127 : i1
    %648 = comb.xor %241, %true : i1
    %649 = comb.and %648, %431 : i1
    %650 = comb.or %649, %129 : i1
    %651 = comb.xor %241, %true : i1
    %652 = comb.and %651, %435 : i1
    %653 = comb.or %652, %131 : i1
    %654 = comb.xor %241, %true : i1
    %655 = comb.and %654, %439 : i1
    %656 = comb.or %655, %133 : i1
    %657 = comb.xor %241, %true : i1
    %658 = comb.and %657, %443 : i1
    %659 = comb.or %658, %135 : i1
    %660 = comb.xor %241, %true : i1
    %661 = comb.and %660, %447 : i1
    %662 = comb.or %661, %137 : i1
    %663 = comb.xor %241, %true : i1
    %664 = comb.and %663, %451 : i1
    %665 = comb.or %664, %139 : i1
    %666 = comb.xor %241, %true : i1
    %667 = comb.and %666, %455 : i1
    %668 = comb.or %667, %141 : i1
    %669 = comb.xor %241, %true : i1
    %670 = comb.and %669, %459 : i1
    %671 = comb.or %670, %143 : i1
    %672 = comb.xor %241, %true : i1
    %673 = comb.and %672, %464 : i1
    %674 = comb.or %673, %145 : i1
    %675 = comb.xor %241, %true : i1
    %676 = comb.and %675, %468 : i1
    %677 = comb.or %676, %147 : i1
    %678 = comb.xor %241, %true : i1
    %679 = comb.and %678, %472 : i1
    %680 = comb.or %679, %149 : i1
    %681 = comb.xor %241, %true : i1
    %682 = comb.and %681, %476 : i1
    %683 = comb.or %682, %151 : i1
    %684 = comb.xor %241, %true : i1
    %685 = comb.and %684, %480 : i1
    %686 = comb.or %685, %153 : i1
    %687 = comb.xor %241, %true : i1
    %688 = comb.and %687, %484 : i1
    %689 = comb.or %688, %155 : i1
    %690 = comb.xor %241, %true : i1
    %691 = comb.and %690, %488 : i1
    %692 = comb.or %691, %157 : i1
    %693 = comb.xor %241, %true : i1
    %694 = comb.and %693, %492 : i1
    %695 = comb.or %694, %159 : i1
    %696 = comb.xor %241, %true : i1
    %697 = comb.and %696, %496 : i1
    %698 = comb.or %697, %161 : i1
    %699 = comb.xor %241, %true : i1
    %700 = comb.and %699, %500 : i1
    %701 = comb.or %700, %163 : i1
    %702 = comb.xor %241, %true : i1
    %703 = comb.and %702, %504 : i1
    %704 = comb.or %703, %165 : i1
    %705 = comb.xor %241, %true : i1
    %706 = comb.and %705, %508 : i1
    %707 = comb.or %706, %167 : i1
    %708 = comb.xor %241, %true : i1
    %709 = comb.and %708, %512 : i1
    %710 = comb.or %709, %169 : i1
    %711 = comb.xor %241, %true : i1
    %712 = comb.and %711, %516 : i1
    %713 = comb.or %712, %171 : i1
    %714 = comb.xor %241, %true : i1
    %715 = comb.and %714, %520 : i1
    %716 = comb.or %715, %173 : i1
    %717 = comb.xor %241, %true : i1
    %718 = comb.and %717, %524 : i1
    %719 = comb.or %718, %175 : i1
    %720 = comb.mux bin %247, %c0_i2, %state : i2
    %721 = comb.mux bin %228, %230, %720 : i2
    %722 = comb.mux bin %211, %221, %721 : i2
    %723 = comb.mux bin %io_instAxi_rd_bits_last, %c0_i3, %238 : i3
    %724 = comb.mux bin %240, %723, %axiOffset : i3
    %725 = comb.mux bin %228, %236, %724 : i3
    %726 = comb.mux bin %211, %axiOffset, %725 : i3
    hw.output %raddrEn, %raddr, %182, %valid_r : i1, i32, i64, i1
  }
  hw.module private @S011HD1P_X32Y2D128_BW_4(%clock: i1, %reset: i1, %io_CEN: i1, %io_WEN: i1, %io_BWEN: i128, %io_A: i6, %io_D: i128) -> (io_Q: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %c0_i128 = hw.constant 0 : i128
    %ram_ext.R0_data, %ram_ext.R1_data = hw.instance "ram_ext" @ram_combMem(R0_addr: %io_A: i6, R0_en: %2: i1, R0_clk: %clock: i1, R1_addr: %io_A: i6, R1_en: %7: i1, R1_clk: %clock: i1, W0_addr: %io_A: i6, W0_en: %2: i1, W0_clk: %clock: i1, W0_data: %6: i128) -> (R0_data: i128, R1_data: i128)
    %output = seq.firreg %8 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 0 : ui64} : i128
    %0 = comb.xor bin %io_CEN, %true {sv.namehint = "_T"} : i1
    %1 = comb.xor bin %io_WEN, %true {sv.namehint = "_T_1"} : i1
    %2 = comb.and bin %0, %1 {sv.namehint = "_T_2"} : i1
    %3 = comb.xor bin %io_BWEN, %c-1_i128 {sv.namehint = "_T_3"} : i128
    %4 = comb.and bin %io_D, %3 {sv.namehint = "_T_4"} : i128
    %5 = comb.and bin %ram_ext.R0_data, %io_BWEN {sv.namehint = "_T_5"} : i128
    %6 = comb.or bin %4, %5 {sv.namehint = "_T_6"} : i128
    %7 = comb.xor bin %2, %true : i1
    %8 = comb.mux bin %2, %c0_i128, %ram_ext.R1_data : i128
    hw.output %output : i128
  }
  hw.module private @Ram_bw_4(%clock: i1, %reset: i1, %io_cen: i1, %io_wen: i1, %io_addr: i6, %io_wdata: i128, %io_mask: i128) -> (io_rdata: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %ram.io_Q = hw.instance "ram" @S011HD1P_X32Y2D128_BW_4(clock: %clock: i1, reset: %reset: i1, io_CEN: %0: i1, io_WEN: %1: i1, io_BWEN: %2: i128, io_A: %io_addr: i6, io_D: %io_wdata: i128) -> (io_Q: i128)
    %0 = comb.xor bin %io_cen, %true {sv.namehint = "_ram_io_CEN_T"} : i1
    %1 = comb.xor bin %io_wen, %true {sv.namehint = "_ram_io_WEN_T"} : i1
    %2 = comb.xor bin %io_mask, %c-1_i128 {sv.namehint = "_ram_io_BWEN_T"} : i128
    hw.output %ram.io_Q : i128
  }
  hw.module private @S011HD1P_X32Y2D128_BW_5(%clock: i1, %reset: i1, %io_CEN: i1, %io_WEN: i1, %io_BWEN: i128, %io_A: i6, %io_D: i128) -> (io_Q: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %c0_i128 = hw.constant 0 : i128
    %ram_ext.R0_data, %ram_ext.R1_data = hw.instance "ram_ext" @ram_combMem(R0_addr: %io_A: i6, R0_en: %2: i1, R0_clk: %clock: i1, R1_addr: %io_A: i6, R1_en: %7: i1, R1_clk: %clock: i1, W0_addr: %io_A: i6, W0_en: %2: i1, W0_clk: %clock: i1, W0_data: %6: i128) -> (R0_data: i128, R1_data: i128)
    %output = seq.firreg %8 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 0 : ui64} : i128
    %0 = comb.xor bin %io_CEN, %true {sv.namehint = "_T"} : i1
    %1 = comb.xor bin %io_WEN, %true {sv.namehint = "_T_1"} : i1
    %2 = comb.and bin %0, %1 {sv.namehint = "_T_2"} : i1
    %3 = comb.xor bin %io_BWEN, %c-1_i128 {sv.namehint = "_T_3"} : i128
    %4 = comb.and bin %io_D, %3 {sv.namehint = "_T_4"} : i128
    %5 = comb.and bin %ram_ext.R0_data, %io_BWEN {sv.namehint = "_T_5"} : i128
    %6 = comb.or bin %4, %5 {sv.namehint = "_T_6"} : i128
    %7 = comb.xor bin %2, %true : i1
    %8 = comb.mux bin %2, %c0_i128, %ram_ext.R1_data : i128
    hw.output %output : i128
  }
  hw.module private @Ram_bw_5(%clock: i1, %reset: i1, %io_cen: i1, %io_wen: i1, %io_addr: i6, %io_wdata: i128, %io_mask: i128) -> (io_rdata: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %ram.io_Q = hw.instance "ram" @S011HD1P_X32Y2D128_BW_5(clock: %clock: i1, reset: %reset: i1, io_CEN: %0: i1, io_WEN: %1: i1, io_BWEN: %2: i128, io_A: %io_addr: i6, io_D: %io_wdata: i128) -> (io_Q: i128)
    %0 = comb.xor bin %io_cen, %true {sv.namehint = "_ram_io_CEN_T"} : i1
    %1 = comb.xor bin %io_wen, %true {sv.namehint = "_ram_io_WEN_T"} : i1
    %2 = comb.xor bin %io_mask, %c-1_i128 {sv.namehint = "_ram_io_BWEN_T"} : i128
    hw.output %ram.io_Q : i128
  }
  hw.module private @S011HD1P_X32Y2D128_BW_6(%clock: i1, %reset: i1, %io_CEN: i1, %io_WEN: i1, %io_BWEN: i128, %io_A: i6, %io_D: i128) -> (io_Q: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %c0_i128 = hw.constant 0 : i128
    %ram_ext.R0_data, %ram_ext.R1_data = hw.instance "ram_ext" @ram_combMem(R0_addr: %io_A: i6, R0_en: %2: i1, R0_clk: %clock: i1, R1_addr: %io_A: i6, R1_en: %7: i1, R1_clk: %clock: i1, W0_addr: %io_A: i6, W0_en: %2: i1, W0_clk: %clock: i1, W0_data: %6: i128) -> (R0_data: i128, R1_data: i128)
    %output = seq.firreg %8 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 0 : ui64} : i128
    %0 = comb.xor bin %io_CEN, %true {sv.namehint = "_T"} : i1
    %1 = comb.xor bin %io_WEN, %true {sv.namehint = "_T_1"} : i1
    %2 = comb.and bin %0, %1 {sv.namehint = "_T_2"} : i1
    %3 = comb.xor bin %io_BWEN, %c-1_i128 {sv.namehint = "_T_3"} : i128
    %4 = comb.and bin %io_D, %3 {sv.namehint = "_T_4"} : i128
    %5 = comb.and bin %ram_ext.R0_data, %io_BWEN {sv.namehint = "_T_5"} : i128
    %6 = comb.or bin %4, %5 {sv.namehint = "_T_6"} : i128
    %7 = comb.xor bin %2, %true : i1
    %8 = comb.mux bin %2, %c0_i128, %ram_ext.R1_data : i128
    hw.output %output : i128
  }
  hw.module private @Ram_bw_6(%clock: i1, %reset: i1, %io_cen: i1, %io_wen: i1, %io_addr: i6, %io_wdata: i128, %io_mask: i128) -> (io_rdata: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %ram.io_Q = hw.instance "ram" @S011HD1P_X32Y2D128_BW_6(clock: %clock: i1, reset: %reset: i1, io_CEN: %0: i1, io_WEN: %1: i1, io_BWEN: %2: i128, io_A: %io_addr: i6, io_D: %io_wdata: i128) -> (io_Q: i128)
    %0 = comb.xor bin %io_cen, %true {sv.namehint = "_ram_io_CEN_T"} : i1
    %1 = comb.xor bin %io_wen, %true {sv.namehint = "_ram_io_WEN_T"} : i1
    %2 = comb.xor bin %io_mask, %c-1_i128 {sv.namehint = "_ram_io_BWEN_T"} : i128
    hw.output %ram.io_Q : i128
  }
  hw.module private @S011HD1P_X32Y2D128_BW_7(%clock: i1, %reset: i1, %io_CEN: i1, %io_WEN: i1, %io_BWEN: i128, %io_A: i6, %io_D: i128) -> (io_Q: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %c0_i128 = hw.constant 0 : i128
    %ram_ext.R0_data, %ram_ext.R1_data = hw.instance "ram_ext" @ram_combMem(R0_addr: %io_A: i6, R0_en: %2: i1, R0_clk: %clock: i1, R1_addr: %io_A: i6, R1_en: %7: i1, R1_clk: %clock: i1, W0_addr: %io_A: i6, W0_en: %2: i1, W0_clk: %clock: i1, W0_data: %6: i128) -> (R0_data: i128, R1_data: i128)
    %output = seq.firreg %8 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 0 : ui64} : i128
    %0 = comb.xor bin %io_CEN, %true {sv.namehint = "_T"} : i1
    %1 = comb.xor bin %io_WEN, %true {sv.namehint = "_T_1"} : i1
    %2 = comb.and bin %0, %1 {sv.namehint = "_T_2"} : i1
    %3 = comb.xor bin %io_BWEN, %c-1_i128 {sv.namehint = "_T_3"} : i128
    %4 = comb.and bin %io_D, %3 {sv.namehint = "_T_4"} : i128
    %5 = comb.and bin %ram_ext.R0_data, %io_BWEN {sv.namehint = "_T_5"} : i128
    %6 = comb.or bin %4, %5 {sv.namehint = "_T_6"} : i128
    %7 = comb.xor bin %2, %true : i1
    %8 = comb.mux bin %2, %c0_i128, %ram_ext.R1_data : i128
    hw.output %output : i128
  }
  hw.module private @Ram_bw_7(%clock: i1, %reset: i1, %io_cen: i1, %io_wen: i1, %io_addr: i6, %io_wdata: i128, %io_mask: i128) -> (io_rdata: i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %ram.io_Q = hw.instance "ram" @S011HD1P_X32Y2D128_BW_7(clock: %clock: i1, reset: %reset: i1, io_CEN: %0: i1, io_WEN: %1: i1, io_BWEN: %2: i128, io_A: %io_addr: i6, io_D: %io_wdata: i128) -> (io_Q: i128)
    %0 = comb.xor bin %io_cen, %true {sv.namehint = "_ram_io_CEN_T"} : i1
    %1 = comb.xor bin %io_wen, %true {sv.namehint = "_ram_io_WEN_T"} : i1
    %2 = comb.xor bin %io_mask, %c-1_i128 {sv.namehint = "_ram_io_BWEN_T"} : i128
    hw.output %ram.io_Q : i128
  }
  hw.module private @MaxPeriodFibonacciLFSR_1(%clock: i1, %reset: i1) -> (io_out_0: i1, io_out_1: i1) {
    %false = hw.constant false
    %true = hw.constant true
    %state_0 = seq.firreg %0 clock %clock reset sync %reset, %true {firrtl.random_init_start = 0 : ui64} : i1
    %state_1 = seq.firreg %state_0 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %0 = comb.xor bin %state_1, %state_0 {sv.namehint = "_T"} : i1
    hw.output %state_0, %state_1 : i1, i1
  }
  hw.module private @DataCache(%clock: i1, %reset: i1, %io_dataAxi_wa_ready: i1, %io_dataAxi_wd_ready: i1, %io_dataAxi_ra_ready: i1, %io_dataAxi_rd_valid: i1, %io_dataAxi_rd_bits_data: i64, %io_dataAxi_rd_bits_last: i1, %io_dcRW_addr: i32, %io_dcRW_wdata: i64, %io_dcRW_dc_mode: i5, %io_dcRW_amo: i5, %io_flush: i1) -> (io_dataAxi_wa_valid: i1, io_dataAxi_wa_bits_addr: i32, io_dataAxi_wd_valid: i1, io_dataAxi_wd_bits_data: i64, io_dataAxi_wd_bits_last: i1, io_dataAxi_ra_valid: i1, io_dataAxi_ra_bits_addr: i32, io_dcRW_rdata: i64, io_dcRW_rvalid: i1, io_dcRW_ready: i1, io_flush_out: i1) {
    %c0_i64 = hw.constant 0 : i64
    %true = hw.constant true
    %c1_i3 = hw.constant 1 : i3
    %false = hw.constant false
    %0 = hw.aggregate_constant [18446744073709551615 : i128, 4294967295 : i128, 65535 : i128, 255 : i128] : !hw.array<4xi128>
    %c0_i3 = hw.constant 0 : i3
    %c-1_i3 = hw.constant -1 : i3
    %c0_i248 = hw.constant 0 : i248
    %c0_i184 = hw.constant 0 : i184
    %c0_i127 = hw.constant 0 : i127
    %c0_i121 = hw.constant 0 : i121
    %c0_i5 = hw.constant 0 : i5
    %c0_i32 = hw.constant 0 : i32
    %c-2_i2 = hw.constant -2 : i2
    %c-1_i2 = hw.constant -1 : i2
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c-8_i4 = hw.constant -8 : i4
    %c-7_i4 = hw.constant -7 : i4
    %c-6_i4 = hw.constant -6 : i4
    %c-5_i4 = hw.constant -5 : i4
    %c-4_i4 = hw.constant -4 : i4
    %c-3_i4 = hw.constant -3 : i4
    %c-2_i4 = hw.constant -2 : i4
    %c-1_i4 = hw.constant -1 : i4
    %c0_i56 = hw.constant 0 : i56
    %c0_i48 = hw.constant 0 : i48
    %c4_i5 = hw.constant 4 : i5
    %c-12_i5 = hw.constant -12 : i5
    %c5_i5 = hw.constant 5 : i5
    %c-11_i5 = hw.constant -11 : i5
    %c6_i5 = hw.constant 6 : i5
    %c-10_i5 = hw.constant -10 : i5
    %c7_i5 = hw.constant 7 : i5
    %c14_i5 = hw.constant 14 : i5
    %c15_i5 = hw.constant 15 : i5
    %c1_i5 = hw.constant 1 : i5
    %c12_i5 = hw.constant 12 : i5
    %c8_i5 = hw.constant 8 : i5
    %c-16_i5 = hw.constant -16 : i5
    %c-4_i5 = hw.constant -4 : i5
    %c-64_i32 = hw.constant -64 : i32
    %c2_i3 = hw.constant 2 : i3
    %c0_i22 = hw.constant 0 : i22
    %c0_i6 = hw.constant 0 : i6
    %c0_i128 = hw.constant 0 : i128
    %c0_i2 = hw.constant 0 : i2
    %c1_i2 = hw.constant 1 : i2
    %c1_i4 = hw.constant 1 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c4_i4 = hw.constant 4 : i4
    %c5_i4 = hw.constant 5 : i4
    %c6_i4 = hw.constant 6 : i4
    %c7_i4 = hw.constant 7 : i4
    %c-1_i128 = hw.constant -1 : i128
    %c0_i4 = hw.constant 0 : i4
    %c3_i3 = hw.constant 3 : i3
    %tag_0_0 = seq.firreg %637 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 0 : ui64} : i22
    %tag_0_1 = seq.firreg %643 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 22 : ui64} : i22
    %tag_0_2 = seq.firreg %649 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 44 : ui64} : i22
    %tag_0_3 = seq.firreg %655 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 66 : ui64} : i22
    %tag_0_4 = seq.firreg %661 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 88 : ui64} : i22
    %tag_0_5 = seq.firreg %667 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 110 : ui64} : i22
    %tag_0_6 = seq.firreg %673 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 132 : ui64} : i22
    %tag_0_7 = seq.firreg %679 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 154 : ui64} : i22
    %tag_0_8 = seq.firreg %685 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 176 : ui64} : i22
    %tag_0_9 = seq.firreg %691 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 198 : ui64} : i22
    %tag_0_10 = seq.firreg %697 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 220 : ui64} : i22
    %tag_0_11 = seq.firreg %703 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 242 : ui64} : i22
    %tag_0_12 = seq.firreg %709 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 264 : ui64} : i22
    %tag_0_13 = seq.firreg %715 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 286 : ui64} : i22
    %tag_0_14 = seq.firreg %721 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 308 : ui64} : i22
    %tag_0_15 = seq.firreg %727 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 330 : ui64} : i22
    %tag_1_0 = seq.firreg %733 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 352 : ui64} : i22
    %tag_1_1 = seq.firreg %738 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 374 : ui64} : i22
    %tag_1_2 = seq.firreg %743 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 396 : ui64} : i22
    %tag_1_3 = seq.firreg %748 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 418 : ui64} : i22
    %tag_1_4 = seq.firreg %753 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 440 : ui64} : i22
    %tag_1_5 = seq.firreg %758 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 462 : ui64} : i22
    %tag_1_6 = seq.firreg %763 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 484 : ui64} : i22
    %tag_1_7 = seq.firreg %768 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 506 : ui64} : i22
    %tag_1_8 = seq.firreg %773 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 528 : ui64} : i22
    %tag_1_9 = seq.firreg %778 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 550 : ui64} : i22
    %tag_1_10 = seq.firreg %783 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 572 : ui64} : i22
    %tag_1_11 = seq.firreg %788 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 594 : ui64} : i22
    %tag_1_12 = seq.firreg %793 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 616 : ui64} : i22
    %tag_1_13 = seq.firreg %798 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 638 : ui64} : i22
    %tag_1_14 = seq.firreg %803 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 660 : ui64} : i22
    %tag_1_15 = seq.firreg %808 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 682 : ui64} : i22
    %tag_2_0 = seq.firreg %814 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 704 : ui64} : i22
    %tag_2_1 = seq.firreg %819 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 726 : ui64} : i22
    %tag_2_2 = seq.firreg %824 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 748 : ui64} : i22
    %tag_2_3 = seq.firreg %829 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 770 : ui64} : i22
    %tag_2_4 = seq.firreg %834 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 792 : ui64} : i22
    %tag_2_5 = seq.firreg %839 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 814 : ui64} : i22
    %tag_2_6 = seq.firreg %844 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 836 : ui64} : i22
    %tag_2_7 = seq.firreg %849 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 858 : ui64} : i22
    %tag_2_8 = seq.firreg %854 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 880 : ui64} : i22
    %tag_2_9 = seq.firreg %859 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 902 : ui64} : i22
    %tag_2_10 = seq.firreg %864 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 924 : ui64} : i22
    %tag_2_11 = seq.firreg %869 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 946 : ui64} : i22
    %tag_2_12 = seq.firreg %874 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 968 : ui64} : i22
    %tag_2_13 = seq.firreg %879 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 990 : ui64} : i22
    %tag_2_14 = seq.firreg %884 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1012 : ui64} : i22
    %tag_2_15 = seq.firreg %889 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1034 : ui64} : i22
    %tag_3_0 = seq.firreg %895 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1056 : ui64} : i22
    %tag_3_1 = seq.firreg %900 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1078 : ui64} : i22
    %tag_3_2 = seq.firreg %905 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1100 : ui64} : i22
    %tag_3_3 = seq.firreg %910 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1122 : ui64} : i22
    %tag_3_4 = seq.firreg %915 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1144 : ui64} : i22
    %tag_3_5 = seq.firreg %920 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1166 : ui64} : i22
    %tag_3_6 = seq.firreg %925 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1188 : ui64} : i22
    %tag_3_7 = seq.firreg %930 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1210 : ui64} : i22
    %tag_3_8 = seq.firreg %935 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1232 : ui64} : i22
    %tag_3_9 = seq.firreg %940 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1254 : ui64} : i22
    %tag_3_10 = seq.firreg %945 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1276 : ui64} : i22
    %tag_3_11 = seq.firreg %950 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1298 : ui64} : i22
    %tag_3_12 = seq.firreg %955 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1320 : ui64} : i22
    %tag_3_13 = seq.firreg %960 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1342 : ui64} : i22
    %tag_3_14 = seq.firreg %965 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1364 : ui64} : i22
    %tag_3_15 = seq.firreg %970 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1386 : ui64} : i22
    %valid_0_0 = seq.firreg %1554 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1408 : ui64} : i1
    %valid_0_1 = seq.firreg %1561 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1409 : ui64} : i1
    %valid_0_2 = seq.firreg %1568 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1410 : ui64} : i1
    %valid_0_3 = seq.firreg %1575 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1411 : ui64} : i1
    %valid_0_4 = seq.firreg %1582 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1412 : ui64} : i1
    %valid_0_5 = seq.firreg %1589 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1413 : ui64} : i1
    %valid_0_6 = seq.firreg %1596 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1414 : ui64} : i1
    %valid_0_7 = seq.firreg %1603 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1415 : ui64} : i1
    %valid_0_8 = seq.firreg %1610 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1416 : ui64} : i1
    %valid_0_9 = seq.firreg %1617 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1417 : ui64} : i1
    %valid_0_10 = seq.firreg %1624 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1418 : ui64} : i1
    %valid_0_11 = seq.firreg %1631 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1419 : ui64} : i1
    %valid_0_12 = seq.firreg %1638 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1420 : ui64} : i1
    %valid_0_13 = seq.firreg %1645 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1421 : ui64} : i1
    %valid_0_14 = seq.firreg %1652 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1422 : ui64} : i1
    %valid_0_15 = seq.firreg %1659 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1423 : ui64} : i1
    %valid_1_0 = seq.firreg %1666 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1424 : ui64} : i1
    %valid_1_1 = seq.firreg %1673 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1425 : ui64} : i1
    %valid_1_2 = seq.firreg %1680 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1426 : ui64} : i1
    %valid_1_3 = seq.firreg %1687 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1427 : ui64} : i1
    %valid_1_4 = seq.firreg %1694 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1428 : ui64} : i1
    %valid_1_5 = seq.firreg %1701 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1429 : ui64} : i1
    %valid_1_6 = seq.firreg %1708 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1430 : ui64} : i1
    %valid_1_7 = seq.firreg %1715 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1431 : ui64} : i1
    %valid_1_8 = seq.firreg %1722 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1432 : ui64} : i1
    %valid_1_9 = seq.firreg %1729 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1433 : ui64} : i1
    %valid_1_10 = seq.firreg %1736 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1434 : ui64} : i1
    %valid_1_11 = seq.firreg %1743 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1435 : ui64} : i1
    %valid_1_12 = seq.firreg %1750 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1436 : ui64} : i1
    %valid_1_13 = seq.firreg %1757 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1437 : ui64} : i1
    %valid_1_14 = seq.firreg %1764 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1438 : ui64} : i1
    %valid_1_15 = seq.firreg %1771 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1439 : ui64} : i1
    %valid_2_0 = seq.firreg %1778 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1440 : ui64} : i1
    %valid_2_1 = seq.firreg %1785 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1441 : ui64} : i1
    %valid_2_2 = seq.firreg %1792 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1442 : ui64} : i1
    %valid_2_3 = seq.firreg %1799 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1443 : ui64} : i1
    %valid_2_4 = seq.firreg %1806 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1444 : ui64} : i1
    %valid_2_5 = seq.firreg %1813 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1445 : ui64} : i1
    %valid_2_6 = seq.firreg %1820 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1446 : ui64} : i1
    %valid_2_7 = seq.firreg %1827 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1447 : ui64} : i1
    %valid_2_8 = seq.firreg %1834 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1448 : ui64} : i1
    %valid_2_9 = seq.firreg %1841 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1449 : ui64} : i1
    %valid_2_10 = seq.firreg %1848 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1450 : ui64} : i1
    %valid_2_11 = seq.firreg %1855 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1451 : ui64} : i1
    %valid_2_12 = seq.firreg %1862 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1452 : ui64} : i1
    %valid_2_13 = seq.firreg %1869 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1453 : ui64} : i1
    %valid_2_14 = seq.firreg %1876 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1454 : ui64} : i1
    %valid_2_15 = seq.firreg %1883 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1455 : ui64} : i1
    %valid_3_0 = seq.firreg %1890 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1456 : ui64} : i1
    %valid_3_1 = seq.firreg %1897 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1457 : ui64} : i1
    %valid_3_2 = seq.firreg %1904 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1458 : ui64} : i1
    %valid_3_3 = seq.firreg %1911 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1459 : ui64} : i1
    %valid_3_4 = seq.firreg %1918 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1460 : ui64} : i1
    %valid_3_5 = seq.firreg %1925 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1461 : ui64} : i1
    %valid_3_6 = seq.firreg %1932 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1462 : ui64} : i1
    %valid_3_7 = seq.firreg %1939 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1463 : ui64} : i1
    %valid_3_8 = seq.firreg %1946 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1464 : ui64} : i1
    %valid_3_9 = seq.firreg %1953 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1465 : ui64} : i1
    %valid_3_10 = seq.firreg %1960 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1466 : ui64} : i1
    %valid_3_11 = seq.firreg %1967 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1467 : ui64} : i1
    %valid_3_12 = seq.firreg %1974 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1468 : ui64} : i1
    %valid_3_13 = seq.firreg %1981 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1469 : ui64} : i1
    %valid_3_14 = seq.firreg %1988 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1470 : ui64} : i1
    %valid_3_15 = seq.firreg %1995 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1471 : ui64} : i1
    %dirty_0_0 = seq.firreg %1271 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1472 : ui64} : i1
    %dirty_0_1 = seq.firreg %1275 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1473 : ui64} : i1
    %dirty_0_2 = seq.firreg %1279 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1474 : ui64} : i1
    %dirty_0_3 = seq.firreg %1283 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1475 : ui64} : i1
    %dirty_0_4 = seq.firreg %1287 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1476 : ui64} : i1
    %dirty_0_5 = seq.firreg %1291 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1477 : ui64} : i1
    %dirty_0_6 = seq.firreg %1295 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1478 : ui64} : i1
    %dirty_0_7 = seq.firreg %1299 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1479 : ui64} : i1
    %dirty_0_8 = seq.firreg %1303 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1480 : ui64} : i1
    %dirty_0_9 = seq.firreg %1307 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1481 : ui64} : i1
    %dirty_0_10 = seq.firreg %1311 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1482 : ui64} : i1
    %dirty_0_11 = seq.firreg %1315 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1483 : ui64} : i1
    %dirty_0_12 = seq.firreg %1319 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1484 : ui64} : i1
    %dirty_0_13 = seq.firreg %1323 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1485 : ui64} : i1
    %dirty_0_14 = seq.firreg %1327 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1486 : ui64} : i1
    %dirty_0_15 = seq.firreg %1331 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1487 : ui64} : i1
    %dirty_1_0 = seq.firreg %1335 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1488 : ui64} : i1
    %dirty_1_1 = seq.firreg %1339 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1489 : ui64} : i1
    %dirty_1_2 = seq.firreg %1343 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1490 : ui64} : i1
    %dirty_1_3 = seq.firreg %1347 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1491 : ui64} : i1
    %dirty_1_4 = seq.firreg %1351 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1492 : ui64} : i1
    %dirty_1_5 = seq.firreg %1355 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1493 : ui64} : i1
    %dirty_1_6 = seq.firreg %1359 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1494 : ui64} : i1
    %dirty_1_7 = seq.firreg %1363 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1495 : ui64} : i1
    %dirty_1_8 = seq.firreg %1367 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1496 : ui64} : i1
    %dirty_1_9 = seq.firreg %1371 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1497 : ui64} : i1
    %dirty_1_10 = seq.firreg %1375 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1498 : ui64} : i1
    %dirty_1_11 = seq.firreg %1379 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1499 : ui64} : i1
    %dirty_1_12 = seq.firreg %1383 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1500 : ui64} : i1
    %dirty_1_13 = seq.firreg %1387 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1501 : ui64} : i1
    %dirty_1_14 = seq.firreg %1391 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1502 : ui64} : i1
    %dirty_1_15 = seq.firreg %1395 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1503 : ui64} : i1
    %dirty_2_0 = seq.firreg %1399 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1504 : ui64} : i1
    %dirty_2_1 = seq.firreg %1403 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1505 : ui64} : i1
    %dirty_2_2 = seq.firreg %1407 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1506 : ui64} : i1
    %dirty_2_3 = seq.firreg %1411 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1507 : ui64} : i1
    %dirty_2_4 = seq.firreg %1415 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1508 : ui64} : i1
    %dirty_2_5 = seq.firreg %1419 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1509 : ui64} : i1
    %dirty_2_6 = seq.firreg %1423 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1510 : ui64} : i1
    %dirty_2_7 = seq.firreg %1427 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1511 : ui64} : i1
    %dirty_2_8 = seq.firreg %1431 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1512 : ui64} : i1
    %dirty_2_9 = seq.firreg %1435 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1513 : ui64} : i1
    %dirty_2_10 = seq.firreg %1439 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1514 : ui64} : i1
    %dirty_2_11 = seq.firreg %1443 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1515 : ui64} : i1
    %dirty_2_12 = seq.firreg %1447 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1516 : ui64} : i1
    %dirty_2_13 = seq.firreg %1451 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1517 : ui64} : i1
    %dirty_2_14 = seq.firreg %1455 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1518 : ui64} : i1
    %dirty_2_15 = seq.firreg %1459 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1519 : ui64} : i1
    %dirty_3_0 = seq.firreg %1463 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1520 : ui64} : i1
    %dirty_3_1 = seq.firreg %1467 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1521 : ui64} : i1
    %dirty_3_2 = seq.firreg %1471 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1522 : ui64} : i1
    %dirty_3_3 = seq.firreg %1475 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1523 : ui64} : i1
    %dirty_3_4 = seq.firreg %1479 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1524 : ui64} : i1
    %dirty_3_5 = seq.firreg %1483 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1525 : ui64} : i1
    %dirty_3_6 = seq.firreg %1487 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1526 : ui64} : i1
    %dirty_3_7 = seq.firreg %1491 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1527 : ui64} : i1
    %dirty_3_8 = seq.firreg %1495 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1528 : ui64} : i1
    %dirty_3_9 = seq.firreg %1499 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1529 : ui64} : i1
    %dirty_3_10 = seq.firreg %1503 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1530 : ui64} : i1
    %dirty_3_11 = seq.firreg %1507 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1531 : ui64} : i1
    %dirty_3_12 = seq.firreg %1511 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1532 : ui64} : i1
    %dirty_3_13 = seq.firreg %1515 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1533 : ui64} : i1
    %dirty_3_14 = seq.firreg %1519 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1534 : ui64} : i1
    %dirty_3_15 = seq.firreg %1523 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1535 : ui64} : i1
    %Ram_bw.io_rdata = hw.instance "Ram_bw" @Ram_bw_4(clock: %clock: i1, reset: %reset: i1, io_cen: %336: i1, io_wen: %340: i1, io_addr: %328: i6, io_wdata: %349: i128, io_mask: %353: i128) -> (io_rdata: i128) {sv.namehint = "data_0_rdata"}
    %Ram_bw_1.io_rdata = hw.instance "Ram_bw_1" @Ram_bw_5(clock: %clock: i1, reset: %reset: i1, io_cen: %337: i1, io_wen: %341: i1, io_addr: %330: i6, io_wdata: %350: i128, io_mask: %354: i128) -> (io_rdata: i128) {sv.namehint = "data_1_rdata"}
    %Ram_bw_2.io_rdata = hw.instance "Ram_bw_2" @Ram_bw_6(clock: %clock: i1, reset: %reset: i1, io_cen: %338: i1, io_wen: %342: i1, io_addr: %332: i6, io_wdata: %351: i128, io_mask: %355: i128) -> (io_rdata: i128) {sv.namehint = "data_2_rdata"}
    %Ram_bw_3.io_rdata = hw.instance "Ram_bw_3" @Ram_bw_7(clock: %clock: i1, reset: %reset: i1, io_cen: %339: i1, io_wen: %343: i1, io_addr: %334: i6, io_wdata: %352: i128, io_mask: %356: i128) -> (io_rdata: i128) {sv.namehint = "data_3_rdata"}
    %wait_r = seq.firreg %1540 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1536 : ui64} : i1
    %valid_r = seq.firreg %603 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1537 : ui64} : i1
    %flush_r = seq.firreg %1547 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1538 : ui64} : i1
    %mode_r = seq.firreg %45 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 1539 : ui64} : i5
    %wdata_r = seq.firreg %46 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1544 : ui64} : i64
    %amo_r = seq.firreg %47 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 1608 : ui64} : i5
    %1 = comb.icmp bin ne %io_dcRW_dc_mode, %c0_i5 {sv.namehint = "_hs_in_T"} : i5
    %2 = comb.xor bin %io_flush, %true {sv.namehint = "_valid_in_T_1"} : i1
    %3 = comb.and bin %1, %5 {sv.namehint = "hs_in"} : i1
    %4 = comb.xor bin %wait_r, %true {sv.namehint = "_T_71"} : i1
    %5 = comb.and bin %1, %2, %4 {sv.namehint = ".io_dcRW_ready.output"} : i1
    %addr_r = seq.firreg %43 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1613 : ui64} : i32
    %6 = comb.mux bin %3, %io_dcRW_addr, %addr_r {sv.namehint = "cur_addr"} : i32
    %matchWay_r = seq.firreg %2008 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1645 : ui64} : i2
    %offset = seq.firreg %1050 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 1647 : ui64} : i3
    %rdatabuf = seq.firreg %624 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1650 : ui64} : i64
    %7 = comb.extract %6 from 6 {sv.namehint = "blockIdx"} : (i32) -> i4
    %blockIdx_r = seq.firreg %2011 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 1714 : ui64} : i4
    %8 = comb.extract %6 from 10 {sv.namehint = "cur_tag"} : (i32) -> i22
    %9 = hw.array_create %tag_0_15, %tag_0_14, %tag_0_13, %tag_0_12, %tag_0_11, %tag_0_10, %tag_0_9, %tag_0_8, %tag_0_7, %tag_0_6, %tag_0_5, %tag_0_4, %tag_0_3, %tag_0_2, %tag_0_1, %tag_0_0 : i22
    %10 = hw.array_get %9[%7] : !hw.array<16xi22>, i4
    %11 = comb.icmp bin eq %10, %8 {sv.namehint = "_cache_hit_vec_T"} : i22
    %12 = hw.array_create %valid_0_15, %valid_0_14, %valid_0_13, %valid_0_12, %valid_0_11, %valid_0_10, %valid_0_9, %valid_0_8, %valid_0_7, %valid_0_6, %valid_0_5, %valid_0_4, %valid_0_3, %valid_0_2, %valid_0_1, %valid_0_0 : i1
    %13 = hw.array_get %12[%7] : !hw.array<16xi1>, i4
    %14 = comb.and bin %11, %13 {sv.namehint = "cache_hit_vec_0"} : i1
    %15 = hw.array_create %tag_1_15, %tag_1_14, %tag_1_13, %tag_1_12, %tag_1_11, %tag_1_10, %tag_1_9, %tag_1_8, %tag_1_7, %tag_1_6, %tag_1_5, %tag_1_4, %tag_1_3, %tag_1_2, %tag_1_1, %tag_1_0 : i22
    %16 = hw.array_get %15[%7] : !hw.array<16xi22>, i4
    %17 = comb.icmp bin eq %16, %8 {sv.namehint = "_cache_hit_vec_T_2"} : i22
    %18 = hw.array_create %valid_1_15, %valid_1_14, %valid_1_13, %valid_1_12, %valid_1_11, %valid_1_10, %valid_1_9, %valid_1_8, %valid_1_7, %valid_1_6, %valid_1_5, %valid_1_4, %valid_1_3, %valid_1_2, %valid_1_1, %valid_1_0 : i1
    %19 = hw.array_get %18[%7] : !hw.array<16xi1>, i4
    %20 = comb.and bin %17, %19 {sv.namehint = "cache_hit_vec_1"} : i1
    %21 = hw.array_create %tag_2_15, %tag_2_14, %tag_2_13, %tag_2_12, %tag_2_11, %tag_2_10, %tag_2_9, %tag_2_8, %tag_2_7, %tag_2_6, %tag_2_5, %tag_2_4, %tag_2_3, %tag_2_2, %tag_2_1, %tag_2_0 : i22
    %22 = hw.array_get %21[%7] : !hw.array<16xi22>, i4
    %23 = comb.icmp bin eq %22, %8 {sv.namehint = "_cache_hit_vec_T_4"} : i22
    %24 = hw.array_create %valid_2_15, %valid_2_14, %valid_2_13, %valid_2_12, %valid_2_11, %valid_2_10, %valid_2_9, %valid_2_8, %valid_2_7, %valid_2_6, %valid_2_5, %valid_2_4, %valid_2_3, %valid_2_2, %valid_2_1, %valid_2_0 : i1
    %25 = hw.array_get %24[%7] : !hw.array<16xi1>, i4
    %26 = comb.and bin %23, %25 {sv.namehint = "cache_hit_vec_2"} : i1
    %27 = hw.array_create %tag_3_15, %tag_3_14, %tag_3_13, %tag_3_12, %tag_3_11, %tag_3_10, %tag_3_9, %tag_3_8, %tag_3_7, %tag_3_6, %tag_3_5, %tag_3_4, %tag_3_3, %tag_3_2, %tag_3_1, %tag_3_0 : i22
    %28 = hw.array_get %27[%7] : !hw.array<16xi22>, i4
    %29 = comb.icmp bin eq %28, %8 {sv.namehint = "_cache_hit_vec_T_6"} : i22
    %30 = hw.array_create %valid_3_15, %valid_3_14, %valid_3_13, %valid_3_12, %valid_3_11, %valid_3_10, %valid_3_9, %valid_3_8, %valid_3_7, %valid_3_6, %valid_3_5, %valid_3_4, %valid_3_3, %valid_3_2, %valid_3_1, %valid_3_0 : i1
    %31 = hw.array_get %30[%7] : !hw.array<16xi1>, i4
    %32 = comb.and bin %29, %31 {sv.namehint = "cache_hit_vec_3"} : i1
    %33 = comb.concat %32, %26, %20, %14 {sv.namehint = "_cacheHit_T"} : i1, i1, i1, i1
    %34 = comb.icmp bin ne %33, %c0_i4 {sv.namehint = "cacheHit"} : i4
    %35 = comb.concat %32, %26 {sv.namehint = "matchWay_hi_1"} : i1, i1
    %36 = comb.icmp bin ne %35, %c0_i2 {sv.namehint = "matchWay_hi_2"} : i2
    %37 = comb.or %32, %20 {sv.namehint = "matchWay_lo_2"} : i1
    %38 = comb.concat %36, %37 {sv.namehint = "_matchWay_T_2"} : i1, i1
    %matchWay_prng.io_out_0, %matchWay_prng.io_out_1 = hw.instance "matchWay_prng" @MaxPeriodFibonacciLFSR_1(clock: %clock: i1, reset: %reset: i1) -> (io_out_0: i1, io_out_1: i1)
    %39 = comb.concat %matchWay_prng.io_out_1, %matchWay_prng.io_out_0 {sv.namehint = "_matchWay_T_3"} : i1, i1
    %40 = comb.mux bin %3, %39, %matchWay_r {sv.namehint = "_matchWay_T_4"} : i2
    %41 = comb.mux bin %34, %38, %40 {sv.namehint = "matchWay"} : i2
    %42 = comb.mux bin %34, %38, %39 : i2
    %43 = comb.mux bin %3, %io_dcRW_addr, %addr_r : i32
    %44 = comb.mux bin %3, %42, %matchWay_r : i2
    %45 = comb.mux bin %3, %io_dcRW_dc_mode, %mode_r : i5
    %46 = comb.mux bin %3, %io_dcRW_wdata, %wdata_r : i64
    %47 = comb.mux bin %3, %io_dcRW_amo, %amo_r : i5
    %48 = comb.extract %io_dcRW_addr from 6 {sv.namehint = "_blockIdx_r_T"} : (i32) -> i4
    %49 = comb.mux bin %3, %48, %blockIdx_r : i4
    %50 = comb.or %io_flush, %flush_r : i1
    %51 = comb.and bin %valid_0_0, %dirty_0_0 {sv.namehint = "_T"} : i1
    %52 = comb.xor bin %51, %true : i1
    %53 = comb.and bin %valid_0_1, %dirty_0_1 {sv.namehint = "_T_1"} : i1
    %54 = comb.concat %c0_i3, %53 : i3, i1
    %55 = comb.and bin %valid_0_2, %dirty_0_2 {sv.namehint = "_T_2"} : i1
    %56 = comb.mux bin %55, %c2_i4, %54 : i4
    %57 = comb.and bin %valid_0_3, %dirty_0_3 {sv.namehint = "_T_3"} : i1
    %58 = comb.mux bin %57, %c3_i4, %56 : i4
    %59 = comb.and bin %valid_0_4, %dirty_0_4 {sv.namehint = "_T_4"} : i1
    %60 = comb.mux bin %59, %c4_i4, %58 : i4
    %61 = comb.and bin %valid_0_5, %dirty_0_5 {sv.namehint = "_T_5"} : i1
    %62 = comb.mux bin %61, %c5_i4, %60 : i4
    %63 = comb.and bin %valid_0_6, %dirty_0_6 {sv.namehint = "_T_6"} : i1
    %64 = comb.mux bin %63, %c6_i4, %62 : i4
    %65 = comb.and bin %valid_0_7, %dirty_0_7 {sv.namehint = "_T_7"} : i1
    %66 = comb.mux bin %65, %c7_i4, %64 : i4
    %67 = comb.and bin %valid_0_8, %dirty_0_8 {sv.namehint = "_T_8"} : i1
    %68 = comb.mux bin %67, %c-8_i4, %66 : i4
    %69 = comb.and bin %valid_0_9, %dirty_0_9 {sv.namehint = "_T_9"} : i1
    %70 = comb.mux bin %69, %c-7_i4, %68 : i4
    %71 = comb.and bin %valid_0_10, %dirty_0_10 {sv.namehint = "_T_10"} : i1
    %72 = comb.mux bin %71, %c-6_i4, %70 : i4
    %73 = comb.and bin %valid_0_11, %dirty_0_11 {sv.namehint = "_T_11"} : i1
    %74 = comb.mux bin %73, %c-5_i4, %72 : i4
    %75 = comb.and bin %valid_0_12, %dirty_0_12 {sv.namehint = "_T_12"} : i1
    %76 = comb.mux bin %75, %c-4_i4, %74 : i4
    %77 = comb.and bin %valid_0_13, %dirty_0_13 {sv.namehint = "_T_13"} : i1
    %78 = comb.mux bin %77, %c-3_i4, %76 : i4
    %79 = comb.and bin %valid_0_14, %dirty_0_14 {sv.namehint = "_T_14"} : i1
    %80 = comb.mux bin %79, %c-2_i4, %78 : i4
    %81 = comb.and bin %valid_0_15, %dirty_0_15 {sv.namehint = "_T_15"} : i1
    %82 = comb.mux bin %81, %c-1_i4, %80 : i4
    %83 = comb.and bin %valid_1_0, %dirty_1_0 {sv.namehint = "_T_16"} : i1
    %84 = comb.mux bin %83, %c0_i4, %82 : i4
    %85 = comb.and bin %valid_1_1, %dirty_1_1 {sv.namehint = "_T_17"} : i1
    %86 = comb.mux bin %85, %c1_i4, %84 : i4
    %87 = comb.and bin %valid_1_2, %dirty_1_2 {sv.namehint = "_T_18"} : i1
    %88 = comb.mux bin %87, %c2_i4, %86 : i4
    %89 = comb.and bin %valid_1_3, %dirty_1_3 {sv.namehint = "_T_19"} : i1
    %90 = comb.mux bin %89, %c3_i4, %88 : i4
    %91 = comb.and bin %valid_1_4, %dirty_1_4 {sv.namehint = "_T_20"} : i1
    %92 = comb.mux bin %91, %c4_i4, %90 : i4
    %93 = comb.and bin %valid_1_5, %dirty_1_5 {sv.namehint = "_T_21"} : i1
    %94 = comb.mux bin %93, %c5_i4, %92 : i4
    %95 = comb.and bin %valid_1_6, %dirty_1_6 {sv.namehint = "_T_22"} : i1
    %96 = comb.mux bin %95, %c6_i4, %94 : i4
    %97 = comb.and bin %valid_1_7, %dirty_1_7 {sv.namehint = "_T_23"} : i1
    %98 = comb.mux bin %97, %c7_i4, %96 : i4
    %99 = comb.and bin %valid_1_8, %dirty_1_8 {sv.namehint = "_T_24"} : i1
    %100 = comb.mux bin %99, %c-8_i4, %98 : i4
    %101 = comb.and bin %valid_1_9, %dirty_1_9 {sv.namehint = "_T_25"} : i1
    %102 = comb.mux bin %101, %c-7_i4, %100 : i4
    %103 = comb.and bin %valid_1_10, %dirty_1_10 {sv.namehint = "_T_26"} : i1
    %104 = comb.mux bin %103, %c-6_i4, %102 : i4
    %105 = comb.and bin %valid_1_11, %dirty_1_11 {sv.namehint = "_T_27"} : i1
    %106 = comb.mux bin %105, %c-5_i4, %104 : i4
    %107 = comb.and bin %valid_1_12, %dirty_1_12 {sv.namehint = "_T_28"} : i1
    %108 = comb.mux bin %107, %c-4_i4, %106 : i4
    %109 = comb.and bin %valid_1_13, %dirty_1_13 {sv.namehint = "_T_29"} : i1
    %110 = comb.mux bin %109, %c-3_i4, %108 : i4
    %111 = comb.and bin %valid_1_14, %dirty_1_14 {sv.namehint = "_T_30"} : i1
    %112 = comb.mux bin %111, %c-2_i4, %110 : i4
    %113 = comb.and bin %valid_1_15, %dirty_1_15 {sv.namehint = "_T_31"} : i1
    %114 = comb.or bin %113, %111, %109, %107, %105, %103, %101, %99, %97, %95, %93, %91, %89, %87, %85, %83 : i1
    %115 = comb.concat %false, %114 : i1, i1
    %116 = comb.mux bin %113, %c-1_i4, %112 : i4
    %117 = comb.and bin %valid_2_0, %dirty_2_0 {sv.namehint = "_T_32"} : i1
    %118 = comb.mux bin %117, %c0_i4, %116 : i4
    %119 = comb.and bin %valid_2_1, %dirty_2_1 {sv.namehint = "_T_33"} : i1
    %120 = comb.mux bin %119, %c1_i4, %118 : i4
    %121 = comb.and bin %valid_2_2, %dirty_2_2 {sv.namehint = "_T_34"} : i1
    %122 = comb.mux bin %121, %c2_i4, %120 : i4
    %123 = comb.and bin %valid_2_3, %dirty_2_3 {sv.namehint = "_T_35"} : i1
    %124 = comb.mux bin %123, %c3_i4, %122 : i4
    %125 = comb.and bin %valid_2_4, %dirty_2_4 {sv.namehint = "_T_36"} : i1
    %126 = comb.mux bin %125, %c4_i4, %124 : i4
    %127 = comb.and bin %valid_2_5, %dirty_2_5 {sv.namehint = "_T_37"} : i1
    %128 = comb.mux bin %127, %c5_i4, %126 : i4
    %129 = comb.and bin %valid_2_6, %dirty_2_6 {sv.namehint = "_T_38"} : i1
    %130 = comb.mux bin %129, %c6_i4, %128 : i4
    %131 = comb.and bin %valid_2_7, %dirty_2_7 {sv.namehint = "_T_39"} : i1
    %132 = comb.mux bin %131, %c7_i4, %130 : i4
    %133 = comb.and bin %valid_2_8, %dirty_2_8 {sv.namehint = "_T_40"} : i1
    %134 = comb.mux bin %133, %c-8_i4, %132 : i4
    %135 = comb.and bin %valid_2_9, %dirty_2_9 {sv.namehint = "_T_41"} : i1
    %136 = comb.mux bin %135, %c-7_i4, %134 : i4
    %137 = comb.and bin %valid_2_10, %dirty_2_10 {sv.namehint = "_T_42"} : i1
    %138 = comb.mux bin %137, %c-6_i4, %136 : i4
    %139 = comb.and bin %valid_2_11, %dirty_2_11 {sv.namehint = "_T_43"} : i1
    %140 = comb.mux bin %139, %c-5_i4, %138 : i4
    %141 = comb.and bin %valid_2_12, %dirty_2_12 {sv.namehint = "_T_44"} : i1
    %142 = comb.mux bin %141, %c-4_i4, %140 : i4
    %143 = comb.and bin %valid_2_13, %dirty_2_13 {sv.namehint = "_T_45"} : i1
    %144 = comb.mux bin %143, %c-3_i4, %142 : i4
    %145 = comb.and bin %valid_2_14, %dirty_2_14 {sv.namehint = "_T_46"} : i1
    %146 = comb.mux bin %145, %c-2_i4, %144 : i4
    %147 = comb.and bin %valid_2_15, %dirty_2_15 {sv.namehint = "_T_47"} : i1
    %148 = comb.or bin %147, %145, %143, %141, %139, %137, %135, %133, %131, %129, %127, %125, %123, %121, %119, %117 : i1
    %149 = comb.mux bin %148, %c-2_i2, %115 : i2
    %150 = comb.mux bin %147, %c-1_i4, %146 : i4
    %151 = comb.and bin %valid_3_0, %dirty_3_0 {sv.namehint = "_T_48"} : i1
    %152 = comb.mux bin %151, %c0_i4, %150 : i4
    %153 = comb.and bin %valid_3_1, %dirty_3_1 {sv.namehint = "_T_49"} : i1
    %154 = comb.mux bin %153, %c1_i4, %152 : i4
    %155 = comb.and bin %valid_3_2, %dirty_3_2 {sv.namehint = "_T_50"} : i1
    %156 = comb.mux bin %155, %c2_i4, %154 : i4
    %157 = comb.and bin %valid_3_3, %dirty_3_3 {sv.namehint = "_T_51"} : i1
    %158 = comb.mux bin %157, %c3_i4, %156 : i4
    %159 = comb.and bin %valid_3_4, %dirty_3_4 {sv.namehint = "_T_52"} : i1
    %160 = comb.mux bin %159, %c4_i4, %158 : i4
    %161 = comb.and bin %valid_3_5, %dirty_3_5 {sv.namehint = "_T_53"} : i1
    %162 = comb.mux bin %161, %c5_i4, %160 : i4
    %163 = comb.and bin %valid_3_6, %dirty_3_6 {sv.namehint = "_T_54"} : i1
    %164 = comb.mux bin %163, %c6_i4, %162 : i4
    %165 = comb.and bin %valid_3_7, %dirty_3_7 {sv.namehint = "_T_55"} : i1
    %166 = comb.mux bin %165, %c7_i4, %164 : i4
    %167 = comb.and bin %valid_3_8, %dirty_3_8 {sv.namehint = "_T_56"} : i1
    %168 = comb.mux bin %167, %c-8_i4, %166 : i4
    %169 = comb.and bin %valid_3_9, %dirty_3_9 {sv.namehint = "_T_57"} : i1
    %170 = comb.mux bin %169, %c-7_i4, %168 : i4
    %171 = comb.and bin %valid_3_10, %dirty_3_10 {sv.namehint = "_T_58"} : i1
    %172 = comb.mux bin %171, %c-6_i4, %170 : i4
    %173 = comb.and bin %valid_3_11, %dirty_3_11 {sv.namehint = "_T_59"} : i1
    %174 = comb.mux bin %173, %c-5_i4, %172 : i4
    %175 = comb.and bin %valid_3_12, %dirty_3_12 {sv.namehint = "_T_60"} : i1
    %176 = comb.mux bin %175, %c-4_i4, %174 : i4
    %177 = comb.and bin %valid_3_13, %dirty_3_13 {sv.namehint = "_T_61"} : i1
    %178 = comb.mux bin %177, %c-3_i4, %176 : i4
    %179 = comb.and bin %valid_3_14, %dirty_3_14 {sv.namehint = "_T_62"} : i1
    %180 = comb.mux bin %179, %c-2_i4, %178 : i4
    %181 = comb.and bin %valid_3_15, %dirty_3_15 {sv.namehint = "_T_63"} : i1
    %182 = comb.or bin %181, %179, %177, %175, %173, %171, %169, %167, %165, %163, %161, %159, %157, %155, %153, %151 : i1
    %183 = comb.mux bin %182, %c-1_i2, %149 {sv.namehint = "flush_way"} : i2
    %184 = comb.mux bin %181, %c-1_i4, %180 {sv.namehint = "flush_idx"} : i4
    %185 = comb.or bin %181, %179, %177, %175, %173, %171, %169, %167, %165, %163, %161, %159, %157, %155, %153, %151, %147, %145, %143, %141, %139, %137, %135, %133, %131, %129, %127, %125, %123, %121, %119, %117, %113, %111, %109, %107, %105, %103, %101, %99, %97, %95, %93, %91, %89, %87, %85, %83, %81, %79, %77, %75, %73, %71, %69, %67, %65, %63, %61, %59, %57, %55, %53 : i1
    %186 = comb.xor %185, %true : i1
    %187 = comb.and %186, %52 {sv.namehint = "flush_done"} : i1
    %188 = comb.mux bin %3, %42, %matchWay_r {sv.namehint = "cur_way"} : i2
    %189 = comb.extract %6 from 4 {sv.namehint = "cur_ram_addr"} : (i32) -> i6
    %190 = comb.extract %offset from 1 {sv.namehint = "cur_axi_addr_lo"} : (i3) -> i2
    %191 = comb.mux bin %flush_r, %184, %7 : i4
    %192 = comb.concat %191, %190 {sv.namehint = "cur_axi_addr"} : i4, i2
    %193 = comb.extract %io_dcRW_dc_mode from 0 : (i5) -> i4
    %194 = comb.extract %mode_r from 0 : (i5) -> i4
    %195 = comb.mux %3, %193, %194 : i4
    %196 = comb.mux bin %3, %io_dcRW_wdata, %wdata_r {sv.namehint = "cur_wdata"} : i64
    %197 = comb.extract %addr_r from 6 {sv.namehint = "pre_blockIdx"} : (i32) -> i4
    %198 = comb.extract %addr_r from 10 {sv.namehint = "pre_tag"} : (i32) -> i22
    %state = seq.firreg %1998 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 1718 : ui64} : i3
    %199 = comb.extract %addr_r from 0 {sv.namehint = "rdata64_hi"} : (i32) -> i4
    %200 = hw.array_create %Ram_bw_3.io_rdata, %Ram_bw_2.io_rdata, %Ram_bw_1.io_rdata, %Ram_bw.io_rdata : i128
    %201 = hw.array_get %200[%matchWay_r] : !hw.array<4xi128>, i2
    %202 = comb.concat %c0_i121, %199, %c0_i3 : i121, i4, i3
    %203 = comb.shru bin %201, %202 {sv.namehint = "rdata64"} : i128
    %204 = comb.extract %203 from 7 {sv.namehint = "_amo_rdata_ans_T_8"} : (i128) -> i1
    %205 = comb.replicate %204 {sv.namehint = "io_dcRW_rdata_hi"} : (i1) -> i56
    %206 = comb.extract %203 from 0 {sv.namehint = "io_dcRW_rdata_lo"} : (i128) -> i8
    %207 = comb.concat %205, %206 {sv.namehint = "_io_dcRW_rdata_T_2"} : i56, i8
    %208 = comb.extract %203 from 15 {sv.namehint = "_amo_rdata_ans_T_5"} : (i128) -> i1
    %209 = comb.replicate %208 {sv.namehint = "io_dcRW_rdata_hi_1"} : (i1) -> i48
    %210 = comb.extract %203 from 0 {sv.namehint = "io_dcRW_rdata_lo_1"} : (i128) -> i16
    %211 = comb.concat %209, %210 {sv.namehint = "_io_dcRW_rdata_T_6"} : i48, i16
    %212 = comb.extract %203 from 31 {sv.namehint = "_amo_rdata_ans_T_2"} : (i128) -> i1
    %213 = comb.replicate %212 {sv.namehint = "io_dcRW_rdata_hi_2"} : (i1) -> i32
    %214 = comb.extract %203 from 0 {sv.namehint = "io_dcRW_rdata_lo_2"} : (i128) -> i32
    %215 = comb.concat %213, %214 {sv.namehint = "_io_dcRW_rdata_T_10"} : i32, i32
    %216 = comb.replicate %212 {sv.namehint = "io_dcRW_rdata_hi_3"} : (i1) -> i32
    %217 = comb.icmp bin eq %mode_r, %c4_i5 {sv.namehint = "_io_dcRW_rdata_T_15"} : i5
    %218 = comb.mux bin %217, %207, %c0_i64 {sv.namehint = "_io_dcRW_rdata_T_16"} : i64
    %219 = comb.icmp bin eq %mode_r, %c-12_i5 {sv.namehint = "_io_dcRW_rdata_T_17"} : i5
    %220 = comb.concat %c0_i56, %206 : i56, i8
    %221 = comb.mux bin %219, %220, %218 {sv.namehint = "_io_dcRW_rdata_T_18"} : i64
    %222 = comb.icmp bin eq %mode_r, %c5_i5 {sv.namehint = "_io_dcRW_rdata_T_19"} : i5
    %223 = comb.mux bin %222, %211, %221 {sv.namehint = "_io_dcRW_rdata_T_20"} : i64
    %224 = comb.icmp bin eq %mode_r, %c-11_i5 {sv.namehint = "_io_dcRW_rdata_T_21"} : i5
    %225 = comb.concat %c0_i48, %210 : i48, i16
    %226 = comb.mux bin %224, %225, %223 {sv.namehint = "_io_dcRW_rdata_T_22"} : i64
    %227 = comb.icmp bin eq %mode_r, %c6_i5 {sv.namehint = "_io_dcRW_rdata_T_23"} : i5
    %228 = comb.mux bin %227, %215, %226 {sv.namehint = "_io_dcRW_rdata_T_24"} : i64
    %229 = comb.icmp bin eq %mode_r, %c-10_i5 {sv.namehint = "_io_dcRW_rdata_T_25"} : i5
    %230 = comb.concat %c0_i32, %214 : i32, i32
    %231 = comb.mux bin %229, %230, %228 {sv.namehint = "_io_dcRW_rdata_T_26"} : i64
    %232 = comb.icmp bin eq %mode_r, %c7_i5 {sv.namehint = "_io_dcRW_rdata_T_27"} : i5
    %233 = comb.extract %203 from 0 : (i128) -> i64
    %234 = comb.mux %232, %233, %231 : i64
    %235 = comb.icmp bin eq %mode_r, %c14_i5 {sv.namehint = "_io_dcRW_rdata_T_29"} : i5
    %236 = comb.concat %216, %214 : i32, i32
    %237 = comb.mux %235, %236, %234 : i64
    %238 = comb.icmp bin eq %mode_r, %c15_i5 {sv.namehint = "_io_dcRW_rdata_T_31"} : i5
    %239 = comb.extract %203 from 0 : (i128) -> i64
    %240 = comb.mux %238, %239, %237 : i64
    %241 = comb.extract %195 from 2 {sv.namehint = "cur_mode_sl"} : (i4) -> i2
    %242 = comb.extract %195 from 3 {sv.namehint = "cur_mode_s"} : (i4) -> i1
    %243 = comb.extract %mode_r from 0 {sv.namehint = "_amo_wdata_T"} : (i5) -> i2
    %244 = comb.extract %203 from 0 {sv.namehint = "_amo_rdata_ans_T"} : (i128) -> i64
    %245 = comb.replicate %212 {sv.namehint = "amo_rdata_ans_hi"} : (i1) -> i32
    %246 = comb.concat %245, %214 {sv.namehint = "_amo_rdata_ans_T_3"} : i32, i32
    %247 = comb.replicate %208 {sv.namehint = "amo_rdata_ans_hi_1"} : (i1) -> i48
    %248 = comb.concat %247, %210 {sv.namehint = "_amo_rdata_ans_T_6"} : i48, i16
    %249 = comb.replicate %204 {sv.namehint = "amo_rdata_ans_hi_2"} : (i1) -> i56
    %250 = comb.concat %249, %206 {sv.namehint = "_amo_rdata_ans_T_9"} : i56, i8
    %251 = comb.icmp bin eq %243, %c-2_i2 {sv.namehint = "_amo_rdata_ans_T_10"} : i2
    %252 = comb.mux bin %251, %246, %244 {sv.namehint = "_amo_rdata_ans_T_11"} : i64
    %253 = comb.icmp bin eq %243, %c1_i2 {sv.namehint = "_amo_rdata_ans_T_12"} : i2
    %254 = comb.mux bin %253, %248, %252 {sv.namehint = "_amo_rdata_ans_T_13"} : i64
    %255 = comb.icmp bin ne %243, %c0_i2 : i2
    %256 = comb.mux bin %255, %254, %250 {sv.namehint = "amo_rdata"} : i64
    %257 = comb.extract %wdata_r from 31 {sv.namehint = "_amo_imm_ans_T_2"} : (i64) -> i1
    %258 = comb.replicate %257 {sv.namehint = "amo_imm_ans_hi"} : (i1) -> i32
    %259 = comb.extract %wdata_r from 0 {sv.namehint = "amo_imm_ans_lo"} : (i64) -> i32
    %260 = comb.concat %258, %259 {sv.namehint = "_amo_imm_ans_T_3"} : i32, i32
    %261 = comb.extract %wdata_r from 15 {sv.namehint = "_amo_imm_ans_T_5"} : (i64) -> i1
    %262 = comb.replicate %261 {sv.namehint = "amo_imm_ans_hi_1"} : (i1) -> i48
    %263 = comb.extract %wdata_r from 0 {sv.namehint = "amo_imm_ans_lo_1"} : (i64) -> i16
    %264 = comb.concat %262, %263 {sv.namehint = "_amo_imm_ans_T_6"} : i48, i16
    %265 = comb.extract %wdata_r from 7 {sv.namehint = "_amo_imm_ans_T_8"} : (i64) -> i1
    %266 = comb.replicate %265 {sv.namehint = "amo_imm_ans_hi_2"} : (i1) -> i56
    %267 = comb.extract %wdata_r from 0 {sv.namehint = "amo_imm_ans_lo_2"} : (i64) -> i8
    %268 = comb.concat %266, %267 {sv.namehint = "_amo_imm_ans_T_9"} : i56, i8
    %269 = comb.icmp bin eq %243, %c-2_i2 {sv.namehint = "_amo_imm_ans_T_10"} : i2
    %270 = comb.mux bin %269, %260, %wdata_r {sv.namehint = "_amo_imm_ans_T_11"} : i64
    %271 = comb.icmp bin eq %243, %c1_i2 {sv.namehint = "_amo_imm_ans_T_12"} : i2
    %272 = comb.mux bin %271, %264, %270 {sv.namehint = "_amo_imm_ans_T_13"} : i64
    %273 = comb.mux bin %255, %272, %268 {sv.namehint = "amo_imm"} : i64
    %274 = comb.add %273, %256 {sv.namehint = "_amo_alu_T_1"} : i64
    %275 = comb.xor bin %273, %256 {sv.namehint = "_amo_alu_T_2"} : i64
    %276 = comb.and bin %273, %256 {sv.namehint = "_amo_alu_T_3"} : i64
    %277 = comb.or bin %273, %256 {sv.namehint = "_amo_alu_T_4"} : i64
    %278 = comb.icmp bin sgt %273, %256 {sv.namehint = "_amo_alu_T_7"} : i64
    %279 = comb.mux bin %278, %256, %273 {sv.namehint = "_amo_alu_T_8"} : i64
    %280 = comb.icmp bin sgt %273, %256 {sv.namehint = "_amo_alu_T_11"} : i64
    %281 = comb.mux bin %280, %273, %256 {sv.namehint = "_amo_alu_T_12"} : i64
    %282 = comb.icmp bin ugt %273, %256 {sv.namehint = "_amo_alu_T_15"} : i64
    %283 = comb.mux bin %282, %273, %256 {sv.namehint = "_amo_alu_T_16"} : i64
    %284 = comb.icmp bin eq %amo_r, %c1_i5 {sv.namehint = "_amo_alu_T_17"} : i5
    %285 = comb.mux bin %284, %273, %c0_i64 {sv.namehint = "_amo_alu_T_18"} : i64
    %286 = comb.icmp bin eq %amo_r, %c0_i5 {sv.namehint = "_amo_alu_T_19"} : i5
    %287 = comb.mux bin %286, %274, %285 {sv.namehint = "_amo_alu_T_20"} : i64
    %288 = comb.icmp bin eq %amo_r, %c4_i5 {sv.namehint = "_amo_alu_T_21"} : i5
    %289 = comb.mux bin %288, %275, %287 {sv.namehint = "_amo_alu_T_22"} : i64
    %290 = comb.icmp bin eq %amo_r, %c12_i5 {sv.namehint = "_amo_alu_T_23"} : i5
    %291 = comb.mux bin %290, %276, %289 {sv.namehint = "_amo_alu_T_24"} : i64
    %292 = comb.icmp bin eq %amo_r, %c8_i5 {sv.namehint = "_amo_alu_T_25"} : i5
    %293 = comb.mux bin %292, %277, %291 {sv.namehint = "_amo_alu_T_26"} : i64
    %294 = comb.icmp bin eq %amo_r, %c-16_i5 {sv.namehint = "_amo_alu_T_27"} : i5
    %295 = comb.mux bin %294, %279, %293 {sv.namehint = "_amo_alu_T_28"} : i64
    %296 = comb.icmp bin eq %amo_r, %c-12_i5 {sv.namehint = "_amo_alu_T_29"} : i5
    %297 = comb.mux bin %296, %281, %295 {sv.namehint = "_amo_alu_T_30"} : i64
    %298 = comb.icmp bin eq %amo_r, %c-4_i5 {sv.namehint = "_amo_alu_T_33"} : i5
    %299 = comb.mux bin %298, %283, %297 {sv.namehint = "amo_alu"} : i64
    %300 = comb.extract %299 from 0 {sv.namehint = "amo_wdata_ans_lo"} : (i64) -> i32
    %301 = comb.concat %c0_i32, %300 {sv.namehint = "_amo_wdata_ans_T_1"} : i32, i32
    %302 = comb.extract %299 from 0 {sv.namehint = "amo_wdata_ans_lo_1"} : (i64) -> i16
    %303 = comb.concat %c0_i48, %302 {sv.namehint = "_amo_wdata_ans_T_2"} : i48, i16
    %304 = comb.extract %299 from 0 {sv.namehint = "amo_wdata_ans_lo_2"} : (i64) -> i8
    %305 = comb.concat %c0_i56, %304 {sv.namehint = "_amo_wdata_ans_T_3"} : i56, i8
    %306 = comb.icmp bin eq %243, %c-2_i2 {sv.namehint = "_amo_wdata_ans_T_4"} : i2
    %307 = comb.mux bin %306, %301, %299 {sv.namehint = "_amo_wdata_ans_T_5"} : i64
    %308 = comb.icmp bin eq %243, %c1_i2 {sv.namehint = "_amo_wdata_ans_T_6"} : i2
    %309 = comb.mux bin %308, %303, %307 {sv.namehint = "_amo_wdata_ans_T_7"} : i64
    %310 = comb.mux bin %255, %309, %305 {sv.namehint = "amo_wdata_ans"} : i64
    %311 = comb.extract %6 from 0 {sv.namehint = "amo_wdata_hi"} : (i32) -> i4
    %312 = comb.concat %c0_i127, %310 : i127, i64
    %313 = comb.concat %c0_i184, %311, %c0_i3 : i184, i4, i3
    %314 = comb.shl bin %312, %313 {sv.namehint = "amo_wdata"} : i191
    %315 = comb.concat %c0_i127, %196 : i127, i64
    %316 = comb.concat %c0_i184, %311, %c0_i3 : i184, i4, i3
    %317 = comb.shl bin %315, %316 {sv.namehint = "inp_wdata"} : i191
    %318 = comb.extract %195 from 0 {sv.namehint = "_inp_mask_T"} : (i4) -> i2
    %319 = hw.array_get %0[%318] {sv.namehint = "_inp_mask_T_6"} : !hw.array<4xi128>, i2
    %320 = comb.concat %c0_i127, %319 : i127, i128
    %321 = comb.concat %c0_i248, %311, %c0_i3 : i248, i4, i3
    %322 = comb.shl bin %320, %321 {sv.namehint = "inp_mask"} : i255
    %323 = comb.icmp bin eq %state, %c0_i3 {sv.namehint = "_T_68"} : i3
    %324 = comb.icmp bin eq %state, %c-3_i3 {sv.namehint = "_T_83"} : i3
    %325 = comb.or bin %323, %324 {sv.namehint = "_data_addr_T_2"} : i1
    %326 = comb.mux bin %325, %189, %192 {sv.namehint = "_data_addr_T_3"} : i6
    %327 = comb.icmp bin eq %188, %c0_i2 : i2
    %328 = comb.mux bin %327, %326, %c0_i6 {sv.namehint = "data_0_addr"} : i6
    %329 = comb.icmp bin eq %188, %c1_i2 : i2
    %330 = comb.mux bin %329, %326, %c0_i6 {sv.namehint = "data_1_addr"} : i6
    %331 = comb.icmp bin eq %188, %c-2_i2 : i2
    %332 = comb.mux bin %331, %326, %c0_i6 {sv.namehint = "data_2_addr"} : i6
    %333 = comb.icmp bin eq %188, %c-1_i2 : i2
    %334 = comb.mux bin %333, %326, %c0_i6 {sv.namehint = "data_3_addr"} : i6
    %335 = comb.or bin %wait_r, %3, %flush_r {sv.namehint = "_data_cen_T_1"} : i1
    %336 = comb.and %327, %335 {sv.namehint = "data_0_cen"} : i1
    %337 = comb.and %329, %335 {sv.namehint = "data_1_cen"} : i1
    %338 = comb.and %331, %335 {sv.namehint = "data_2_cen"} : i1
    %339 = comb.and %333, %335 {sv.namehint = "data_3_cen"} : i1
    %340 = comb.and %327, %1530 {sv.namehint = "data_0_wen"} : i1
    %341 = comb.and %329, %1530 {sv.namehint = "data_1_wen"} : i1
    %342 = comb.and %331, %1530 {sv.namehint = "data_2_wen"} : i1
    %343 = comb.and %333, %1530 {sv.namehint = "data_3_wen"} : i1
    %344 = comb.extract %317 from 0 : (i191) -> i128
    %345 = comb.concat %io_dataAxi_rd_bits_data, %rdatabuf : i64, i64
    %346 = comb.mux %323, %344, %345 : i128
    %347 = comb.extract %314 from 0 : (i191) -> i128
    %348 = comb.mux %324, %347, %346 : i128
    %349 = comb.mux bin %327, %348, %c0_i128 {sv.namehint = "data_0_wdata"} : i128
    %350 = comb.mux bin %329, %348, %c0_i128 {sv.namehint = "data_1_wdata"} : i128
    %351 = comb.mux bin %331, %348, %c0_i128 {sv.namehint = "data_2_wdata"} : i128
    %352 = comb.mux bin %333, %348, %c0_i128 {sv.namehint = "data_3_wdata"} : i128
    %353 = comb.mux bin %327, %1536, %c0_i128 {sv.namehint = "data_0_mask"} : i128
    %354 = comb.mux bin %329, %1536, %c0_i128 {sv.namehint = "data_1_mask"} : i128
    %355 = comb.mux bin %331, %1536, %c0_i128 {sv.namehint = "data_2_mask"} : i128
    %356 = comb.mux bin %333, %1536, %c0_i128 {sv.namehint = "data_3_mask"} : i128
    %357 = comb.or bin %323, %324 {sv.namehint = "_T_66"} : i1
    %358 = comb.and bin %1530, %357 {sv.namehint = "_T_67"} : i1
    %359 = comb.icmp bin eq %7, %c0_i4 : i4
    %360 = comb.and bin %358, %327, %359 : i1
    %361 = comb.or %360, %dirty_0_0 : i1
    %362 = comb.icmp bin eq %7, %c1_i4 : i4
    %363 = comb.and bin %358, %327, %362 : i1
    %364 = comb.or %363, %dirty_0_1 : i1
    %365 = comb.icmp bin eq %7, %c2_i4 : i4
    %366 = comb.and bin %358, %327, %365 : i1
    %367 = comb.or %366, %dirty_0_2 : i1
    %368 = comb.icmp bin eq %7, %c3_i4 : i4
    %369 = comb.and bin %358, %327, %368 : i1
    %370 = comb.or %369, %dirty_0_3 : i1
    %371 = comb.icmp bin eq %7, %c4_i4 : i4
    %372 = comb.and bin %358, %327, %371 : i1
    %373 = comb.or %372, %dirty_0_4 : i1
    %374 = comb.icmp bin eq %7, %c5_i4 : i4
    %375 = comb.and bin %358, %327, %374 : i1
    %376 = comb.or %375, %dirty_0_5 : i1
    %377 = comb.icmp bin eq %7, %c6_i4 : i4
    %378 = comb.and bin %358, %327, %377 : i1
    %379 = comb.or %378, %dirty_0_6 : i1
    %380 = comb.icmp bin eq %7, %c7_i4 : i4
    %381 = comb.and bin %358, %327, %380 : i1
    %382 = comb.or %381, %dirty_0_7 : i1
    %383 = comb.icmp bin eq %7, %c-8_i4 : i4
    %384 = comb.and bin %358, %327, %383 : i1
    %385 = comb.or %384, %dirty_0_8 : i1
    %386 = comb.icmp bin eq %7, %c-7_i4 : i4
    %387 = comb.and bin %358, %327, %386 : i1
    %388 = comb.or %387, %dirty_0_9 : i1
    %389 = comb.icmp bin eq %7, %c-6_i4 : i4
    %390 = comb.and bin %358, %327, %389 : i1
    %391 = comb.or %390, %dirty_0_10 : i1
    %392 = comb.icmp bin eq %7, %c-5_i4 : i4
    %393 = comb.and bin %358, %327, %392 : i1
    %394 = comb.or %393, %dirty_0_11 : i1
    %395 = comb.icmp bin eq %7, %c-4_i4 : i4
    %396 = comb.and bin %358, %327, %395 : i1
    %397 = comb.or %396, %dirty_0_12 : i1
    %398 = comb.icmp bin eq %7, %c-3_i4 : i4
    %399 = comb.and bin %358, %327, %398 : i1
    %400 = comb.or %399, %dirty_0_13 : i1
    %401 = comb.icmp bin eq %7, %c-2_i4 : i4
    %402 = comb.and bin %358, %327, %401 : i1
    %403 = comb.or %402, %dirty_0_14 : i1
    %404 = comb.icmp bin eq %7, %c-1_i4 : i4
    %405 = comb.and bin %358, %327, %404 : i1
    %406 = comb.or %405, %dirty_0_15 : i1
    %407 = comb.and bin %358, %329, %359 : i1
    %408 = comb.or %407, %dirty_1_0 : i1
    %409 = comb.and bin %358, %329, %362 : i1
    %410 = comb.or %409, %dirty_1_1 : i1
    %411 = comb.and bin %358, %329, %365 : i1
    %412 = comb.or %411, %dirty_1_2 : i1
    %413 = comb.and bin %358, %329, %368 : i1
    %414 = comb.or %413, %dirty_1_3 : i1
    %415 = comb.and bin %358, %329, %371 : i1
    %416 = comb.or %415, %dirty_1_4 : i1
    %417 = comb.and bin %358, %329, %374 : i1
    %418 = comb.or %417, %dirty_1_5 : i1
    %419 = comb.and bin %358, %329, %377 : i1
    %420 = comb.or %419, %dirty_1_6 : i1
    %421 = comb.and bin %358, %329, %380 : i1
    %422 = comb.or %421, %dirty_1_7 : i1
    %423 = comb.and bin %358, %329, %383 : i1
    %424 = comb.or %423, %dirty_1_8 : i1
    %425 = comb.and bin %358, %329, %386 : i1
    %426 = comb.or %425, %dirty_1_9 : i1
    %427 = comb.and bin %358, %329, %389 : i1
    %428 = comb.or %427, %dirty_1_10 : i1
    %429 = comb.and bin %358, %329, %392 : i1
    %430 = comb.or %429, %dirty_1_11 : i1
    %431 = comb.and bin %358, %329, %395 : i1
    %432 = comb.or %431, %dirty_1_12 : i1
    %433 = comb.and bin %358, %329, %398 : i1
    %434 = comb.or %433, %dirty_1_13 : i1
    %435 = comb.and bin %358, %329, %401 : i1
    %436 = comb.or %435, %dirty_1_14 : i1
    %437 = comb.and bin %358, %329, %404 : i1
    %438 = comb.or %437, %dirty_1_15 : i1
    %439 = comb.and bin %358, %331, %359 : i1
    %440 = comb.or %439, %dirty_2_0 : i1
    %441 = comb.and bin %358, %331, %362 : i1
    %442 = comb.or %441, %dirty_2_1 : i1
    %443 = comb.and bin %358, %331, %365 : i1
    %444 = comb.or %443, %dirty_2_2 : i1
    %445 = comb.and bin %358, %331, %368 : i1
    %446 = comb.or %445, %dirty_2_3 : i1
    %447 = comb.and bin %358, %331, %371 : i1
    %448 = comb.or %447, %dirty_2_4 : i1
    %449 = comb.and bin %358, %331, %374 : i1
    %450 = comb.or %449, %dirty_2_5 : i1
    %451 = comb.and bin %358, %331, %377 : i1
    %452 = comb.or %451, %dirty_2_6 : i1
    %453 = comb.and bin %358, %331, %380 : i1
    %454 = comb.or %453, %dirty_2_7 : i1
    %455 = comb.and bin %358, %331, %383 : i1
    %456 = comb.or %455, %dirty_2_8 : i1
    %457 = comb.and bin %358, %331, %386 : i1
    %458 = comb.or %457, %dirty_2_9 : i1
    %459 = comb.and bin %358, %331, %389 : i1
    %460 = comb.or %459, %dirty_2_10 : i1
    %461 = comb.and bin %358, %331, %392 : i1
    %462 = comb.or %461, %dirty_2_11 : i1
    %463 = comb.and bin %358, %331, %395 : i1
    %464 = comb.or %463, %dirty_2_12 : i1
    %465 = comb.and bin %358, %331, %398 : i1
    %466 = comb.or %465, %dirty_2_13 : i1
    %467 = comb.and bin %358, %331, %401 : i1
    %468 = comb.or %467, %dirty_2_14 : i1
    %469 = comb.and bin %358, %331, %404 : i1
    %470 = comb.or %469, %dirty_2_15 : i1
    %471 = comb.and bin %358, %333, %359 : i1
    %472 = comb.or %471, %dirty_3_0 : i1
    %473 = comb.and bin %358, %333, %362 : i1
    %474 = comb.or %473, %dirty_3_1 : i1
    %475 = comb.and bin %358, %333, %365 : i1
    %476 = comb.or %475, %dirty_3_2 : i1
    %477 = comb.and bin %358, %333, %368 : i1
    %478 = comb.or %477, %dirty_3_3 : i1
    %479 = comb.and bin %358, %333, %371 : i1
    %480 = comb.or %479, %dirty_3_4 : i1
    %481 = comb.and bin %358, %333, %374 : i1
    %482 = comb.or %481, %dirty_3_5 : i1
    %483 = comb.and bin %358, %333, %377 : i1
    %484 = comb.or %483, %dirty_3_6 : i1
    %485 = comb.and bin %358, %333, %380 : i1
    %486 = comb.or %485, %dirty_3_7 : i1
    %487 = comb.and bin %358, %333, %383 : i1
    %488 = comb.or %487, %dirty_3_8 : i1
    %489 = comb.and bin %358, %333, %386 : i1
    %490 = comb.or %489, %dirty_3_9 : i1
    %491 = comb.and bin %358, %333, %389 : i1
    %492 = comb.or %491, %dirty_3_10 : i1
    %493 = comb.and bin %358, %333, %392 : i1
    %494 = comb.or %493, %dirty_3_11 : i1
    %495 = comb.and bin %358, %333, %395 : i1
    %496 = comb.or %495, %dirty_3_12 : i1
    %497 = comb.and bin %358, %333, %398 : i1
    %498 = comb.or %497, %dirty_3_13 : i1
    %499 = comb.and bin %358, %333, %401 : i1
    %500 = comb.or %499, %dirty_3_14 : i1
    %501 = comb.and bin %358, %333, %404 : i1
    %502 = comb.or %501, %dirty_3_15 : i1
    %axiRaddrEn = seq.firreg %613 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1721 : ui64} : i1
    %503 = comb.and bin %6, %c-64_i32 {sv.namehint = "axiRaddr"} : i32
    %axiRdataEn = seq.firreg %630 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1722 : ui64} : i1
    %axiWaddrEn = seq.firreg %2005 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1723 : ui64} : i1
    %504 = hw.array_create %tag_3_0, %tag_2_0, %tag_1_0, %tag_0_0 : i22
    %505 = hw.array_get %504[%matchWay_r] : !hw.array<4xi22>, i2
    %506 = hw.array_create %tag_3_1, %tag_2_1, %tag_1_1, %tag_0_1 : i22
    %507 = hw.array_get %506[%matchWay_r] : !hw.array<4xi22>, i2
    %508 = hw.array_create %tag_3_2, %tag_2_2, %tag_1_2, %tag_0_2 : i22
    %509 = hw.array_get %508[%matchWay_r] : !hw.array<4xi22>, i2
    %510 = hw.array_create %tag_3_3, %tag_2_3, %tag_1_3, %tag_0_3 : i22
    %511 = hw.array_get %510[%matchWay_r] : !hw.array<4xi22>, i2
    %512 = hw.array_create %tag_3_4, %tag_2_4, %tag_1_4, %tag_0_4 : i22
    %513 = hw.array_get %512[%matchWay_r] : !hw.array<4xi22>, i2
    %514 = hw.array_create %tag_3_5, %tag_2_5, %tag_1_5, %tag_0_5 : i22
    %515 = hw.array_get %514[%matchWay_r] : !hw.array<4xi22>, i2
    %516 = hw.array_create %tag_3_6, %tag_2_6, %tag_1_6, %tag_0_6 : i22
    %517 = hw.array_get %516[%matchWay_r] : !hw.array<4xi22>, i2
    %518 = hw.array_create %tag_3_7, %tag_2_7, %tag_1_7, %tag_0_7 : i22
    %519 = hw.array_get %518[%matchWay_r] : !hw.array<4xi22>, i2
    %520 = hw.array_create %tag_3_8, %tag_2_8, %tag_1_8, %tag_0_8 : i22
    %521 = hw.array_get %520[%matchWay_r] : !hw.array<4xi22>, i2
    %522 = hw.array_create %tag_3_9, %tag_2_9, %tag_1_9, %tag_0_9 : i22
    %523 = hw.array_get %522[%matchWay_r] : !hw.array<4xi22>, i2
    %524 = hw.array_create %tag_3_10, %tag_2_10, %tag_1_10, %tag_0_10 : i22
    %525 = hw.array_get %524[%matchWay_r] : !hw.array<4xi22>, i2
    %526 = hw.array_create %tag_3_11, %tag_2_11, %tag_1_11, %tag_0_11 : i22
    %527 = hw.array_get %526[%matchWay_r] : !hw.array<4xi22>, i2
    %528 = hw.array_create %tag_3_12, %tag_2_12, %tag_1_12, %tag_0_12 : i22
    %529 = hw.array_get %528[%matchWay_r] : !hw.array<4xi22>, i2
    %530 = hw.array_create %tag_3_13, %tag_2_13, %tag_1_13, %tag_0_13 : i22
    %531 = hw.array_get %530[%matchWay_r] : !hw.array<4xi22>, i2
    %532 = hw.array_create %tag_3_14, %tag_2_14, %tag_1_14, %tag_0_14 : i22
    %533 = hw.array_get %532[%matchWay_r] : !hw.array<4xi22>, i2
    %534 = hw.array_create %tag_3_15, %tag_2_15, %tag_1_15, %tag_0_15 : i22
    %535 = hw.array_get %534[%matchWay_r] : !hw.array<4xi22>, i2
    %536 = hw.array_create %535, %533, %531, %529, %527, %525, %523, %521, %519, %517, %515, %513, %511, %509, %507, %505 : i22
    %537 = hw.array_get %536[%blockIdx_r] : !hw.array<16xi22>, i4
    %538 = comb.concat %537, %blockIdx_r, %c0_i6 {sv.namehint = "axiWaddr"} : i22, i4, i6
    %539 = comb.extract %offset from 0 {sv.namehint = "_T_78"} : (i3) -> i1
    %540 = comb.extract %201 from 64 {sv.namehint = "_axiWdata_T_1"} : (i128) -> i64
    %541 = comb.extract %201 from 0 {sv.namehint = "_axiWdata_T_2"} : (i128) -> i64
    %542 = comb.mux bin %539, %540, %541 {sv.namehint = "axiWdata"} : i64
    %axiWdataEn = seq.firreg %1058 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1724 : ui64} : i1
    %543 = comb.icmp bin eq %offset, %c-1_i3 {sv.namehint = ".io_dataAxi_wd_bits_last.output"} : i3
    %544 = comb.or bin %flush_r, %io_flush {sv.namehint = "_T_69"} : i1
    %545 = comb.xor bin %3, %true {sv.namehint = "_T_70"} : i1
    %546 = comb.and bin %545, %4 {sv.namehint = "_T_72"} : i1
    %547 = comb.icmp bin eq %241, %c-1_i2 {sv.namehint = "_T_73"} : i2
    %548 = comb.mux bin %547, %c-3_i3, %state : i3
    %549 = comb.xor %547, %true : i1
    %550 = comb.or bin %544, %546 : i1
    %551 = comb.xor %550, %true : i1
    %552 = comb.and %551, %34, %549, %242 : i1
    %553 = comb.extract %322 from 0 : (i255) -> i128
    %554 = comb.xor %34, %true : i1
    %555 = comb.or %550, %554, %547 : i1
    %556 = comb.mux bin %555, %c-1_i128, %553 : i128
    %557 = hw.array_create %dirty_3_0, %dirty_2_0, %dirty_1_0, %dirty_0_0 : i1
    %558 = hw.array_get %557[%41] : !hw.array<4xi1>, i2
    %559 = hw.array_create %dirty_3_1, %dirty_2_1, %dirty_1_1, %dirty_0_1 : i1
    %560 = hw.array_get %559[%41] : !hw.array<4xi1>, i2
    %561 = hw.array_create %dirty_3_2, %dirty_2_2, %dirty_1_2, %dirty_0_2 : i1
    %562 = hw.array_get %561[%41] : !hw.array<4xi1>, i2
    %563 = hw.array_create %dirty_3_3, %dirty_2_3, %dirty_1_3, %dirty_0_3 : i1
    %564 = hw.array_get %563[%41] : !hw.array<4xi1>, i2
    %565 = hw.array_create %dirty_3_4, %dirty_2_4, %dirty_1_4, %dirty_0_4 : i1
    %566 = hw.array_get %565[%41] : !hw.array<4xi1>, i2
    %567 = hw.array_create %dirty_3_5, %dirty_2_5, %dirty_1_5, %dirty_0_5 : i1
    %568 = hw.array_get %567[%41] : !hw.array<4xi1>, i2
    %569 = hw.array_create %dirty_3_6, %dirty_2_6, %dirty_1_6, %dirty_0_6 : i1
    %570 = hw.array_get %569[%41] : !hw.array<4xi1>, i2
    %571 = hw.array_create %dirty_3_7, %dirty_2_7, %dirty_1_7, %dirty_0_7 : i1
    %572 = hw.array_get %571[%41] : !hw.array<4xi1>, i2
    %573 = hw.array_create %dirty_3_8, %dirty_2_8, %dirty_1_8, %dirty_0_8 : i1
    %574 = hw.array_get %573[%41] : !hw.array<4xi1>, i2
    %575 = hw.array_create %dirty_3_9, %dirty_2_9, %dirty_1_9, %dirty_0_9 : i1
    %576 = hw.array_get %575[%41] : !hw.array<4xi1>, i2
    %577 = hw.array_create %dirty_3_10, %dirty_2_10, %dirty_1_10, %dirty_0_10 : i1
    %578 = hw.array_get %577[%41] : !hw.array<4xi1>, i2
    %579 = hw.array_create %dirty_3_11, %dirty_2_11, %dirty_1_11, %dirty_0_11 : i1
    %580 = hw.array_get %579[%41] : !hw.array<4xi1>, i2
    %581 = hw.array_create %dirty_3_12, %dirty_2_12, %dirty_1_12, %dirty_0_12 : i1
    %582 = hw.array_get %581[%41] : !hw.array<4xi1>, i2
    %583 = hw.array_create %dirty_3_13, %dirty_2_13, %dirty_1_13, %dirty_0_13 : i1
    %584 = hw.array_get %583[%41] : !hw.array<4xi1>, i2
    %585 = hw.array_create %dirty_3_14, %dirty_2_14, %dirty_1_14, %dirty_0_14 : i1
    %586 = hw.array_get %585[%41] : !hw.array<4xi1>, i2
    %587 = hw.array_create %dirty_3_15, %dirty_2_15, %dirty_1_15, %dirty_0_15 : i1
    %588 = hw.array_get %587[%41] : !hw.array<4xi1>, i2
    %589 = hw.array_create %588, %586, %584, %582, %580, %578, %576, %574, %572, %570, %568, %566, %564, %562, %560, %558 : i1
    %590 = hw.array_get %589[%7] : !hw.array<16xi1>, i4
    %591 = comb.or bin %544, %546, %34 : i1
    %592 = comb.xor %591, %true : i1
    %593 = comb.and %592, %590 : i1
    %594 = comb.or %593, %axiWaddrEn : i1
    %595 = comb.concat %false, %590, %true : i1, i1, i1
    %596 = comb.mux bin %34, %548, %595 : i3
    %597 = comb.mux bin %546, %state, %596 : i3
    %598 = comb.mux bin %544, %c-2_i3, %597 : i3
    %599 = comb.or bin %544, %546, %34, %590 : i1
    %600 = comb.xor %599, %true : i1
    %601 = comb.or %600, %axiRaddrEn : i1
    %602 = comb.xor %550, %true : i1
    %603 = comb.and %323, %602, %34 : i1
    %604 = comb.xor %34, %true : i1
    %605 = comb.or %604, %547 : i1
    %606 = comb.mux bin %550, %wait_r, %605 : i1
    %607 = comb.icmp bin eq %state, %c1_i3 {sv.namehint = "_T_74"} : i3
    %608 = comb.and bin %axiRaddrEn, %io_dataAxi_ra_ready {sv.namehint = "_T_75"} : i1
    %609 = comb.mux bin %608, %c2_i3, %state : i3
    %610 = comb.and bin %607, %608 : i1
    %611 = comb.xor %610, %true : i1
    %612 = comb.and %611, %axiRaddrEn : i1
    %613 = comb.mux bin %323, %601, %612 : i1
    %614 = comb.or %608, %axiRdataEn : i1
    %615 = comb.icmp bin eq %state, %c2_i3 {sv.namehint = "_T_76"} : i3
    %616 = comb.and bin %axiRdataEn, %io_dataAxi_rd_valid {sv.namehint = "_T_77"} : i1
    %617 = comb.add %offset, %c1_i3 {sv.namehint = "_offset_T_1"} : i3
    %618 = comb.mux bin %616, %617, %offset : i3
    %619 = comb.and %616, %539 : i1
    %620 = comb.and bin %615, %616 : i1
    %621 = comb.xor %620, %true : i1
    %622 = comb.or bin %323, %607 : i1
    %623 = comb.or %622, %621, %539 : i1
    %624 = comb.mux bin %623, %rdatabuf, %io_dataAxi_rd_bits_data : i64
    %625 = comb.and bin %616, %io_dataAxi_rd_bits_last : i1
    %626 = comb.and bin %615, %625 : i1
    %627 = comb.xor %626, %true : i1
    %628 = comb.and %627, %axiRdataEn : i1
    %629 = comb.mux bin %607, %614, %628 : i1
    %630 = comb.mux bin %323, %axiRdataEn, %629 : i1
    %631 = comb.icmp bin eq %matchWay_r, %c0_i2 : i2
    %632 = comb.icmp bin eq %197, %c0_i4 : i4
    %633 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %632 : i1
    %634 = comb.and bin %615, %633 : i1
    %635 = comb.xor %634, %true : i1
    %636 = comb.or %622, %635 : i1
    %637 = comb.mux bin %636, %tag_0_0, %198 : i22
    %638 = comb.icmp bin eq %197, %c1_i4 : i4
    %639 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %638 : i1
    %640 = comb.and bin %615, %639 : i1
    %641 = comb.xor %640, %true : i1
    %642 = comb.or %622, %641 : i1
    %643 = comb.mux bin %642, %tag_0_1, %198 : i22
    %644 = comb.icmp bin eq %197, %c2_i4 : i4
    %645 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %644 : i1
    %646 = comb.and bin %615, %645 : i1
    %647 = comb.xor %646, %true : i1
    %648 = comb.or %622, %647 : i1
    %649 = comb.mux bin %648, %tag_0_2, %198 : i22
    %650 = comb.icmp bin eq %197, %c3_i4 : i4
    %651 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %650 : i1
    %652 = comb.and bin %615, %651 : i1
    %653 = comb.xor %652, %true : i1
    %654 = comb.or %622, %653 : i1
    %655 = comb.mux bin %654, %tag_0_3, %198 : i22
    %656 = comb.icmp bin eq %197, %c4_i4 : i4
    %657 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %656 : i1
    %658 = comb.and bin %615, %657 : i1
    %659 = comb.xor %658, %true : i1
    %660 = comb.or %622, %659 : i1
    %661 = comb.mux bin %660, %tag_0_4, %198 : i22
    %662 = comb.icmp bin eq %197, %c5_i4 : i4
    %663 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %662 : i1
    %664 = comb.and bin %615, %663 : i1
    %665 = comb.xor %664, %true : i1
    %666 = comb.or %622, %665 : i1
    %667 = comb.mux bin %666, %tag_0_5, %198 : i22
    %668 = comb.icmp bin eq %197, %c6_i4 : i4
    %669 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %668 : i1
    %670 = comb.and bin %615, %669 : i1
    %671 = comb.xor %670, %true : i1
    %672 = comb.or %622, %671 : i1
    %673 = comb.mux bin %672, %tag_0_6, %198 : i22
    %674 = comb.icmp bin eq %197, %c7_i4 : i4
    %675 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %674 : i1
    %676 = comb.and bin %615, %675 : i1
    %677 = comb.xor %676, %true : i1
    %678 = comb.or %622, %677 : i1
    %679 = comb.mux bin %678, %tag_0_7, %198 : i22
    %680 = comb.icmp bin eq %197, %c-8_i4 : i4
    %681 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %680 : i1
    %682 = comb.and bin %615, %681 : i1
    %683 = comb.xor %682, %true : i1
    %684 = comb.or %622, %683 : i1
    %685 = comb.mux bin %684, %tag_0_8, %198 : i22
    %686 = comb.icmp bin eq %197, %c-7_i4 : i4
    %687 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %686 : i1
    %688 = comb.and bin %615, %687 : i1
    %689 = comb.xor %688, %true : i1
    %690 = comb.or %622, %689 : i1
    %691 = comb.mux bin %690, %tag_0_9, %198 : i22
    %692 = comb.icmp bin eq %197, %c-6_i4 : i4
    %693 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %692 : i1
    %694 = comb.and bin %615, %693 : i1
    %695 = comb.xor %694, %true : i1
    %696 = comb.or %622, %695 : i1
    %697 = comb.mux bin %696, %tag_0_10, %198 : i22
    %698 = comb.icmp bin eq %197, %c-5_i4 : i4
    %699 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %698 : i1
    %700 = comb.and bin %615, %699 : i1
    %701 = comb.xor %700, %true : i1
    %702 = comb.or %622, %701 : i1
    %703 = comb.mux bin %702, %tag_0_11, %198 : i22
    %704 = comb.icmp bin eq %197, %c-4_i4 : i4
    %705 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %704 : i1
    %706 = comb.and bin %615, %705 : i1
    %707 = comb.xor %706, %true : i1
    %708 = comb.or %622, %707 : i1
    %709 = comb.mux bin %708, %tag_0_12, %198 : i22
    %710 = comb.icmp bin eq %197, %c-3_i4 : i4
    %711 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %710 : i1
    %712 = comb.and bin %615, %711 : i1
    %713 = comb.xor %712, %true : i1
    %714 = comb.or %622, %713 : i1
    %715 = comb.mux bin %714, %tag_0_13, %198 : i22
    %716 = comb.icmp bin eq %197, %c-2_i4 : i4
    %717 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %716 : i1
    %718 = comb.and bin %615, %717 : i1
    %719 = comb.xor %718, %true : i1
    %720 = comb.or %622, %719 : i1
    %721 = comb.mux bin %720, %tag_0_14, %198 : i22
    %722 = comb.icmp bin eq %197, %c-1_i4 : i4
    %723 = comb.and bin %616, %io_dataAxi_rd_bits_last, %631, %722 : i1
    %724 = comb.and bin %615, %723 : i1
    %725 = comb.xor %724, %true : i1
    %726 = comb.or %622, %725 : i1
    %727 = comb.mux bin %726, %tag_0_15, %198 : i22
    %728 = comb.icmp bin eq %matchWay_r, %c1_i2 : i2
    %729 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %632 : i1
    %730 = comb.and bin %615, %729 : i1
    %731 = comb.xor %730, %true : i1
    %732 = comb.or %622, %731 : i1
    %733 = comb.mux bin %732, %tag_1_0, %198 : i22
    %734 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %638 : i1
    %735 = comb.and bin %615, %734 : i1
    %736 = comb.xor %735, %true : i1
    %737 = comb.or %622, %736 : i1
    %738 = comb.mux bin %737, %tag_1_1, %198 : i22
    %739 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %644 : i1
    %740 = comb.and bin %615, %739 : i1
    %741 = comb.xor %740, %true : i1
    %742 = comb.or %622, %741 : i1
    %743 = comb.mux bin %742, %tag_1_2, %198 : i22
    %744 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %650 : i1
    %745 = comb.and bin %615, %744 : i1
    %746 = comb.xor %745, %true : i1
    %747 = comb.or %622, %746 : i1
    %748 = comb.mux bin %747, %tag_1_3, %198 : i22
    %749 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %656 : i1
    %750 = comb.and bin %615, %749 : i1
    %751 = comb.xor %750, %true : i1
    %752 = comb.or %622, %751 : i1
    %753 = comb.mux bin %752, %tag_1_4, %198 : i22
    %754 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %662 : i1
    %755 = comb.and bin %615, %754 : i1
    %756 = comb.xor %755, %true : i1
    %757 = comb.or %622, %756 : i1
    %758 = comb.mux bin %757, %tag_1_5, %198 : i22
    %759 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %668 : i1
    %760 = comb.and bin %615, %759 : i1
    %761 = comb.xor %760, %true : i1
    %762 = comb.or %622, %761 : i1
    %763 = comb.mux bin %762, %tag_1_6, %198 : i22
    %764 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %674 : i1
    %765 = comb.and bin %615, %764 : i1
    %766 = comb.xor %765, %true : i1
    %767 = comb.or %622, %766 : i1
    %768 = comb.mux bin %767, %tag_1_7, %198 : i22
    %769 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %680 : i1
    %770 = comb.and bin %615, %769 : i1
    %771 = comb.xor %770, %true : i1
    %772 = comb.or %622, %771 : i1
    %773 = comb.mux bin %772, %tag_1_8, %198 : i22
    %774 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %686 : i1
    %775 = comb.and bin %615, %774 : i1
    %776 = comb.xor %775, %true : i1
    %777 = comb.or %622, %776 : i1
    %778 = comb.mux bin %777, %tag_1_9, %198 : i22
    %779 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %692 : i1
    %780 = comb.and bin %615, %779 : i1
    %781 = comb.xor %780, %true : i1
    %782 = comb.or %622, %781 : i1
    %783 = comb.mux bin %782, %tag_1_10, %198 : i22
    %784 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %698 : i1
    %785 = comb.and bin %615, %784 : i1
    %786 = comb.xor %785, %true : i1
    %787 = comb.or %622, %786 : i1
    %788 = comb.mux bin %787, %tag_1_11, %198 : i22
    %789 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %704 : i1
    %790 = comb.and bin %615, %789 : i1
    %791 = comb.xor %790, %true : i1
    %792 = comb.or %622, %791 : i1
    %793 = comb.mux bin %792, %tag_1_12, %198 : i22
    %794 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %710 : i1
    %795 = comb.and bin %615, %794 : i1
    %796 = comb.xor %795, %true : i1
    %797 = comb.or %622, %796 : i1
    %798 = comb.mux bin %797, %tag_1_13, %198 : i22
    %799 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %716 : i1
    %800 = comb.and bin %615, %799 : i1
    %801 = comb.xor %800, %true : i1
    %802 = comb.or %622, %801 : i1
    %803 = comb.mux bin %802, %tag_1_14, %198 : i22
    %804 = comb.and bin %616, %io_dataAxi_rd_bits_last, %728, %722 : i1
    %805 = comb.and bin %615, %804 : i1
    %806 = comb.xor %805, %true : i1
    %807 = comb.or %622, %806 : i1
    %808 = comb.mux bin %807, %tag_1_15, %198 : i22
    %809 = comb.icmp bin eq %matchWay_r, %c-2_i2 : i2
    %810 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %632 : i1
    %811 = comb.and bin %615, %810 : i1
    %812 = comb.xor %811, %true : i1
    %813 = comb.or %622, %812 : i1
    %814 = comb.mux bin %813, %tag_2_0, %198 : i22
    %815 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %638 : i1
    %816 = comb.and bin %615, %815 : i1
    %817 = comb.xor %816, %true : i1
    %818 = comb.or %622, %817 : i1
    %819 = comb.mux bin %818, %tag_2_1, %198 : i22
    %820 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %644 : i1
    %821 = comb.and bin %615, %820 : i1
    %822 = comb.xor %821, %true : i1
    %823 = comb.or %622, %822 : i1
    %824 = comb.mux bin %823, %tag_2_2, %198 : i22
    %825 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %650 : i1
    %826 = comb.and bin %615, %825 : i1
    %827 = comb.xor %826, %true : i1
    %828 = comb.or %622, %827 : i1
    %829 = comb.mux bin %828, %tag_2_3, %198 : i22
    %830 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %656 : i1
    %831 = comb.and bin %615, %830 : i1
    %832 = comb.xor %831, %true : i1
    %833 = comb.or %622, %832 : i1
    %834 = comb.mux bin %833, %tag_2_4, %198 : i22
    %835 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %662 : i1
    %836 = comb.and bin %615, %835 : i1
    %837 = comb.xor %836, %true : i1
    %838 = comb.or %622, %837 : i1
    %839 = comb.mux bin %838, %tag_2_5, %198 : i22
    %840 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %668 : i1
    %841 = comb.and bin %615, %840 : i1
    %842 = comb.xor %841, %true : i1
    %843 = comb.or %622, %842 : i1
    %844 = comb.mux bin %843, %tag_2_6, %198 : i22
    %845 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %674 : i1
    %846 = comb.and bin %615, %845 : i1
    %847 = comb.xor %846, %true : i1
    %848 = comb.or %622, %847 : i1
    %849 = comb.mux bin %848, %tag_2_7, %198 : i22
    %850 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %680 : i1
    %851 = comb.and bin %615, %850 : i1
    %852 = comb.xor %851, %true : i1
    %853 = comb.or %622, %852 : i1
    %854 = comb.mux bin %853, %tag_2_8, %198 : i22
    %855 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %686 : i1
    %856 = comb.and bin %615, %855 : i1
    %857 = comb.xor %856, %true : i1
    %858 = comb.or %622, %857 : i1
    %859 = comb.mux bin %858, %tag_2_9, %198 : i22
    %860 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %692 : i1
    %861 = comb.and bin %615, %860 : i1
    %862 = comb.xor %861, %true : i1
    %863 = comb.or %622, %862 : i1
    %864 = comb.mux bin %863, %tag_2_10, %198 : i22
    %865 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %698 : i1
    %866 = comb.and bin %615, %865 : i1
    %867 = comb.xor %866, %true : i1
    %868 = comb.or %622, %867 : i1
    %869 = comb.mux bin %868, %tag_2_11, %198 : i22
    %870 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %704 : i1
    %871 = comb.and bin %615, %870 : i1
    %872 = comb.xor %871, %true : i1
    %873 = comb.or %622, %872 : i1
    %874 = comb.mux bin %873, %tag_2_12, %198 : i22
    %875 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %710 : i1
    %876 = comb.and bin %615, %875 : i1
    %877 = comb.xor %876, %true : i1
    %878 = comb.or %622, %877 : i1
    %879 = comb.mux bin %878, %tag_2_13, %198 : i22
    %880 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %716 : i1
    %881 = comb.and bin %615, %880 : i1
    %882 = comb.xor %881, %true : i1
    %883 = comb.or %622, %882 : i1
    %884 = comb.mux bin %883, %tag_2_14, %198 : i22
    %885 = comb.and bin %616, %io_dataAxi_rd_bits_last, %809, %722 : i1
    %886 = comb.and bin %615, %885 : i1
    %887 = comb.xor %886, %true : i1
    %888 = comb.or %622, %887 : i1
    %889 = comb.mux bin %888, %tag_2_15, %198 : i22
    %890 = comb.icmp bin eq %matchWay_r, %c-1_i2 : i2
    %891 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %632 : i1
    %892 = comb.and bin %615, %891 : i1
    %893 = comb.xor %892, %true : i1
    %894 = comb.or %622, %893 : i1
    %895 = comb.mux bin %894, %tag_3_0, %198 : i22
    %896 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %638 : i1
    %897 = comb.and bin %615, %896 : i1
    %898 = comb.xor %897, %true : i1
    %899 = comb.or %622, %898 : i1
    %900 = comb.mux bin %899, %tag_3_1, %198 : i22
    %901 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %644 : i1
    %902 = comb.and bin %615, %901 : i1
    %903 = comb.xor %902, %true : i1
    %904 = comb.or %622, %903 : i1
    %905 = comb.mux bin %904, %tag_3_2, %198 : i22
    %906 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %650 : i1
    %907 = comb.and bin %615, %906 : i1
    %908 = comb.xor %907, %true : i1
    %909 = comb.or %622, %908 : i1
    %910 = comb.mux bin %909, %tag_3_3, %198 : i22
    %911 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %656 : i1
    %912 = comb.and bin %615, %911 : i1
    %913 = comb.xor %912, %true : i1
    %914 = comb.or %622, %913 : i1
    %915 = comb.mux bin %914, %tag_3_4, %198 : i22
    %916 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %662 : i1
    %917 = comb.and bin %615, %916 : i1
    %918 = comb.xor %917, %true : i1
    %919 = comb.or %622, %918 : i1
    %920 = comb.mux bin %919, %tag_3_5, %198 : i22
    %921 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %668 : i1
    %922 = comb.and bin %615, %921 : i1
    %923 = comb.xor %922, %true : i1
    %924 = comb.or %622, %923 : i1
    %925 = comb.mux bin %924, %tag_3_6, %198 : i22
    %926 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %674 : i1
    %927 = comb.and bin %615, %926 : i1
    %928 = comb.xor %927, %true : i1
    %929 = comb.or %622, %928 : i1
    %930 = comb.mux bin %929, %tag_3_7, %198 : i22
    %931 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %680 : i1
    %932 = comb.and bin %615, %931 : i1
    %933 = comb.xor %932, %true : i1
    %934 = comb.or %622, %933 : i1
    %935 = comb.mux bin %934, %tag_3_8, %198 : i22
    %936 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %686 : i1
    %937 = comb.and bin %615, %936 : i1
    %938 = comb.xor %937, %true : i1
    %939 = comb.or %622, %938 : i1
    %940 = comb.mux bin %939, %tag_3_9, %198 : i22
    %941 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %692 : i1
    %942 = comb.and bin %615, %941 : i1
    %943 = comb.xor %942, %true : i1
    %944 = comb.or %622, %943 : i1
    %945 = comb.mux bin %944, %tag_3_10, %198 : i22
    %946 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %698 : i1
    %947 = comb.and bin %615, %946 : i1
    %948 = comb.xor %947, %true : i1
    %949 = comb.or %622, %948 : i1
    %950 = comb.mux bin %949, %tag_3_11, %198 : i22
    %951 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %704 : i1
    %952 = comb.and bin %615, %951 : i1
    %953 = comb.xor %952, %true : i1
    %954 = comb.or %622, %953 : i1
    %955 = comb.mux bin %954, %tag_3_12, %198 : i22
    %956 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %710 : i1
    %957 = comb.and bin %615, %956 : i1
    %958 = comb.xor %957, %true : i1
    %959 = comb.or %622, %958 : i1
    %960 = comb.mux bin %959, %tag_3_13, %198 : i22
    %961 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %716 : i1
    %962 = comb.and bin %615, %961 : i1
    %963 = comb.xor %962, %true : i1
    %964 = comb.or %622, %963 : i1
    %965 = comb.mux bin %964, %tag_3_14, %198 : i22
    %966 = comb.and bin %616, %io_dataAxi_rd_bits_last, %890, %722 : i1
    %967 = comb.and bin %615, %966 : i1
    %968 = comb.xor %967, %true : i1
    %969 = comb.or %622, %968 : i1
    %970 = comb.mux bin %969, %tag_3_15, %198 : i22
    %971 = comb.or %633, %valid_0_0 : i1
    %972 = comb.or %639, %valid_0_1 : i1
    %973 = comb.or %645, %valid_0_2 : i1
    %974 = comb.or %651, %valid_0_3 : i1
    %975 = comb.or %657, %valid_0_4 : i1
    %976 = comb.or %663, %valid_0_5 : i1
    %977 = comb.or %669, %valid_0_6 : i1
    %978 = comb.or %675, %valid_0_7 : i1
    %979 = comb.or %681, %valid_0_8 : i1
    %980 = comb.or %687, %valid_0_9 : i1
    %981 = comb.or %693, %valid_0_10 : i1
    %982 = comb.or %699, %valid_0_11 : i1
    %983 = comb.or %705, %valid_0_12 : i1
    %984 = comb.or %711, %valid_0_13 : i1
    %985 = comb.or %717, %valid_0_14 : i1
    %986 = comb.or %723, %valid_0_15 : i1
    %987 = comb.or %729, %valid_1_0 : i1
    %988 = comb.or %734, %valid_1_1 : i1
    %989 = comb.or %739, %valid_1_2 : i1
    %990 = comb.or %744, %valid_1_3 : i1
    %991 = comb.or %749, %valid_1_4 : i1
    %992 = comb.or %754, %valid_1_5 : i1
    %993 = comb.or %759, %valid_1_6 : i1
    %994 = comb.or %764, %valid_1_7 : i1
    %995 = comb.or %769, %valid_1_8 : i1
    %996 = comb.or %774, %valid_1_9 : i1
    %997 = comb.or %779, %valid_1_10 : i1
    %998 = comb.or %784, %valid_1_11 : i1
    %999 = comb.or %789, %valid_1_12 : i1
    %1000 = comb.or %794, %valid_1_13 : i1
    %1001 = comb.or %799, %valid_1_14 : i1
    %1002 = comb.or %804, %valid_1_15 : i1
    %1003 = comb.or %810, %valid_2_0 : i1
    %1004 = comb.or %815, %valid_2_1 : i1
    %1005 = comb.or %820, %valid_2_2 : i1
    %1006 = comb.or %825, %valid_2_3 : i1
    %1007 = comb.or %830, %valid_2_4 : i1
    %1008 = comb.or %835, %valid_2_5 : i1
    %1009 = comb.or %840, %valid_2_6 : i1
    %1010 = comb.or %845, %valid_2_7 : i1
    %1011 = comb.or %850, %valid_2_8 : i1
    %1012 = comb.or %855, %valid_2_9 : i1
    %1013 = comb.or %860, %valid_2_10 : i1
    %1014 = comb.or %865, %valid_2_11 : i1
    %1015 = comb.or %870, %valid_2_12 : i1
    %1016 = comb.or %875, %valid_2_13 : i1
    %1017 = comb.or %880, %valid_2_14 : i1
    %1018 = comb.or %885, %valid_2_15 : i1
    %1019 = comb.or %891, %valid_3_0 : i1
    %1020 = comb.or %896, %valid_3_1 : i1
    %1021 = comb.or %901, %valid_3_2 : i1
    %1022 = comb.or %906, %valid_3_3 : i1
    %1023 = comb.or %911, %valid_3_4 : i1
    %1024 = comb.or %916, %valid_3_5 : i1
    %1025 = comb.or %921, %valid_3_6 : i1
    %1026 = comb.or %926, %valid_3_7 : i1
    %1027 = comb.or %931, %valid_3_8 : i1
    %1028 = comb.or %936, %valid_3_9 : i1
    %1029 = comb.or %941, %valid_3_10 : i1
    %1030 = comb.or %946, %valid_3_11 : i1
    %1031 = comb.or %951, %valid_3_12 : i1
    %1032 = comb.or %956, %valid_3_13 : i1
    %1033 = comb.or %961, %valid_3_14 : i1
    %1034 = comb.or %966, %valid_3_15 : i1
    %1035 = comb.mux bin %625, %c0_i3, %state : i3
    %1036 = comb.icmp bin eq %state, %c3_i3 {sv.namehint = "_T_79"} : i3
    %1037 = comb.and bin %axiWaddrEn, %io_dataAxi_wa_ready {sv.namehint = "_T_80"} : i1
    %1038 = comb.mux bin %1037, %c-4_i3, %state : i3
    %1039 = comb.xor %1037, %true : i1
    %1040 = comb.and %1039, %axiWaddrEn : i1
    %1041 = comb.or %1037, %axiWdataEn : i1
    %1042 = comb.icmp bin eq %state, %c-4_i3 {sv.namehint = "_T_81"} : i3
    %1043 = comb.and bin %axiWdataEn, %io_dataAxi_wd_ready {sv.namehint = "_T_82"} : i1
    %1044 = comb.add %offset, %c1_i3 {sv.namehint = "_offset_T_3"} : i3
    %1045 = comb.and bin %1042, %1043 : i1
    %1046 = comb.mux bin %1045, %1044, %offset : i3
    %1047 = comb.mux bin %1036, %c0_i3, %1046 : i3
    %1048 = comb.mux bin %615, %618, %1047 : i3
    %1049 = comb.mux bin %607, %c0_i3, %1048 : i3
    %1050 = comb.mux bin %323, %offset, %1049 : i3
    %1051 = comb.and bin %1043, %543 : i1
    %1052 = comb.mux bin %1051, %c0_i3, %state : i3
    %1053 = comb.xor bin %1043, %true : i1
    %1054 = comb.mux bin %1042, %1053, %axiWdataEn : i1
    %1055 = comb.mux bin %1036, %1041, %1054 : i1
    %1056 = comb.or bin %607, %615 : i1
    %1057 = comb.or bin %323, %1056 : i1
    %1058 = comb.mux bin %1057, %axiWdataEn, %1055 : i1
    %1059 = comb.icmp bin eq %blockIdx_r, %c0_i4 : i4
    %1060 = comb.and bin %1043, %543, %631, %1059 : i1
    %1061 = comb.xor %1060, %true : i1
    %1062 = comb.and %1061, %valid_0_0 : i1
    %1063 = comb.icmp bin eq %blockIdx_r, %c1_i4 : i4
    %1064 = comb.and bin %1043, %543, %631, %1063 : i1
    %1065 = comb.xor %1064, %true : i1
    %1066 = comb.and %1065, %valid_0_1 : i1
    %1067 = comb.icmp bin eq %blockIdx_r, %c2_i4 : i4
    %1068 = comb.and bin %1043, %543, %631, %1067 : i1
    %1069 = comb.xor %1068, %true : i1
    %1070 = comb.and %1069, %valid_0_2 : i1
    %1071 = comb.icmp bin eq %blockIdx_r, %c3_i4 : i4
    %1072 = comb.and bin %1043, %543, %631, %1071 : i1
    %1073 = comb.xor %1072, %true : i1
    %1074 = comb.and %1073, %valid_0_3 : i1
    %1075 = comb.icmp bin eq %blockIdx_r, %c4_i4 : i4
    %1076 = comb.and bin %1043, %543, %631, %1075 : i1
    %1077 = comb.xor %1076, %true : i1
    %1078 = comb.and %1077, %valid_0_4 : i1
    %1079 = comb.icmp bin eq %blockIdx_r, %c5_i4 : i4
    %1080 = comb.and bin %1043, %543, %631, %1079 : i1
    %1081 = comb.xor %1080, %true : i1
    %1082 = comb.and %1081, %valid_0_5 : i1
    %1083 = comb.icmp bin eq %blockIdx_r, %c6_i4 : i4
    %1084 = comb.and bin %1043, %543, %631, %1083 : i1
    %1085 = comb.xor %1084, %true : i1
    %1086 = comb.and %1085, %valid_0_6 : i1
    %1087 = comb.icmp bin eq %blockIdx_r, %c7_i4 : i4
    %1088 = comb.and bin %1043, %543, %631, %1087 : i1
    %1089 = comb.xor %1088, %true : i1
    %1090 = comb.and %1089, %valid_0_7 : i1
    %1091 = comb.icmp bin eq %blockIdx_r, %c-8_i4 : i4
    %1092 = comb.and bin %1043, %543, %631, %1091 : i1
    %1093 = comb.xor %1092, %true : i1
    %1094 = comb.and %1093, %valid_0_8 : i1
    %1095 = comb.icmp bin eq %blockIdx_r, %c-7_i4 : i4
    %1096 = comb.and bin %1043, %543, %631, %1095 : i1
    %1097 = comb.xor %1096, %true : i1
    %1098 = comb.and %1097, %valid_0_9 : i1
    %1099 = comb.icmp bin eq %blockIdx_r, %c-6_i4 : i4
    %1100 = comb.and bin %1043, %543, %631, %1099 : i1
    %1101 = comb.xor %1100, %true : i1
    %1102 = comb.and %1101, %valid_0_10 : i1
    %1103 = comb.icmp bin eq %blockIdx_r, %c-5_i4 : i4
    %1104 = comb.and bin %1043, %543, %631, %1103 : i1
    %1105 = comb.xor %1104, %true : i1
    %1106 = comb.and %1105, %valid_0_11 : i1
    %1107 = comb.icmp bin eq %blockIdx_r, %c-4_i4 : i4
    %1108 = comb.and bin %1043, %543, %631, %1107 : i1
    %1109 = comb.xor %1108, %true : i1
    %1110 = comb.and %1109, %valid_0_12 : i1
    %1111 = comb.icmp bin eq %blockIdx_r, %c-3_i4 : i4
    %1112 = comb.and bin %1043, %543, %631, %1111 : i1
    %1113 = comb.xor %1112, %true : i1
    %1114 = comb.and %1113, %valid_0_13 : i1
    %1115 = comb.icmp bin eq %blockIdx_r, %c-2_i4 : i4
    %1116 = comb.and bin %1043, %543, %631, %1115 : i1
    %1117 = comb.xor %1116, %true : i1
    %1118 = comb.and %1117, %valid_0_14 : i1
    %1119 = comb.icmp bin eq %blockIdx_r, %c-1_i4 : i4
    %1120 = comb.and bin %1043, %543, %631, %1119 : i1
    %1121 = comb.xor %1120, %true : i1
    %1122 = comb.and %1121, %valid_0_15 : i1
    %1123 = comb.and bin %1043, %543, %728, %1059 : i1
    %1124 = comb.xor %1123, %true : i1
    %1125 = comb.and %1124, %valid_1_0 : i1
    %1126 = comb.and bin %1043, %543, %728, %1063 : i1
    %1127 = comb.xor %1126, %true : i1
    %1128 = comb.and %1127, %valid_1_1 : i1
    %1129 = comb.and bin %1043, %543, %728, %1067 : i1
    %1130 = comb.xor %1129, %true : i1
    %1131 = comb.and %1130, %valid_1_2 : i1
    %1132 = comb.and bin %1043, %543, %728, %1071 : i1
    %1133 = comb.xor %1132, %true : i1
    %1134 = comb.and %1133, %valid_1_3 : i1
    %1135 = comb.and bin %1043, %543, %728, %1075 : i1
    %1136 = comb.xor %1135, %true : i1
    %1137 = comb.and %1136, %valid_1_4 : i1
    %1138 = comb.and bin %1043, %543, %728, %1079 : i1
    %1139 = comb.xor %1138, %true : i1
    %1140 = comb.and %1139, %valid_1_5 : i1
    %1141 = comb.and bin %1043, %543, %728, %1083 : i1
    %1142 = comb.xor %1141, %true : i1
    %1143 = comb.and %1142, %valid_1_6 : i1
    %1144 = comb.and bin %1043, %543, %728, %1087 : i1
    %1145 = comb.xor %1144, %true : i1
    %1146 = comb.and %1145, %valid_1_7 : i1
    %1147 = comb.and bin %1043, %543, %728, %1091 : i1
    %1148 = comb.xor %1147, %true : i1
    %1149 = comb.and %1148, %valid_1_8 : i1
    %1150 = comb.and bin %1043, %543, %728, %1095 : i1
    %1151 = comb.xor %1150, %true : i1
    %1152 = comb.and %1151, %valid_1_9 : i1
    %1153 = comb.and bin %1043, %543, %728, %1099 : i1
    %1154 = comb.xor %1153, %true : i1
    %1155 = comb.and %1154, %valid_1_10 : i1
    %1156 = comb.and bin %1043, %543, %728, %1103 : i1
    %1157 = comb.xor %1156, %true : i1
    %1158 = comb.and %1157, %valid_1_11 : i1
    %1159 = comb.and bin %1043, %543, %728, %1107 : i1
    %1160 = comb.xor %1159, %true : i1
    %1161 = comb.and %1160, %valid_1_12 : i1
    %1162 = comb.and bin %1043, %543, %728, %1111 : i1
    %1163 = comb.xor %1162, %true : i1
    %1164 = comb.and %1163, %valid_1_13 : i1
    %1165 = comb.and bin %1043, %543, %728, %1115 : i1
    %1166 = comb.xor %1165, %true : i1
    %1167 = comb.and %1166, %valid_1_14 : i1
    %1168 = comb.and bin %1043, %543, %728, %1119 : i1
    %1169 = comb.xor %1168, %true : i1
    %1170 = comb.and %1169, %valid_1_15 : i1
    %1171 = comb.and bin %1043, %543, %809, %1059 : i1
    %1172 = comb.xor %1171, %true : i1
    %1173 = comb.and %1172, %valid_2_0 : i1
    %1174 = comb.and bin %1043, %543, %809, %1063 : i1
    %1175 = comb.xor %1174, %true : i1
    %1176 = comb.and %1175, %valid_2_1 : i1
    %1177 = comb.and bin %1043, %543, %809, %1067 : i1
    %1178 = comb.xor %1177, %true : i1
    %1179 = comb.and %1178, %valid_2_2 : i1
    %1180 = comb.and bin %1043, %543, %809, %1071 : i1
    %1181 = comb.xor %1180, %true : i1
    %1182 = comb.and %1181, %valid_2_3 : i1
    %1183 = comb.and bin %1043, %543, %809, %1075 : i1
    %1184 = comb.xor %1183, %true : i1
    %1185 = comb.and %1184, %valid_2_4 : i1
    %1186 = comb.and bin %1043, %543, %809, %1079 : i1
    %1187 = comb.xor %1186, %true : i1
    %1188 = comb.and %1187, %valid_2_5 : i1
    %1189 = comb.and bin %1043, %543, %809, %1083 : i1
    %1190 = comb.xor %1189, %true : i1
    %1191 = comb.and %1190, %valid_2_6 : i1
    %1192 = comb.and bin %1043, %543, %809, %1087 : i1
    %1193 = comb.xor %1192, %true : i1
    %1194 = comb.and %1193, %valid_2_7 : i1
    %1195 = comb.and bin %1043, %543, %809, %1091 : i1
    %1196 = comb.xor %1195, %true : i1
    %1197 = comb.and %1196, %valid_2_8 : i1
    %1198 = comb.and bin %1043, %543, %809, %1095 : i1
    %1199 = comb.xor %1198, %true : i1
    %1200 = comb.and %1199, %valid_2_9 : i1
    %1201 = comb.and bin %1043, %543, %809, %1099 : i1
    %1202 = comb.xor %1201, %true : i1
    %1203 = comb.and %1202, %valid_2_10 : i1
    %1204 = comb.and bin %1043, %543, %809, %1103 : i1
    %1205 = comb.xor %1204, %true : i1
    %1206 = comb.and %1205, %valid_2_11 : i1
    %1207 = comb.and bin %1043, %543, %809, %1107 : i1
    %1208 = comb.xor %1207, %true : i1
    %1209 = comb.and %1208, %valid_2_12 : i1
    %1210 = comb.and bin %1043, %543, %809, %1111 : i1
    %1211 = comb.xor %1210, %true : i1
    %1212 = comb.and %1211, %valid_2_13 : i1
    %1213 = comb.and bin %1043, %543, %809, %1115 : i1
    %1214 = comb.xor %1213, %true : i1
    %1215 = comb.and %1214, %valid_2_14 : i1
    %1216 = comb.and bin %1043, %543, %809, %1119 : i1
    %1217 = comb.xor %1216, %true : i1
    %1218 = comb.and %1217, %valid_2_15 : i1
    %1219 = comb.and bin %1043, %543, %890, %1059 : i1
    %1220 = comb.xor %1219, %true : i1
    %1221 = comb.and %1220, %valid_3_0 : i1
    %1222 = comb.and bin %1043, %543, %890, %1063 : i1
    %1223 = comb.xor %1222, %true : i1
    %1224 = comb.and %1223, %valid_3_1 : i1
    %1225 = comb.and bin %1043, %543, %890, %1067 : i1
    %1226 = comb.xor %1225, %true : i1
    %1227 = comb.and %1226, %valid_3_2 : i1
    %1228 = comb.and bin %1043, %543, %890, %1071 : i1
    %1229 = comb.xor %1228, %true : i1
    %1230 = comb.and %1229, %valid_3_3 : i1
    %1231 = comb.and bin %1043, %543, %890, %1075 : i1
    %1232 = comb.xor %1231, %true : i1
    %1233 = comb.and %1232, %valid_3_4 : i1
    %1234 = comb.and bin %1043, %543, %890, %1079 : i1
    %1235 = comb.xor %1234, %true : i1
    %1236 = comb.and %1235, %valid_3_5 : i1
    %1237 = comb.and bin %1043, %543, %890, %1083 : i1
    %1238 = comb.xor %1237, %true : i1
    %1239 = comb.and %1238, %valid_3_6 : i1
    %1240 = comb.and bin %1043, %543, %890, %1087 : i1
    %1241 = comb.xor %1240, %true : i1
    %1242 = comb.and %1241, %valid_3_7 : i1
    %1243 = comb.and bin %1043, %543, %890, %1091 : i1
    %1244 = comb.xor %1243, %true : i1
    %1245 = comb.and %1244, %valid_3_8 : i1
    %1246 = comb.and bin %1043, %543, %890, %1095 : i1
    %1247 = comb.xor %1246, %true : i1
    %1248 = comb.and %1247, %valid_3_9 : i1
    %1249 = comb.and bin %1043, %543, %890, %1099 : i1
    %1250 = comb.xor %1249, %true : i1
    %1251 = comb.and %1250, %valid_3_10 : i1
    %1252 = comb.and bin %1043, %543, %890, %1103 : i1
    %1253 = comb.xor %1252, %true : i1
    %1254 = comb.and %1253, %valid_3_11 : i1
    %1255 = comb.and bin %1043, %543, %890, %1107 : i1
    %1256 = comb.xor %1255, %true : i1
    %1257 = comb.and %1256, %valid_3_12 : i1
    %1258 = comb.and bin %1043, %543, %890, %1111 : i1
    %1259 = comb.xor %1258, %true : i1
    %1260 = comb.and %1259, %valid_3_13 : i1
    %1261 = comb.and bin %1043, %543, %890, %1115 : i1
    %1262 = comb.xor %1261, %true : i1
    %1263 = comb.and %1262, %valid_3_14 : i1
    %1264 = comb.and bin %1043, %543, %890, %1119 : i1
    %1265 = comb.xor %1264, %true : i1
    %1266 = comb.and %1265, %valid_3_15 : i1
    %1267 = comb.and bin %1042, %1060 : i1
    %1268 = comb.xor %1267, %true : i1
    %1269 = comb.or bin %323, %607, %615, %1036 : i1
    %1270 = comb.or %1269, %1268 : i1
    %1271 = comb.and %1270, %361 : i1
    %1272 = comb.and bin %1042, %1064 : i1
    %1273 = comb.xor %1272, %true : i1
    %1274 = comb.or %1269, %1273 : i1
    %1275 = comb.and %1274, %364 : i1
    %1276 = comb.and bin %1042, %1068 : i1
    %1277 = comb.xor %1276, %true : i1
    %1278 = comb.or %1269, %1277 : i1
    %1279 = comb.and %1278, %367 : i1
    %1280 = comb.and bin %1042, %1072 : i1
    %1281 = comb.xor %1280, %true : i1
    %1282 = comb.or %1269, %1281 : i1
    %1283 = comb.and %1282, %370 : i1
    %1284 = comb.and bin %1042, %1076 : i1
    %1285 = comb.xor %1284, %true : i1
    %1286 = comb.or %1269, %1285 : i1
    %1287 = comb.and %1286, %373 : i1
    %1288 = comb.and bin %1042, %1080 : i1
    %1289 = comb.xor %1288, %true : i1
    %1290 = comb.or %1269, %1289 : i1
    %1291 = comb.and %1290, %376 : i1
    %1292 = comb.and bin %1042, %1084 : i1
    %1293 = comb.xor %1292, %true : i1
    %1294 = comb.or %1269, %1293 : i1
    %1295 = comb.and %1294, %379 : i1
    %1296 = comb.and bin %1042, %1088 : i1
    %1297 = comb.xor %1296, %true : i1
    %1298 = comb.or %1269, %1297 : i1
    %1299 = comb.and %1298, %382 : i1
    %1300 = comb.and bin %1042, %1092 : i1
    %1301 = comb.xor %1300, %true : i1
    %1302 = comb.or %1269, %1301 : i1
    %1303 = comb.and %1302, %385 : i1
    %1304 = comb.and bin %1042, %1096 : i1
    %1305 = comb.xor %1304, %true : i1
    %1306 = comb.or %1269, %1305 : i1
    %1307 = comb.and %1306, %388 : i1
    %1308 = comb.and bin %1042, %1100 : i1
    %1309 = comb.xor %1308, %true : i1
    %1310 = comb.or %1269, %1309 : i1
    %1311 = comb.and %1310, %391 : i1
    %1312 = comb.and bin %1042, %1104 : i1
    %1313 = comb.xor %1312, %true : i1
    %1314 = comb.or %1269, %1313 : i1
    %1315 = comb.and %1314, %394 : i1
    %1316 = comb.and bin %1042, %1108 : i1
    %1317 = comb.xor %1316, %true : i1
    %1318 = comb.or %1269, %1317 : i1
    %1319 = comb.and %1318, %397 : i1
    %1320 = comb.and bin %1042, %1112 : i1
    %1321 = comb.xor %1320, %true : i1
    %1322 = comb.or %1269, %1321 : i1
    %1323 = comb.and %1322, %400 : i1
    %1324 = comb.and bin %1042, %1116 : i1
    %1325 = comb.xor %1324, %true : i1
    %1326 = comb.or %1269, %1325 : i1
    %1327 = comb.and %1326, %403 : i1
    %1328 = comb.and bin %1042, %1120 : i1
    %1329 = comb.xor %1328, %true : i1
    %1330 = comb.or %1269, %1329 : i1
    %1331 = comb.and %1330, %406 : i1
    %1332 = comb.and bin %1042, %1123 : i1
    %1333 = comb.xor %1332, %true : i1
    %1334 = comb.or %1269, %1333 : i1
    %1335 = comb.and %1334, %408 : i1
    %1336 = comb.and bin %1042, %1126 : i1
    %1337 = comb.xor %1336, %true : i1
    %1338 = comb.or %1269, %1337 : i1
    %1339 = comb.and %1338, %410 : i1
    %1340 = comb.and bin %1042, %1129 : i1
    %1341 = comb.xor %1340, %true : i1
    %1342 = comb.or %1269, %1341 : i1
    %1343 = comb.and %1342, %412 : i1
    %1344 = comb.and bin %1042, %1132 : i1
    %1345 = comb.xor %1344, %true : i1
    %1346 = comb.or %1269, %1345 : i1
    %1347 = comb.and %1346, %414 : i1
    %1348 = comb.and bin %1042, %1135 : i1
    %1349 = comb.xor %1348, %true : i1
    %1350 = comb.or %1269, %1349 : i1
    %1351 = comb.and %1350, %416 : i1
    %1352 = comb.and bin %1042, %1138 : i1
    %1353 = comb.xor %1352, %true : i1
    %1354 = comb.or %1269, %1353 : i1
    %1355 = comb.and %1354, %418 : i1
    %1356 = comb.and bin %1042, %1141 : i1
    %1357 = comb.xor %1356, %true : i1
    %1358 = comb.or %1269, %1357 : i1
    %1359 = comb.and %1358, %420 : i1
    %1360 = comb.and bin %1042, %1144 : i1
    %1361 = comb.xor %1360, %true : i1
    %1362 = comb.or %1269, %1361 : i1
    %1363 = comb.and %1362, %422 : i1
    %1364 = comb.and bin %1042, %1147 : i1
    %1365 = comb.xor %1364, %true : i1
    %1366 = comb.or %1269, %1365 : i1
    %1367 = comb.and %1366, %424 : i1
    %1368 = comb.and bin %1042, %1150 : i1
    %1369 = comb.xor %1368, %true : i1
    %1370 = comb.or %1269, %1369 : i1
    %1371 = comb.and %1370, %426 : i1
    %1372 = comb.and bin %1042, %1153 : i1
    %1373 = comb.xor %1372, %true : i1
    %1374 = comb.or %1269, %1373 : i1
    %1375 = comb.and %1374, %428 : i1
    %1376 = comb.and bin %1042, %1156 : i1
    %1377 = comb.xor %1376, %true : i1
    %1378 = comb.or %1269, %1377 : i1
    %1379 = comb.and %1378, %430 : i1
    %1380 = comb.and bin %1042, %1159 : i1
    %1381 = comb.xor %1380, %true : i1
    %1382 = comb.or %1269, %1381 : i1
    %1383 = comb.and %1382, %432 : i1
    %1384 = comb.and bin %1042, %1162 : i1
    %1385 = comb.xor %1384, %true : i1
    %1386 = comb.or %1269, %1385 : i1
    %1387 = comb.and %1386, %434 : i1
    %1388 = comb.and bin %1042, %1165 : i1
    %1389 = comb.xor %1388, %true : i1
    %1390 = comb.or %1269, %1389 : i1
    %1391 = comb.and %1390, %436 : i1
    %1392 = comb.and bin %1042, %1168 : i1
    %1393 = comb.xor %1392, %true : i1
    %1394 = comb.or %1269, %1393 : i1
    %1395 = comb.and %1394, %438 : i1
    %1396 = comb.and bin %1042, %1171 : i1
    %1397 = comb.xor %1396, %true : i1
    %1398 = comb.or %1269, %1397 : i1
    %1399 = comb.and %1398, %440 : i1
    %1400 = comb.and bin %1042, %1174 : i1
    %1401 = comb.xor %1400, %true : i1
    %1402 = comb.or %1269, %1401 : i1
    %1403 = comb.and %1402, %442 : i1
    %1404 = comb.and bin %1042, %1177 : i1
    %1405 = comb.xor %1404, %true : i1
    %1406 = comb.or %1269, %1405 : i1
    %1407 = comb.and %1406, %444 : i1
    %1408 = comb.and bin %1042, %1180 : i1
    %1409 = comb.xor %1408, %true : i1
    %1410 = comb.or %1269, %1409 : i1
    %1411 = comb.and %1410, %446 : i1
    %1412 = comb.and bin %1042, %1183 : i1
    %1413 = comb.xor %1412, %true : i1
    %1414 = comb.or %1269, %1413 : i1
    %1415 = comb.and %1414, %448 : i1
    %1416 = comb.and bin %1042, %1186 : i1
    %1417 = comb.xor %1416, %true : i1
    %1418 = comb.or %1269, %1417 : i1
    %1419 = comb.and %1418, %450 : i1
    %1420 = comb.and bin %1042, %1189 : i1
    %1421 = comb.xor %1420, %true : i1
    %1422 = comb.or %1269, %1421 : i1
    %1423 = comb.and %1422, %452 : i1
    %1424 = comb.and bin %1042, %1192 : i1
    %1425 = comb.xor %1424, %true : i1
    %1426 = comb.or %1269, %1425 : i1
    %1427 = comb.and %1426, %454 : i1
    %1428 = comb.and bin %1042, %1195 : i1
    %1429 = comb.xor %1428, %true : i1
    %1430 = comb.or %1269, %1429 : i1
    %1431 = comb.and %1430, %456 : i1
    %1432 = comb.and bin %1042, %1198 : i1
    %1433 = comb.xor %1432, %true : i1
    %1434 = comb.or %1269, %1433 : i1
    %1435 = comb.and %1434, %458 : i1
    %1436 = comb.and bin %1042, %1201 : i1
    %1437 = comb.xor %1436, %true : i1
    %1438 = comb.or %1269, %1437 : i1
    %1439 = comb.and %1438, %460 : i1
    %1440 = comb.and bin %1042, %1204 : i1
    %1441 = comb.xor %1440, %true : i1
    %1442 = comb.or %1269, %1441 : i1
    %1443 = comb.and %1442, %462 : i1
    %1444 = comb.and bin %1042, %1207 : i1
    %1445 = comb.xor %1444, %true : i1
    %1446 = comb.or %1269, %1445 : i1
    %1447 = comb.and %1446, %464 : i1
    %1448 = comb.and bin %1042, %1210 : i1
    %1449 = comb.xor %1448, %true : i1
    %1450 = comb.or %1269, %1449 : i1
    %1451 = comb.and %1450, %466 : i1
    %1452 = comb.and bin %1042, %1213 : i1
    %1453 = comb.xor %1452, %true : i1
    %1454 = comb.or %1269, %1453 : i1
    %1455 = comb.and %1454, %468 : i1
    %1456 = comb.and bin %1042, %1216 : i1
    %1457 = comb.xor %1456, %true : i1
    %1458 = comb.or %1269, %1457 : i1
    %1459 = comb.and %1458, %470 : i1
    %1460 = comb.and bin %1042, %1219 : i1
    %1461 = comb.xor %1460, %true : i1
    %1462 = comb.or %1269, %1461 : i1
    %1463 = comb.and %1462, %472 : i1
    %1464 = comb.and bin %1042, %1222 : i1
    %1465 = comb.xor %1464, %true : i1
    %1466 = comb.or %1269, %1465 : i1
    %1467 = comb.and %1466, %474 : i1
    %1468 = comb.and bin %1042, %1225 : i1
    %1469 = comb.xor %1468, %true : i1
    %1470 = comb.or %1269, %1469 : i1
    %1471 = comb.and %1470, %476 : i1
    %1472 = comb.and bin %1042, %1228 : i1
    %1473 = comb.xor %1472, %true : i1
    %1474 = comb.or %1269, %1473 : i1
    %1475 = comb.and %1474, %478 : i1
    %1476 = comb.and bin %1042, %1231 : i1
    %1477 = comb.xor %1476, %true : i1
    %1478 = comb.or %1269, %1477 : i1
    %1479 = comb.and %1478, %480 : i1
    %1480 = comb.and bin %1042, %1234 : i1
    %1481 = comb.xor %1480, %true : i1
    %1482 = comb.or %1269, %1481 : i1
    %1483 = comb.and %1482, %482 : i1
    %1484 = comb.and bin %1042, %1237 : i1
    %1485 = comb.xor %1484, %true : i1
    %1486 = comb.or %1269, %1485 : i1
    %1487 = comb.and %1486, %484 : i1
    %1488 = comb.and bin %1042, %1240 : i1
    %1489 = comb.xor %1488, %true : i1
    %1490 = comb.or %1269, %1489 : i1
    %1491 = comb.and %1490, %486 : i1
    %1492 = comb.and bin %1042, %1243 : i1
    %1493 = comb.xor %1492, %true : i1
    %1494 = comb.or %1269, %1493 : i1
    %1495 = comb.and %1494, %488 : i1
    %1496 = comb.and bin %1042, %1246 : i1
    %1497 = comb.xor %1496, %true : i1
    %1498 = comb.or %1269, %1497 : i1
    %1499 = comb.and %1498, %490 : i1
    %1500 = comb.and bin %1042, %1249 : i1
    %1501 = comb.xor %1500, %true : i1
    %1502 = comb.or %1269, %1501 : i1
    %1503 = comb.and %1502, %492 : i1
    %1504 = comb.and bin %1042, %1252 : i1
    %1505 = comb.xor %1504, %true : i1
    %1506 = comb.or %1269, %1505 : i1
    %1507 = comb.and %1506, %494 : i1
    %1508 = comb.and bin %1042, %1255 : i1
    %1509 = comb.xor %1508, %true : i1
    %1510 = comb.or %1269, %1509 : i1
    %1511 = comb.and %1510, %496 : i1
    %1512 = comb.and bin %1042, %1258 : i1
    %1513 = comb.xor %1512, %true : i1
    %1514 = comb.or %1269, %1513 : i1
    %1515 = comb.and %1514, %498 : i1
    %1516 = comb.and bin %1042, %1261 : i1
    %1517 = comb.xor %1516, %true : i1
    %1518 = comb.or %1269, %1517 : i1
    %1519 = comb.and %1518, %500 : i1
    %1520 = comb.and bin %1042, %1264 : i1
    %1521 = comb.xor %1520, %true : i1
    %1522 = comb.or %1269, %1521 : i1
    %1523 = comb.and %1522, %502 : i1
    %1524 = comb.or bin %1036, %1042 : i1
    %1525 = comb.xor %1524, %true : i1
    %1526 = comb.and %1525, %324 : i1
    %1527 = comb.mux bin %615, %619, %1526 : i1
    %1528 = comb.xor %607, %true : i1
    %1529 = comb.and %1528, %1527 : i1
    %1530 = comb.mux bin %323, %552, %1529 {sv.namehint = "wen"} : i1
    %1531 = comb.or bin %607, %615, %1524 : i1
    %1532 = comb.xor %324, %true : i1
    %1533 = comb.or %1531, %1532 : i1
    %1534 = comb.mux bin %1533, %c-1_i128, %553 : i128
    %1535 = hw.array_create %1534, %1534, %1534, %c-1_i128, %c-1_i128, %c-1_i128, %c-1_i128, %556 : i128
    %1536 = hw.array_get %1535[%state] {sv.namehint = "mask"} : !hw.array<8xi128>, i3
    %1537 = comb.xor %324, %true : i1
    %1538 = comb.or %1531, %1537 : i1
    %1539 = comb.and %1538, %wait_r : i1
    %1540 = comb.mux bin %323, %606, %1539 : i1
    %1541 = comb.icmp bin eq %state, %c-2_i3 {sv.namehint = "_T_84"} : i3
    %1542 = comb.and bin %1541, %187 : i1
    %1543 = comb.xor %1542, %true : i1
    %1544 = comb.or bin %1042, %324 : i1
    %1545 = comb.or bin %323, %607, %615, %1036, %1544 : i1
    %1546 = comb.or %1545, %1543 : i1
    %1547 = comb.and %1546, %50 : i1
    %1548 = comb.xor %1542, %true : i1
    %1549 = comb.or %324, %1548 : i1
    %1550 = comb.and %1549, %valid_0_0 : i1
    %1551 = comb.mux bin %1042, %1062, %1550 : i1
    %1552 = comb.mux bin %1036, %valid_0_0, %1551 : i1
    %1553 = comb.mux bin %615, %971, %1552 : i1
    %1554 = comb.mux bin %622, %valid_0_0, %1553 : i1
    %1555 = comb.xor %1542, %true : i1
    %1556 = comb.or %324, %1555 : i1
    %1557 = comb.and %1556, %valid_0_1 : i1
    %1558 = comb.mux bin %1042, %1066, %1557 : i1
    %1559 = comb.mux bin %1036, %valid_0_1, %1558 : i1
    %1560 = comb.mux bin %615, %972, %1559 : i1
    %1561 = comb.mux bin %622, %valid_0_1, %1560 : i1
    %1562 = comb.xor %1542, %true : i1
    %1563 = comb.or %324, %1562 : i1
    %1564 = comb.and %1563, %valid_0_2 : i1
    %1565 = comb.mux bin %1042, %1070, %1564 : i1
    %1566 = comb.mux bin %1036, %valid_0_2, %1565 : i1
    %1567 = comb.mux bin %615, %973, %1566 : i1
    %1568 = comb.mux bin %622, %valid_0_2, %1567 : i1
    %1569 = comb.xor %1542, %true : i1
    %1570 = comb.or %324, %1569 : i1
    %1571 = comb.and %1570, %valid_0_3 : i1
    %1572 = comb.mux bin %1042, %1074, %1571 : i1
    %1573 = comb.mux bin %1036, %valid_0_3, %1572 : i1
    %1574 = comb.mux bin %615, %974, %1573 : i1
    %1575 = comb.mux bin %622, %valid_0_3, %1574 : i1
    %1576 = comb.xor %1542, %true : i1
    %1577 = comb.or %324, %1576 : i1
    %1578 = comb.and %1577, %valid_0_4 : i1
    %1579 = comb.mux bin %1042, %1078, %1578 : i1
    %1580 = comb.mux bin %1036, %valid_0_4, %1579 : i1
    %1581 = comb.mux bin %615, %975, %1580 : i1
    %1582 = comb.mux bin %622, %valid_0_4, %1581 : i1
    %1583 = comb.xor %1542, %true : i1
    %1584 = comb.or %324, %1583 : i1
    %1585 = comb.and %1584, %valid_0_5 : i1
    %1586 = comb.mux bin %1042, %1082, %1585 : i1
    %1587 = comb.mux bin %1036, %valid_0_5, %1586 : i1
    %1588 = comb.mux bin %615, %976, %1587 : i1
    %1589 = comb.mux bin %622, %valid_0_5, %1588 : i1
    %1590 = comb.xor %1542, %true : i1
    %1591 = comb.or %324, %1590 : i1
    %1592 = comb.and %1591, %valid_0_6 : i1
    %1593 = comb.mux bin %1042, %1086, %1592 : i1
    %1594 = comb.mux bin %1036, %valid_0_6, %1593 : i1
    %1595 = comb.mux bin %615, %977, %1594 : i1
    %1596 = comb.mux bin %622, %valid_0_6, %1595 : i1
    %1597 = comb.xor %1542, %true : i1
    %1598 = comb.or %324, %1597 : i1
    %1599 = comb.and %1598, %valid_0_7 : i1
    %1600 = comb.mux bin %1042, %1090, %1599 : i1
    %1601 = comb.mux bin %1036, %valid_0_7, %1600 : i1
    %1602 = comb.mux bin %615, %978, %1601 : i1
    %1603 = comb.mux bin %622, %valid_0_7, %1602 : i1
    %1604 = comb.xor %1542, %true : i1
    %1605 = comb.or %324, %1604 : i1
    %1606 = comb.and %1605, %valid_0_8 : i1
    %1607 = comb.mux bin %1042, %1094, %1606 : i1
    %1608 = comb.mux bin %1036, %valid_0_8, %1607 : i1
    %1609 = comb.mux bin %615, %979, %1608 : i1
    %1610 = comb.mux bin %622, %valid_0_8, %1609 : i1
    %1611 = comb.xor %1542, %true : i1
    %1612 = comb.or %324, %1611 : i1
    %1613 = comb.and %1612, %valid_0_9 : i1
    %1614 = comb.mux bin %1042, %1098, %1613 : i1
    %1615 = comb.mux bin %1036, %valid_0_9, %1614 : i1
    %1616 = comb.mux bin %615, %980, %1615 : i1
    %1617 = comb.mux bin %622, %valid_0_9, %1616 : i1
    %1618 = comb.xor %1542, %true : i1
    %1619 = comb.or %324, %1618 : i1
    %1620 = comb.and %1619, %valid_0_10 : i1
    %1621 = comb.mux bin %1042, %1102, %1620 : i1
    %1622 = comb.mux bin %1036, %valid_0_10, %1621 : i1
    %1623 = comb.mux bin %615, %981, %1622 : i1
    %1624 = comb.mux bin %622, %valid_0_10, %1623 : i1
    %1625 = comb.xor %1542, %true : i1
    %1626 = comb.or %324, %1625 : i1
    %1627 = comb.and %1626, %valid_0_11 : i1
    %1628 = comb.mux bin %1042, %1106, %1627 : i1
    %1629 = comb.mux bin %1036, %valid_0_11, %1628 : i1
    %1630 = comb.mux bin %615, %982, %1629 : i1
    %1631 = comb.mux bin %622, %valid_0_11, %1630 : i1
    %1632 = comb.xor %1542, %true : i1
    %1633 = comb.or %324, %1632 : i1
    %1634 = comb.and %1633, %valid_0_12 : i1
    %1635 = comb.mux bin %1042, %1110, %1634 : i1
    %1636 = comb.mux bin %1036, %valid_0_12, %1635 : i1
    %1637 = comb.mux bin %615, %983, %1636 : i1
    %1638 = comb.mux bin %622, %valid_0_12, %1637 : i1
    %1639 = comb.xor %1542, %true : i1
    %1640 = comb.or %324, %1639 : i1
    %1641 = comb.and %1640, %valid_0_13 : i1
    %1642 = comb.mux bin %1042, %1114, %1641 : i1
    %1643 = comb.mux bin %1036, %valid_0_13, %1642 : i1
    %1644 = comb.mux bin %615, %984, %1643 : i1
    %1645 = comb.mux bin %622, %valid_0_13, %1644 : i1
    %1646 = comb.xor %1542, %true : i1
    %1647 = comb.or %324, %1646 : i1
    %1648 = comb.and %1647, %valid_0_14 : i1
    %1649 = comb.mux bin %1042, %1118, %1648 : i1
    %1650 = comb.mux bin %1036, %valid_0_14, %1649 : i1
    %1651 = comb.mux bin %615, %985, %1650 : i1
    %1652 = comb.mux bin %622, %valid_0_14, %1651 : i1
    %1653 = comb.xor %1542, %true : i1
    %1654 = comb.or %324, %1653 : i1
    %1655 = comb.and %1654, %valid_0_15 : i1
    %1656 = comb.mux bin %1042, %1122, %1655 : i1
    %1657 = comb.mux bin %1036, %valid_0_15, %1656 : i1
    %1658 = comb.mux bin %615, %986, %1657 : i1
    %1659 = comb.mux bin %622, %valid_0_15, %1658 : i1
    %1660 = comb.xor %1542, %true : i1
    %1661 = comb.or %324, %1660 : i1
    %1662 = comb.and %1661, %valid_1_0 : i1
    %1663 = comb.mux bin %1042, %1125, %1662 : i1
    %1664 = comb.mux bin %1036, %valid_1_0, %1663 : i1
    %1665 = comb.mux bin %615, %987, %1664 : i1
    %1666 = comb.mux bin %622, %valid_1_0, %1665 : i1
    %1667 = comb.xor %1542, %true : i1
    %1668 = comb.or %324, %1667 : i1
    %1669 = comb.and %1668, %valid_1_1 : i1
    %1670 = comb.mux bin %1042, %1128, %1669 : i1
    %1671 = comb.mux bin %1036, %valid_1_1, %1670 : i1
    %1672 = comb.mux bin %615, %988, %1671 : i1
    %1673 = comb.mux bin %622, %valid_1_1, %1672 : i1
    %1674 = comb.xor %1542, %true : i1
    %1675 = comb.or %324, %1674 : i1
    %1676 = comb.and %1675, %valid_1_2 : i1
    %1677 = comb.mux bin %1042, %1131, %1676 : i1
    %1678 = comb.mux bin %1036, %valid_1_2, %1677 : i1
    %1679 = comb.mux bin %615, %989, %1678 : i1
    %1680 = comb.mux bin %622, %valid_1_2, %1679 : i1
    %1681 = comb.xor %1542, %true : i1
    %1682 = comb.or %324, %1681 : i1
    %1683 = comb.and %1682, %valid_1_3 : i1
    %1684 = comb.mux bin %1042, %1134, %1683 : i1
    %1685 = comb.mux bin %1036, %valid_1_3, %1684 : i1
    %1686 = comb.mux bin %615, %990, %1685 : i1
    %1687 = comb.mux bin %622, %valid_1_3, %1686 : i1
    %1688 = comb.xor %1542, %true : i1
    %1689 = comb.or %324, %1688 : i1
    %1690 = comb.and %1689, %valid_1_4 : i1
    %1691 = comb.mux bin %1042, %1137, %1690 : i1
    %1692 = comb.mux bin %1036, %valid_1_4, %1691 : i1
    %1693 = comb.mux bin %615, %991, %1692 : i1
    %1694 = comb.mux bin %622, %valid_1_4, %1693 : i1
    %1695 = comb.xor %1542, %true : i1
    %1696 = comb.or %324, %1695 : i1
    %1697 = comb.and %1696, %valid_1_5 : i1
    %1698 = comb.mux bin %1042, %1140, %1697 : i1
    %1699 = comb.mux bin %1036, %valid_1_5, %1698 : i1
    %1700 = comb.mux bin %615, %992, %1699 : i1
    %1701 = comb.mux bin %622, %valid_1_5, %1700 : i1
    %1702 = comb.xor %1542, %true : i1
    %1703 = comb.or %324, %1702 : i1
    %1704 = comb.and %1703, %valid_1_6 : i1
    %1705 = comb.mux bin %1042, %1143, %1704 : i1
    %1706 = comb.mux bin %1036, %valid_1_6, %1705 : i1
    %1707 = comb.mux bin %615, %993, %1706 : i1
    %1708 = comb.mux bin %622, %valid_1_6, %1707 : i1
    %1709 = comb.xor %1542, %true : i1
    %1710 = comb.or %324, %1709 : i1
    %1711 = comb.and %1710, %valid_1_7 : i1
    %1712 = comb.mux bin %1042, %1146, %1711 : i1
    %1713 = comb.mux bin %1036, %valid_1_7, %1712 : i1
    %1714 = comb.mux bin %615, %994, %1713 : i1
    %1715 = comb.mux bin %622, %valid_1_7, %1714 : i1
    %1716 = comb.xor %1542, %true : i1
    %1717 = comb.or %324, %1716 : i1
    %1718 = comb.and %1717, %valid_1_8 : i1
    %1719 = comb.mux bin %1042, %1149, %1718 : i1
    %1720 = comb.mux bin %1036, %valid_1_8, %1719 : i1
    %1721 = comb.mux bin %615, %995, %1720 : i1
    %1722 = comb.mux bin %622, %valid_1_8, %1721 : i1
    %1723 = comb.xor %1542, %true : i1
    %1724 = comb.or %324, %1723 : i1
    %1725 = comb.and %1724, %valid_1_9 : i1
    %1726 = comb.mux bin %1042, %1152, %1725 : i1
    %1727 = comb.mux bin %1036, %valid_1_9, %1726 : i1
    %1728 = comb.mux bin %615, %996, %1727 : i1
    %1729 = comb.mux bin %622, %valid_1_9, %1728 : i1
    %1730 = comb.xor %1542, %true : i1
    %1731 = comb.or %324, %1730 : i1
    %1732 = comb.and %1731, %valid_1_10 : i1
    %1733 = comb.mux bin %1042, %1155, %1732 : i1
    %1734 = comb.mux bin %1036, %valid_1_10, %1733 : i1
    %1735 = comb.mux bin %615, %997, %1734 : i1
    %1736 = comb.mux bin %622, %valid_1_10, %1735 : i1
    %1737 = comb.xor %1542, %true : i1
    %1738 = comb.or %324, %1737 : i1
    %1739 = comb.and %1738, %valid_1_11 : i1
    %1740 = comb.mux bin %1042, %1158, %1739 : i1
    %1741 = comb.mux bin %1036, %valid_1_11, %1740 : i1
    %1742 = comb.mux bin %615, %998, %1741 : i1
    %1743 = comb.mux bin %622, %valid_1_11, %1742 : i1
    %1744 = comb.xor %1542, %true : i1
    %1745 = comb.or %324, %1744 : i1
    %1746 = comb.and %1745, %valid_1_12 : i1
    %1747 = comb.mux bin %1042, %1161, %1746 : i1
    %1748 = comb.mux bin %1036, %valid_1_12, %1747 : i1
    %1749 = comb.mux bin %615, %999, %1748 : i1
    %1750 = comb.mux bin %622, %valid_1_12, %1749 : i1
    %1751 = comb.xor %1542, %true : i1
    %1752 = comb.or %324, %1751 : i1
    %1753 = comb.and %1752, %valid_1_13 : i1
    %1754 = comb.mux bin %1042, %1164, %1753 : i1
    %1755 = comb.mux bin %1036, %valid_1_13, %1754 : i1
    %1756 = comb.mux bin %615, %1000, %1755 : i1
    %1757 = comb.mux bin %622, %valid_1_13, %1756 : i1
    %1758 = comb.xor %1542, %true : i1
    %1759 = comb.or %324, %1758 : i1
    %1760 = comb.and %1759, %valid_1_14 : i1
    %1761 = comb.mux bin %1042, %1167, %1760 : i1
    %1762 = comb.mux bin %1036, %valid_1_14, %1761 : i1
    %1763 = comb.mux bin %615, %1001, %1762 : i1
    %1764 = comb.mux bin %622, %valid_1_14, %1763 : i1
    %1765 = comb.xor %1542, %true : i1
    %1766 = comb.or %324, %1765 : i1
    %1767 = comb.and %1766, %valid_1_15 : i1
    %1768 = comb.mux bin %1042, %1170, %1767 : i1
    %1769 = comb.mux bin %1036, %valid_1_15, %1768 : i1
    %1770 = comb.mux bin %615, %1002, %1769 : i1
    %1771 = comb.mux bin %622, %valid_1_15, %1770 : i1
    %1772 = comb.xor %1542, %true : i1
    %1773 = comb.or %324, %1772 : i1
    %1774 = comb.and %1773, %valid_2_0 : i1
    %1775 = comb.mux bin %1042, %1173, %1774 : i1
    %1776 = comb.mux bin %1036, %valid_2_0, %1775 : i1
    %1777 = comb.mux bin %615, %1003, %1776 : i1
    %1778 = comb.mux bin %622, %valid_2_0, %1777 : i1
    %1779 = comb.xor %1542, %true : i1
    %1780 = comb.or %324, %1779 : i1
    %1781 = comb.and %1780, %valid_2_1 : i1
    %1782 = comb.mux bin %1042, %1176, %1781 : i1
    %1783 = comb.mux bin %1036, %valid_2_1, %1782 : i1
    %1784 = comb.mux bin %615, %1004, %1783 : i1
    %1785 = comb.mux bin %622, %valid_2_1, %1784 : i1
    %1786 = comb.xor %1542, %true : i1
    %1787 = comb.or %324, %1786 : i1
    %1788 = comb.and %1787, %valid_2_2 : i1
    %1789 = comb.mux bin %1042, %1179, %1788 : i1
    %1790 = comb.mux bin %1036, %valid_2_2, %1789 : i1
    %1791 = comb.mux bin %615, %1005, %1790 : i1
    %1792 = comb.mux bin %622, %valid_2_2, %1791 : i1
    %1793 = comb.xor %1542, %true : i1
    %1794 = comb.or %324, %1793 : i1
    %1795 = comb.and %1794, %valid_2_3 : i1
    %1796 = comb.mux bin %1042, %1182, %1795 : i1
    %1797 = comb.mux bin %1036, %valid_2_3, %1796 : i1
    %1798 = comb.mux bin %615, %1006, %1797 : i1
    %1799 = comb.mux bin %622, %valid_2_3, %1798 : i1
    %1800 = comb.xor %1542, %true : i1
    %1801 = comb.or %324, %1800 : i1
    %1802 = comb.and %1801, %valid_2_4 : i1
    %1803 = comb.mux bin %1042, %1185, %1802 : i1
    %1804 = comb.mux bin %1036, %valid_2_4, %1803 : i1
    %1805 = comb.mux bin %615, %1007, %1804 : i1
    %1806 = comb.mux bin %622, %valid_2_4, %1805 : i1
    %1807 = comb.xor %1542, %true : i1
    %1808 = comb.or %324, %1807 : i1
    %1809 = comb.and %1808, %valid_2_5 : i1
    %1810 = comb.mux bin %1042, %1188, %1809 : i1
    %1811 = comb.mux bin %1036, %valid_2_5, %1810 : i1
    %1812 = comb.mux bin %615, %1008, %1811 : i1
    %1813 = comb.mux bin %622, %valid_2_5, %1812 : i1
    %1814 = comb.xor %1542, %true : i1
    %1815 = comb.or %324, %1814 : i1
    %1816 = comb.and %1815, %valid_2_6 : i1
    %1817 = comb.mux bin %1042, %1191, %1816 : i1
    %1818 = comb.mux bin %1036, %valid_2_6, %1817 : i1
    %1819 = comb.mux bin %615, %1009, %1818 : i1
    %1820 = comb.mux bin %622, %valid_2_6, %1819 : i1
    %1821 = comb.xor %1542, %true : i1
    %1822 = comb.or %324, %1821 : i1
    %1823 = comb.and %1822, %valid_2_7 : i1
    %1824 = comb.mux bin %1042, %1194, %1823 : i1
    %1825 = comb.mux bin %1036, %valid_2_7, %1824 : i1
    %1826 = comb.mux bin %615, %1010, %1825 : i1
    %1827 = comb.mux bin %622, %valid_2_7, %1826 : i1
    %1828 = comb.xor %1542, %true : i1
    %1829 = comb.or %324, %1828 : i1
    %1830 = comb.and %1829, %valid_2_8 : i1
    %1831 = comb.mux bin %1042, %1197, %1830 : i1
    %1832 = comb.mux bin %1036, %valid_2_8, %1831 : i1
    %1833 = comb.mux bin %615, %1011, %1832 : i1
    %1834 = comb.mux bin %622, %valid_2_8, %1833 : i1
    %1835 = comb.xor %1542, %true : i1
    %1836 = comb.or %324, %1835 : i1
    %1837 = comb.and %1836, %valid_2_9 : i1
    %1838 = comb.mux bin %1042, %1200, %1837 : i1
    %1839 = comb.mux bin %1036, %valid_2_9, %1838 : i1
    %1840 = comb.mux bin %615, %1012, %1839 : i1
    %1841 = comb.mux bin %622, %valid_2_9, %1840 : i1
    %1842 = comb.xor %1542, %true : i1
    %1843 = comb.or %324, %1842 : i1
    %1844 = comb.and %1843, %valid_2_10 : i1
    %1845 = comb.mux bin %1042, %1203, %1844 : i1
    %1846 = comb.mux bin %1036, %valid_2_10, %1845 : i1
    %1847 = comb.mux bin %615, %1013, %1846 : i1
    %1848 = comb.mux bin %622, %valid_2_10, %1847 : i1
    %1849 = comb.xor %1542, %true : i1
    %1850 = comb.or %324, %1849 : i1
    %1851 = comb.and %1850, %valid_2_11 : i1
    %1852 = comb.mux bin %1042, %1206, %1851 : i1
    %1853 = comb.mux bin %1036, %valid_2_11, %1852 : i1
    %1854 = comb.mux bin %615, %1014, %1853 : i1
    %1855 = comb.mux bin %622, %valid_2_11, %1854 : i1
    %1856 = comb.xor %1542, %true : i1
    %1857 = comb.or %324, %1856 : i1
    %1858 = comb.and %1857, %valid_2_12 : i1
    %1859 = comb.mux bin %1042, %1209, %1858 : i1
    %1860 = comb.mux bin %1036, %valid_2_12, %1859 : i1
    %1861 = comb.mux bin %615, %1015, %1860 : i1
    %1862 = comb.mux bin %622, %valid_2_12, %1861 : i1
    %1863 = comb.xor %1542, %true : i1
    %1864 = comb.or %324, %1863 : i1
    %1865 = comb.and %1864, %valid_2_13 : i1
    %1866 = comb.mux bin %1042, %1212, %1865 : i1
    %1867 = comb.mux bin %1036, %valid_2_13, %1866 : i1
    %1868 = comb.mux bin %615, %1016, %1867 : i1
    %1869 = comb.mux bin %622, %valid_2_13, %1868 : i1
    %1870 = comb.xor %1542, %true : i1
    %1871 = comb.or %324, %1870 : i1
    %1872 = comb.and %1871, %valid_2_14 : i1
    %1873 = comb.mux bin %1042, %1215, %1872 : i1
    %1874 = comb.mux bin %1036, %valid_2_14, %1873 : i1
    %1875 = comb.mux bin %615, %1017, %1874 : i1
    %1876 = comb.mux bin %622, %valid_2_14, %1875 : i1
    %1877 = comb.xor %1542, %true : i1
    %1878 = comb.or %324, %1877 : i1
    %1879 = comb.and %1878, %valid_2_15 : i1
    %1880 = comb.mux bin %1042, %1218, %1879 : i1
    %1881 = comb.mux bin %1036, %valid_2_15, %1880 : i1
    %1882 = comb.mux bin %615, %1018, %1881 : i1
    %1883 = comb.mux bin %622, %valid_2_15, %1882 : i1
    %1884 = comb.xor %1542, %true : i1
    %1885 = comb.or %324, %1884 : i1
    %1886 = comb.and %1885, %valid_3_0 : i1
    %1887 = comb.mux bin %1042, %1221, %1886 : i1
    %1888 = comb.mux bin %1036, %valid_3_0, %1887 : i1
    %1889 = comb.mux bin %615, %1019, %1888 : i1
    %1890 = comb.mux bin %622, %valid_3_0, %1889 : i1
    %1891 = comb.xor %1542, %true : i1
    %1892 = comb.or %324, %1891 : i1
    %1893 = comb.and %1892, %valid_3_1 : i1
    %1894 = comb.mux bin %1042, %1224, %1893 : i1
    %1895 = comb.mux bin %1036, %valid_3_1, %1894 : i1
    %1896 = comb.mux bin %615, %1020, %1895 : i1
    %1897 = comb.mux bin %622, %valid_3_1, %1896 : i1
    %1898 = comb.xor %1542, %true : i1
    %1899 = comb.or %324, %1898 : i1
    %1900 = comb.and %1899, %valid_3_2 : i1
    %1901 = comb.mux bin %1042, %1227, %1900 : i1
    %1902 = comb.mux bin %1036, %valid_3_2, %1901 : i1
    %1903 = comb.mux bin %615, %1021, %1902 : i1
    %1904 = comb.mux bin %622, %valid_3_2, %1903 : i1
    %1905 = comb.xor %1542, %true : i1
    %1906 = comb.or %324, %1905 : i1
    %1907 = comb.and %1906, %valid_3_3 : i1
    %1908 = comb.mux bin %1042, %1230, %1907 : i1
    %1909 = comb.mux bin %1036, %valid_3_3, %1908 : i1
    %1910 = comb.mux bin %615, %1022, %1909 : i1
    %1911 = comb.mux bin %622, %valid_3_3, %1910 : i1
    %1912 = comb.xor %1542, %true : i1
    %1913 = comb.or %324, %1912 : i1
    %1914 = comb.and %1913, %valid_3_4 : i1
    %1915 = comb.mux bin %1042, %1233, %1914 : i1
    %1916 = comb.mux bin %1036, %valid_3_4, %1915 : i1
    %1917 = comb.mux bin %615, %1023, %1916 : i1
    %1918 = comb.mux bin %622, %valid_3_4, %1917 : i1
    %1919 = comb.xor %1542, %true : i1
    %1920 = comb.or %324, %1919 : i1
    %1921 = comb.and %1920, %valid_3_5 : i1
    %1922 = comb.mux bin %1042, %1236, %1921 : i1
    %1923 = comb.mux bin %1036, %valid_3_5, %1922 : i1
    %1924 = comb.mux bin %615, %1024, %1923 : i1
    %1925 = comb.mux bin %622, %valid_3_5, %1924 : i1
    %1926 = comb.xor %1542, %true : i1
    %1927 = comb.or %324, %1926 : i1
    %1928 = comb.and %1927, %valid_3_6 : i1
    %1929 = comb.mux bin %1042, %1239, %1928 : i1
    %1930 = comb.mux bin %1036, %valid_3_6, %1929 : i1
    %1931 = comb.mux bin %615, %1025, %1930 : i1
    %1932 = comb.mux bin %622, %valid_3_6, %1931 : i1
    %1933 = comb.xor %1542, %true : i1
    %1934 = comb.or %324, %1933 : i1
    %1935 = comb.and %1934, %valid_3_7 : i1
    %1936 = comb.mux bin %1042, %1242, %1935 : i1
    %1937 = comb.mux bin %1036, %valid_3_7, %1936 : i1
    %1938 = comb.mux bin %615, %1026, %1937 : i1
    %1939 = comb.mux bin %622, %valid_3_7, %1938 : i1
    %1940 = comb.xor %1542, %true : i1
    %1941 = comb.or %324, %1940 : i1
    %1942 = comb.and %1941, %valid_3_8 : i1
    %1943 = comb.mux bin %1042, %1245, %1942 : i1
    %1944 = comb.mux bin %1036, %valid_3_8, %1943 : i1
    %1945 = comb.mux bin %615, %1027, %1944 : i1
    %1946 = comb.mux bin %622, %valid_3_8, %1945 : i1
    %1947 = comb.xor %1542, %true : i1
    %1948 = comb.or %324, %1947 : i1
    %1949 = comb.and %1948, %valid_3_9 : i1
    %1950 = comb.mux bin %1042, %1248, %1949 : i1
    %1951 = comb.mux bin %1036, %valid_3_9, %1950 : i1
    %1952 = comb.mux bin %615, %1028, %1951 : i1
    %1953 = comb.mux bin %622, %valid_3_9, %1952 : i1
    %1954 = comb.xor %1542, %true : i1
    %1955 = comb.or %324, %1954 : i1
    %1956 = comb.and %1955, %valid_3_10 : i1
    %1957 = comb.mux bin %1042, %1251, %1956 : i1
    %1958 = comb.mux bin %1036, %valid_3_10, %1957 : i1
    %1959 = comb.mux bin %615, %1029, %1958 : i1
    %1960 = comb.mux bin %622, %valid_3_10, %1959 : i1
    %1961 = comb.xor %1542, %true : i1
    %1962 = comb.or %324, %1961 : i1
    %1963 = comb.and %1962, %valid_3_11 : i1
    %1964 = comb.mux bin %1042, %1254, %1963 : i1
    %1965 = comb.mux bin %1036, %valid_3_11, %1964 : i1
    %1966 = comb.mux bin %615, %1030, %1965 : i1
    %1967 = comb.mux bin %622, %valid_3_11, %1966 : i1
    %1968 = comb.xor %1542, %true : i1
    %1969 = comb.or %324, %1968 : i1
    %1970 = comb.and %1969, %valid_3_12 : i1
    %1971 = comb.mux bin %1042, %1257, %1970 : i1
    %1972 = comb.mux bin %1036, %valid_3_12, %1971 : i1
    %1973 = comb.mux bin %615, %1031, %1972 : i1
    %1974 = comb.mux bin %622, %valid_3_12, %1973 : i1
    %1975 = comb.xor %1542, %true : i1
    %1976 = comb.or %324, %1975 : i1
    %1977 = comb.and %1976, %valid_3_13 : i1
    %1978 = comb.mux bin %1042, %1260, %1977 : i1
    %1979 = comb.mux bin %1036, %valid_3_13, %1978 : i1
    %1980 = comb.mux bin %615, %1032, %1979 : i1
    %1981 = comb.mux bin %622, %valid_3_13, %1980 : i1
    %1982 = comb.xor %1542, %true : i1
    %1983 = comb.or %324, %1982 : i1
    %1984 = comb.and %1983, %valid_3_14 : i1
    %1985 = comb.mux bin %1042, %1263, %1984 : i1
    %1986 = comb.mux bin %1036, %valid_3_14, %1985 : i1
    %1987 = comb.mux bin %615, %1033, %1986 : i1
    %1988 = comb.mux bin %622, %valid_3_14, %1987 : i1
    %1989 = comb.xor %1542, %true : i1
    %1990 = comb.or %324, %1989 : i1
    %1991 = comb.and %1990, %valid_3_15 : i1
    %1992 = comb.mux bin %1042, %1266, %1991 : i1
    %1993 = comb.mux bin %1036, %valid_3_15, %1992 : i1
    %1994 = comb.mux bin %615, %1034, %1993 : i1
    %1995 = comb.mux bin %622, %valid_3_15, %1994 : i1
    %1996 = comb.mux bin %187, %c0_i3, %c3_i3 : i3
    %1997 = hw.array_create %state, %1996, %c0_i3, %1052, %1038, %1035, %609, %598 : i3
    %1998 = hw.array_get %1997[%state] : !hw.array<8xi3>, i3
    %1999 = comb.xor %187, %true : i1
    %2000 = comb.xor %1544, %true : i1
    %2001 = comb.and %2000, %1541, %1999 : i1
    %2002 = comb.or %2001, %axiWaddrEn : i1
    %2003 = comb.mux bin %1036, %1040, %2002 : i1
    %2004 = comb.mux bin %1056, %axiWaddrEn, %2003 : i1
    %2005 = comb.mux bin %323, %594, %2004 : i1
    %2006 = comb.xor %1541, %true : i1
    %2007 = comb.or %1545, %2006, %187 : i1
    %2008 = comb.mux bin %2007, %44, %183 : i2
    %2009 = comb.xor %1541, %true : i1
    %2010 = comb.or %1545, %2009, %187 : i1
    %2011 = comb.mux bin %2010, %49, %184 : i4
    hw.output %axiWaddrEn, %538, %axiWdataEn, %542, %543, %axiRaddrEn, %503, %240, %valid_r, %5, %flush_r : i1, i32, i1, i64, i1, i1, i32, i64, i1, i1, i1
  }
  hw.module private @ToAXI(%clock: i1, %reset: i1, %io_dataIO_addr: i32, %io_dataIO_wdata: i64, %io_dataIO_dc_mode: i5, %io_outAxi_wa_ready: i1, %io_outAxi_wd_ready: i1, %io_outAxi_ra_ready: i1, %io_outAxi_rd_valid: i1, %io_outAxi_rd_bits_data: i64) -> (io_dataIO_rdata: i64, io_dataIO_rvalid: i1, io_dataIO_ready: i1, io_outAxi_wa_valid: i1, io_outAxi_wa_bits_addr: i32, io_outAxi_wd_valid: i1, io_outAxi_wd_bits_data: i64, io_outAxi_wd_bits_strb: i8, io_outAxi_ra_valid: i1, io_outAxi_ra_bits_addr: i32, io_outAxi_rd_ready: i1) {
    %true = hw.constant true
    %c0_i58 = hw.constant 0 : i58
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %c0_i185 = hw.constant 0 : i185
    %c11_i5 = hw.constant 11 : i5
    %c10_i5 = hw.constant 10 : i5
    %c9_i5 = hw.constant 9 : i5
    %c8_i5 = hw.constant 8 : i5
    %c0_i48 = hw.constant 0 : i48
    %c0_i56 = hw.constant 0 : i56
    %c0_i127 = hw.constant 0 : i127
    %c0_i12 = hw.constant 0 : i12
    %c0_i7 = hw.constant 0 : i7
    %c0_i32 = hw.constant 0 : i32
    %c0_i5 = hw.constant 0 : i5
    %c1_i3 = hw.constant 1 : i3
    %c3_i3 = hw.constant 3 : i3
    %c2_i3 = hw.constant 2 : i3
    %c15_i8 = hw.constant 15 : i8
    %c3_i8 = hw.constant 3 : i8
    %c1_i8 = hw.constant 1 : i8
    %c-4_i3 = hw.constant -4 : i3
    %c4_i5 = hw.constant 4 : i5
    %c-12_i5 = hw.constant -12 : i5
    %c5_i5 = hw.constant 5 : i5
    %c-11_i5 = hw.constant -11 : i5
    %c6_i5 = hw.constant 6 : i5
    %c-10_i5 = hw.constant -10 : i5
    %c7_i5 = hw.constant 7 : i5
    %c-3_i3 = hw.constant -3 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c0_i64 = hw.constant 0 : i64
    %c0_i8 = hw.constant 0 : i8
    %waddrEn = seq.firreg %43 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %waddr = seq.firreg %4 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1 : ui64} : i32
    %wdataEn = seq.firreg %52 clock %clock reset sync %reset, %false {firrtl.random_init_start = 44 : ui64} : i1
    %wdata = seq.firreg %24 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 45 : ui64} : i64
    %wstrb = seq.firreg %19 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 109 : ui64} : i8
    %raddrEn = seq.firreg %59 clock %clock reset sync %reset, %false {firrtl.random_init_start = 120 : ui64} : i1
    %raddr = seq.firreg %31 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 121 : ui64} : i32
    %rdataEn = seq.firreg %119 clock %clock reset sync %reset, %false {firrtl.random_init_start = 153 : ui64} : i1
    %rdata = seq.firreg %115 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 154 : ui64} : i64
    %pre_addr = seq.firreg %37 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 218 : ui64} : i32
    %mode = seq.firreg %1 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 250 : ui64} : i5
    %state = seq.firreg %122 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 255 : ui64} : i3
    %0 = comb.icmp bin eq %state, %c0_i3 {sv.namehint = "_io_dataIO_ready_T"} : i3
    %1 = comb.mux bin %0, %io_dataIO_dc_mode, %mode : i5
    %2 = comb.extract %io_dataIO_dc_mode from 3 {sv.namehint = "_T_3"} : (i5) -> i1
    %3 = comb.and bin %0, %2 : i1
    %4 = comb.mux bin %3, %io_dataIO_addr, %waddr : i32
    %5 = comb.or %2, %waddrEn : i1
    %6 = comb.icmp bin eq %io_dataIO_dc_mode, %c8_i5 {sv.namehint = "_wtype_T_1"} : i5
    %7 = comb.icmp bin eq %io_dataIO_dc_mode, %c9_i5 {sv.namehint = "_wtype_T_3"} : i5
    %8 = comb.icmp bin eq %io_dataIO_dc_mode, %c10_i5 {sv.namehint = "_wtype_T_5"} : i5
    %9 = comb.icmp bin eq %io_dataIO_dc_mode, %c11_i5 {sv.namehint = "_wtype_T_7"} : i5
    %10 = comb.replicate %9 {sv.namehint = "_wtype_T_11"} : (i1) -> i8
    %11 = comb.mux bin %8, %c15_i8, %10 {sv.namehint = "_wtype_T_12"} : i8
    %12 = comb.mux bin %7, %c3_i8, %11 {sv.namehint = "_wtype_T_13"} : i8
    %13 = comb.mux bin %6, %c1_i8, %12 {sv.namehint = "wtype_1"} : i8
    %14 = comb.extract %io_dataIO_addr from 0 {sv.namehint = "_wdata_T"} : (i32) -> i3
    %15 = comb.concat %c0_i7, %13 : i7, i8
    %16 = comb.concat %c0_i12, %14 : i12, i3
    %17 = comb.shl bin %15, %16 {sv.namehint = "_wstrb_T_1"} : i15
    %18 = comb.extract %17 from 0 : (i15) -> i8
    %19 = comb.mux bin %3, %18, %wstrb : i8
    %20 = comb.concat %c0_i127, %io_dataIO_wdata : i127, i64
    %21 = comb.concat %c0_i185, %14, %c0_i3 : i185, i3, i3
    %22 = comb.shl bin %20, %21 {sv.namehint = "_wdata_T_2"} : i191
    %23 = comb.extract %22 from 0 {sv.namehint = "_wdata_T_3"} : (i191) -> i64
    %24 = comb.mux bin %3, %23, %wdata : i64
    %25 = comb.extract %io_dataIO_dc_mode from 2 {sv.namehint = "_T_5"} : (i5) -> i1
    %26 = comb.mux bin %25, %c-4_i3, %state : i3
    %27 = comb.mux bin %2, %c1_i3, %26 : i3
    %28 = comb.xor %25, %true : i1
    %29 = comb.xor %0, %true : i1
    %30 = comb.or %29, %2, %28 : i1
    %31 = comb.mux bin %30, %raddr, %io_dataIO_addr : i32
    %32 = comb.xor %2, %true : i1
    %33 = comb.and %32, %25 : i1
    %34 = comb.or %33, %raddrEn : i1
    %35 = comb.or bin %2, %25 : i1
    %36 = comb.and bin %0, %35 : i1
    %37 = comb.mux bin %36, %io_dataIO_addr, %pre_addr : i32
    %38 = comb.icmp bin eq %state, %c1_i3 {sv.namehint = "_T_6"} : i3
    %39 = comb.and bin %waddrEn, %io_outAxi_wa_ready {sv.namehint = "_T_7"} : i1
    %40 = comb.and bin %38, %39 : i1
    %41 = comb.xor %40, %true : i1
    %42 = comb.and %41, %waddrEn : i1
    %43 = comb.mux bin %0, %5, %42 : i1
    %44 = comb.mux bin %39, %c2_i3, %state : i3
    %45 = comb.icmp bin eq %state, %c2_i3 {sv.namehint = "_T_8"} : i3
    %46 = comb.mux bin %io_outAxi_wd_ready, %c3_i3, %state : i3
    %47 = comb.icmp bin eq %state, %c3_i3 {sv.namehint = "_T_9"} : i3
    %48 = comb.xor %47, %true : i1
    %49 = comb.and %48, %wdataEn : i1
    %50 = comb.or %45, %49 : i1
    %51 = comb.or bin %0, %38 : i1
    %52 = comb.mux bin %51, %wdataEn, %50 : i1
    %53 = comb.icmp bin eq %state, %c-4_i3 {sv.namehint = "_T_10"} : i3
    %54 = comb.and bin %raddrEn, %io_outAxi_ra_ready {sv.namehint = "_T_11"} : i1
    %55 = comb.and bin %53, %54 : i1
    %56 = comb.xor %55, %true : i1
    %57 = comb.or %38, %45, %47, %56 : i1
    %58 = comb.and %57, %raddrEn : i1
    %59 = comb.mux bin %0, %34, %58 : i1
    %60 = comb.mux bin %54, %c-3_i3, %state : i3
    %61 = comb.icmp bin eq %state, %c-3_i3 {sv.namehint = "_T_12"} : i3
    %62 = comb.and bin %rdataEn, %io_outAxi_rd_valid {sv.namehint = "_T_13"} : i1
    %63 = comb.extract %pre_addr from 0 {sv.namehint = "strb_offset"} : (i32) -> i3
    %64 = comb.icmp bin eq %mode, %c4_i5 {sv.namehint = "_T_14"} : i5
    %65 = comb.concat %c0_i58, %63, %c0_i3 : i58, i3, i3
    %66 = comb.shru bin %io_outAxi_rd_bits_data, %65 {sv.namehint = "_tem_rdata_T_1"} : i64
    %67 = comb.extract %66 from 0 {sv.namehint = "_tem_rdata_T_2"} : (i64) -> i8
    %68 = comb.extract %66 from 7 : (i64) -> i1
    %69 = comb.replicate %68 : (i1) -> i56
    %70 = comb.concat %69, %67 : i56, i8
    %71 = comb.icmp bin eq %mode, %c5_i5 {sv.namehint = "_T_15"} : i5
    %72 = comb.concat %c0_i58, %63, %c0_i3 : i58, i3, i3
    %73 = comb.shru bin %io_outAxi_rd_bits_data, %72 {sv.namehint = "_tem_rdata_T_5"} : i64
    %74 = comb.extract %73 from 0 {sv.namehint = "_tem_rdata_T_6"} : (i64) -> i16
    %75 = comb.extract %73 from 15 : (i64) -> i1
    %76 = comb.replicate %75 : (i1) -> i48
    %77 = comb.concat %76, %74 : i48, i16
    %78 = comb.icmp bin eq %mode, %c6_i5 {sv.namehint = "_T_16"} : i5
    %79 = comb.concat %c0_i58, %63, %c0_i3 : i58, i3, i3
    %80 = comb.shru bin %io_outAxi_rd_bits_data, %79 {sv.namehint = "_tem_rdata_T_9"} : i64
    %81 = comb.extract %80 from 0 {sv.namehint = "_tem_rdata_T_10"} : (i64) -> i32
    %82 = comb.extract %80 from 31 : (i64) -> i1
    %83 = comb.replicate %82 : (i1) -> i32
    %84 = comb.concat %83, %81 : i32, i32
    %85 = comb.mux bin %78, %84, %c0_i64 : i64
    %86 = comb.mux bin %71, %77, %85 : i64
    %87 = comb.mux bin %64, %70, %86 {sv.namehint = "tem_rdata"} : i64
    %88 = comb.icmp bin eq %mode, %c7_i5 {sv.namehint = "_T_17"} : i5
    %89 = comb.icmp bin eq %mode, %c-12_i5 {sv.namehint = "_T_18"} : i5
    %90 = comb.concat %c0_i58, %63, %c0_i3 : i58, i3, i3
    %91 = comb.shru bin %io_outAxi_rd_bits_data, %90 {sv.namehint = "_rdata_T_4"} : i64
    %92 = comb.extract %91 from 0 {sv.namehint = "_rdata_T_5"} : (i64) -> i8
    %93 = comb.concat %c0_i56, %92 : i56, i8
    %94 = comb.icmp bin eq %mode, %c-11_i5 {sv.namehint = "_T_19"} : i5
    %95 = comb.concat %c0_i58, %63, %c0_i3 : i58, i3, i3
    %96 = comb.shru bin %io_outAxi_rd_bits_data, %95 {sv.namehint = "_rdata_T_7"} : i64
    %97 = comb.extract %96 from 0 {sv.namehint = "_rdata_T_8"} : (i64) -> i16
    %98 = comb.concat %c0_i48, %97 : i48, i16
    %99 = comb.icmp bin eq %mode, %c-10_i5 {sv.namehint = "_T_20"} : i5
    %100 = comb.concat %c0_i58, %63, %c0_i3 : i58, i3, i3
    %101 = comb.shru bin %io_outAxi_rd_bits_data, %100 {sv.namehint = "_rdata_T_10"} : i64
    %102 = comb.extract %101 from 0 {sv.namehint = "_rdata_T_11"} : (i64) -> i32
    %103 = comb.concat %c0_i32, %102 : i32, i32
    %104 = comb.mux bin %99, %103, %rdata : i64
    %105 = comb.mux bin %94, %98, %104 : i64
    %106 = comb.mux bin %89, %93, %105 : i64
    %107 = comb.mux bin %88, %io_outAxi_rd_bits_data, %106 : i64
    %108 = comb.or %71, %78 : i1
    %109 = comb.mux bin %108, %87, %107 : i64
    %110 = comb.mux bin %64, %70, %109 : i64
    %111 = comb.and bin %61, %62 : i1
    %112 = comb.or bin %0, %38, %45, %47, %53 : i1
    %113 = comb.xor %111, %true : i1
    %114 = comb.or %112, %113 : i1
    %115 = comb.mux bin %114, %rdata, %110 : i64
    %116 = comb.xor bin %62, %true : i1
    %117 = comb.xor %61, %true : i1
    %118 = comb.or %112, %117 : i1
    %119 = comb.mux bin %118, %rdataEn, %116 : i1
    %120 = comb.mux bin %62, %c-2_i3, %state : i3
    %121 = hw.array_create %state, %c0_i3, %120, %60, %c0_i3, %46, %44, %27 : i3
    %122 = hw.array_get %121[%state] : !hw.array<8xi3>, i3
    %out_rdata = seq.firreg %rdata clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 258 : ui64} : i64
    %out_valid = seq.firreg %125 clock %clock reset sync %reset, %false {firrtl.random_init_start = 322 : ui64} : i1
    %123 = comb.icmp bin eq %state, %c-2_i3 {sv.namehint = "_out_valid_T"} : i3
    %124 = comb.icmp bin eq %state, %c3_i3 {sv.namehint = "_out_valid_T_1"} : i3
    %125 = comb.or bin %123, %124 {sv.namehint = "_out_valid_T_2"} : i1
    hw.output %out_rdata, %out_valid, %0, %waddrEn, %waddr, %wdataEn, %wdata, %wstrb, %raddrEn, %raddr, %rdataEn : i64, i1, i1, i1, i32, i1, i64, i8, i1, i32, i1
  }
  hw.module private @ToAXI_1(%clock: i1, %reset: i1, %io_dataIO_addr: i32, %io_dataIO_dc_mode: i5, %io_outAxi_wa_ready: i1, %io_outAxi_wd_ready: i1, %io_outAxi_ra_ready: i1, %io_outAxi_rd_valid: i1, %io_outAxi_rd_bits_data: i64) -> (io_dataIO_rdata: i64, io_dataIO_rvalid: i1, io_dataIO_ready: i1, io_outAxi_wa_valid: i1, io_outAxi_wa_bits_addr: i32, io_outAxi_wd_valid: i1, io_outAxi_wd_bits_data: i64, io_outAxi_wd_bits_strb: i8, io_outAxi_ra_valid: i1, io_outAxi_ra_bits_addr: i32, io_outAxi_rd_ready: i1) {
    %true = hw.constant true
    %c0_i58 = hw.constant 0 : i58
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %c0_i185 = hw.constant 0 : i185
    %c0_i191 = hw.constant 0 : i191
    %c11_i5 = hw.constant 11 : i5
    %c10_i5 = hw.constant 10 : i5
    %c9_i5 = hw.constant 9 : i5
    %c8_i5 = hw.constant 8 : i5
    %c0_i48 = hw.constant 0 : i48
    %c0_i56 = hw.constant 0 : i56
    %c0_i12 = hw.constant 0 : i12
    %c0_i7 = hw.constant 0 : i7
    %c0_i32 = hw.constant 0 : i32
    %c0_i5 = hw.constant 0 : i5
    %c1_i3 = hw.constant 1 : i3
    %c3_i3 = hw.constant 3 : i3
    %c2_i3 = hw.constant 2 : i3
    %c15_i8 = hw.constant 15 : i8
    %c3_i8 = hw.constant 3 : i8
    %c1_i8 = hw.constant 1 : i8
    %c-4_i3 = hw.constant -4 : i3
    %c4_i5 = hw.constant 4 : i5
    %c-12_i5 = hw.constant -12 : i5
    %c5_i5 = hw.constant 5 : i5
    %c-11_i5 = hw.constant -11 : i5
    %c6_i5 = hw.constant 6 : i5
    %c-10_i5 = hw.constant -10 : i5
    %c7_i5 = hw.constant 7 : i5
    %c-3_i3 = hw.constant -3 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c0_i8 = hw.constant 0 : i8
    %c0_i64 = hw.constant 0 : i64
    %waddrEn = seq.firreg %42 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %waddr = seq.firreg %4 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1 : ui64} : i32
    %wdataEn = seq.firreg %51 clock %clock reset sync %reset, %false {firrtl.random_init_start = 44 : ui64} : i1
    %wdata = seq.firreg %23 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 45 : ui64} : i64
    %wstrb = seq.firreg %19 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 109 : ui64} : i8
    %raddrEn = seq.firreg %58 clock %clock reset sync %reset, %false {firrtl.random_init_start = 120 : ui64} : i1
    %raddr = seq.firreg %30 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 121 : ui64} : i32
    %rdataEn = seq.firreg %118 clock %clock reset sync %reset, %false {firrtl.random_init_start = 153 : ui64} : i1
    %rdata = seq.firreg %114 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 154 : ui64} : i64
    %pre_addr = seq.firreg %36 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 218 : ui64} : i32
    %mode = seq.firreg %1 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 250 : ui64} : i5
    %state = seq.firreg %121 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 255 : ui64} : i3
    %0 = comb.icmp bin eq %state, %c0_i3 {sv.namehint = "_io_dataIO_ready_T"} : i3
    %1 = comb.mux bin %0, %io_dataIO_dc_mode, %mode : i5
    %2 = comb.extract %io_dataIO_dc_mode from 3 {sv.namehint = "_T_3"} : (i5) -> i1
    %3 = comb.and bin %0, %2 : i1
    %4 = comb.mux bin %3, %io_dataIO_addr, %waddr : i32
    %5 = comb.or %2, %waddrEn : i1
    %6 = comb.icmp bin eq %io_dataIO_dc_mode, %c8_i5 {sv.namehint = "_wtype_T_1"} : i5
    %7 = comb.icmp bin eq %io_dataIO_dc_mode, %c9_i5 {sv.namehint = "_wtype_T_3"} : i5
    %8 = comb.icmp bin eq %io_dataIO_dc_mode, %c10_i5 {sv.namehint = "_wtype_T_5"} : i5
    %9 = comb.icmp bin eq %io_dataIO_dc_mode, %c11_i5 {sv.namehint = "_wtype_T_7"} : i5
    %10 = comb.replicate %9 {sv.namehint = "_wtype_T_11"} : (i1) -> i8
    %11 = comb.mux bin %8, %c15_i8, %10 {sv.namehint = "_wtype_T_12"} : i8
    %12 = comb.mux bin %7, %c3_i8, %11 {sv.namehint = "_wtype_T_13"} : i8
    %13 = comb.mux bin %6, %c1_i8, %12 {sv.namehint = "wtype_1"} : i8
    %14 = comb.extract %io_dataIO_addr from 0 {sv.namehint = "_wdata_T"} : (i32) -> i3
    %15 = comb.concat %c0_i7, %13 : i7, i8
    %16 = comb.concat %c0_i12, %14 : i12, i3
    %17 = comb.shl bin %15, %16 {sv.namehint = "_wstrb_T_1"} : i15
    %18 = comb.extract %17 from 0 : (i15) -> i8
    %19 = comb.mux bin %3, %18, %wstrb : i8
    %20 = comb.concat %c0_i185, %14, %c0_i3 : i185, i3, i3
    %21 = comb.shl bin %c0_i191, %20 {sv.namehint = "_wdata_T_2"} : i191
    %22 = comb.extract %21 from 0 {sv.namehint = "_wdata_T_3"} : (i191) -> i64
    %23 = comb.mux bin %3, %22, %wdata : i64
    %24 = comb.extract %io_dataIO_dc_mode from 2 {sv.namehint = "_T_5"} : (i5) -> i1
    %25 = comb.mux bin %24, %c-4_i3, %state : i3
    %26 = comb.mux bin %2, %c1_i3, %25 : i3
    %27 = comb.xor %24, %true : i1
    %28 = comb.xor %0, %true : i1
    %29 = comb.or %28, %2, %27 : i1
    %30 = comb.mux bin %29, %raddr, %io_dataIO_addr : i32
    %31 = comb.xor %2, %true : i1
    %32 = comb.and %31, %24 : i1
    %33 = comb.or %32, %raddrEn : i1
    %34 = comb.or bin %2, %24 : i1
    %35 = comb.and bin %0, %34 : i1
    %36 = comb.mux bin %35, %io_dataIO_addr, %pre_addr : i32
    %37 = comb.icmp bin eq %state, %c1_i3 {sv.namehint = "_T_6"} : i3
    %38 = comb.and bin %waddrEn, %io_outAxi_wa_ready {sv.namehint = "_T_7"} : i1
    %39 = comb.and bin %37, %38 : i1
    %40 = comb.xor %39, %true : i1
    %41 = comb.and %40, %waddrEn : i1
    %42 = comb.mux bin %0, %5, %41 : i1
    %43 = comb.mux bin %38, %c2_i3, %state : i3
    %44 = comb.icmp bin eq %state, %c2_i3 {sv.namehint = "_T_8"} : i3
    %45 = comb.mux bin %io_outAxi_wd_ready, %c3_i3, %state : i3
    %46 = comb.icmp bin eq %state, %c3_i3 {sv.namehint = "_T_9"} : i3
    %47 = comb.xor %46, %true : i1
    %48 = comb.and %47, %wdataEn : i1
    %49 = comb.or %44, %48 : i1
    %50 = comb.or bin %0, %37 : i1
    %51 = comb.mux bin %50, %wdataEn, %49 : i1
    %52 = comb.icmp bin eq %state, %c-4_i3 {sv.namehint = "_T_10"} : i3
    %53 = comb.and bin %raddrEn, %io_outAxi_ra_ready {sv.namehint = "_T_11"} : i1
    %54 = comb.and bin %52, %53 : i1
    %55 = comb.xor %54, %true : i1
    %56 = comb.or %37, %44, %46, %55 : i1
    %57 = comb.and %56, %raddrEn : i1
    %58 = comb.mux bin %0, %33, %57 : i1
    %59 = comb.mux bin %53, %c-3_i3, %state : i3
    %60 = comb.icmp bin eq %state, %c-3_i3 {sv.namehint = "_T_12"} : i3
    %61 = comb.and bin %rdataEn, %io_outAxi_rd_valid {sv.namehint = "_T_13"} : i1
    %62 = comb.extract %pre_addr from 0 {sv.namehint = "strb_offset"} : (i32) -> i3
    %63 = comb.icmp bin eq %mode, %c4_i5 {sv.namehint = "_T_14"} : i5
    %64 = comb.concat %c0_i58, %62, %c0_i3 : i58, i3, i3
    %65 = comb.shru bin %io_outAxi_rd_bits_data, %64 {sv.namehint = "_tem_rdata_T_1"} : i64
    %66 = comb.extract %65 from 0 {sv.namehint = "_tem_rdata_T_2"} : (i64) -> i8
    %67 = comb.extract %65 from 7 : (i64) -> i1
    %68 = comb.replicate %67 : (i1) -> i56
    %69 = comb.concat %68, %66 : i56, i8
    %70 = comb.icmp bin eq %mode, %c5_i5 {sv.namehint = "_T_15"} : i5
    %71 = comb.concat %c0_i58, %62, %c0_i3 : i58, i3, i3
    %72 = comb.shru bin %io_outAxi_rd_bits_data, %71 {sv.namehint = "_tem_rdata_T_5"} : i64
    %73 = comb.extract %72 from 0 {sv.namehint = "_tem_rdata_T_6"} : (i64) -> i16
    %74 = comb.extract %72 from 15 : (i64) -> i1
    %75 = comb.replicate %74 : (i1) -> i48
    %76 = comb.concat %75, %73 : i48, i16
    %77 = comb.icmp bin eq %mode, %c6_i5 {sv.namehint = "_T_16"} : i5
    %78 = comb.concat %c0_i58, %62, %c0_i3 : i58, i3, i3
    %79 = comb.shru bin %io_outAxi_rd_bits_data, %78 {sv.namehint = "_tem_rdata_T_9"} : i64
    %80 = comb.extract %79 from 0 {sv.namehint = "_tem_rdata_T_10"} : (i64) -> i32
    %81 = comb.extract %79 from 31 : (i64) -> i1
    %82 = comb.replicate %81 : (i1) -> i32
    %83 = comb.concat %82, %80 : i32, i32
    %84 = comb.mux bin %77, %83, %c0_i64 : i64
    %85 = comb.mux bin %70, %76, %84 : i64
    %86 = comb.mux bin %63, %69, %85 {sv.namehint = "tem_rdata"} : i64
    %87 = comb.icmp bin eq %mode, %c7_i5 {sv.namehint = "_T_17"} : i5
    %88 = comb.icmp bin eq %mode, %c-12_i5 {sv.namehint = "_T_18"} : i5
    %89 = comb.concat %c0_i58, %62, %c0_i3 : i58, i3, i3
    %90 = comb.shru bin %io_outAxi_rd_bits_data, %89 {sv.namehint = "_rdata_T_4"} : i64
    %91 = comb.extract %90 from 0 {sv.namehint = "_rdata_T_5"} : (i64) -> i8
    %92 = comb.concat %c0_i56, %91 : i56, i8
    %93 = comb.icmp bin eq %mode, %c-11_i5 {sv.namehint = "_T_19"} : i5
    %94 = comb.concat %c0_i58, %62, %c0_i3 : i58, i3, i3
    %95 = comb.shru bin %io_outAxi_rd_bits_data, %94 {sv.namehint = "_rdata_T_7"} : i64
    %96 = comb.extract %95 from 0 {sv.namehint = "_rdata_T_8"} : (i64) -> i16
    %97 = comb.concat %c0_i48, %96 : i48, i16
    %98 = comb.icmp bin eq %mode, %c-10_i5 {sv.namehint = "_T_20"} : i5
    %99 = comb.concat %c0_i58, %62, %c0_i3 : i58, i3, i3
    %100 = comb.shru bin %io_outAxi_rd_bits_data, %99 {sv.namehint = "_rdata_T_10"} : i64
    %101 = comb.extract %100 from 0 {sv.namehint = "_rdata_T_11"} : (i64) -> i32
    %102 = comb.concat %c0_i32, %101 : i32, i32
    %103 = comb.mux bin %98, %102, %rdata : i64
    %104 = comb.mux bin %93, %97, %103 : i64
    %105 = comb.mux bin %88, %92, %104 : i64
    %106 = comb.mux bin %87, %io_outAxi_rd_bits_data, %105 : i64
    %107 = comb.or %70, %77 : i1
    %108 = comb.mux bin %107, %86, %106 : i64
    %109 = comb.mux bin %63, %69, %108 : i64
    %110 = comb.and bin %60, %61 : i1
    %111 = comb.or bin %0, %37, %44, %46, %52 : i1
    %112 = comb.xor %110, %true : i1
    %113 = comb.or %111, %112 : i1
    %114 = comb.mux bin %113, %rdata, %109 : i64
    %115 = comb.xor bin %61, %true : i1
    %116 = comb.xor %60, %true : i1
    %117 = comb.or %111, %116 : i1
    %118 = comb.mux bin %117, %rdataEn, %115 : i1
    %119 = comb.mux bin %61, %c-2_i3, %state : i3
    %120 = hw.array_create %state, %c0_i3, %119, %59, %c0_i3, %45, %43, %26 : i3
    %121 = hw.array_get %120[%state] : !hw.array<8xi3>, i3
    %out_rdata = seq.firreg %rdata clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 258 : ui64} : i64
    %out_valid = seq.firreg %124 clock %clock reset sync %reset, %false {firrtl.random_init_start = 322 : ui64} : i1
    %122 = comb.icmp bin eq %state, %c-2_i3 {sv.namehint = "_out_valid_T"} : i3
    %123 = comb.icmp bin eq %state, %c3_i3 {sv.namehint = "_out_valid_T_1"} : i3
    %124 = comb.or bin %122, %123 {sv.namehint = "_out_valid_T_2"} : i1
    hw.output %out_rdata, %out_valid, %0, %waddrEn, %waddr, %wdataEn, %wdata, %wstrb, %raddrEn, %raddr, %rdataEn : i64, i1, i1, i1, i32, i1, i64, i8, i1, i32, i1
  }
  hw.module private @CrossBar(%clock: i1, %reset: i1, %io_icAxi_ra_valid: i1, %io_icAxi_ra_bits_addr: i32, %io_flashAxi_wa_valid: i1, %io_flashAxi_wa_bits_addr: i32, %io_flashAxi_wd_valid: i1, %io_flashAxi_wd_bits_data: i64, %io_flashAxi_wd_bits_strb: i8, %io_flashAxi_ra_valid: i1, %io_flashAxi_ra_bits_addr: i32, %io_flashAxi_rd_ready: i1, %io_memAxi_wa_valid: i1, %io_memAxi_wa_bits_addr: i32, %io_memAxi_wd_valid: i1, %io_memAxi_wd_bits_data: i64, %io_memAxi_wd_bits_last: i1, %io_memAxi_ra_valid: i1, %io_memAxi_ra_bits_addr: i32, %io_mmioAxi_wa_valid: i1, %io_mmioAxi_wa_bits_addr: i32, %io_mmioAxi_wd_valid: i1, %io_mmioAxi_wd_bits_data: i64, %io_mmioAxi_wd_bits_strb: i8, %io_mmioAxi_ra_valid: i1, %io_mmioAxi_ra_bits_addr: i32, %io_mmioAxi_rd_ready: i1, %io_outAxi_wa_ready: i1, %io_outAxi_wd_ready: i1, %io_outAxi_ra_ready: i1, %io_outAxi_rd_valid: i1, %io_outAxi_rd_bits_data: i64, %io_outAxi_rd_bits_last: i1, %io_selectMem: i1) -> (io_icAxi_ra_ready: i1, io_icAxi_rd_valid: i1, io_icAxi_rd_bits_data: i64, io_icAxi_rd_bits_last: i1, io_flashAxi_wa_ready: i1, io_flashAxi_wd_ready: i1, io_flashAxi_ra_ready: i1, io_flashAxi_rd_valid: i1, io_flashAxi_rd_bits_data: i64, io_memAxi_wa_ready: i1, io_memAxi_wd_ready: i1, io_memAxi_ra_ready: i1, io_memAxi_rd_valid: i1, io_memAxi_rd_bits_data: i64, io_memAxi_rd_bits_last: i1, io_mmioAxi_wa_ready: i1, io_mmioAxi_wd_ready: i1, io_mmioAxi_ra_ready: i1, io_mmioAxi_rd_valid: i1, io_mmioAxi_rd_bits_data: i64, io_outAxi_wa_valid: i1, io_outAxi_wa_bits_addr: i32, io_outAxi_wa_bits_len: i8, io_outAxi_wd_valid: i1, io_outAxi_wd_bits_data: i64, io_outAxi_wd_bits_strb: i8, io_outAxi_wd_bits_last: i1, io_outAxi_ra_valid: i1, io_outAxi_ra_bits_addr: i32, io_outAxi_ra_bits_len: i8, io_outAxi_rd_ready: i1) {
    %true = hw.constant true
    %c1_i4 = hw.constant 1 : i4
    %c7_i4 = hw.constant 7 : i4
    %c5_i4 = hw.constant 5 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c4_i4 = hw.constant 4 : i4
    %c6_i4 = hw.constant 6 : i4
    %c-8_i4 = hw.constant -8 : i4
    %false = hw.constant false
    %c0_i4 = hw.constant 0 : i4
    %c0_i32 = hw.constant 0 : i32
    %c0_i8 = hw.constant 0 : i8
    %c0_i64 = hw.constant 0 : i64
    %c7_i8 = hw.constant 7 : i8
    %c-1_i8 = hw.constant -1 : i8
    %state = seq.firreg %212 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 0 : ui64} : i4
    %selectMem_r = seq.firreg %85 clock %clock reset sync %reset, %false {firrtl.random_init_start = 4 : ui64} : i1
    %0 = comb.and bin %io_memAxi_ra_valid, %71 {sv.namehint = "_memTrans_T"} : i1
    %1 = comb.and bin %io_memAxi_wa_valid, %79 {sv.namehint = "_memTrans_T_1"} : i1
    %2 = comb.or bin %0, %1 {sv.namehint = "memTrans"} : i1
    %3 = comb.and bin %67, %60 {sv.namehint = "_memDone_T_1"} : i1
    %4 = comb.and bin %io_memAxi_wd_valid, %75, %io_memAxi_wd_bits_last {sv.namehint = "_memDone_T_3"} : i1
    %5 = comb.or bin %3, %4 {sv.namehint = "memDone"} : i1
    %6 = comb.and bin %io_icAxi_ra_valid, %99 {sv.namehint = "instTrans"} : i1
    %7 = comb.and bin %97, %92 {sv.namehint = "instDone"} : i1
    %8 = comb.and bin %io_flashAxi_ra_valid, %114 {sv.namehint = "flashTrans"} : i1
    %9 = comb.and %112, %io_flashAxi_rd_ready, %107, %104, %io_outAxi_rd_bits_last {sv.namehint = "flashDone"} : i1
    %10 = comb.and bin %io_mmioAxi_ra_valid, %154 {sv.namehint = "_mmioTrans_T"} : i1
    %11 = comb.and bin %io_mmioAxi_wa_valid, %202 {sv.namehint = "_mmioTrans_T_1"} : i1
    %12 = comb.or bin %10, %11 {sv.namehint = "mmioTrans"} : i1
    %13 = comb.and %130, %io_mmioAxi_rd_ready, %125, %123, %io_outAxi_rd_bits_last {sv.namehint = "_mmioDone_T_1"} : i1
    %14 = comb.and bin %io_mmioAxi_wd_valid, %183 {sv.namehint = "_mmioDone_T_2"} : i1
    %15 = comb.or bin %13, %14 {sv.namehint = "mmioDone"} : i1
    %16 = comb.icmp bin eq %state, %c0_i4 {sv.namehint = "_T"} : i4
    %17 = comb.or %io_selectMem, %selectMem_r : i1
    %18 = comb.or bin %io_mmioAxi_ra_valid, %io_mmioAxi_wa_valid {sv.namehint = "_T_2"} : i1
    %19 = comb.mux bin %io_icAxi_ra_valid, %c2_i4, %state : i4
    %20 = comb.mux bin %io_flashAxi_ra_valid, %c5_i4, %19 : i4
    %21 = comb.mux bin %18, %c7_i4, %20 : i4
    %22 = comb.or bin %io_selectMem, %io_memAxi_ra_valid, %io_memAxi_wa_valid : i1
    %23 = comb.mux bin %22, %c1_i4, %21 : i4
    %24 = comb.icmp bin eq %state, %c1_i4 {sv.namehint = "_T_3"} : i4
    %25 = comb.xor bin %io_selectMem, %true {sv.namehint = "_T_4"} : i1
    %26 = comb.and bin %selectMem_r, %25 {sv.namehint = "_T_5"} : i1
    %27 = comb.xor %26, %true : i1
    %28 = comb.and %27, %selectMem_r : i1
    %29 = comb.xor %26, %true : i1
    %30 = comb.and %29, %io_outAxi_rd_bits_last : i1
    %31 = comb.mux bin %26, %c0_i64, %io_outAxi_rd_bits_data : i64
    %32 = comb.xor %26, %true : i1
    %33 = comb.and %32, %io_outAxi_rd_valid : i1
    %34 = comb.xor bin %26, %true : i1
    %35 = comb.mux bin %26, %c0_i8, %c7_i8 : i8
    %36 = comb.mux bin %26, %c0_i32, %io_memAxi_ra_bits_addr : i32
    %37 = comb.xor %26, %true : i1
    %38 = comb.and %37, %io_memAxi_ra_valid : i1
    %39 = comb.xor %26, %true : i1
    %40 = comb.and %39, %io_outAxi_ra_ready : i1
    %41 = comb.xor %26, %true : i1
    %42 = comb.and %41, %io_memAxi_wd_bits_last : i1
    %43 = comb.mux bin %26, %c0_i8, %c-1_i8 : i8
    %44 = comb.mux bin %26, %c0_i64, %io_memAxi_wd_bits_data : i64
    %45 = comb.xor %26, %true : i1
    %46 = comb.and %45, %io_memAxi_wd_valid : i1
    %47 = comb.xor %26, %true : i1
    %48 = comb.and %47, %io_outAxi_wd_ready : i1
    %49 = comb.mux bin %26, %c0_i32, %io_memAxi_wa_bits_addr : i32
    %50 = comb.xor %26, %true : i1
    %51 = comb.and %50, %io_memAxi_wa_valid : i1
    %52 = comb.xor %26, %true : i1
    %53 = comb.and %52, %io_outAxi_wa_ready : i1
    %54 = comb.mux bin %2, %c3_i4, %state : i4
    %55 = comb.mux bin %26, %c0_i4, %54 : i4
    %56 = comb.icmp bin eq %state, %c3_i4 {sv.namehint = "_T_6"} : i4
    %57 = comb.and %56, %io_outAxi_rd_bits_last : i1
    %58 = comb.mux bin %24, %30, %57 : i1
    %59 = comb.xor %16, %true : i1
    %60 = comb.and %59, %58 {sv.namehint = ".io_memAxi_rd_bits_last.output"} : i1
    %61 = comb.mux bin %56, %io_outAxi_rd_bits_data, %c0_i64 : i64
    %62 = comb.mux bin %24, %31, %61 : i64
    %63 = comb.mux bin %16, %c0_i64, %62 : i64
    %64 = comb.and %56, %io_outAxi_rd_valid : i1
    %65 = comb.mux bin %24, %33, %64 : i1
    %66 = comb.xor %16, %true : i1
    %67 = comb.and %66, %65 {sv.namehint = ".io_memAxi_rd_valid.output"} : i1
    %68 = comb.and %56, %io_outAxi_ra_ready : i1
    %69 = comb.mux bin %24, %40, %68 : i1
    %70 = comb.xor %16, %true : i1
    %71 = comb.and %70, %69 {sv.namehint = ".io_memAxi_ra_ready.output"} : i1
    %72 = comb.and %56, %io_outAxi_wd_ready : i1
    %73 = comb.mux bin %24, %48, %72 : i1
    %74 = comb.xor %16, %true : i1
    %75 = comb.and %74, %73 {sv.namehint = ".io_memAxi_wd_ready.output"} : i1
    %76 = comb.and %56, %io_outAxi_wa_ready : i1
    %77 = comb.mux bin %24, %53, %76 : i1
    %78 = comb.xor %16, %true : i1
    %79 = comb.and %78, %77 {sv.namehint = ".io_memAxi_wa_ready.output"} : i1
    %80 = comb.mux bin %5, %c0_i4, %state : i4
    %81 = comb.and bin %56, %5 : i1
    %82 = comb.xor %81, %true : i1
    %83 = comb.and %82, %selectMem_r : i1
    %84 = comb.mux bin %24, %28, %83 : i1
    %85 = comb.mux bin %16, %17, %84 : i1
    %86 = comb.icmp bin eq %state, %c2_i4 {sv.namehint = "_T_7"} : i4
    %87 = comb.mux bin %6, %c4_i4, %state : i4
    %88 = comb.icmp bin eq %state, %c4_i4 {sv.namehint = "_T_8"} : i4
    %89 = comb.or bin %86, %88 : i1
    %90 = comb.or bin %16, %24, %56 : i1
    %91 = comb.xor %90, %true : i1
    %92 = comb.and %91, %89, %io_outAxi_rd_bits_last {sv.namehint = ".io_icAxi_rd_bits_last.output"} : i1
    %93 = comb.xor %89, %true : i1
    %94 = comb.or %90, %93 : i1
    %95 = comb.mux bin %94, %c0_i64, %io_outAxi_rd_bits_data : i64
    %96 = comb.xor %90, %true : i1
    %97 = comb.and %96, %89, %io_outAxi_rd_valid {sv.namehint = ".io_icAxi_rd_valid.output"} : i1
    %98 = comb.xor %90, %true : i1
    %99 = comb.and %98, %89, %io_outAxi_ra_ready {sv.namehint = ".io_icAxi_ra_ready.output"} : i1
    %100 = comb.mux bin %7, %c0_i4, %state : i4
    %101 = comb.icmp bin eq %state, %c5_i4 {sv.namehint = "_T_9"} : i4
    %102 = comb.mux bin %8, %c6_i4, %state : i4
    %103 = comb.icmp bin eq %state, %c6_i4 {sv.namehint = "_T_10"} : i4
    %104 = comb.or bin %101, %103 : i1
    %105 = comb.or bin %56, %89 : i1
    %106 = comb.or bin %16, %24, %105 : i1
    %107 = comb.xor %106, %true : i1
    %108 = comb.xor %104, %true : i1
    %109 = comb.or %106, %108 : i1
    %110 = comb.mux bin %109, %c0_i64, %io_outAxi_rd_bits_data : i64
    %111 = comb.xor %106, %true : i1
    %112 = comb.and %111, %104, %io_outAxi_rd_valid {sv.namehint = ".io_flashAxi_rd_valid.output"} : i1
    %113 = comb.xor %106, %true : i1
    %114 = comb.and %113, %104, %io_outAxi_ra_ready {sv.namehint = ".io_flashAxi_ra_ready.output"} : i1
    %115 = comb.xor %106, %true : i1
    %116 = comb.and %115, %104, %io_outAxi_wd_ready : i1
    %117 = comb.xor %106, %true : i1
    %118 = comb.and %117, %104, %io_outAxi_wa_ready : i1
    %119 = comb.mux bin %9, %c0_i4, %state : i4
    %120 = comb.icmp bin eq %state, %c7_i4 {sv.namehint = "_T_11"} : i4
    %121 = comb.mux bin %12, %c-8_i4, %state : i4
    %122 = comb.icmp bin eq %state, %c-8_i4 {sv.namehint = "_T_12"} : i4
    %123 = comb.or bin %120, %122 : i1
    %124 = comb.or bin %16, %24, %56, %86, %88, %104 : i1
    %125 = comb.xor %124, %true : i1
    %126 = comb.xor %123, %true : i1
    %127 = comb.or %124, %126 : i1
    %128 = comb.mux bin %127, %c0_i64, %io_outAxi_rd_bits_data : i64
    %129 = comb.xor %124, %true : i1
    %130 = comb.and %129, %123, %io_outAxi_rd_valid {sv.namehint = ".io_mmioAxi_rd_valid.output"} : i1
    %131 = comb.and %123, %io_mmioAxi_rd_ready : i1
    %132 = comb.mux bin %104, %io_flashAxi_rd_ready, %131 : i1
    %133 = comb.or %105, %132 : i1
    %134 = comb.mux bin %24, %34, %133 : i1
    %135 = comb.xor %16, %true : i1
    %136 = comb.and %135, %134 : i1
    %137 = comb.mux bin %105, %c7_i8, %c0_i8 : i8
    %138 = comb.mux bin %24, %35, %137 : i8
    %139 = comb.mux bin %16, %c0_i8, %138 : i8
    %140 = comb.mux bin %123, %io_mmioAxi_ra_bits_addr, %c0_i32 : i32
    %141 = comb.mux bin %104, %io_flashAxi_ra_bits_addr, %140 : i32
    %142 = comb.mux bin %89, %io_icAxi_ra_bits_addr, %141 : i32
    %143 = comb.mux bin %56, %io_memAxi_ra_bits_addr, %142 : i32
    %144 = comb.mux bin %24, %36, %143 : i32
    %145 = comb.mux bin %16, %c0_i32, %144 : i32
    %146 = comb.and %123, %io_mmioAxi_ra_valid : i1
    %147 = comb.mux bin %104, %io_flashAxi_ra_valid, %146 : i1
    %148 = comb.mux bin %89, %io_icAxi_ra_valid, %147 : i1
    %149 = comb.mux bin %56, %io_memAxi_ra_valid, %148 : i1
    %150 = comb.mux bin %24, %38, %149 : i1
    %151 = comb.xor %16, %true : i1
    %152 = comb.and %151, %150 : i1
    %153 = comb.xor %124, %true : i1
    %154 = comb.and %153, %123, %io_outAxi_ra_ready {sv.namehint = ".io_mmioAxi_ra_ready.output"} : i1
    %155 = comb.or %104, %123 : i1
    %156 = comb.xor %89, %true : i1
    %157 = comb.and %156, %155 : i1
    %158 = comb.mux bin %56, %io_memAxi_wd_bits_last, %157 : i1
    %159 = comb.mux bin %24, %42, %158 : i1
    %160 = comb.xor %16, %true : i1
    %161 = comb.and %160, %159 : i1
    %162 = comb.mux bin %123, %io_mmioAxi_wd_bits_strb, %c0_i8 : i8
    %163 = comb.mux bin %104, %io_flashAxi_wd_bits_strb, %162 : i8
    %164 = comb.mux bin %89, %c0_i8, %163 : i8
    %165 = comb.mux bin %56, %c-1_i8, %164 : i8
    %166 = comb.mux bin %24, %43, %165 : i8
    %167 = comb.mux bin %16, %c0_i8, %166 : i8
    %168 = comb.mux bin %123, %io_mmioAxi_wd_bits_data, %c0_i64 : i64
    %169 = comb.mux bin %104, %io_flashAxi_wd_bits_data, %168 : i64
    %170 = comb.mux bin %89, %c0_i64, %169 : i64
    %171 = comb.mux bin %56, %io_memAxi_wd_bits_data, %170 : i64
    %172 = comb.mux bin %24, %44, %171 : i64
    %173 = comb.mux bin %16, %c0_i64, %172 : i64
    %174 = comb.and %123, %io_mmioAxi_wd_valid : i1
    %175 = comb.mux bin %104, %io_flashAxi_wd_valid, %174 : i1
    %176 = comb.xor %89, %true : i1
    %177 = comb.and %176, %175 : i1
    %178 = comb.mux bin %56, %io_memAxi_wd_valid, %177 : i1
    %179 = comb.mux bin %24, %46, %178 : i1
    %180 = comb.xor %16, %true : i1
    %181 = comb.and %180, %179 : i1
    %182 = comb.xor %124, %true : i1
    %183 = comb.and %182, %123, %io_outAxi_wd_ready {sv.namehint = ".io_mmioAxi_wd_ready.output"} : i1
    %184 = comb.mux bin %56, %c7_i8, %c0_i8 : i8
    %185 = comb.mux bin %24, %35, %184 : i8
    %186 = comb.mux bin %16, %c0_i8, %185 : i8
    %187 = comb.mux bin %123, %io_mmioAxi_wa_bits_addr, %c0_i32 : i32
    %188 = comb.mux bin %104, %io_flashAxi_wa_bits_addr, %187 : i32
    %189 = comb.mux bin %89, %c0_i32, %188 : i32
    %190 = comb.mux bin %56, %io_memAxi_wa_bits_addr, %189 : i32
    %191 = comb.mux bin %24, %49, %190 : i32
    %192 = comb.mux bin %16, %c0_i32, %191 : i32
    %193 = comb.and %123, %io_mmioAxi_wa_valid : i1
    %194 = comb.mux bin %104, %io_flashAxi_wa_valid, %193 : i1
    %195 = comb.xor %89, %true : i1
    %196 = comb.and %195, %194 : i1
    %197 = comb.mux bin %56, %io_memAxi_wa_valid, %196 : i1
    %198 = comb.mux bin %24, %51, %197 : i1
    %199 = comb.xor %16, %true : i1
    %200 = comb.and %199, %198 : i1
    %201 = comb.xor %124, %true : i1
    %202 = comb.and %201, %123, %io_outAxi_wa_ready {sv.namehint = ".io_mmioAxi_wa_ready.output"} : i1
    %203 = comb.and bin %122, %15 : i1
    %204 = comb.mux bin %203, %c0_i4, %state : i4
    %205 = comb.mux bin %120, %121, %204 : i4
    %206 = comb.mux bin %103, %119, %205 : i4
    %207 = comb.mux bin %101, %102, %206 : i4
    %208 = comb.mux bin %88, %100, %207 : i4
    %209 = comb.mux bin %86, %87, %208 : i4
    %210 = comb.mux bin %56, %80, %209 : i4
    %211 = comb.mux bin %24, %55, %210 : i4
    %212 = comb.mux bin %16, %23, %211 : i4
    hw.output %99, %97, %95, %92, %118, %116, %114, %112, %110, %79, %75, %71, %67, %63, %60, %202, %183, %154, %130, %128, %200, %192, %186, %181, %173, %167, %161, %152, %145, %139, %136 : i1, i1, i64, i1, i1, i1, i1, i1, i64, i1, i1, i1, i1, i64, i1, i1, i1, i1, i1, i64, i1, i32, i8, i1, i64, i8, i1, i1, i32, i8, i1
  }
  hw.module private @FetchCrossBar(%clock: i1, %reset: i1, %io_instIO_addr: i32, %io_instIO_arvalid: i1, %io_icRead_inst: i64, %io_icRead_rvalid: i1, %io_flashRead_rdata: i64, %io_flashRead_rvalid: i1) -> (io_instIO_inst: i64, io_instIO_rvalid: i1, io_icRead_addr: i32, io_icRead_arvalid: i1, io_flashRead_addr: i32, io_flashRead_dc_mode: i5) {
    %true = hw.constant true
    %false = hw.constant false
    %c7_i5 = hw.constant 7 : i5
    %c0_i5 = hw.constant 0 : i5
    %pre_mem = seq.firreg %1 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %0 = comb.extract %io_instIO_addr from 31 {sv.namehint = "inp_mem"} : (i32) -> i1
    %1 = comb.mux bin %io_instIO_arvalid, %0, %pre_mem : i1
    %2 = comb.and %io_instIO_arvalid, %0 : i1
    %3 = comb.xor %io_instIO_arvalid, %true : i1
    %4 = comb.or %3, %0 : i1
    %5 = comb.mux bin %4, %c0_i5, %c7_i5 : i5
    %6 = comb.mux bin %pre_mem, %io_icRead_inst, %io_flashRead_rdata : i64
    %7 = comb.mux bin %pre_mem, %io_icRead_rvalid, %io_flashRead_rvalid : i1
    hw.output %6, %7, %io_instIO_addr, %2, %io_instIO_addr, %5 : i64, i1, i32, i1, i32, i5
  }
  hw.module private @Splite64to32(%clock: i1, %reset: i1, %io_data_in_addr: i32, %io_data_in_dc_mode: i5, %io_data_out_rdata: i64, %io_data_out_rvalid: i1, %io_data_out_ready: i1) -> (io_data_in_rdata: i64, io_data_in_rvalid: i1, io_data_out_addr: i32, io_data_out_dc_mode: i5) {
    %true = hw.constant true
    %c4_i32 = hw.constant 4 : i32
    %false = hw.constant false
    %c0_i3 = hw.constant 0 : i3
    %c-10_i5 = hw.constant -10 : i5
    %c0_i5 = hw.constant 0 : i5
    %c0_i32 = hw.constant 0 : i32
    %data_buf = seq.firreg %30 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 0 : ui64} : i32
    %addr_r = seq.firreg %17 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 32 : ui64} : i32
    %is_64 = seq.firreg %22 clock %clock reset sync %reset, %false {firrtl.random_init_start = 64 : ui64} : i1
    %busy = seq.firreg %26 clock %clock reset sync %reset, %false {firrtl.random_init_start = 65 : ui64} : i1
    %state = seq.firreg %38 clock %clock reset sync %reset, %false {firrtl.random_init_start = 66 : ui64} : i1
    %0 = comb.extract %34 from 4 : (i5) -> i1
    %1 = comb.extract %34 from 1 : (i5) -> i2
    %2 = comb.concat %0, %1 : i1, i2
    %3 = comb.icmp bin ne %2, %c0_i3 {sv.namehint = "_hs_out_T"} : i3
    %4 = comb.and bin %3, %io_data_out_ready {sv.namehint = "hs_out"} : i1
    %5 = comb.extract %io_data_out_rdata from 0 {sv.namehint = "io_data_in_rdata_hi"} : (i64) -> i32
    %6 = comb.concat %5, %data_buf {sv.namehint = "_io_data_in_rdata_T"} : i32, i32
    %7 = comb.mux bin %is_64, %6, %io_data_out_rdata {sv.namehint = "_io_data_in_rdata_T_1"} : i64
    %8 = comb.xor bin %state, %true {sv.namehint = "_T"} : i1
    %9 = comb.icmp bin ne %io_data_in_dc_mode, %c0_i5 {sv.namehint = "_T_1"} : i5
    %10 = comb.extract %io_data_in_addr from 3 {sv.namehint = "io_data_out_addr_hi"} : (i32) -> i29
    %11 = comb.concat %10, %c0_i3 {sv.namehint = "_io_data_out_addr_T"} : i29, i3
    %12 = comb.mux bin %9, %11, %c0_i32 : i32
    %13 = comb.and bin %9, %4 : i1
    %14 = comb.or %13, %state : i1
    %15 = comb.concat %10, %c0_i3 {sv.namehint = "_addr_r_T"} : i29, i3
    %16 = comb.and bin %8, %13 : i1
    %17 = comb.mux bin %16, %15, %addr_r : i32
    %18 = comb.xor %4, %true : i1
    %19 = comb.and %18, %is_64 : i1
    %20 = comb.or %4, %19 : i1
    %21 = comb.and bin %8, %9 : i1
    %22 = comb.mux bin %21, %20, %is_64 : i1
    %23 = comb.xor %27, %true : i1
    %24 = comb.and %23, %busy : i1
    %25 = comb.or %9, %24 : i1
    %26 = comb.mux bin %state, %busy, %25 : i1
    %27 = comb.and %8, %busy, %io_data_out_rvalid {sv.namehint = ".io_data_in_rvalid.output"} : i1
    %28 = comb.extract %io_data_out_rdata from 0 : (i64) -> i32
    %29 = comb.and %state, %io_data_out_rvalid : i1
    %30 = comb.mux bin %29, %28, %data_buf : i32
    %31 = comb.add %addr_r, %c4_i32 {sv.namehint = "_io_data_out_addr_T_2"} : i32
    %32 = comb.mux bin %state, %31, %12 : i32
    %33 = comb.or %state, %9 : i1
    %34 = comb.mux bin %33, %c-10_i5, %c0_i5 {sv.namehint = ".io_data_out_dc_mode.output"} : i5
    %35 = comb.and bin %state, %4 : i1
    %36 = comb.xor %35, %true : i1
    %37 = comb.and %36, %state : i1
    %38 = comb.mux bin %state, %37, %14 : i1
    hw.output %7, %27, %32, %34 : i64, i1, i32, i5
  }
  hw.module private @MemCrossBar(%clock: i1, %reset: i1, %io_dataRW_addr: i32, %io_dataRW_wdata: i64, %io_dataRW_dc_mode: i5, %io_dataRW_amo: i5, %io_mmio_rdata: i64, %io_mmio_rvalid: i1, %io_mmio_ready: i1, %io_dcRW_rdata: i64, %io_dcRW_rvalid: i1, %io_dcRW_ready: i1, %io_clintIO_rdata: i64, %io_plicIO_rdata: i64) -> (io_dataRW_rdata: i64, io_dataRW_rvalid: i1, io_dataRW_ready: i1, io_mmio_addr: i32, io_mmio_wdata: i64, io_mmio_dc_mode: i5, io_dcRW_addr: i32, io_dcRW_wdata: i64, io_dcRW_dc_mode: i5, io_dcRW_amo: i5, io_clintIO_addr: i32, io_clintIO_wdata: i64, io_clintIO_wvalid: i1, io_plicIO_addr: i32, io_plicIO_wdata: i64, io_plicIO_wvalid: i1, io_plicIO_arvalid: i1) {
    %true = hw.constant true
    %false = hw.constant false
    %c268435456_i32 = hw.constant 268435456 : i32
    %c201326591_i32 = hw.constant 201326591 : i32
    %c33603576_i32 = hw.constant 33603576 : i32
    %c33570816_i32 = hw.constant 33570816 : i32
    %c33554432_i32 = hw.constant 33554432 : i32
    %c-1879048192_i32 = hw.constant -1879048192 : i32
    %c0_i5 = hw.constant 0 : i5
    %c-2_i2 = hw.constant -2 : i2
    %c-1_i2 = hw.constant -1 : i2
    %c1_i2 = hw.constant 1 : i2
    %c0_i2 = hw.constant 0 : i2
    %c0_i64 = hw.constant 0 : i64
    %pre_type = seq.firreg %32 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 0 : ui64} : i2
    %data_r = seq.firreg %21 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 2 : ui64} : i64
    %data_valid = seq.firreg %44 clock %clock reset sync %reset, %false {firrtl.random_init_start = 66 : ui64} : i1
    %0 = comb.icmp bin eq %io_dataRW_addr, %c33603576_i32 {sv.namehint = "_is_clint_T"} : i32
    %1 = comb.icmp bin eq %io_dataRW_addr, %c33570816_i32 {sv.namehint = "_is_clint_T_1"} : i32
    %2 = comb.icmp bin eq %io_dataRW_addr, %c33554432_i32 {sv.namehint = "_is_clint_T_3"} : i32
    %3 = comb.or bin %0, %1, %2 {sv.namehint = "is_clint"} : i1
    %4 = comb.icmp bin ugt %io_dataRW_addr, %c201326591_i32 {sv.namehint = "_is_plic_T"} : i32
    %5 = comb.icmp bin ult %io_dataRW_addr, %c268435456_i32 {sv.namehint = "_is_plic_T_3"} : i32
    %6 = comb.and bin %4, %5 {sv.namehint = "is_plic"} : i1
    %7 = comb.extract %io_dataRW_addr from 31 {sv.namehint = "_inp_mem_T"} : (i32) -> i1
    %8 = comb.icmp bin ult %io_dataRW_addr, %c-1879048192_i32 {sv.namehint = "_inp_mem_T_1"} : i32
    %9 = comb.and bin %7, %8 {sv.namehint = "inp_mem"} : i1
    %10 = comb.icmp bin ne %io_dataRW_dc_mode, %c0_i5 {sv.namehint = "_T"} : i5
    %11 = comb.extract %io_dataRW_dc_mode from 3 {sv.namehint = "_io_clintIO_wvalid_T"} : (i5) -> i1
    %12 = comb.and %10, %3, %11 : i1
    %13 = comb.extract %io_dataRW_dc_mode from 2 {sv.namehint = "_io_plicIO_arvalid_T"} : (i5) -> i1
    %14 = comb.xor %3, %true : i1
    %15 = comb.and %10, %14, %6, %13 : i1
    %16 = comb.extract %io_dataRW_dc_mode from 3 {sv.namehint = "_io_plicIO_wvalid_T"} : (i5) -> i1
    %17 = comb.xor %3, %true : i1
    %18 = comb.and %10, %17, %6, %16 : i1
    %19 = comb.mux bin %6, %io_plicIO_rdata, %data_r : i64
    %20 = comb.mux bin %3, %io_clintIO_rdata, %19 : i64
    %21 = comb.mux bin %10, %20, %data_r : i64
    %22 = comb.or bin %3, %6 : i1
    %23 = comb.and bin %10, %22 : i1
    %24 = comb.or %23, %data_valid : i1
    %25 = comb.xor %9, %true : i1
    %26 = comb.xor %10, %true : i1
    %27 = comb.or %26, %22, %25 : i1
    %28 = comb.mux bin %27, %c0_i5, %io_dataRW_dc_mode : i5
    %29 = comb.concat %false, %9 : i1, i1
    %30 = comb.mux bin %6, %c-1_i2, %29 : i2
    %31 = comb.mux bin %3, %c-2_i2, %30 : i2
    %32 = comb.mux bin %10, %31, %pre_type : i2
    %33 = comb.xor %10, %true : i1
    %34 = comb.or %33, %3, %6, %9 : i1
    %35 = comb.mux bin %34, %c0_i5, %io_dataRW_dc_mode : i5
    %36 = comb.mux bin %9, %io_dcRW_ready, %io_mmio_ready : i1
    %37 = comb.xor %22, %true : i1
    %38 = comb.and %10, %37, %36 : i1
    %39 = comb.icmp bin eq %pre_type, %c-2_i2 {sv.namehint = "_T_1"} : i2
    %40 = comb.icmp bin eq %pre_type, %c-1_i2 {sv.namehint = "_T_2"} : i2
    %41 = comb.or bin %39, %40 {sv.namehint = "_T_3"} : i1
    %42 = comb.and bin %41, %data_valid {sv.namehint = "_T_4"} : i1
    %43 = comb.xor %42, %true : i1
    %44 = comb.and %43, %24 : i1
    %45 = comb.icmp bin eq %pre_type, %c1_i2 {sv.namehint = "_T_5"} : i2
    %46 = comb.icmp bin eq %pre_type, %c0_i2 {sv.namehint = "_T_6"} : i2
    %47 = comb.mux bin %46, %io_mmio_rdata, %c0_i64 : i64
    %48 = comb.mux bin %45, %io_dcRW_rdata, %47 : i64
    %49 = comb.mux bin %42, %data_r, %48 : i64
    %50 = comb.and %46, %io_mmio_rvalid : i1
    %51 = comb.mux bin %45, %io_dcRW_rvalid, %50 : i1
    %52 = comb.or %42, %51 : i1
    hw.output %49, %52, %38, %io_dataRW_addr, %io_dataRW_wdata, %35, %io_dataRW_addr, %io_dataRW_wdata, %28, %io_dataRW_amo, %io_dataRW_addr, %io_dataRW_wdata, %12, %io_dataRW_addr, %io_dataRW_wdata, %18, %15 : i64, i1, i1, i32, i64, i5, i32, i64, i5, i5, i32, i64, i1, i32, i64, i1, i1
  }
  hw.module private @MaxPeriodFibonacciLFSR_2(%clock: i1, %reset: i1) -> (io_out_0: i1, io_out_1: i1, io_out_2: i1, io_out_3: i1) {
    %false = hw.constant false
    %true = hw.constant true
    %state_0 = seq.firreg %0 clock %clock reset sync %reset, %true {firrtl.random_init_start = 0 : ui64} : i1
    %state_1 = seq.firreg %state_0 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %state_2 = seq.firreg %state_1 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2 : ui64} : i1
    %state_3 = seq.firreg %state_2 clock %clock reset sync %reset, %false {firrtl.random_init_start = 3 : ui64} : i1
    %0 = comb.xor bin %state_3, %state_2 {sv.namehint = "_T"} : i1
    hw.output %state_0, %state_1, %state_2, %state_3 : i1, i1, i1, i1
  }
  hw.module private @TLB(%clock: i1, %reset: i1, %io_va2pa_vaddr: i64, %io_va2pa_vvalid: i1, %io_mmuState_priv: i2, %io_mmuState_mstatus: i64, %io_mmuState_satp: i64, %io_flush: i1, %io_dcacheRW_rdata: i64, %io_dcacheRW_rvalid: i1, %io_dcacheRW_ready: i1) -> (io_va2pa_paddr: i32, io_va2pa_pvalid: i1, io_va2pa_tlb_excep_cause: i64, io_va2pa_tlb_excep_tval: i64, io_va2pa_tlb_excep_en: i1, io_dcacheRW_addr: i32, io_dcacheRW_wdata: i64, io_dcacheRW_dc_mode: i5) {
    %c-512_i20 = hw.constant -512 : i20
    %c0_i32 = hw.constant 0 : i32
    %c-262144_i20 = hw.constant -262144 : i20
    %c-1_i20 = hw.constant -1 : i20
    %true = hw.constant true
    %c0_i3 = hw.constant 0 : i3
    %c0_i56 = hw.constant 0 : i56
    %c-3_i4 = hw.constant -3 : i4
    %c0_i2 = hw.constant 0 : i2
    %c0_i4 = hw.constant 0 : i4
    %c1_i4 = hw.constant 1 : i4
    %c-1_i2 = hw.constant -1 : i2
    %false = hw.constant false
    %c-9_i8 = hw.constant -9 : i8
    %c-1_i12 = hw.constant -1 : i12
    %c-64_i7 = hw.constant -64 : i7
    %c15_i64 = hw.constant 15 : i64
    %c13_i64 = hw.constant 13 : i64
    %c0_i18 = hw.constant 0 : i18
    %c0_i9 = hw.constant 0 : i9
    %c-8_i4 = hw.constant -8 : i4
    %c-2_i2 = hw.constant -2 : i2
    %c-7_i4 = hw.constant -7 : i4
    %c-6_i4 = hw.constant -6 : i4
    %c-5_i4 = hw.constant -5 : i4
    %c-4_i4 = hw.constant -4 : i4
    %c-2_i4 = hw.constant -2 : i4
    %c-1_i4 = hw.constant -1 : i4
    %c0_i8 = hw.constant 0 : i8
    %c0_i12 = hw.constant 0 : i12
    %c0_i34 = hw.constant 0 : i34
    %c7_i5 = hw.constant 7 : i5
    %c11_i5 = hw.constant 11 : i5
    %c0_i64 = hw.constant 0 : i64
    %c0_i20 = hw.constant 0 : i20
    %c0_i52 = hw.constant 0 : i52
    %c0_i10 = hw.constant 0 : i10
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c4_i4 = hw.constant 4 : i4
    %c5_i4 = hw.constant 5 : i4
    %c6_i4 = hw.constant 6 : i4
    %c7_i4 = hw.constant 7 : i4
    %c0_i5 = hw.constant 0 : i5
    %c30_i8 = hw.constant 30 : i8
    %c-512_i52 = hw.constant -512 : i52
    %c-262144_i52 = hw.constant -262144 : i52
    %c1_i2 = hw.constant 1 : i2
    %c12_i64 = hw.constant 12 : i64
    %tag_0 = seq.firreg %573 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 0 : ui64} : i52
    %tag_1 = seq.firreg %579 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 52 : ui64} : i52
    %tag_2 = seq.firreg %585 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 104 : ui64} : i52
    %tag_3 = seq.firreg %591 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 156 : ui64} : i52
    %tag_4 = seq.firreg %597 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 208 : ui64} : i52
    %tag_5 = seq.firreg %603 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 260 : ui64} : i52
    %tag_6 = seq.firreg %609 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 312 : ui64} : i52
    %tag_7 = seq.firreg %615 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 364 : ui64} : i52
    %tag_8 = seq.firreg %621 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 416 : ui64} : i52
    %tag_9 = seq.firreg %627 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 468 : ui64} : i52
    %tag_10 = seq.firreg %633 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 520 : ui64} : i52
    %tag_11 = seq.firreg %639 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 572 : ui64} : i52
    %tag_12 = seq.firreg %645 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 624 : ui64} : i52
    %tag_13 = seq.firreg %651 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 676 : ui64} : i52
    %tag_14 = seq.firreg %657 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 728 : ui64} : i52
    %tag_15 = seq.firreg %663 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 780 : ui64} : i52
    %paddr_0 = seq.firreg %735 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 832 : ui64} : i20
    %paddr_1 = seq.firreg %740 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 852 : ui64} : i20
    %paddr_2 = seq.firreg %745 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 872 : ui64} : i20
    %paddr_3 = seq.firreg %750 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 892 : ui64} : i20
    %paddr_4 = seq.firreg %755 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 912 : ui64} : i20
    %paddr_5 = seq.firreg %760 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 932 : ui64} : i20
    %paddr_6 = seq.firreg %765 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 952 : ui64} : i20
    %paddr_7 = seq.firreg %770 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 972 : ui64} : i20
    %paddr_8 = seq.firreg %775 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 992 : ui64} : i20
    %paddr_9 = seq.firreg %780 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1012 : ui64} : i20
    %paddr_10 = seq.firreg %785 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1032 : ui64} : i20
    %paddr_11 = seq.firreg %790 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1052 : ui64} : i20
    %paddr_12 = seq.firreg %795 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1072 : ui64} : i20
    %paddr_13 = seq.firreg %800 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1092 : ui64} : i20
    %paddr_14 = seq.firreg %805 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1112 : ui64} : i20
    %paddr_15 = seq.firreg %810 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1132 : ui64} : i20
    %info_0 = seq.firreg %977 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1152 : ui64} : i10
    %info_1 = seq.firreg %983 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1162 : ui64} : i10
    %info_2 = seq.firreg %989 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1172 : ui64} : i10
    %info_3 = seq.firreg %995 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1182 : ui64} : i10
    %info_4 = seq.firreg %1001 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1192 : ui64} : i10
    %info_5 = seq.firreg %1007 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1202 : ui64} : i10
    %info_6 = seq.firreg %1013 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1212 : ui64} : i10
    %info_7 = seq.firreg %1019 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1222 : ui64} : i10
    %info_8 = seq.firreg %1025 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1232 : ui64} : i10
    %info_9 = seq.firreg %1031 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1242 : ui64} : i10
    %info_10 = seq.firreg %1037 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1252 : ui64} : i10
    %info_11 = seq.firreg %1043 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1262 : ui64} : i10
    %info_12 = seq.firreg %1049 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1272 : ui64} : i10
    %info_13 = seq.firreg %1055 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1282 : ui64} : i10
    %info_14 = seq.firreg %1061 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1292 : ui64} : i10
    %info_15 = seq.firreg %1067 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1302 : ui64} : i10
    %pte_addr_0 = seq.firreg %815 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1312 : ui64} : i32
    %pte_addr_1 = seq.firreg %820 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1344 : ui64} : i32
    %pte_addr_2 = seq.firreg %825 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1376 : ui64} : i32
    %pte_addr_3 = seq.firreg %830 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1408 : ui64} : i32
    %pte_addr_4 = seq.firreg %835 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1440 : ui64} : i32
    %pte_addr_5 = seq.firreg %840 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1472 : ui64} : i32
    %pte_addr_6 = seq.firreg %845 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1504 : ui64} : i32
    %pte_addr_7 = seq.firreg %850 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1536 : ui64} : i32
    %pte_addr_8 = seq.firreg %855 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1568 : ui64} : i32
    %pte_addr_9 = seq.firreg %860 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1600 : ui64} : i32
    %pte_addr_10 = seq.firreg %865 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1632 : ui64} : i32
    %pte_addr_11 = seq.firreg %870 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1664 : ui64} : i32
    %pte_addr_12 = seq.firreg %875 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1696 : ui64} : i32
    %pte_addr_13 = seq.firreg %880 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1728 : ui64} : i32
    %pte_addr_14 = seq.firreg %885 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1760 : ui64} : i32
    %pte_addr_15 = seq.firreg %890 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1792 : ui64} : i32
    %pte_level_0 = seq.firreg %895 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1824 : ui64} : i2
    %pte_level_1 = seq.firreg %900 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1826 : ui64} : i2
    %pte_level_2 = seq.firreg %905 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1828 : ui64} : i2
    %pte_level_3 = seq.firreg %910 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1830 : ui64} : i2
    %pte_level_4 = seq.firreg %915 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1832 : ui64} : i2
    %pte_level_5 = seq.firreg %920 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1834 : ui64} : i2
    %pte_level_6 = seq.firreg %925 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1836 : ui64} : i2
    %pte_level_7 = seq.firreg %930 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1838 : ui64} : i2
    %pte_level_8 = seq.firreg %935 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1840 : ui64} : i2
    %pte_level_9 = seq.firreg %940 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1842 : ui64} : i2
    %pte_level_10 = seq.firreg %945 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1844 : ui64} : i2
    %pte_level_11 = seq.firreg %950 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1846 : ui64} : i2
    %pte_level_12 = seq.firreg %955 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1848 : ui64} : i2
    %pte_level_13 = seq.firreg %960 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1850 : ui64} : i2
    %pte_level_14 = seq.firreg %965 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1852 : ui64} : i2
    %pte_level_15 = seq.firreg %970 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1854 : ui64} : i2
    %valid_0 = seq.firreg %667 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1856 : ui64} : i1
    %valid_1 = seq.firreg %671 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1857 : ui64} : i1
    %valid_2 = seq.firreg %675 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1858 : ui64} : i1
    %valid_3 = seq.firreg %679 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1859 : ui64} : i1
    %valid_4 = seq.firreg %683 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1860 : ui64} : i1
    %valid_5 = seq.firreg %687 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1861 : ui64} : i1
    %valid_6 = seq.firreg %691 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1862 : ui64} : i1
    %valid_7 = seq.firreg %695 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1863 : ui64} : i1
    %valid_8 = seq.firreg %699 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1864 : ui64} : i1
    %valid_9 = seq.firreg %703 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1865 : ui64} : i1
    %valid_10 = seq.firreg %707 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1866 : ui64} : i1
    %valid_11 = seq.firreg %711 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1867 : ui64} : i1
    %valid_12 = seq.firreg %715 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1868 : ui64} : i1
    %valid_13 = seq.firreg %719 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1869 : ui64} : i1
    %valid_14 = seq.firreg %723 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1870 : ui64} : i1
    %valid_15 = seq.firreg %727 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1871 : ui64} : i1
    %pre_addr = seq.firreg %273 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1872 : ui64} : i64
    %pte_addr_r = seq.firreg %502 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1936 : ui64} : i32
    %wpte_data_r = seq.firreg %343 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1968 : ui64} : i64
    %dc_mode_r = seq.firreg %509 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 2032 : ui64, sv.namehint = ".io_dcacheRW_dc_mode.output"} : i5
    %out_valid_r = seq.firreg %1068 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2038 : ui64, sv.namehint = ".io_va2pa_pvalid.output"} : i1
    %out_paddr_r = seq.firreg %1070 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 2039 : ui64} : i32
    %out_excep_r_cause = seq.firreg %435 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 2071 : ui64} : i64
    %out_excep_r_tval = seq.firreg %439 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 2135 : ui64} : i64
    %out_excep_r_en = seq.firreg %552 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2199 : ui64, sv.namehint = ".io_va2pa_tlb_excep_en.output"} : i1
    %0 = comb.and %io_va2pa_vvalid, %270, %271, %272 {sv.namehint = "handshake"} : i1
    %1 = comb.extract %io_va2pa_vaddr from 12 {sv.namehint = "inp_tag"} : (i64) -> i52
    %2 = comb.icmp bin eq %io_mmuState_priv, %c-1_i2 {sv.namehint = "_mmuMode_T"} : i2
    %3 = comb.extract %io_mmuState_satp from 60 {sv.namehint = "_mmuMode_T_1"} : (i64) -> i4
    %4 = comb.mux bin %2, %c0_i4, %3 {sv.namehint = "mmuMode"} : i4
    %5 = comb.icmp bin eq %4, %c-8_i4 {sv.namehint = "is_Sv39"} : i4
    %6 = comb.icmp bin eq %pte_level_0, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_3"} : i2
    %7 = comb.replicate %6 {sv.namehint = "_tlb_tag_mask_T_4"} : (i1) -> i52
    %8 = comb.icmp bin eq %pte_level_0, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_5"} : i2
    %9 = comb.mux bin %8, %c-512_i52, %7 {sv.namehint = "_tlb_tag_mask_T_6"} : i52
    %10 = comb.icmp bin eq %pte_level_0, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_7"} : i2
    %11 = comb.mux bin %10, %c-262144_i52, %9 {sv.namehint = "tlb_tag_mask"} : i52
    %12 = comb.and bin %1, %11 {sv.namehint = "_T_1"} : i52
    %13 = comb.icmp bin eq %12, %tag_0 {sv.namehint = "_T_2"} : i52
    %14 = comb.and bin %13, %valid_0 {sv.namehint = "_T_3"} : i1
    %15 = comb.mux bin %14, %paddr_0, %c0_i20 : i20
    %16 = comb.mux bin %14, %info_0, %c0_i10 : i10
    %17 = comb.mux bin %14, %pte_addr_0, %c0_i32 : i32
    %18 = comb.mux bin %14, %pte_level_0, %c0_i2 : i2
    %19 = comb.icmp bin eq %pte_level_1, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_11"} : i2
    %20 = comb.replicate %19 {sv.namehint = "_tlb_tag_mask_T_12"} : (i1) -> i52
    %21 = comb.icmp bin eq %pte_level_1, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_13"} : i2
    %22 = comb.mux bin %21, %c-512_i52, %20 {sv.namehint = "_tlb_tag_mask_T_14"} : i52
    %23 = comb.icmp bin eq %pte_level_1, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_15"} : i2
    %24 = comb.mux bin %23, %c-262144_i52, %22 {sv.namehint = "tlb_tag_mask_1"} : i52
    %25 = comb.and bin %1, %24 {sv.namehint = "_T_4"} : i52
    %26 = comb.icmp bin eq %25, %tag_1 {sv.namehint = "_T_5"} : i52
    %27 = comb.and bin %26, %valid_1 {sv.namehint = "_T_6"} : i1
    %28 = comb.mux bin %27, %paddr_1, %15 : i20
    %29 = comb.mux bin %27, %info_1, %16 : i10
    %30 = comb.mux bin %27, %pte_addr_1, %17 : i32
    %31 = comb.concat %c0_i3, %27 : i3, i1
    %32 = comb.mux bin %27, %pte_level_1, %18 : i2
    %33 = comb.icmp bin eq %pte_level_2, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_19"} : i2
    %34 = comb.replicate %33 {sv.namehint = "_tlb_tag_mask_T_20"} : (i1) -> i52
    %35 = comb.icmp bin eq %pte_level_2, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_21"} : i2
    %36 = comb.mux bin %35, %c-512_i52, %34 {sv.namehint = "_tlb_tag_mask_T_22"} : i52
    %37 = comb.icmp bin eq %pte_level_2, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_23"} : i2
    %38 = comb.mux bin %37, %c-262144_i52, %36 {sv.namehint = "tlb_tag_mask_2"} : i52
    %39 = comb.and bin %1, %38 {sv.namehint = "_T_7"} : i52
    %40 = comb.icmp bin eq %39, %tag_2 {sv.namehint = "_T_8"} : i52
    %41 = comb.and bin %40, %valid_2 {sv.namehint = "_T_9"} : i1
    %42 = comb.mux bin %41, %paddr_2, %28 : i20
    %43 = comb.mux bin %41, %info_2, %29 : i10
    %44 = comb.mux bin %41, %pte_addr_2, %30 : i32
    %45 = comb.mux bin %41, %c2_i4, %31 : i4
    %46 = comb.mux bin %41, %pte_level_2, %32 : i2
    %47 = comb.icmp bin eq %pte_level_3, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_27"} : i2
    %48 = comb.replicate %47 {sv.namehint = "_tlb_tag_mask_T_28"} : (i1) -> i52
    %49 = comb.icmp bin eq %pte_level_3, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_29"} : i2
    %50 = comb.mux bin %49, %c-512_i52, %48 {sv.namehint = "_tlb_tag_mask_T_30"} : i52
    %51 = comb.icmp bin eq %pte_level_3, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_31"} : i2
    %52 = comb.mux bin %51, %c-262144_i52, %50 {sv.namehint = "tlb_tag_mask_3"} : i52
    %53 = comb.and bin %1, %52 {sv.namehint = "_T_10"} : i52
    %54 = comb.icmp bin eq %53, %tag_3 {sv.namehint = "_T_11"} : i52
    %55 = comb.and bin %54, %valid_3 {sv.namehint = "_T_12"} : i1
    %56 = comb.mux bin %55, %paddr_3, %42 : i20
    %57 = comb.mux bin %55, %info_3, %43 : i10
    %58 = comb.mux bin %55, %pte_addr_3, %44 : i32
    %59 = comb.mux bin %55, %c3_i4, %45 : i4
    %60 = comb.mux bin %55, %pte_level_3, %46 : i2
    %61 = comb.icmp bin eq %pte_level_4, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_35"} : i2
    %62 = comb.replicate %61 {sv.namehint = "_tlb_tag_mask_T_36"} : (i1) -> i52
    %63 = comb.icmp bin eq %pte_level_4, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_37"} : i2
    %64 = comb.mux bin %63, %c-512_i52, %62 {sv.namehint = "_tlb_tag_mask_T_38"} : i52
    %65 = comb.icmp bin eq %pte_level_4, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_39"} : i2
    %66 = comb.mux bin %65, %c-262144_i52, %64 {sv.namehint = "tlb_tag_mask_4"} : i52
    %67 = comb.and bin %1, %66 {sv.namehint = "_T_13"} : i52
    %68 = comb.icmp bin eq %67, %tag_4 {sv.namehint = "_T_14"} : i52
    %69 = comb.and bin %68, %valid_4 {sv.namehint = "_T_15"} : i1
    %70 = comb.mux bin %69, %paddr_4, %56 : i20
    %71 = comb.mux bin %69, %info_4, %57 : i10
    %72 = comb.mux bin %69, %pte_addr_4, %58 : i32
    %73 = comb.mux bin %69, %c4_i4, %59 : i4
    %74 = comb.mux bin %69, %pte_level_4, %60 : i2
    %75 = comb.icmp bin eq %pte_level_5, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_43"} : i2
    %76 = comb.replicate %75 {sv.namehint = "_tlb_tag_mask_T_44"} : (i1) -> i52
    %77 = comb.icmp bin eq %pte_level_5, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_45"} : i2
    %78 = comb.mux bin %77, %c-512_i52, %76 {sv.namehint = "_tlb_tag_mask_T_46"} : i52
    %79 = comb.icmp bin eq %pte_level_5, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_47"} : i2
    %80 = comb.mux bin %79, %c-262144_i52, %78 {sv.namehint = "tlb_tag_mask_5"} : i52
    %81 = comb.and bin %1, %80 {sv.namehint = "_T_16"} : i52
    %82 = comb.icmp bin eq %81, %tag_5 {sv.namehint = "_T_17"} : i52
    %83 = comb.and bin %82, %valid_5 {sv.namehint = "_T_18"} : i1
    %84 = comb.mux bin %83, %paddr_5, %70 : i20
    %85 = comb.mux bin %83, %info_5, %71 : i10
    %86 = comb.mux bin %83, %pte_addr_5, %72 : i32
    %87 = comb.mux bin %83, %c5_i4, %73 : i4
    %88 = comb.mux bin %83, %pte_level_5, %74 : i2
    %89 = comb.icmp bin eq %pte_level_6, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_51"} : i2
    %90 = comb.replicate %89 {sv.namehint = "_tlb_tag_mask_T_52"} : (i1) -> i52
    %91 = comb.icmp bin eq %pte_level_6, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_53"} : i2
    %92 = comb.mux bin %91, %c-512_i52, %90 {sv.namehint = "_tlb_tag_mask_T_54"} : i52
    %93 = comb.icmp bin eq %pte_level_6, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_55"} : i2
    %94 = comb.mux bin %93, %c-262144_i52, %92 {sv.namehint = "tlb_tag_mask_6"} : i52
    %95 = comb.and bin %1, %94 {sv.namehint = "_T_19"} : i52
    %96 = comb.icmp bin eq %95, %tag_6 {sv.namehint = "_T_20"} : i52
    %97 = comb.and bin %96, %valid_6 {sv.namehint = "_T_21"} : i1
    %98 = comb.mux bin %97, %paddr_6, %84 : i20
    %99 = comb.mux bin %97, %info_6, %85 : i10
    %100 = comb.mux bin %97, %pte_addr_6, %86 : i32
    %101 = comb.mux bin %97, %c6_i4, %87 : i4
    %102 = comb.mux bin %97, %pte_level_6, %88 : i2
    %103 = comb.icmp bin eq %pte_level_7, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_59"} : i2
    %104 = comb.replicate %103 {sv.namehint = "_tlb_tag_mask_T_60"} : (i1) -> i52
    %105 = comb.icmp bin eq %pte_level_7, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_61"} : i2
    %106 = comb.mux bin %105, %c-512_i52, %104 {sv.namehint = "_tlb_tag_mask_T_62"} : i52
    %107 = comb.icmp bin eq %pte_level_7, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_63"} : i2
    %108 = comb.mux bin %107, %c-262144_i52, %106 {sv.namehint = "tlb_tag_mask_7"} : i52
    %109 = comb.and bin %1, %108 {sv.namehint = "_T_22"} : i52
    %110 = comb.icmp bin eq %109, %tag_7 {sv.namehint = "_T_23"} : i52
    %111 = comb.and bin %110, %valid_7 {sv.namehint = "_T_24"} : i1
    %112 = comb.mux bin %111, %paddr_7, %98 : i20
    %113 = comb.mux bin %111, %info_7, %99 : i10
    %114 = comb.mux bin %111, %pte_addr_7, %100 : i32
    %115 = comb.mux bin %111, %c7_i4, %101 : i4
    %116 = comb.mux bin %111, %pte_level_7, %102 : i2
    %117 = comb.icmp bin eq %pte_level_8, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_67"} : i2
    %118 = comb.replicate %117 {sv.namehint = "_tlb_tag_mask_T_68"} : (i1) -> i52
    %119 = comb.icmp bin eq %pte_level_8, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_69"} : i2
    %120 = comb.mux bin %119, %c-512_i52, %118 {sv.namehint = "_tlb_tag_mask_T_70"} : i52
    %121 = comb.icmp bin eq %pte_level_8, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_71"} : i2
    %122 = comb.mux bin %121, %c-262144_i52, %120 {sv.namehint = "tlb_tag_mask_8"} : i52
    %123 = comb.and bin %1, %122 {sv.namehint = "_T_25"} : i52
    %124 = comb.icmp bin eq %123, %tag_8 {sv.namehint = "_T_26"} : i52
    %125 = comb.and bin %124, %valid_8 {sv.namehint = "_T_27"} : i1
    %126 = comb.mux bin %125, %paddr_8, %112 : i20
    %127 = comb.mux bin %125, %info_8, %113 : i10
    %128 = comb.mux bin %125, %pte_addr_8, %114 : i32
    %129 = comb.mux bin %125, %c-8_i4, %115 : i4
    %130 = comb.mux bin %125, %pte_level_8, %116 : i2
    %131 = comb.icmp bin eq %pte_level_9, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_75"} : i2
    %132 = comb.replicate %131 {sv.namehint = "_tlb_tag_mask_T_76"} : (i1) -> i52
    %133 = comb.icmp bin eq %pte_level_9, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_77"} : i2
    %134 = comb.mux bin %133, %c-512_i52, %132 {sv.namehint = "_tlb_tag_mask_T_78"} : i52
    %135 = comb.icmp bin eq %pte_level_9, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_79"} : i2
    %136 = comb.mux bin %135, %c-262144_i52, %134 {sv.namehint = "tlb_tag_mask_9"} : i52
    %137 = comb.and bin %1, %136 {sv.namehint = "_T_28"} : i52
    %138 = comb.icmp bin eq %137, %tag_9 {sv.namehint = "_T_29"} : i52
    %139 = comb.and bin %138, %valid_9 {sv.namehint = "_T_30"} : i1
    %140 = comb.mux bin %139, %paddr_9, %126 : i20
    %141 = comb.mux bin %139, %info_9, %127 : i10
    %142 = comb.mux bin %139, %pte_addr_9, %128 : i32
    %143 = comb.mux bin %139, %c-7_i4, %129 : i4
    %144 = comb.mux bin %139, %pte_level_9, %130 : i2
    %145 = comb.icmp bin eq %pte_level_10, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_83"} : i2
    %146 = comb.replicate %145 {sv.namehint = "_tlb_tag_mask_T_84"} : (i1) -> i52
    %147 = comb.icmp bin eq %pte_level_10, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_85"} : i2
    %148 = comb.mux bin %147, %c-512_i52, %146 {sv.namehint = "_tlb_tag_mask_T_86"} : i52
    %149 = comb.icmp bin eq %pte_level_10, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_87"} : i2
    %150 = comb.mux bin %149, %c-262144_i52, %148 {sv.namehint = "tlb_tag_mask_10"} : i52
    %151 = comb.and bin %1, %150 {sv.namehint = "_T_31"} : i52
    %152 = comb.icmp bin eq %151, %tag_10 {sv.namehint = "_T_32"} : i52
    %153 = comb.and bin %152, %valid_10 {sv.namehint = "_T_33"} : i1
    %154 = comb.mux bin %153, %paddr_10, %140 : i20
    %155 = comb.mux bin %153, %info_10, %141 : i10
    %156 = comb.mux bin %153, %pte_addr_10, %142 : i32
    %157 = comb.mux bin %153, %c-6_i4, %143 : i4
    %158 = comb.mux bin %153, %pte_level_10, %144 : i2
    %159 = comb.icmp bin eq %pte_level_11, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_91"} : i2
    %160 = comb.replicate %159 {sv.namehint = "_tlb_tag_mask_T_92"} : (i1) -> i52
    %161 = comb.icmp bin eq %pte_level_11, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_93"} : i2
    %162 = comb.mux bin %161, %c-512_i52, %160 {sv.namehint = "_tlb_tag_mask_T_94"} : i52
    %163 = comb.icmp bin eq %pte_level_11, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_95"} : i2
    %164 = comb.mux bin %163, %c-262144_i52, %162 {sv.namehint = "tlb_tag_mask_11"} : i52
    %165 = comb.and bin %1, %164 {sv.namehint = "_T_34"} : i52
    %166 = comb.icmp bin eq %165, %tag_11 {sv.namehint = "_T_35"} : i52
    %167 = comb.and bin %166, %valid_11 {sv.namehint = "_T_36"} : i1
    %168 = comb.mux bin %167, %paddr_11, %154 : i20
    %169 = comb.mux bin %167, %info_11, %155 : i10
    %170 = comb.mux bin %167, %pte_addr_11, %156 : i32
    %171 = comb.mux bin %167, %c-5_i4, %157 : i4
    %172 = comb.mux bin %167, %pte_level_11, %158 : i2
    %173 = comb.icmp bin eq %pte_level_12, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_99"} : i2
    %174 = comb.replicate %173 {sv.namehint = "_tlb_tag_mask_T_100"} : (i1) -> i52
    %175 = comb.icmp bin eq %pte_level_12, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_101"} : i2
    %176 = comb.mux bin %175, %c-512_i52, %174 {sv.namehint = "_tlb_tag_mask_T_102"} : i52
    %177 = comb.icmp bin eq %pte_level_12, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_103"} : i2
    %178 = comb.mux bin %177, %c-262144_i52, %176 {sv.namehint = "tlb_tag_mask_12"} : i52
    %179 = comb.and bin %1, %178 {sv.namehint = "_T_37"} : i52
    %180 = comb.icmp bin eq %179, %tag_12 {sv.namehint = "_T_38"} : i52
    %181 = comb.and bin %180, %valid_12 {sv.namehint = "_T_39"} : i1
    %182 = comb.mux bin %181, %paddr_12, %168 : i20
    %183 = comb.mux bin %181, %info_12, %169 : i10
    %184 = comb.mux bin %181, %pte_addr_12, %170 : i32
    %185 = comb.mux bin %181, %c-4_i4, %171 : i4
    %186 = comb.mux bin %181, %pte_level_12, %172 : i2
    %187 = comb.icmp bin eq %pte_level_13, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_107"} : i2
    %188 = comb.replicate %187 {sv.namehint = "_tlb_tag_mask_T_108"} : (i1) -> i52
    %189 = comb.icmp bin eq %pte_level_13, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_109"} : i2
    %190 = comb.mux bin %189, %c-512_i52, %188 {sv.namehint = "_tlb_tag_mask_T_110"} : i52
    %191 = comb.icmp bin eq %pte_level_13, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_111"} : i2
    %192 = comb.mux bin %191, %c-262144_i52, %190 {sv.namehint = "tlb_tag_mask_13"} : i52
    %193 = comb.and bin %1, %192 {sv.namehint = "_T_40"} : i52
    %194 = comb.icmp bin eq %193, %tag_13 {sv.namehint = "_T_41"} : i52
    %195 = comb.and bin %194, %valid_13 {sv.namehint = "_T_42"} : i1
    %196 = comb.mux bin %195, %paddr_13, %182 : i20
    %197 = comb.mux bin %195, %info_13, %183 : i10
    %198 = comb.mux bin %195, %pte_addr_13, %184 : i32
    %199 = comb.mux bin %195, %c-3_i4, %185 : i4
    %200 = comb.mux bin %195, %pte_level_13, %186 : i2
    %201 = comb.icmp bin eq %pte_level_14, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_115"} : i2
    %202 = comb.replicate %201 {sv.namehint = "_tlb_tag_mask_T_116"} : (i1) -> i52
    %203 = comb.icmp bin eq %pte_level_14, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_117"} : i2
    %204 = comb.mux bin %203, %c-512_i52, %202 {sv.namehint = "_tlb_tag_mask_T_118"} : i52
    %205 = comb.icmp bin eq %pte_level_14, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_119"} : i2
    %206 = comb.mux bin %205, %c-262144_i52, %204 {sv.namehint = "tlb_tag_mask_14"} : i52
    %207 = comb.and bin %1, %206 {sv.namehint = "_T_43"} : i52
    %208 = comb.icmp bin eq %207, %tag_14 {sv.namehint = "_T_44"} : i52
    %209 = comb.and bin %208, %valid_14 {sv.namehint = "_T_45"} : i1
    %210 = comb.mux bin %209, %paddr_14, %196 : i20
    %211 = comb.mux bin %209, %info_14, %197 : i10
    %212 = comb.mux bin %209, %pte_addr_14, %198 : i32
    %213 = comb.mux bin %209, %c-2_i4, %199 : i4
    %214 = comb.mux bin %209, %pte_level_14, %200 : i2
    %215 = comb.icmp bin eq %pte_level_15, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_123"} : i2
    %216 = comb.replicate %215 {sv.namehint = "_tlb_tag_mask_T_124"} : (i1) -> i52
    %217 = comb.icmp bin eq %pte_level_15, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_125"} : i2
    %218 = comb.mux bin %217, %c-512_i52, %216 {sv.namehint = "_tlb_tag_mask_T_126"} : i52
    %219 = comb.icmp bin eq %pte_level_15, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_127"} : i2
    %220 = comb.mux bin %219, %c-262144_i52, %218 {sv.namehint = "tlb_tag_mask_15"} : i52
    %221 = comb.and bin %1, %220 {sv.namehint = "_T_46"} : i52
    %222 = comb.icmp bin eq %221, %tag_15 {sv.namehint = "_T_47"} : i52
    %223 = comb.and bin %222, %valid_15 {sv.namehint = "_T_48"} : i1
    %224 = comb.or %223, %209, %195, %181, %167, %153, %139, %125, %111, %97, %83, %69, %55, %41, %27, %14 {sv.namehint = "tlbMsg_tlbHit"} : i1
    %225 = comb.mux bin %223, %paddr_15, %210 {sv.namehint = "tlbMsg_tlbPa"} : i20
    %226 = comb.mux bin %223, %info_15, %211 {sv.namehint = "tlbMsg_tlbInfo"} : i10
    %227 = comb.mux bin %223, %pte_addr_15, %212 {sv.namehint = "tlbMsg_tlbPteAddr"} : i32
    %228 = comb.mux bin %223, %c-1_i4, %213 {sv.namehint = "tlbMsg_tlbIdx"} : i4
    %229 = comb.mux bin %223, %pte_level_15, %214 {sv.namehint = "tlbMsg_tlbLevel"} : i2
    %state = seq.firreg %559 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 2200 : ui64} : i2
    %flush_r = seq.firreg %266 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2202 : ui64} : i1
    %230 = comb.or bin %io_flush, %flush_r {sv.namehint = "_T_49"} : i1
    %231 = comb.icmp bin ne %state, %c0_i2 : i2
    %232 = comb.xor bin %231, %true {sv.namehint = "_T_50"} : i1
    %233 = comb.and bin %230, %232 : i1
    %234 = comb.xor %233, %true : i1
    %235 = comb.and %234, %valid_0 : i1
    %236 = comb.xor %233, %true : i1
    %237 = comb.and %236, %valid_1 : i1
    %238 = comb.xor %233, %true : i1
    %239 = comb.and %238, %valid_2 : i1
    %240 = comb.xor %233, %true : i1
    %241 = comb.and %240, %valid_3 : i1
    %242 = comb.xor %233, %true : i1
    %243 = comb.and %242, %valid_4 : i1
    %244 = comb.xor %233, %true : i1
    %245 = comb.and %244, %valid_5 : i1
    %246 = comb.xor %233, %true : i1
    %247 = comb.and %246, %valid_6 : i1
    %248 = comb.xor %233, %true : i1
    %249 = comb.and %248, %valid_7 : i1
    %250 = comb.xor %233, %true : i1
    %251 = comb.and %250, %valid_8 : i1
    %252 = comb.xor %233, %true : i1
    %253 = comb.and %252, %valid_9 : i1
    %254 = comb.xor %233, %true : i1
    %255 = comb.and %254, %valid_10 : i1
    %256 = comb.xor %233, %true : i1
    %257 = comb.and %256, %valid_11 : i1
    %258 = comb.xor %233, %true : i1
    %259 = comb.and %258, %valid_12 : i1
    %260 = comb.xor %233, %true : i1
    %261 = comb.and %260, %valid_13 : i1
    %262 = comb.xor %233, %true : i1
    %263 = comb.and %262, %valid_14 : i1
    %264 = comb.xor %233, %true : i1
    %265 = comb.and %264, %valid_15 : i1
    %266 = comb.mux bin %230, %231, %flush_r : i1
    %m_type_r = seq.firreg %431 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 2203 : ui64} : i2
    %267 = comb.mux bin %0, %c1_i2, %m_type_r {sv.namehint = "cur_m_type"} : i2
    %268 = comb.icmp bin eq %267, %c-1_i2 {sv.namehint = "_tlb_access_illegal_T_13"} : i2
    %269 = comb.concat %c0_i2, %268, %c-64_i7 {sv.namehint = "ad"} : i2, i1, i7
    %270 = comb.xor bin %231, %true {sv.namehint = "_T_54"} : i1
    %271 = comb.xor bin %io_flush, %true {sv.namehint = "_io_va2pa_ready_T_2"} : i1
    %272 = comb.xor bin %flush_r, %true {sv.namehint = "_io_va2pa_ready_T_4"} : i1
    %273 = comb.mux bin %0, %io_va2pa_vaddr, %pre_addr : i64
    %274 = comb.or bin %out_valid_r, %out_excep_r_en {sv.namehint = "_T_51"} : i1
    %275 = comb.xor %274, %true : i1
    %276 = comb.and %275, %out_valid_r : i1
    %277 = comb.xor %274, %true : i1
    %278 = comb.and %277, %out_excep_r_en : i1
    %279 = comb.icmp bin ne %dc_mode_r, %c0_i5 {sv.namehint = "_dc_hand_T"} : i5
    %280 = comb.and bin %io_dcacheRW_ready, %279 {sv.namehint = "dc_hand"} : i1
    %281 = comb.extract %io_va2pa_vaddr from 38 {sv.namehint = "_T_65"} : (i64) -> i1
    %282 = comb.replicate %281 {sv.namehint = "_tlb_high_legal_T_2"} : (i1) -> i25
    %283 = comb.extract %io_va2pa_vaddr from 39 {sv.namehint = "_T_63"} : (i64) -> i25
    %284 = comb.icmp bin eq %267, %c1_i2 {sv.namehint = "_tlb_access_illegal_T"} : i2
    %285 = comb.extract %226 from 3 {sv.namehint = "_tlb_access_illegal_T_7"} : (i10) -> i1
    %286 = comb.xor bin %285, %true {sv.namehint = "_tlb_access_illegal_T_2"} : i1
    %287 = comb.and bin %284, %286 {sv.namehint = "_tlb_access_illegal_T_3"} : i1
    %288 = comb.icmp bin eq %267, %c-2_i2 {sv.namehint = "_tlb_access_illegal_T_4"} : i2
    %289 = comb.extract %226 from 1 {sv.namehint = "_tlb_access_illegal_T_5"} : (i10) -> i1
    %290 = comb.extract %io_mmuState_mstatus from 19 {sv.namehint = "_T_101"} : (i64) -> i1
    %291 = comb.and bin %290, %285 {sv.namehint = "_tlb_access_illegal_T_8"} : i1
    %292 = comb.or bin %289, %291 {sv.namehint = "_tlb_access_illegal_T_9"} : i1
    %293 = comb.xor bin %292, %true {sv.namehint = "_tlb_access_illegal_T_10"} : i1
    %294 = comb.and bin %288, %293 {sv.namehint = "_tlb_access_illegal_T_11"} : i1
    %295 = comb.extract %226 from 2 {sv.namehint = "_tlb_access_illegal_T_14"} : (i10) -> i1
    %296 = comb.xor bin %295, %true {sv.namehint = "_tlb_access_illegal_T_15"} : i1
    %297 = comb.and bin %268, %296 {sv.namehint = "_tlb_access_illegal_T_16"} : i1
    %298 = comb.or bin %287, %294, %297 {sv.namehint = "tlb_access_illegal"} : i1
    %select_prng.io_out_0, %select_prng.io_out_1, %select_prng.io_out_2, %select_prng.io_out_3 = hw.instance "select_prng" @MaxPeriodFibonacciLFSR_2(clock: %clock: i1, reset: %reset: i1) -> (io_out_0: i1, io_out_1: i1, io_out_2: i1, io_out_3: i1)
    %299 = comb.concat %select_prng.io_out_3, %select_prng.io_out_2, %select_prng.io_out_1, %select_prng.io_out_0 {sv.namehint = "select"} : i1, i1, i1, i1
    %select_r = seq.firreg %428 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 2205 : ui64} : i4
    %offset = seq.firreg %477 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 2209 : ui64} : i8
    %level = seq.firreg %483 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 2217 : ui64} : i2
    %wpte_hs_r = seq.firreg %468 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2263 : ui64} : i1
    %300 = comb.icmp bin ne %state, %c0_i2 {sv.namehint = "_T_52"} : i2
    %301 = comb.or bin %5, %300 {sv.namehint = "_T_53"} : i1
    %302 = comb.xor bin %0, %true {sv.namehint = "_T_55"} : i1
    %303 = comb.icmp bin ne %282, %283 {sv.namehint = "_T_56"} : i25
    %304 = comb.and bin %224, %298 {sv.namehint = "_T_57"} : i1
    %305 = comb.or bin %303, %304 {sv.namehint = "_T_58"} : i1
    %306 = comb.or bin %302, %305 : i1
    %307 = comb.xor %306, %true : i1
    %308 = comb.xor %231, %true : i1
    %309 = comb.and %308, %307, %224 : i1
    %310 = comb.or %309, %276 : i1
    %311 = comb.icmp bin eq %229, %c0_i2 {sv.namehint = "_paddr_mask_T_3"} : i2
    %312 = comb.icmp bin eq %229, %c1_i2 {sv.namehint = "_paddr_mask_T_5"} : i2
    %313 = comb.replicate %311 : (i1) -> i20
    %314 = comb.mux %312, %c-512_i20, %313 : i20
    %315 = comb.icmp bin eq %229, %c-2_i2 {sv.namehint = "_paddr_mask_T_7"} : i2
    %316 = comb.mux %315, %c-262144_i20, %314 : i20
    %317 = comb.concat %225, %c0_i12 {sv.namehint = "_out_paddr_r_T"} : i20, i12
    %318 = comb.xor %316, %c-1_i20 : i20
    %319 = comb.extract %io_va2pa_vaddr from 0 : (i64) -> i32
    %320 = comb.concat %318, %c-1_i12 : i20, i12
    %321 = comb.and %319, %320 : i32
    %322 = comb.concat %316, %c0_i12 : i20, i12
    %323 = comb.and bin %322, %317 : i32
    %324 = comb.or bin %321, %323 : i32
    %325 = comb.xor %224, %true : i1
    %326 = comb.or %231, %306, %325 : i1
    %327 = comb.mux bin %326, %out_paddr_r, %324 : i32
    %328 = comb.and bin %269, %226 {sv.namehint = "_T_59"} : i10
    %329 = comb.icmp bin ne %328, %269 {sv.namehint = "_T_60"} : i10
    %330 = comb.and bin %329, %5 {sv.namehint = "_T_61"} : i1
    %331 = comb.mux bin %330, %c-1_i2, %state : i2
    %332 = comb.and bin %224, %330 : i1
    %333 = comb.xor %332, %true : i1
    %334 = comb.or %306, %333 : i1
    %335 = comb.and %334, %wpte_hs_r : i1
    %336 = comb.mux bin %330, %227, %pte_addr_r : i32
    %337 = comb.or bin %226, %269 {sv.namehint = "wpte_data_r_lo"} : i10
    %338 = comb.concat %c0_i34, %225, %337 {sv.namehint = "_wpte_data_r_T"} : i34, i20, i10
    %339 = comb.xor %332, %true : i1
    %340 = comb.and bin %301, %270 : i1
    %341 = comb.xor %340, %true : i1
    %342 = comb.or %341, %306, %339 : i1
    %343 = comb.mux bin %342, %wpte_data_r, %338 : i64
    %344 = comb.icmp bin eq %228, %c0_i4 : i4
    %345 = comb.and bin %224, %330, %344 : i1
    %346 = comb.xor %345, %true : i1
    %347 = comb.or %306, %346 : i1
    %348 = comb.mux bin %347, %info_0, %337 : i10
    %349 = comb.icmp bin eq %228, %c1_i4 : i4
    %350 = comb.and bin %224, %330, %349 : i1
    %351 = comb.xor %350, %true : i1
    %352 = comb.or %306, %351 : i1
    %353 = comb.mux bin %352, %info_1, %337 : i10
    %354 = comb.icmp bin eq %228, %c2_i4 : i4
    %355 = comb.and bin %224, %330, %354 : i1
    %356 = comb.xor %355, %true : i1
    %357 = comb.or %306, %356 : i1
    %358 = comb.mux bin %357, %info_2, %337 : i10
    %359 = comb.icmp bin eq %228, %c3_i4 : i4
    %360 = comb.and bin %224, %330, %359 : i1
    %361 = comb.xor %360, %true : i1
    %362 = comb.or %306, %361 : i1
    %363 = comb.mux bin %362, %info_3, %337 : i10
    %364 = comb.icmp bin eq %228, %c4_i4 : i4
    %365 = comb.and bin %224, %330, %364 : i1
    %366 = comb.xor %365, %true : i1
    %367 = comb.or %306, %366 : i1
    %368 = comb.mux bin %367, %info_4, %337 : i10
    %369 = comb.icmp bin eq %228, %c5_i4 : i4
    %370 = comb.and bin %224, %330, %369 : i1
    %371 = comb.xor %370, %true : i1
    %372 = comb.or %306, %371 : i1
    %373 = comb.mux bin %372, %info_5, %337 : i10
    %374 = comb.icmp bin eq %228, %c6_i4 : i4
    %375 = comb.and bin %224, %330, %374 : i1
    %376 = comb.xor %375, %true : i1
    %377 = comb.or %306, %376 : i1
    %378 = comb.mux bin %377, %info_6, %337 : i10
    %379 = comb.icmp bin eq %228, %c7_i4 : i4
    %380 = comb.and bin %224, %330, %379 : i1
    %381 = comb.xor %380, %true : i1
    %382 = comb.or %306, %381 : i1
    %383 = comb.mux bin %382, %info_7, %337 : i10
    %384 = comb.icmp bin eq %228, %c-8_i4 : i4
    %385 = comb.and bin %224, %330, %384 : i1
    %386 = comb.xor %385, %true : i1
    %387 = comb.or %306, %386 : i1
    %388 = comb.mux bin %387, %info_8, %337 : i10
    %389 = comb.icmp bin eq %228, %c-7_i4 : i4
    %390 = comb.and bin %224, %330, %389 : i1
    %391 = comb.xor %390, %true : i1
    %392 = comb.or %306, %391 : i1
    %393 = comb.mux bin %392, %info_9, %337 : i10
    %394 = comb.icmp bin eq %228, %c-6_i4 : i4
    %395 = comb.and bin %224, %330, %394 : i1
    %396 = comb.xor %395, %true : i1
    %397 = comb.or %306, %396 : i1
    %398 = comb.mux bin %397, %info_10, %337 : i10
    %399 = comb.icmp bin eq %228, %c-5_i4 : i4
    %400 = comb.and bin %224, %330, %399 : i1
    %401 = comb.xor %400, %true : i1
    %402 = comb.or %306, %401 : i1
    %403 = comb.mux bin %402, %info_11, %337 : i10
    %404 = comb.icmp bin eq %228, %c-4_i4 : i4
    %405 = comb.and bin %224, %330, %404 : i1
    %406 = comb.xor %405, %true : i1
    %407 = comb.or %306, %406 : i1
    %408 = comb.mux bin %407, %info_12, %337 : i10
    %409 = comb.icmp bin eq %228, %c-3_i4 : i4
    %410 = comb.and bin %224, %330, %409 : i1
    %411 = comb.xor %410, %true : i1
    %412 = comb.or %306, %411 : i1
    %413 = comb.mux bin %412, %info_13, %337 : i10
    %414 = comb.icmp bin eq %228, %c-2_i4 : i4
    %415 = comb.and bin %224, %330, %414 : i1
    %416 = comb.xor %415, %true : i1
    %417 = comb.or %306, %416 : i1
    %418 = comb.mux bin %417, %info_14, %337 : i10
    %419 = comb.icmp bin eq %228, %c-1_i4 : i4
    %420 = comb.and bin %224, %330, %419 : i1
    %421 = comb.xor %420, %true : i1
    %422 = comb.or %306, %421 : i1
    %423 = comb.mux bin %422, %info_15, %337 : i10
    %424 = comb.xor bin %224, %true {sv.namehint = "_T_62"} : i1
    %425 = comb.or bin %302, %305, %224 : i1
    %426 = comb.xor %340, %true : i1
    %427 = comb.or %426, %425, %224 : i1
    %428 = comb.mux bin %427, %select_r, %299 : i4
    %429 = comb.xor %340, %true : i1
    %430 = comb.or %429, %425, %224 : i1
    %431 = comb.mux bin %430, %m_type_r, %c1_i2 : i2
    %432 = comb.xor %224, %true : i1
    %433 = comb.or %305, %432 : i1
    %434 = comb.and %340, %0, %433 : i1
    %435 = comb.mux bin %434, %c12_i64, %out_excep_r_cause : i64
    %436 = comb.xor %224, %true : i1
    %437 = comb.or %305, %436 : i1
    %438 = comb.and %340, %0, %437 : i1
    %439 = comb.mux bin %438, %io_va2pa_vaddr, %out_excep_r_tval : i64
    %440 = comb.replicate %281 {sv.namehint = "_T_66"} : (i1) -> i25
    %441 = comb.icmp bin ne %283, %440 {sv.namehint = "_T_67"} : i25
    %442 = comb.xor %224, %true : i1
    %443 = comb.and %442, %424, %441 : i1
    %444 = comb.or %305, %443 : i1
    %445 = comb.and %0, %444 : i1
    %446 = comb.or %445, %278 : i1
    %447 = comb.extract %io_va2pa_vaddr from 30 {sv.namehint = "pte_addr_r_hi_lo"} : (i64) -> i9
    %448 = comb.extract %io_mmuState_satp from 0 : (i64) -> i20
    %449 = comb.concat %448, %447, %c0_i3 : i20, i9, i3
    %450 = comb.or %224, %441 : i1
    %451 = comb.mux bin %450, %pte_addr_r, %449 : i32
    %452 = comb.mux bin %224, %336, %451 : i32
    %453 = comb.mux bin %306, %pte_addr_r, %452 : i32
    %454 = comb.or %425, %224, %441 : i1
    %455 = comb.mux bin %454, %c0_i5, %c7_i5 : i5
    %456 = comb.or %425, %224, %441 : i1
    %457 = comb.mux bin %456, %offset, %c30_i8 : i8
    %458 = comb.or %425, %224, %441 : i1
    %459 = comb.mux bin %458, %level, %c-1_i2 : i2
    %460 = comb.mux bin %224, %331, %c1_i2 : i2
    %461 = comb.mux bin %306, %state, %460 : i2
    %462 = comb.icmp bin eq %state, %c-1_i2 {sv.namehint = "_T_68"} : i2
    %463 = comb.or bin %io_dcacheRW_ready, %wpte_hs_r : i1
    %464 = comb.mux bin %463, %c0_i5, %c11_i5 : i5
    %465 = comb.and bin %462, %io_dcacheRW_ready : i1
    %466 = comb.or %465, %wpte_hs_r : i1
    %467 = comb.mux bin %231, %466, %335 : i1
    %468 = comb.mux bin %301, %467, %wpte_hs_r : i1
    %469 = comb.icmp bin eq %state, %c1_i2 {sv.namehint = "_T_69"} : i2
    %470 = comb.mux bin %280, %c0_i5, %dc_mode_r : i5
    %471 = comb.add %offset, %c-9_i8 {sv.namehint = "_offset_T_1"} : i8
    %472 = comb.and bin %469, %280 : i1
    %473 = comb.xor %472, %true : i1
    %474 = comb.or %462, %473 : i1
    %475 = comb.mux bin %474, %offset, %471 : i8
    %476 = comb.mux bin %231, %475, %457 : i8
    %477 = comb.mux bin %301, %476, %offset : i8
    %478 = comb.add %level, %c-1_i2 {sv.namehint = "_level_T_1"} : i2
    %479 = comb.xor %472, %true : i1
    %480 = comb.or %462, %479 : i1
    %481 = comb.mux bin %480, %level, %478 : i2
    %482 = comb.mux bin %231, %481, %459 : i2
    %483 = comb.mux bin %301, %482, %level : i2
    %484 = comb.extract %io_dcacheRW_rdata from 0 : (i64) -> i4
    %485 = comb.icmp bin eq %484, %c1_i4 {sv.namehint = "_T_74"} : i4
    %486 = comb.extract %io_dcacheRW_rdata from 6 : (i64) -> i2
    %487 = comb.extract %io_dcacheRW_rdata from 4 : (i64) -> i1
    %488 = comb.concat %486, %487 : i2, i1
    %489 = comb.icmp bin ne %488, %c0_i3 {sv.namehint = "_T_78"} : i3
    %490 = comb.or %489, %278 : i1
    %491 = comb.concat %c0_i56, %offset : i56, i8
    %492 = comb.shru bin %pre_addr, %491 {sv.namehint = "_pte_addr_r_T_2"} : i64
    %493 = comb.extract %492 from 0 {sv.namehint = "pte_addr_r_hi_lo_1"} : (i64) -> i9
    %494 = comb.extract %io_dcacheRW_rdata from 10 : (i64) -> i20
    %495 = comb.concat %494, %493, %c0_i3 : i20, i9, i3
    %496 = comb.and bin %io_dcacheRW_rvalid, %485 : i1
    %497 = comb.and bin %469, %496 : i1
    %498 = comb.xor %497, %true : i1
    %499 = comb.or %462, %498, %489 : i1
    %500 = comb.mux bin %499, %pte_addr_r, %495 : i32
    %501 = comb.mux bin %231, %500, %453 : i32
    %502 = comb.mux bin %301, %501, %pte_addr_r : i32
    %503 = comb.xor %496, %true : i1
    %504 = comb.or %503, %489 : i1
    %505 = comb.mux bin %504, %470, %c7_i5 : i5
    %506 = comb.mux bin %469, %505, %dc_mode_r : i5
    %507 = comb.mux bin %462, %464, %506 : i5
    %508 = comb.mux bin %231, %507, %455 : i5
    %509 = comb.mux bin %301, %508, %dc_mode_r : i5
    %510 = comb.extract %io_dcacheRW_rdata from 4 {sv.namehint = "_T_79"} : (i64) -> i1
    %511 = comb.icmp bin eq %io_mmuState_priv, %c1_i2 {sv.namehint = "_T_80"} : i2
    %512 = comb.extract %io_mmuState_mstatus from 18 {sv.namehint = "_T_81"} : (i64) -> i1
    %513 = comb.xor bin %512, %true {sv.namehint = "_T_82"} : i1
    %514 = comb.icmp bin eq %out_excep_r_cause, %c12_i64 {sv.namehint = "_T_95"} : i64
    %515 = comb.or bin %513, %514 {sv.namehint = "_T_84"} : i1
    %516 = comb.and bin %511, %515 {sv.namehint = "_T_85"} : i1
    %517 = comb.icmp bin eq %io_mmuState_priv, %c0_i2 {sv.namehint = "_T_86"} : i2
    %518 = comb.mux bin %510, %516, %517 {sv.namehint = "_T_87"} : i1
    %519 = comb.extract %io_dcacheRW_rdata from 0 {sv.namehint = "_T_88"} : (i64) -> i1
    %520 = comb.xor bin %519, %true {sv.namehint = "_T_89"} : i1
    %521 = comb.extract %io_dcacheRW_rdata from 1 {sv.namehint = "_T_100"} : (i64) -> i1
    %522 = comb.xor bin %521, %true {sv.namehint = "_T_91"} : i1
    %523 = comb.extract %io_dcacheRW_rdata from 2 {sv.namehint = "_T_109"} : (i64) -> i1
    %524 = comb.and bin %522, %523 {sv.namehint = "_T_93"} : i1
    %525 = comb.extract %io_dcacheRW_rdata from 3 {sv.namehint = "_T_102"} : (i64) -> i1
    %526 = comb.xor bin %525, %true {sv.namehint = "_T_97"} : i1
    %527 = comb.and bin %514, %526 {sv.namehint = "_T_98"} : i1
    %528 = comb.icmp bin eq %out_excep_r_cause, %c13_i64 {sv.namehint = "_T_99"} : i64
    %529 = comb.and bin %290, %525 {sv.namehint = "_T_103"} : i1
    %530 = comb.or bin %521, %529 {sv.namehint = "_T_104"} : i1
    %531 = comb.xor bin %530, %true {sv.namehint = "_T_105"} : i1
    %532 = comb.and bin %528, %531 {sv.namehint = "_T_106"} : i1
    %533 = comb.icmp bin eq %out_excep_r_cause, %c15_i64 {sv.namehint = "_T_108"} : i64
    %534 = comb.xor bin %523, %true {sv.namehint = "_T_110"} : i1
    %535 = comb.and bin %533, %534 {sv.namehint = "_T_111"} : i1
    %536 = comb.icmp bin eq %level, %c1_i2 {sv.namehint = "_ppn_mask_T_5"} : i2
    %537 = comb.extract %io_dcacheRW_rdata from 10 {sv.namehint = "_T_114"} : (i64) -> i9
    %538 = comb.icmp bin ne %537, %c0_i9 {sv.namehint = "_T_115"} : i9
    %539 = comb.and bin %536, %538 {sv.namehint = "_T_116"} : i1
    %540 = comb.icmp bin eq %level, %c-2_i2 {sv.namehint = "_ppn_mask_T_7"} : i2
    %541 = comb.extract %io_dcacheRW_rdata from 10 {sv.namehint = "_T_118"} : (i64) -> i18
    %542 = comb.icmp bin ne %541, %c0_i18 {sv.namehint = "_T_119"} : i18
    %543 = comb.and bin %540, %542 {sv.namehint = "_T_120"} : i1
    %544 = comb.or bin %518, %520, %524, %527, %532, %535, %539, %543 : i1
    %545 = comb.or %544, %278 : i1
    %546 = comb.mux bin %485, %490, %545 : i1
    %547 = comb.and bin %469, %io_dcacheRW_rvalid : i1
    %548 = comb.xor %547, %true : i1
    %549 = comb.or %462, %548 : i1
    %550 = comb.mux bin %549, %278, %546 : i1
    %551 = comb.mux bin %231, %550, %446 : i1
    %552 = comb.mux bin %301, %551, %278 : i1
    %553 = comb.xor %485, %true : i1
    %554 = comb.or %553, %489 : i1
    %555 = comb.and %547, %554 : i1
    %556 = comb.mux %462, %io_dcacheRW_rvalid, %555 : i1
    %557 = comb.mux bin %556, %c0_i2, %state : i2
    %558 = comb.mux bin %231, %557, %461 : i2
    %559 = comb.mux bin %301, %558, %state : i2
    %560 = comb.icmp bin eq %level, %c0_i2 {sv.namehint = "_ppn_mask_T_3"} : i2
    %561 = comb.replicate %560 {sv.namehint = "_ppn_mask_T_4"} : (i1) -> i52
    %562 = comb.mux bin %536, %c-512_i52, %561 {sv.namehint = "_ppn_mask_T_6"} : i52
    %563 = comb.mux bin %540, %c-262144_i52, %562 {sv.namehint = "ppn_mask"} : i52
    %564 = comb.extract %pre_addr from 12 {sv.namehint = "_tag_T"} : (i64) -> i52
    %565 = comb.and bin %564, %563 {sv.namehint = "_tag_T_1"} : i52
    %566 = comb.icmp bin eq %select_r, %c0_i4 : i4
    %567 = comb.or bin %485, %544 : i1
    %568 = comb.xor %566, %true : i1
    %569 = comb.xor %547, %true : i1
    %570 = comb.or bin %270, %462 : i1
    %571 = comb.xor %301, %true : i1
    %572 = comb.or %571, %570, %569, %567, %568 : i1
    %573 = comb.mux bin %572, %tag_0, %565 : i52
    %574 = comb.icmp bin eq %select_r, %c1_i4 : i4
    %575 = comb.xor %574, %true : i1
    %576 = comb.xor %547, %true : i1
    %577 = comb.xor %301, %true : i1
    %578 = comb.or %577, %570, %576, %567, %575 : i1
    %579 = comb.mux bin %578, %tag_1, %565 : i52
    %580 = comb.icmp bin eq %select_r, %c2_i4 : i4
    %581 = comb.xor %580, %true : i1
    %582 = comb.xor %547, %true : i1
    %583 = comb.xor %301, %true : i1
    %584 = comb.or %583, %570, %582, %567, %581 : i1
    %585 = comb.mux bin %584, %tag_2, %565 : i52
    %586 = comb.icmp bin eq %select_r, %c3_i4 : i4
    %587 = comb.xor %586, %true : i1
    %588 = comb.xor %547, %true : i1
    %589 = comb.xor %301, %true : i1
    %590 = comb.or %589, %570, %588, %567, %587 : i1
    %591 = comb.mux bin %590, %tag_3, %565 : i52
    %592 = comb.icmp bin eq %select_r, %c4_i4 : i4
    %593 = comb.xor %592, %true : i1
    %594 = comb.xor %547, %true : i1
    %595 = comb.xor %301, %true : i1
    %596 = comb.or %595, %570, %594, %567, %593 : i1
    %597 = comb.mux bin %596, %tag_4, %565 : i52
    %598 = comb.icmp bin eq %select_r, %c5_i4 : i4
    %599 = comb.xor %598, %true : i1
    %600 = comb.xor %547, %true : i1
    %601 = comb.xor %301, %true : i1
    %602 = comb.or %601, %570, %600, %567, %599 : i1
    %603 = comb.mux bin %602, %tag_5, %565 : i52
    %604 = comb.icmp bin eq %select_r, %c6_i4 : i4
    %605 = comb.xor %604, %true : i1
    %606 = comb.xor %547, %true : i1
    %607 = comb.xor %301, %true : i1
    %608 = comb.or %607, %570, %606, %567, %605 : i1
    %609 = comb.mux bin %608, %tag_6, %565 : i52
    %610 = comb.icmp bin eq %select_r, %c7_i4 : i4
    %611 = comb.xor %610, %true : i1
    %612 = comb.xor %547, %true : i1
    %613 = comb.xor %301, %true : i1
    %614 = comb.or %613, %570, %612, %567, %611 : i1
    %615 = comb.mux bin %614, %tag_7, %565 : i52
    %616 = comb.icmp bin eq %select_r, %c-8_i4 : i4
    %617 = comb.xor %616, %true : i1
    %618 = comb.xor %547, %true : i1
    %619 = comb.xor %301, %true : i1
    %620 = comb.or %619, %570, %618, %567, %617 : i1
    %621 = comb.mux bin %620, %tag_8, %565 : i52
    %622 = comb.icmp bin eq %select_r, %c-7_i4 : i4
    %623 = comb.xor %622, %true : i1
    %624 = comb.xor %547, %true : i1
    %625 = comb.xor %301, %true : i1
    %626 = comb.or %625, %570, %624, %567, %623 : i1
    %627 = comb.mux bin %626, %tag_9, %565 : i52
    %628 = comb.icmp bin eq %select_r, %c-6_i4 : i4
    %629 = comb.xor %628, %true : i1
    %630 = comb.xor %547, %true : i1
    %631 = comb.xor %301, %true : i1
    %632 = comb.or %631, %570, %630, %567, %629 : i1
    %633 = comb.mux bin %632, %tag_10, %565 : i52
    %634 = comb.icmp bin eq %select_r, %c-5_i4 : i4
    %635 = comb.xor %634, %true : i1
    %636 = comb.xor %547, %true : i1
    %637 = comb.xor %301, %true : i1
    %638 = comb.or %637, %570, %636, %567, %635 : i1
    %639 = comb.mux bin %638, %tag_11, %565 : i52
    %640 = comb.icmp bin eq %select_r, %c-4_i4 : i4
    %641 = comb.xor %640, %true : i1
    %642 = comb.xor %547, %true : i1
    %643 = comb.xor %301, %true : i1
    %644 = comb.or %643, %570, %642, %567, %641 : i1
    %645 = comb.mux bin %644, %tag_12, %565 : i52
    %646 = comb.icmp bin eq %select_r, %c-3_i4 : i4
    %647 = comb.xor %646, %true : i1
    %648 = comb.xor %547, %true : i1
    %649 = comb.xor %301, %true : i1
    %650 = comb.or %649, %570, %648, %567, %647 : i1
    %651 = comb.mux bin %650, %tag_13, %565 : i52
    %652 = comb.icmp bin eq %select_r, %c-2_i4 : i4
    %653 = comb.xor %652, %true : i1
    %654 = comb.xor %547, %true : i1
    %655 = comb.xor %301, %true : i1
    %656 = comb.or %655, %570, %654, %567, %653 : i1
    %657 = comb.mux bin %656, %tag_14, %565 : i52
    %658 = comb.icmp bin eq %select_r, %c-1_i4 : i4
    %659 = comb.xor %658, %true : i1
    %660 = comb.xor %547, %true : i1
    %661 = comb.xor %301, %true : i1
    %662 = comb.or %661, %570, %660, %567, %659 : i1
    %663 = comb.mux bin %662, %tag_15, %565 : i52
    %664 = comb.xor %567, %true : i1
    %665 = comb.xor %570, %true : i1
    %666 = comb.and %301, %665, %547, %664, %566 : i1
    %667 = comb.or %666, %235 : i1
    %668 = comb.xor %567, %true : i1
    %669 = comb.xor %570, %true : i1
    %670 = comb.and %301, %669, %547, %668, %574 : i1
    %671 = comb.or %670, %237 : i1
    %672 = comb.xor %567, %true : i1
    %673 = comb.xor %570, %true : i1
    %674 = comb.and %301, %673, %547, %672, %580 : i1
    %675 = comb.or %674, %239 : i1
    %676 = comb.xor %567, %true : i1
    %677 = comb.xor %570, %true : i1
    %678 = comb.and %301, %677, %547, %676, %586 : i1
    %679 = comb.or %678, %241 : i1
    %680 = comb.xor %567, %true : i1
    %681 = comb.xor %570, %true : i1
    %682 = comb.and %301, %681, %547, %680, %592 : i1
    %683 = comb.or %682, %243 : i1
    %684 = comb.xor %567, %true : i1
    %685 = comb.xor %570, %true : i1
    %686 = comb.and %301, %685, %547, %684, %598 : i1
    %687 = comb.or %686, %245 : i1
    %688 = comb.xor %567, %true : i1
    %689 = comb.xor %570, %true : i1
    %690 = comb.and %301, %689, %547, %688, %604 : i1
    %691 = comb.or %690, %247 : i1
    %692 = comb.xor %567, %true : i1
    %693 = comb.xor %570, %true : i1
    %694 = comb.and %301, %693, %547, %692, %610 : i1
    %695 = comb.or %694, %249 : i1
    %696 = comb.xor %567, %true : i1
    %697 = comb.xor %570, %true : i1
    %698 = comb.and %301, %697, %547, %696, %616 : i1
    %699 = comb.or %698, %251 : i1
    %700 = comb.xor %567, %true : i1
    %701 = comb.xor %570, %true : i1
    %702 = comb.and %301, %701, %547, %700, %622 : i1
    %703 = comb.or %702, %253 : i1
    %704 = comb.xor %567, %true : i1
    %705 = comb.xor %570, %true : i1
    %706 = comb.and %301, %705, %547, %704, %628 : i1
    %707 = comb.or %706, %255 : i1
    %708 = comb.xor %567, %true : i1
    %709 = comb.xor %570, %true : i1
    %710 = comb.and %301, %709, %547, %708, %634 : i1
    %711 = comb.or %710, %257 : i1
    %712 = comb.xor %567, %true : i1
    %713 = comb.xor %570, %true : i1
    %714 = comb.and %301, %713, %547, %712, %640 : i1
    %715 = comb.or %714, %259 : i1
    %716 = comb.xor %567, %true : i1
    %717 = comb.xor %570, %true : i1
    %718 = comb.and %301, %717, %547, %716, %646 : i1
    %719 = comb.or %718, %261 : i1
    %720 = comb.xor %567, %true : i1
    %721 = comb.xor %570, %true : i1
    %722 = comb.and %301, %721, %547, %720, %652 : i1
    %723 = comb.or %722, %263 : i1
    %724 = comb.xor %567, %true : i1
    %725 = comb.xor %570, %true : i1
    %726 = comb.and %301, %725, %547, %724, %658 : i1
    %727 = comb.or %726, %265 : i1
    %728 = comb.extract %io_dcacheRW_rdata from 10 {sv.namehint = "_update_pa_T"} : (i64) -> i20
    %729 = comb.extract %563 from 0 : (i52) -> i20
    %730 = comb.and bin %729, %728 : i20
    %731 = comb.xor %566, %true : i1
    %732 = comb.xor %547, %true : i1
    %733 = comb.xor %301, %true : i1
    %734 = comb.or %733, %570, %732, %567, %731 : i1
    %735 = comb.mux bin %734, %paddr_0, %730 : i20
    %736 = comb.xor %574, %true : i1
    %737 = comb.xor %547, %true : i1
    %738 = comb.xor %301, %true : i1
    %739 = comb.or %738, %570, %737, %567, %736 : i1
    %740 = comb.mux bin %739, %paddr_1, %730 : i20
    %741 = comb.xor %580, %true : i1
    %742 = comb.xor %547, %true : i1
    %743 = comb.xor %301, %true : i1
    %744 = comb.or %743, %570, %742, %567, %741 : i1
    %745 = comb.mux bin %744, %paddr_2, %730 : i20
    %746 = comb.xor %586, %true : i1
    %747 = comb.xor %547, %true : i1
    %748 = comb.xor %301, %true : i1
    %749 = comb.or %748, %570, %747, %567, %746 : i1
    %750 = comb.mux bin %749, %paddr_3, %730 : i20
    %751 = comb.xor %592, %true : i1
    %752 = comb.xor %547, %true : i1
    %753 = comb.xor %301, %true : i1
    %754 = comb.or %753, %570, %752, %567, %751 : i1
    %755 = comb.mux bin %754, %paddr_4, %730 : i20
    %756 = comb.xor %598, %true : i1
    %757 = comb.xor %547, %true : i1
    %758 = comb.xor %301, %true : i1
    %759 = comb.or %758, %570, %757, %567, %756 : i1
    %760 = comb.mux bin %759, %paddr_5, %730 : i20
    %761 = comb.xor %604, %true : i1
    %762 = comb.xor %547, %true : i1
    %763 = comb.xor %301, %true : i1
    %764 = comb.or %763, %570, %762, %567, %761 : i1
    %765 = comb.mux bin %764, %paddr_6, %730 : i20
    %766 = comb.xor %610, %true : i1
    %767 = comb.xor %547, %true : i1
    %768 = comb.xor %301, %true : i1
    %769 = comb.or %768, %570, %767, %567, %766 : i1
    %770 = comb.mux bin %769, %paddr_7, %730 : i20
    %771 = comb.xor %616, %true : i1
    %772 = comb.xor %547, %true : i1
    %773 = comb.xor %301, %true : i1
    %774 = comb.or %773, %570, %772, %567, %771 : i1
    %775 = comb.mux bin %774, %paddr_8, %730 : i20
    %776 = comb.xor %622, %true : i1
    %777 = comb.xor %547, %true : i1
    %778 = comb.xor %301, %true : i1
    %779 = comb.or %778, %570, %777, %567, %776 : i1
    %780 = comb.mux bin %779, %paddr_9, %730 : i20
    %781 = comb.xor %628, %true : i1
    %782 = comb.xor %547, %true : i1
    %783 = comb.xor %301, %true : i1
    %784 = comb.or %783, %570, %782, %567, %781 : i1
    %785 = comb.mux bin %784, %paddr_10, %730 : i20
    %786 = comb.xor %634, %true : i1
    %787 = comb.xor %547, %true : i1
    %788 = comb.xor %301, %true : i1
    %789 = comb.or %788, %570, %787, %567, %786 : i1
    %790 = comb.mux bin %789, %paddr_11, %730 : i20
    %791 = comb.xor %640, %true : i1
    %792 = comb.xor %547, %true : i1
    %793 = comb.xor %301, %true : i1
    %794 = comb.or %793, %570, %792, %567, %791 : i1
    %795 = comb.mux bin %794, %paddr_12, %730 : i20
    %796 = comb.xor %646, %true : i1
    %797 = comb.xor %547, %true : i1
    %798 = comb.xor %301, %true : i1
    %799 = comb.or %798, %570, %797, %567, %796 : i1
    %800 = comb.mux bin %799, %paddr_13, %730 : i20
    %801 = comb.xor %652, %true : i1
    %802 = comb.xor %547, %true : i1
    %803 = comb.xor %301, %true : i1
    %804 = comb.or %803, %570, %802, %567, %801 : i1
    %805 = comb.mux bin %804, %paddr_14, %730 : i20
    %806 = comb.xor %658, %true : i1
    %807 = comb.xor %547, %true : i1
    %808 = comb.xor %301, %true : i1
    %809 = comb.or %808, %570, %807, %567, %806 : i1
    %810 = comb.mux bin %809, %paddr_15, %730 : i20
    %811 = comb.xor %566, %true : i1
    %812 = comb.xor %547, %true : i1
    %813 = comb.xor %301, %true : i1
    %814 = comb.or %813, %570, %812, %567, %811 : i1
    %815 = comb.mux bin %814, %pte_addr_0, %pte_addr_r : i32
    %816 = comb.xor %574, %true : i1
    %817 = comb.xor %547, %true : i1
    %818 = comb.xor %301, %true : i1
    %819 = comb.or %818, %570, %817, %567, %816 : i1
    %820 = comb.mux bin %819, %pte_addr_1, %pte_addr_r : i32
    %821 = comb.xor %580, %true : i1
    %822 = comb.xor %547, %true : i1
    %823 = comb.xor %301, %true : i1
    %824 = comb.or %823, %570, %822, %567, %821 : i1
    %825 = comb.mux bin %824, %pte_addr_2, %pte_addr_r : i32
    %826 = comb.xor %586, %true : i1
    %827 = comb.xor %547, %true : i1
    %828 = comb.xor %301, %true : i1
    %829 = comb.or %828, %570, %827, %567, %826 : i1
    %830 = comb.mux bin %829, %pte_addr_3, %pte_addr_r : i32
    %831 = comb.xor %592, %true : i1
    %832 = comb.xor %547, %true : i1
    %833 = comb.xor %301, %true : i1
    %834 = comb.or %833, %570, %832, %567, %831 : i1
    %835 = comb.mux bin %834, %pte_addr_4, %pte_addr_r : i32
    %836 = comb.xor %598, %true : i1
    %837 = comb.xor %547, %true : i1
    %838 = comb.xor %301, %true : i1
    %839 = comb.or %838, %570, %837, %567, %836 : i1
    %840 = comb.mux bin %839, %pte_addr_5, %pte_addr_r : i32
    %841 = comb.xor %604, %true : i1
    %842 = comb.xor %547, %true : i1
    %843 = comb.xor %301, %true : i1
    %844 = comb.or %843, %570, %842, %567, %841 : i1
    %845 = comb.mux bin %844, %pte_addr_6, %pte_addr_r : i32
    %846 = comb.xor %610, %true : i1
    %847 = comb.xor %547, %true : i1
    %848 = comb.xor %301, %true : i1
    %849 = comb.or %848, %570, %847, %567, %846 : i1
    %850 = comb.mux bin %849, %pte_addr_7, %pte_addr_r : i32
    %851 = comb.xor %616, %true : i1
    %852 = comb.xor %547, %true : i1
    %853 = comb.xor %301, %true : i1
    %854 = comb.or %853, %570, %852, %567, %851 : i1
    %855 = comb.mux bin %854, %pte_addr_8, %pte_addr_r : i32
    %856 = comb.xor %622, %true : i1
    %857 = comb.xor %547, %true : i1
    %858 = comb.xor %301, %true : i1
    %859 = comb.or %858, %570, %857, %567, %856 : i1
    %860 = comb.mux bin %859, %pte_addr_9, %pte_addr_r : i32
    %861 = comb.xor %628, %true : i1
    %862 = comb.xor %547, %true : i1
    %863 = comb.xor %301, %true : i1
    %864 = comb.or %863, %570, %862, %567, %861 : i1
    %865 = comb.mux bin %864, %pte_addr_10, %pte_addr_r : i32
    %866 = comb.xor %634, %true : i1
    %867 = comb.xor %547, %true : i1
    %868 = comb.xor %301, %true : i1
    %869 = comb.or %868, %570, %867, %567, %866 : i1
    %870 = comb.mux bin %869, %pte_addr_11, %pte_addr_r : i32
    %871 = comb.xor %640, %true : i1
    %872 = comb.xor %547, %true : i1
    %873 = comb.xor %301, %true : i1
    %874 = comb.or %873, %570, %872, %567, %871 : i1
    %875 = comb.mux bin %874, %pte_addr_12, %pte_addr_r : i32
    %876 = comb.xor %646, %true : i1
    %877 = comb.xor %547, %true : i1
    %878 = comb.xor %301, %true : i1
    %879 = comb.or %878, %570, %877, %567, %876 : i1
    %880 = comb.mux bin %879, %pte_addr_13, %pte_addr_r : i32
    %881 = comb.xor %652, %true : i1
    %882 = comb.xor %547, %true : i1
    %883 = comb.xor %301, %true : i1
    %884 = comb.or %883, %570, %882, %567, %881 : i1
    %885 = comb.mux bin %884, %pte_addr_14, %pte_addr_r : i32
    %886 = comb.xor %658, %true : i1
    %887 = comb.xor %547, %true : i1
    %888 = comb.xor %301, %true : i1
    %889 = comb.or %888, %570, %887, %567, %886 : i1
    %890 = comb.mux bin %889, %pte_addr_15, %pte_addr_r : i32
    %891 = comb.xor %566, %true : i1
    %892 = comb.xor %547, %true : i1
    %893 = comb.xor %301, %true : i1
    %894 = comb.or %893, %570, %892, %567, %891 : i1
    %895 = comb.mux bin %894, %pte_level_0, %level : i2
    %896 = comb.xor %574, %true : i1
    %897 = comb.xor %547, %true : i1
    %898 = comb.xor %301, %true : i1
    %899 = comb.or %898, %570, %897, %567, %896 : i1
    %900 = comb.mux bin %899, %pte_level_1, %level : i2
    %901 = comb.xor %580, %true : i1
    %902 = comb.xor %547, %true : i1
    %903 = comb.xor %301, %true : i1
    %904 = comb.or %903, %570, %902, %567, %901 : i1
    %905 = comb.mux bin %904, %pte_level_2, %level : i2
    %906 = comb.xor %586, %true : i1
    %907 = comb.xor %547, %true : i1
    %908 = comb.xor %301, %true : i1
    %909 = comb.or %908, %570, %907, %567, %906 : i1
    %910 = comb.mux bin %909, %pte_level_3, %level : i2
    %911 = comb.xor %592, %true : i1
    %912 = comb.xor %547, %true : i1
    %913 = comb.xor %301, %true : i1
    %914 = comb.or %913, %570, %912, %567, %911 : i1
    %915 = comb.mux bin %914, %pte_level_4, %level : i2
    %916 = comb.xor %598, %true : i1
    %917 = comb.xor %547, %true : i1
    %918 = comb.xor %301, %true : i1
    %919 = comb.or %918, %570, %917, %567, %916 : i1
    %920 = comb.mux bin %919, %pte_level_5, %level : i2
    %921 = comb.xor %604, %true : i1
    %922 = comb.xor %547, %true : i1
    %923 = comb.xor %301, %true : i1
    %924 = comb.or %923, %570, %922, %567, %921 : i1
    %925 = comb.mux bin %924, %pte_level_6, %level : i2
    %926 = comb.xor %610, %true : i1
    %927 = comb.xor %547, %true : i1
    %928 = comb.xor %301, %true : i1
    %929 = comb.or %928, %570, %927, %567, %926 : i1
    %930 = comb.mux bin %929, %pte_level_7, %level : i2
    %931 = comb.xor %616, %true : i1
    %932 = comb.xor %547, %true : i1
    %933 = comb.xor %301, %true : i1
    %934 = comb.or %933, %570, %932, %567, %931 : i1
    %935 = comb.mux bin %934, %pte_level_8, %level : i2
    %936 = comb.xor %622, %true : i1
    %937 = comb.xor %547, %true : i1
    %938 = comb.xor %301, %true : i1
    %939 = comb.or %938, %570, %937, %567, %936 : i1
    %940 = comb.mux bin %939, %pte_level_9, %level : i2
    %941 = comb.xor %628, %true : i1
    %942 = comb.xor %547, %true : i1
    %943 = comb.xor %301, %true : i1
    %944 = comb.or %943, %570, %942, %567, %941 : i1
    %945 = comb.mux bin %944, %pte_level_10, %level : i2
    %946 = comb.xor %634, %true : i1
    %947 = comb.xor %547, %true : i1
    %948 = comb.xor %301, %true : i1
    %949 = comb.or %948, %570, %947, %567, %946 : i1
    %950 = comb.mux bin %949, %pte_level_11, %level : i2
    %951 = comb.xor %640, %true : i1
    %952 = comb.xor %547, %true : i1
    %953 = comb.xor %301, %true : i1
    %954 = comb.or %953, %570, %952, %567, %951 : i1
    %955 = comb.mux bin %954, %pte_level_12, %level : i2
    %956 = comb.xor %646, %true : i1
    %957 = comb.xor %547, %true : i1
    %958 = comb.xor %301, %true : i1
    %959 = comb.or %958, %570, %957, %567, %956 : i1
    %960 = comb.mux bin %959, %pte_level_13, %level : i2
    %961 = comb.xor %652, %true : i1
    %962 = comb.xor %547, %true : i1
    %963 = comb.xor %301, %true : i1
    %964 = comb.or %963, %570, %962, %567, %961 : i1
    %965 = comb.mux bin %964, %pte_level_14, %level : i2
    %966 = comb.xor %658, %true : i1
    %967 = comb.xor %547, %true : i1
    %968 = comb.xor %301, %true : i1
    %969 = comb.or %968, %570, %967, %567, %966 : i1
    %970 = comb.mux bin %969, %pte_level_15, %level : i2
    %971 = comb.extract %io_dcacheRW_rdata from 0 {sv.namehint = "_info_T_1"} : (i64) -> i10
    %972 = comb.xor %566, %true : i1
    %973 = comb.xor %547, %true : i1
    %974 = comb.or %462, %973, %567, %972 : i1
    %975 = comb.mux bin %974, %info_0, %971 : i10
    %976 = comb.mux bin %231, %975, %348 : i10
    %977 = comb.mux bin %301, %976, %info_0 : i10
    %978 = comb.xor %574, %true : i1
    %979 = comb.xor %547, %true : i1
    %980 = comb.or %462, %979, %567, %978 : i1
    %981 = comb.mux bin %980, %info_1, %971 : i10
    %982 = comb.mux bin %231, %981, %353 : i10
    %983 = comb.mux bin %301, %982, %info_1 : i10
    %984 = comb.xor %580, %true : i1
    %985 = comb.xor %547, %true : i1
    %986 = comb.or %462, %985, %567, %984 : i1
    %987 = comb.mux bin %986, %info_2, %971 : i10
    %988 = comb.mux bin %231, %987, %358 : i10
    %989 = comb.mux bin %301, %988, %info_2 : i10
    %990 = comb.xor %586, %true : i1
    %991 = comb.xor %547, %true : i1
    %992 = comb.or %462, %991, %567, %990 : i1
    %993 = comb.mux bin %992, %info_3, %971 : i10
    %994 = comb.mux bin %231, %993, %363 : i10
    %995 = comb.mux bin %301, %994, %info_3 : i10
    %996 = comb.xor %592, %true : i1
    %997 = comb.xor %547, %true : i1
    %998 = comb.or %462, %997, %567, %996 : i1
    %999 = comb.mux bin %998, %info_4, %971 : i10
    %1000 = comb.mux bin %231, %999, %368 : i10
    %1001 = comb.mux bin %301, %1000, %info_4 : i10
    %1002 = comb.xor %598, %true : i1
    %1003 = comb.xor %547, %true : i1
    %1004 = comb.or %462, %1003, %567, %1002 : i1
    %1005 = comb.mux bin %1004, %info_5, %971 : i10
    %1006 = comb.mux bin %231, %1005, %373 : i10
    %1007 = comb.mux bin %301, %1006, %info_5 : i10
    %1008 = comb.xor %604, %true : i1
    %1009 = comb.xor %547, %true : i1
    %1010 = comb.or %462, %1009, %567, %1008 : i1
    %1011 = comb.mux bin %1010, %info_6, %971 : i10
    %1012 = comb.mux bin %231, %1011, %378 : i10
    %1013 = comb.mux bin %301, %1012, %info_6 : i10
    %1014 = comb.xor %610, %true : i1
    %1015 = comb.xor %547, %true : i1
    %1016 = comb.or %462, %1015, %567, %1014 : i1
    %1017 = comb.mux bin %1016, %info_7, %971 : i10
    %1018 = comb.mux bin %231, %1017, %383 : i10
    %1019 = comb.mux bin %301, %1018, %info_7 : i10
    %1020 = comb.xor %616, %true : i1
    %1021 = comb.xor %547, %true : i1
    %1022 = comb.or %462, %1021, %567, %1020 : i1
    %1023 = comb.mux bin %1022, %info_8, %971 : i10
    %1024 = comb.mux bin %231, %1023, %388 : i10
    %1025 = comb.mux bin %301, %1024, %info_8 : i10
    %1026 = comb.xor %622, %true : i1
    %1027 = comb.xor %547, %true : i1
    %1028 = comb.or %462, %1027, %567, %1026 : i1
    %1029 = comb.mux bin %1028, %info_9, %971 : i10
    %1030 = comb.mux bin %231, %1029, %393 : i10
    %1031 = comb.mux bin %301, %1030, %info_9 : i10
    %1032 = comb.xor %628, %true : i1
    %1033 = comb.xor %547, %true : i1
    %1034 = comb.or %462, %1033, %567, %1032 : i1
    %1035 = comb.mux bin %1034, %info_10, %971 : i10
    %1036 = comb.mux bin %231, %1035, %398 : i10
    %1037 = comb.mux bin %301, %1036, %info_10 : i10
    %1038 = comb.xor %634, %true : i1
    %1039 = comb.xor %547, %true : i1
    %1040 = comb.or %462, %1039, %567, %1038 : i1
    %1041 = comb.mux bin %1040, %info_11, %971 : i10
    %1042 = comb.mux bin %231, %1041, %403 : i10
    %1043 = comb.mux bin %301, %1042, %info_11 : i10
    %1044 = comb.xor %640, %true : i1
    %1045 = comb.xor %547, %true : i1
    %1046 = comb.or %462, %1045, %567, %1044 : i1
    %1047 = comb.mux bin %1046, %info_12, %971 : i10
    %1048 = comb.mux bin %231, %1047, %408 : i10
    %1049 = comb.mux bin %301, %1048, %info_12 : i10
    %1050 = comb.xor %646, %true : i1
    %1051 = comb.xor %547, %true : i1
    %1052 = comb.or %462, %1051, %567, %1050 : i1
    %1053 = comb.mux bin %1052, %info_13, %971 : i10
    %1054 = comb.mux bin %231, %1053, %413 : i10
    %1055 = comb.mux bin %301, %1054, %info_13 : i10
    %1056 = comb.xor %652, %true : i1
    %1057 = comb.xor %547, %true : i1
    %1058 = comb.or %462, %1057, %567, %1056 : i1
    %1059 = comb.mux bin %1058, %info_14, %971 : i10
    %1060 = comb.mux bin %231, %1059, %418 : i10
    %1061 = comb.mux bin %301, %1060, %info_14 : i10
    %1062 = comb.xor %658, %true : i1
    %1063 = comb.xor %547, %true : i1
    %1064 = comb.or %462, %1063, %567, %1062 : i1
    %1065 = comb.mux bin %1064, %info_15, %971 : i10
    %1066 = comb.mux bin %231, %1065, %423 : i10
    %1067 = comb.mux bin %301, %1066, %info_15 : i10
    %1068 = comb.mux bin %301, %310, %io_va2pa_vvalid : i1
    %1069 = comb.extract %io_va2pa_vaddr from 0 : (i64) -> i32
    %1070 = comb.mux bin %301, %327, %1069 : i32
    hw.output %out_paddr_r, %out_valid_r, %out_excep_r_cause, %out_excep_r_tval, %out_excep_r_en, %pte_addr_r, %wpte_data_r, %dc_mode_r : i32, i1, i64, i64, i1, i32, i64, i5
  }
  hw.module private @MaxPeriodFibonacciLFSR_3(%clock: i1, %reset: i1) -> (io_out_0: i1, io_out_1: i1, io_out_2: i1, io_out_3: i1) {
    %false = hw.constant false
    %true = hw.constant true
    %state_0 = seq.firreg %0 clock %clock reset sync %reset, %true {firrtl.random_init_start = 0 : ui64} : i1
    %state_1 = seq.firreg %state_0 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %state_2 = seq.firreg %state_1 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2 : ui64} : i1
    %state_3 = seq.firreg %state_2 clock %clock reset sync %reset, %false {firrtl.random_init_start = 3 : ui64} : i1
    %0 = comb.xor bin %state_3, %state_2 {sv.namehint = "_T"} : i1
    hw.output %state_0, %state_1, %state_2, %state_3 : i1, i1, i1, i1
  }
  hw.module private @TLB_1(%clock: i1, %reset: i1, %io_va2pa_vaddr: i64, %io_va2pa_vvalid: i1, %io_va2pa_m_type: i2, %io_mmuState_priv: i2, %io_mmuState_mstatus: i64, %io_mmuState_satp: i64, %io_flush: i1, %io_dcacheRW_rdata: i64, %io_dcacheRW_rvalid: i1, %io_dcacheRW_ready: i1) -> (io_va2pa_paddr: i32, io_va2pa_pvalid: i1, io_va2pa_tlb_excep_cause: i64, io_va2pa_tlb_excep_tval: i64, io_va2pa_tlb_excep_en: i1, io_dcacheRW_addr: i32, io_dcacheRW_wdata: i64, io_dcacheRW_dc_mode: i5) {
    %c-512_i20 = hw.constant -512 : i20
    %c0_i32 = hw.constant 0 : i32
    %c-262144_i20 = hw.constant -262144 : i20
    %c-1_i20 = hw.constant -1 : i20
    %true = hw.constant true
    %c0_i3 = hw.constant 0 : i3
    %c0_i56 = hw.constant 0 : i56
    %c-3_i4 = hw.constant -3 : i4
    %c0_i2 = hw.constant 0 : i2
    %c0_i4 = hw.constant 0 : i4
    %c1_i4 = hw.constant 1 : i4
    %c-1_i2 = hw.constant -1 : i2
    %false = hw.constant false
    %c-9_i8 = hw.constant -9 : i8
    %0 = hw.aggregate_constant [15, 13, 12, 0] : !hw.array<4xi64>
    %c-1_i12 = hw.constant -1 : i12
    %c-64_i7 = hw.constant -64 : i7
    %c0_i18 = hw.constant 0 : i18
    %c0_i9 = hw.constant 0 : i9
    %c1_i2 = hw.constant 1 : i2
    %c-8_i4 = hw.constant -8 : i4
    %c-2_i2 = hw.constant -2 : i2
    %c-7_i4 = hw.constant -7 : i4
    %c-6_i4 = hw.constant -6 : i4
    %c-5_i4 = hw.constant -5 : i4
    %c-4_i4 = hw.constant -4 : i4
    %c-2_i4 = hw.constant -2 : i4
    %c-1_i4 = hw.constant -1 : i4
    %c0_i8 = hw.constant 0 : i8
    %c0_i12 = hw.constant 0 : i12
    %c0_i34 = hw.constant 0 : i34
    %c7_i5 = hw.constant 7 : i5
    %c11_i5 = hw.constant 11 : i5
    %c0_i64 = hw.constant 0 : i64
    %c0_i20 = hw.constant 0 : i20
    %c0_i52 = hw.constant 0 : i52
    %c0_i10 = hw.constant 0 : i10
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c4_i4 = hw.constant 4 : i4
    %c5_i4 = hw.constant 5 : i4
    %c6_i4 = hw.constant 6 : i4
    %c7_i4 = hw.constant 7 : i4
    %c0_i5 = hw.constant 0 : i5
    %c12_i64 = hw.constant 12 : i64
    %c13_i64 = hw.constant 13 : i64
    %c15_i64 = hw.constant 15 : i64
    %c30_i8 = hw.constant 30 : i8
    %c-512_i52 = hw.constant -512 : i52
    %c-262144_i52 = hw.constant -262144 : i52
    %tag_0 = seq.firreg %582 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 0 : ui64} : i52
    %tag_1 = seq.firreg %588 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 52 : ui64} : i52
    %tag_2 = seq.firreg %594 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 104 : ui64} : i52
    %tag_3 = seq.firreg %600 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 156 : ui64} : i52
    %tag_4 = seq.firreg %606 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 208 : ui64} : i52
    %tag_5 = seq.firreg %612 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 260 : ui64} : i52
    %tag_6 = seq.firreg %618 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 312 : ui64} : i52
    %tag_7 = seq.firreg %624 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 364 : ui64} : i52
    %tag_8 = seq.firreg %630 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 416 : ui64} : i52
    %tag_9 = seq.firreg %636 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 468 : ui64} : i52
    %tag_10 = seq.firreg %642 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 520 : ui64} : i52
    %tag_11 = seq.firreg %648 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 572 : ui64} : i52
    %tag_12 = seq.firreg %654 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 624 : ui64} : i52
    %tag_13 = seq.firreg %660 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 676 : ui64} : i52
    %tag_14 = seq.firreg %666 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 728 : ui64} : i52
    %tag_15 = seq.firreg %672 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 780 : ui64} : i52
    %paddr_0 = seq.firreg %744 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 832 : ui64} : i20
    %paddr_1 = seq.firreg %749 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 852 : ui64} : i20
    %paddr_2 = seq.firreg %754 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 872 : ui64} : i20
    %paddr_3 = seq.firreg %759 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 892 : ui64} : i20
    %paddr_4 = seq.firreg %764 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 912 : ui64} : i20
    %paddr_5 = seq.firreg %769 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 932 : ui64} : i20
    %paddr_6 = seq.firreg %774 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 952 : ui64} : i20
    %paddr_7 = seq.firreg %779 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 972 : ui64} : i20
    %paddr_8 = seq.firreg %784 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 992 : ui64} : i20
    %paddr_9 = seq.firreg %789 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1012 : ui64} : i20
    %paddr_10 = seq.firreg %794 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1032 : ui64} : i20
    %paddr_11 = seq.firreg %799 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1052 : ui64} : i20
    %paddr_12 = seq.firreg %804 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1072 : ui64} : i20
    %paddr_13 = seq.firreg %809 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1092 : ui64} : i20
    %paddr_14 = seq.firreg %814 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1112 : ui64} : i20
    %paddr_15 = seq.firreg %819 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1132 : ui64} : i20
    %info_0 = seq.firreg %986 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1152 : ui64} : i10
    %info_1 = seq.firreg %992 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1162 : ui64} : i10
    %info_2 = seq.firreg %998 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1172 : ui64} : i10
    %info_3 = seq.firreg %1004 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1182 : ui64} : i10
    %info_4 = seq.firreg %1010 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1192 : ui64} : i10
    %info_5 = seq.firreg %1016 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1202 : ui64} : i10
    %info_6 = seq.firreg %1022 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1212 : ui64} : i10
    %info_7 = seq.firreg %1028 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1222 : ui64} : i10
    %info_8 = seq.firreg %1034 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1232 : ui64} : i10
    %info_9 = seq.firreg %1040 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1242 : ui64} : i10
    %info_10 = seq.firreg %1046 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1252 : ui64} : i10
    %info_11 = seq.firreg %1052 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1262 : ui64} : i10
    %info_12 = seq.firreg %1058 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1272 : ui64} : i10
    %info_13 = seq.firreg %1064 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1282 : ui64} : i10
    %info_14 = seq.firreg %1070 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1292 : ui64} : i10
    %info_15 = seq.firreg %1076 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1302 : ui64} : i10
    %pte_addr_0 = seq.firreg %824 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1312 : ui64} : i32
    %pte_addr_1 = seq.firreg %829 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1344 : ui64} : i32
    %pte_addr_2 = seq.firreg %834 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1376 : ui64} : i32
    %pte_addr_3 = seq.firreg %839 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1408 : ui64} : i32
    %pte_addr_4 = seq.firreg %844 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1440 : ui64} : i32
    %pte_addr_5 = seq.firreg %849 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1472 : ui64} : i32
    %pte_addr_6 = seq.firreg %854 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1504 : ui64} : i32
    %pte_addr_7 = seq.firreg %859 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1536 : ui64} : i32
    %pte_addr_8 = seq.firreg %864 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1568 : ui64} : i32
    %pte_addr_9 = seq.firreg %869 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1600 : ui64} : i32
    %pte_addr_10 = seq.firreg %874 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1632 : ui64} : i32
    %pte_addr_11 = seq.firreg %879 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1664 : ui64} : i32
    %pte_addr_12 = seq.firreg %884 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1696 : ui64} : i32
    %pte_addr_13 = seq.firreg %889 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1728 : ui64} : i32
    %pte_addr_14 = seq.firreg %894 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1760 : ui64} : i32
    %pte_addr_15 = seq.firreg %899 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1792 : ui64} : i32
    %pte_level_0 = seq.firreg %904 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1824 : ui64} : i2
    %pte_level_1 = seq.firreg %909 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1826 : ui64} : i2
    %pte_level_2 = seq.firreg %914 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1828 : ui64} : i2
    %pte_level_3 = seq.firreg %919 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1830 : ui64} : i2
    %pte_level_4 = seq.firreg %924 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1832 : ui64} : i2
    %pte_level_5 = seq.firreg %929 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1834 : ui64} : i2
    %pte_level_6 = seq.firreg %934 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1836 : ui64} : i2
    %pte_level_7 = seq.firreg %939 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1838 : ui64} : i2
    %pte_level_8 = seq.firreg %944 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1840 : ui64} : i2
    %pte_level_9 = seq.firreg %949 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1842 : ui64} : i2
    %pte_level_10 = seq.firreg %954 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1844 : ui64} : i2
    %pte_level_11 = seq.firreg %959 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1846 : ui64} : i2
    %pte_level_12 = seq.firreg %964 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1848 : ui64} : i2
    %pte_level_13 = seq.firreg %969 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1850 : ui64} : i2
    %pte_level_14 = seq.firreg %974 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1852 : ui64} : i2
    %pte_level_15 = seq.firreg %979 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1854 : ui64} : i2
    %valid_0 = seq.firreg %676 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1856 : ui64} : i1
    %valid_1 = seq.firreg %680 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1857 : ui64} : i1
    %valid_2 = seq.firreg %684 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1858 : ui64} : i1
    %valid_3 = seq.firreg %688 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1859 : ui64} : i1
    %valid_4 = seq.firreg %692 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1860 : ui64} : i1
    %valid_5 = seq.firreg %696 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1861 : ui64} : i1
    %valid_6 = seq.firreg %700 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1862 : ui64} : i1
    %valid_7 = seq.firreg %704 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1863 : ui64} : i1
    %valid_8 = seq.firreg %708 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1864 : ui64} : i1
    %valid_9 = seq.firreg %712 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1865 : ui64} : i1
    %valid_10 = seq.firreg %716 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1866 : ui64} : i1
    %valid_11 = seq.firreg %720 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1867 : ui64} : i1
    %valid_12 = seq.firreg %724 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1868 : ui64} : i1
    %valid_13 = seq.firreg %728 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1869 : ui64} : i1
    %valid_14 = seq.firreg %732 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1870 : ui64} : i1
    %valid_15 = seq.firreg %736 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1871 : ui64} : i1
    %pre_addr = seq.firreg %280 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1872 : ui64} : i64
    %pte_addr_r = seq.firreg %511 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1936 : ui64} : i32
    %wpte_data_r = seq.firreg %351 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1968 : ui64} : i64
    %dc_mode_r = seq.firreg %518 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 2032 : ui64, sv.namehint = ".io_dcacheRW_dc_mode.output"} : i5
    %out_valid_r = seq.firreg %1077 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2038 : ui64, sv.namehint = ".io_va2pa_pvalid.output"} : i1
    %out_paddr_r = seq.firreg %1079 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 2039 : ui64} : i32
    %out_excep_r_cause = seq.firreg %444 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 2071 : ui64} : i64
    %out_excep_r_tval = seq.firreg %448 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 2135 : ui64} : i64
    %out_excep_r_en = seq.firreg %561 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2199 : ui64, sv.namehint = ".io_va2pa_tlb_excep_en.output"} : i1
    %1 = comb.and %io_va2pa_vvalid, %277, %278, %279 {sv.namehint = "handshake"} : i1
    %2 = comb.extract %io_va2pa_vaddr from 12 {sv.namehint = "inp_tag"} : (i64) -> i52
    %3 = comb.icmp bin eq %io_va2pa_m_type, %c1_i2 {sv.namehint = "_out_excep_r_cause_T_6"} : i2
    %4 = comb.extract %io_mmuState_mstatus from 17 {sv.namehint = "_mode_T_1"} : (i64) -> i1
    %5 = comb.extract %io_mmuState_mstatus from 11 {sv.namehint = "_mode_T_2"} : (i64) -> i2
    %6 = comb.xor %4, %true : i1
    %7 = comb.or %3, %6 : i1
    %8 = comb.mux bin %7, %io_mmuState_priv, %5 {sv.namehint = "mode"} : i2
    %9 = comb.icmp bin eq %8, %c-1_i2 {sv.namehint = "_mmuMode_T"} : i2
    %10 = comb.extract %io_mmuState_satp from 60 {sv.namehint = "_mmuMode_T_1"} : (i64) -> i4
    %11 = comb.mux bin %9, %c0_i4, %10 {sv.namehint = "mmuMode"} : i4
    %12 = comb.icmp bin eq %11, %c-8_i4 {sv.namehint = "is_Sv39"} : i4
    %13 = comb.icmp bin eq %pte_level_0, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_3"} : i2
    %14 = comb.replicate %13 {sv.namehint = "_tlb_tag_mask_T_4"} : (i1) -> i52
    %15 = comb.icmp bin eq %pte_level_0, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_5"} : i2
    %16 = comb.mux bin %15, %c-512_i52, %14 {sv.namehint = "_tlb_tag_mask_T_6"} : i52
    %17 = comb.icmp bin eq %pte_level_0, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_7"} : i2
    %18 = comb.mux bin %17, %c-262144_i52, %16 {sv.namehint = "tlb_tag_mask"} : i52
    %19 = comb.and bin %2, %18 {sv.namehint = "_T_1"} : i52
    %20 = comb.icmp bin eq %19, %tag_0 {sv.namehint = "_T_2"} : i52
    %21 = comb.and bin %20, %valid_0 {sv.namehint = "_T_3"} : i1
    %22 = comb.mux bin %21, %paddr_0, %c0_i20 : i20
    %23 = comb.mux bin %21, %info_0, %c0_i10 : i10
    %24 = comb.mux bin %21, %pte_addr_0, %c0_i32 : i32
    %25 = comb.mux bin %21, %pte_level_0, %c0_i2 : i2
    %26 = comb.icmp bin eq %pte_level_1, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_11"} : i2
    %27 = comb.replicate %26 {sv.namehint = "_tlb_tag_mask_T_12"} : (i1) -> i52
    %28 = comb.icmp bin eq %pte_level_1, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_13"} : i2
    %29 = comb.mux bin %28, %c-512_i52, %27 {sv.namehint = "_tlb_tag_mask_T_14"} : i52
    %30 = comb.icmp bin eq %pte_level_1, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_15"} : i2
    %31 = comb.mux bin %30, %c-262144_i52, %29 {sv.namehint = "tlb_tag_mask_1"} : i52
    %32 = comb.and bin %2, %31 {sv.namehint = "_T_4"} : i52
    %33 = comb.icmp bin eq %32, %tag_1 {sv.namehint = "_T_5"} : i52
    %34 = comb.and bin %33, %valid_1 {sv.namehint = "_T_6"} : i1
    %35 = comb.mux bin %34, %paddr_1, %22 : i20
    %36 = comb.mux bin %34, %info_1, %23 : i10
    %37 = comb.mux bin %34, %pte_addr_1, %24 : i32
    %38 = comb.concat %c0_i3, %34 : i3, i1
    %39 = comb.mux bin %34, %pte_level_1, %25 : i2
    %40 = comb.icmp bin eq %pte_level_2, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_19"} : i2
    %41 = comb.replicate %40 {sv.namehint = "_tlb_tag_mask_T_20"} : (i1) -> i52
    %42 = comb.icmp bin eq %pte_level_2, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_21"} : i2
    %43 = comb.mux bin %42, %c-512_i52, %41 {sv.namehint = "_tlb_tag_mask_T_22"} : i52
    %44 = comb.icmp bin eq %pte_level_2, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_23"} : i2
    %45 = comb.mux bin %44, %c-262144_i52, %43 {sv.namehint = "tlb_tag_mask_2"} : i52
    %46 = comb.and bin %2, %45 {sv.namehint = "_T_7"} : i52
    %47 = comb.icmp bin eq %46, %tag_2 {sv.namehint = "_T_8"} : i52
    %48 = comb.and bin %47, %valid_2 {sv.namehint = "_T_9"} : i1
    %49 = comb.mux bin %48, %paddr_2, %35 : i20
    %50 = comb.mux bin %48, %info_2, %36 : i10
    %51 = comb.mux bin %48, %pte_addr_2, %37 : i32
    %52 = comb.mux bin %48, %c2_i4, %38 : i4
    %53 = comb.mux bin %48, %pte_level_2, %39 : i2
    %54 = comb.icmp bin eq %pte_level_3, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_27"} : i2
    %55 = comb.replicate %54 {sv.namehint = "_tlb_tag_mask_T_28"} : (i1) -> i52
    %56 = comb.icmp bin eq %pte_level_3, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_29"} : i2
    %57 = comb.mux bin %56, %c-512_i52, %55 {sv.namehint = "_tlb_tag_mask_T_30"} : i52
    %58 = comb.icmp bin eq %pte_level_3, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_31"} : i2
    %59 = comb.mux bin %58, %c-262144_i52, %57 {sv.namehint = "tlb_tag_mask_3"} : i52
    %60 = comb.and bin %2, %59 {sv.namehint = "_T_10"} : i52
    %61 = comb.icmp bin eq %60, %tag_3 {sv.namehint = "_T_11"} : i52
    %62 = comb.and bin %61, %valid_3 {sv.namehint = "_T_12"} : i1
    %63 = comb.mux bin %62, %paddr_3, %49 : i20
    %64 = comb.mux bin %62, %info_3, %50 : i10
    %65 = comb.mux bin %62, %pte_addr_3, %51 : i32
    %66 = comb.mux bin %62, %c3_i4, %52 : i4
    %67 = comb.mux bin %62, %pte_level_3, %53 : i2
    %68 = comb.icmp bin eq %pte_level_4, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_35"} : i2
    %69 = comb.replicate %68 {sv.namehint = "_tlb_tag_mask_T_36"} : (i1) -> i52
    %70 = comb.icmp bin eq %pte_level_4, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_37"} : i2
    %71 = comb.mux bin %70, %c-512_i52, %69 {sv.namehint = "_tlb_tag_mask_T_38"} : i52
    %72 = comb.icmp bin eq %pte_level_4, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_39"} : i2
    %73 = comb.mux bin %72, %c-262144_i52, %71 {sv.namehint = "tlb_tag_mask_4"} : i52
    %74 = comb.and bin %2, %73 {sv.namehint = "_T_13"} : i52
    %75 = comb.icmp bin eq %74, %tag_4 {sv.namehint = "_T_14"} : i52
    %76 = comb.and bin %75, %valid_4 {sv.namehint = "_T_15"} : i1
    %77 = comb.mux bin %76, %paddr_4, %63 : i20
    %78 = comb.mux bin %76, %info_4, %64 : i10
    %79 = comb.mux bin %76, %pte_addr_4, %65 : i32
    %80 = comb.mux bin %76, %c4_i4, %66 : i4
    %81 = comb.mux bin %76, %pte_level_4, %67 : i2
    %82 = comb.icmp bin eq %pte_level_5, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_43"} : i2
    %83 = comb.replicate %82 {sv.namehint = "_tlb_tag_mask_T_44"} : (i1) -> i52
    %84 = comb.icmp bin eq %pte_level_5, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_45"} : i2
    %85 = comb.mux bin %84, %c-512_i52, %83 {sv.namehint = "_tlb_tag_mask_T_46"} : i52
    %86 = comb.icmp bin eq %pte_level_5, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_47"} : i2
    %87 = comb.mux bin %86, %c-262144_i52, %85 {sv.namehint = "tlb_tag_mask_5"} : i52
    %88 = comb.and bin %2, %87 {sv.namehint = "_T_16"} : i52
    %89 = comb.icmp bin eq %88, %tag_5 {sv.namehint = "_T_17"} : i52
    %90 = comb.and bin %89, %valid_5 {sv.namehint = "_T_18"} : i1
    %91 = comb.mux bin %90, %paddr_5, %77 : i20
    %92 = comb.mux bin %90, %info_5, %78 : i10
    %93 = comb.mux bin %90, %pte_addr_5, %79 : i32
    %94 = comb.mux bin %90, %c5_i4, %80 : i4
    %95 = comb.mux bin %90, %pte_level_5, %81 : i2
    %96 = comb.icmp bin eq %pte_level_6, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_51"} : i2
    %97 = comb.replicate %96 {sv.namehint = "_tlb_tag_mask_T_52"} : (i1) -> i52
    %98 = comb.icmp bin eq %pte_level_6, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_53"} : i2
    %99 = comb.mux bin %98, %c-512_i52, %97 {sv.namehint = "_tlb_tag_mask_T_54"} : i52
    %100 = comb.icmp bin eq %pte_level_6, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_55"} : i2
    %101 = comb.mux bin %100, %c-262144_i52, %99 {sv.namehint = "tlb_tag_mask_6"} : i52
    %102 = comb.and bin %2, %101 {sv.namehint = "_T_19"} : i52
    %103 = comb.icmp bin eq %102, %tag_6 {sv.namehint = "_T_20"} : i52
    %104 = comb.and bin %103, %valid_6 {sv.namehint = "_T_21"} : i1
    %105 = comb.mux bin %104, %paddr_6, %91 : i20
    %106 = comb.mux bin %104, %info_6, %92 : i10
    %107 = comb.mux bin %104, %pte_addr_6, %93 : i32
    %108 = comb.mux bin %104, %c6_i4, %94 : i4
    %109 = comb.mux bin %104, %pte_level_6, %95 : i2
    %110 = comb.icmp bin eq %pte_level_7, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_59"} : i2
    %111 = comb.replicate %110 {sv.namehint = "_tlb_tag_mask_T_60"} : (i1) -> i52
    %112 = comb.icmp bin eq %pte_level_7, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_61"} : i2
    %113 = comb.mux bin %112, %c-512_i52, %111 {sv.namehint = "_tlb_tag_mask_T_62"} : i52
    %114 = comb.icmp bin eq %pte_level_7, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_63"} : i2
    %115 = comb.mux bin %114, %c-262144_i52, %113 {sv.namehint = "tlb_tag_mask_7"} : i52
    %116 = comb.and bin %2, %115 {sv.namehint = "_T_22"} : i52
    %117 = comb.icmp bin eq %116, %tag_7 {sv.namehint = "_T_23"} : i52
    %118 = comb.and bin %117, %valid_7 {sv.namehint = "_T_24"} : i1
    %119 = comb.mux bin %118, %paddr_7, %105 : i20
    %120 = comb.mux bin %118, %info_7, %106 : i10
    %121 = comb.mux bin %118, %pte_addr_7, %107 : i32
    %122 = comb.mux bin %118, %c7_i4, %108 : i4
    %123 = comb.mux bin %118, %pte_level_7, %109 : i2
    %124 = comb.icmp bin eq %pte_level_8, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_67"} : i2
    %125 = comb.replicate %124 {sv.namehint = "_tlb_tag_mask_T_68"} : (i1) -> i52
    %126 = comb.icmp bin eq %pte_level_8, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_69"} : i2
    %127 = comb.mux bin %126, %c-512_i52, %125 {sv.namehint = "_tlb_tag_mask_T_70"} : i52
    %128 = comb.icmp bin eq %pte_level_8, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_71"} : i2
    %129 = comb.mux bin %128, %c-262144_i52, %127 {sv.namehint = "tlb_tag_mask_8"} : i52
    %130 = comb.and bin %2, %129 {sv.namehint = "_T_25"} : i52
    %131 = comb.icmp bin eq %130, %tag_8 {sv.namehint = "_T_26"} : i52
    %132 = comb.and bin %131, %valid_8 {sv.namehint = "_T_27"} : i1
    %133 = comb.mux bin %132, %paddr_8, %119 : i20
    %134 = comb.mux bin %132, %info_8, %120 : i10
    %135 = comb.mux bin %132, %pte_addr_8, %121 : i32
    %136 = comb.mux bin %132, %c-8_i4, %122 : i4
    %137 = comb.mux bin %132, %pte_level_8, %123 : i2
    %138 = comb.icmp bin eq %pte_level_9, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_75"} : i2
    %139 = comb.replicate %138 {sv.namehint = "_tlb_tag_mask_T_76"} : (i1) -> i52
    %140 = comb.icmp bin eq %pte_level_9, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_77"} : i2
    %141 = comb.mux bin %140, %c-512_i52, %139 {sv.namehint = "_tlb_tag_mask_T_78"} : i52
    %142 = comb.icmp bin eq %pte_level_9, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_79"} : i2
    %143 = comb.mux bin %142, %c-262144_i52, %141 {sv.namehint = "tlb_tag_mask_9"} : i52
    %144 = comb.and bin %2, %143 {sv.namehint = "_T_28"} : i52
    %145 = comb.icmp bin eq %144, %tag_9 {sv.namehint = "_T_29"} : i52
    %146 = comb.and bin %145, %valid_9 {sv.namehint = "_T_30"} : i1
    %147 = comb.mux bin %146, %paddr_9, %133 : i20
    %148 = comb.mux bin %146, %info_9, %134 : i10
    %149 = comb.mux bin %146, %pte_addr_9, %135 : i32
    %150 = comb.mux bin %146, %c-7_i4, %136 : i4
    %151 = comb.mux bin %146, %pte_level_9, %137 : i2
    %152 = comb.icmp bin eq %pte_level_10, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_83"} : i2
    %153 = comb.replicate %152 {sv.namehint = "_tlb_tag_mask_T_84"} : (i1) -> i52
    %154 = comb.icmp bin eq %pte_level_10, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_85"} : i2
    %155 = comb.mux bin %154, %c-512_i52, %153 {sv.namehint = "_tlb_tag_mask_T_86"} : i52
    %156 = comb.icmp bin eq %pte_level_10, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_87"} : i2
    %157 = comb.mux bin %156, %c-262144_i52, %155 {sv.namehint = "tlb_tag_mask_10"} : i52
    %158 = comb.and bin %2, %157 {sv.namehint = "_T_31"} : i52
    %159 = comb.icmp bin eq %158, %tag_10 {sv.namehint = "_T_32"} : i52
    %160 = comb.and bin %159, %valid_10 {sv.namehint = "_T_33"} : i1
    %161 = comb.mux bin %160, %paddr_10, %147 : i20
    %162 = comb.mux bin %160, %info_10, %148 : i10
    %163 = comb.mux bin %160, %pte_addr_10, %149 : i32
    %164 = comb.mux bin %160, %c-6_i4, %150 : i4
    %165 = comb.mux bin %160, %pte_level_10, %151 : i2
    %166 = comb.icmp bin eq %pte_level_11, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_91"} : i2
    %167 = comb.replicate %166 {sv.namehint = "_tlb_tag_mask_T_92"} : (i1) -> i52
    %168 = comb.icmp bin eq %pte_level_11, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_93"} : i2
    %169 = comb.mux bin %168, %c-512_i52, %167 {sv.namehint = "_tlb_tag_mask_T_94"} : i52
    %170 = comb.icmp bin eq %pte_level_11, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_95"} : i2
    %171 = comb.mux bin %170, %c-262144_i52, %169 {sv.namehint = "tlb_tag_mask_11"} : i52
    %172 = comb.and bin %2, %171 {sv.namehint = "_T_34"} : i52
    %173 = comb.icmp bin eq %172, %tag_11 {sv.namehint = "_T_35"} : i52
    %174 = comb.and bin %173, %valid_11 {sv.namehint = "_T_36"} : i1
    %175 = comb.mux bin %174, %paddr_11, %161 : i20
    %176 = comb.mux bin %174, %info_11, %162 : i10
    %177 = comb.mux bin %174, %pte_addr_11, %163 : i32
    %178 = comb.mux bin %174, %c-5_i4, %164 : i4
    %179 = comb.mux bin %174, %pte_level_11, %165 : i2
    %180 = comb.icmp bin eq %pte_level_12, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_99"} : i2
    %181 = comb.replicate %180 {sv.namehint = "_tlb_tag_mask_T_100"} : (i1) -> i52
    %182 = comb.icmp bin eq %pte_level_12, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_101"} : i2
    %183 = comb.mux bin %182, %c-512_i52, %181 {sv.namehint = "_tlb_tag_mask_T_102"} : i52
    %184 = comb.icmp bin eq %pte_level_12, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_103"} : i2
    %185 = comb.mux bin %184, %c-262144_i52, %183 {sv.namehint = "tlb_tag_mask_12"} : i52
    %186 = comb.and bin %2, %185 {sv.namehint = "_T_37"} : i52
    %187 = comb.icmp bin eq %186, %tag_12 {sv.namehint = "_T_38"} : i52
    %188 = comb.and bin %187, %valid_12 {sv.namehint = "_T_39"} : i1
    %189 = comb.mux bin %188, %paddr_12, %175 : i20
    %190 = comb.mux bin %188, %info_12, %176 : i10
    %191 = comb.mux bin %188, %pte_addr_12, %177 : i32
    %192 = comb.mux bin %188, %c-4_i4, %178 : i4
    %193 = comb.mux bin %188, %pte_level_12, %179 : i2
    %194 = comb.icmp bin eq %pte_level_13, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_107"} : i2
    %195 = comb.replicate %194 {sv.namehint = "_tlb_tag_mask_T_108"} : (i1) -> i52
    %196 = comb.icmp bin eq %pte_level_13, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_109"} : i2
    %197 = comb.mux bin %196, %c-512_i52, %195 {sv.namehint = "_tlb_tag_mask_T_110"} : i52
    %198 = comb.icmp bin eq %pte_level_13, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_111"} : i2
    %199 = comb.mux bin %198, %c-262144_i52, %197 {sv.namehint = "tlb_tag_mask_13"} : i52
    %200 = comb.and bin %2, %199 {sv.namehint = "_T_40"} : i52
    %201 = comb.icmp bin eq %200, %tag_13 {sv.namehint = "_T_41"} : i52
    %202 = comb.and bin %201, %valid_13 {sv.namehint = "_T_42"} : i1
    %203 = comb.mux bin %202, %paddr_13, %189 : i20
    %204 = comb.mux bin %202, %info_13, %190 : i10
    %205 = comb.mux bin %202, %pte_addr_13, %191 : i32
    %206 = comb.mux bin %202, %c-3_i4, %192 : i4
    %207 = comb.mux bin %202, %pte_level_13, %193 : i2
    %208 = comb.icmp bin eq %pte_level_14, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_115"} : i2
    %209 = comb.replicate %208 {sv.namehint = "_tlb_tag_mask_T_116"} : (i1) -> i52
    %210 = comb.icmp bin eq %pte_level_14, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_117"} : i2
    %211 = comb.mux bin %210, %c-512_i52, %209 {sv.namehint = "_tlb_tag_mask_T_118"} : i52
    %212 = comb.icmp bin eq %pte_level_14, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_119"} : i2
    %213 = comb.mux bin %212, %c-262144_i52, %211 {sv.namehint = "tlb_tag_mask_14"} : i52
    %214 = comb.and bin %2, %213 {sv.namehint = "_T_43"} : i52
    %215 = comb.icmp bin eq %214, %tag_14 {sv.namehint = "_T_44"} : i52
    %216 = comb.and bin %215, %valid_14 {sv.namehint = "_T_45"} : i1
    %217 = comb.mux bin %216, %paddr_14, %203 : i20
    %218 = comb.mux bin %216, %info_14, %204 : i10
    %219 = comb.mux bin %216, %pte_addr_14, %205 : i32
    %220 = comb.mux bin %216, %c-2_i4, %206 : i4
    %221 = comb.mux bin %216, %pte_level_14, %207 : i2
    %222 = comb.icmp bin eq %pte_level_15, %c0_i2 {sv.namehint = "_tlb_tag_mask_T_123"} : i2
    %223 = comb.replicate %222 {sv.namehint = "_tlb_tag_mask_T_124"} : (i1) -> i52
    %224 = comb.icmp bin eq %pte_level_15, %c1_i2 {sv.namehint = "_tlb_tag_mask_T_125"} : i2
    %225 = comb.mux bin %224, %c-512_i52, %223 {sv.namehint = "_tlb_tag_mask_T_126"} : i52
    %226 = comb.icmp bin eq %pte_level_15, %c-2_i2 {sv.namehint = "_tlb_tag_mask_T_127"} : i2
    %227 = comb.mux bin %226, %c-262144_i52, %225 {sv.namehint = "tlb_tag_mask_15"} : i52
    %228 = comb.and bin %2, %227 {sv.namehint = "_T_46"} : i52
    %229 = comb.icmp bin eq %228, %tag_15 {sv.namehint = "_T_47"} : i52
    %230 = comb.and bin %229, %valid_15 {sv.namehint = "_T_48"} : i1
    %231 = comb.or %230, %216, %202, %188, %174, %160, %146, %132, %118, %104, %90, %76, %62, %48, %34, %21 {sv.namehint = "tlbMsg_tlbHit"} : i1
    %232 = comb.mux bin %230, %paddr_15, %217 {sv.namehint = "tlbMsg_tlbPa"} : i20
    %233 = comb.mux bin %230, %info_15, %218 {sv.namehint = "tlbMsg_tlbInfo"} : i10
    %234 = comb.mux bin %230, %pte_addr_15, %219 {sv.namehint = "tlbMsg_tlbPteAddr"} : i32
    %235 = comb.mux bin %230, %c-1_i4, %220 {sv.namehint = "tlbMsg_tlbIdx"} : i4
    %236 = comb.mux bin %230, %pte_level_15, %221 {sv.namehint = "tlbMsg_tlbLevel"} : i2
    %state = seq.firreg %568 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 2200 : ui64} : i2
    %flush_r = seq.firreg %273 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2202 : ui64} : i1
    %237 = comb.or bin %io_flush, %flush_r {sv.namehint = "_T_49"} : i1
    %238 = comb.icmp bin ne %state, %c0_i2 : i2
    %239 = comb.xor bin %238, %true {sv.namehint = "_T_50"} : i1
    %240 = comb.and bin %237, %239 : i1
    %241 = comb.xor %240, %true : i1
    %242 = comb.and %241, %valid_0 : i1
    %243 = comb.xor %240, %true : i1
    %244 = comb.and %243, %valid_1 : i1
    %245 = comb.xor %240, %true : i1
    %246 = comb.and %245, %valid_2 : i1
    %247 = comb.xor %240, %true : i1
    %248 = comb.and %247, %valid_3 : i1
    %249 = comb.xor %240, %true : i1
    %250 = comb.and %249, %valid_4 : i1
    %251 = comb.xor %240, %true : i1
    %252 = comb.and %251, %valid_5 : i1
    %253 = comb.xor %240, %true : i1
    %254 = comb.and %253, %valid_6 : i1
    %255 = comb.xor %240, %true : i1
    %256 = comb.and %255, %valid_7 : i1
    %257 = comb.xor %240, %true : i1
    %258 = comb.and %257, %valid_8 : i1
    %259 = comb.xor %240, %true : i1
    %260 = comb.and %259, %valid_9 : i1
    %261 = comb.xor %240, %true : i1
    %262 = comb.and %261, %valid_10 : i1
    %263 = comb.xor %240, %true : i1
    %264 = comb.and %263, %valid_11 : i1
    %265 = comb.xor %240, %true : i1
    %266 = comb.and %265, %valid_12 : i1
    %267 = comb.xor %240, %true : i1
    %268 = comb.and %267, %valid_13 : i1
    %269 = comb.xor %240, %true : i1
    %270 = comb.and %269, %valid_14 : i1
    %271 = comb.xor %240, %true : i1
    %272 = comb.and %271, %valid_15 : i1
    %273 = comb.mux bin %237, %238, %flush_r : i1
    %m_type_r = seq.firreg %439 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 2203 : ui64} : i2
    %274 = comb.mux bin %1, %io_va2pa_m_type, %m_type_r {sv.namehint = "cur_m_type"} : i2
    %275 = comb.icmp bin eq %274, %c-1_i2 {sv.namehint = "_tlb_access_illegal_T_13"} : i2
    %276 = comb.concat %c0_i2, %275, %c-64_i7 {sv.namehint = "ad"} : i2, i1, i7
    %277 = comb.xor bin %238, %true {sv.namehint = "_T_54"} : i1
    %278 = comb.xor bin %io_flush, %true {sv.namehint = "_io_va2pa_ready_T_2"} : i1
    %279 = comb.xor bin %flush_r, %true {sv.namehint = "_io_va2pa_ready_T_4"} : i1
    %280 = comb.mux bin %1, %io_va2pa_vaddr, %pre_addr : i64
    %281 = comb.or bin %out_valid_r, %out_excep_r_en {sv.namehint = "_T_51"} : i1
    %282 = comb.xor %281, %true : i1
    %283 = comb.and %282, %out_valid_r : i1
    %284 = comb.xor %281, %true : i1
    %285 = comb.and %284, %out_excep_r_en : i1
    %286 = comb.icmp bin ne %dc_mode_r, %c0_i5 {sv.namehint = "_dc_hand_T"} : i5
    %287 = comb.and bin %io_dcacheRW_ready, %286 {sv.namehint = "dc_hand"} : i1
    %288 = comb.extract %io_va2pa_vaddr from 38 {sv.namehint = "_T_65"} : (i64) -> i1
    %289 = comb.replicate %288 {sv.namehint = "_tlb_high_legal_T_2"} : (i1) -> i25
    %290 = comb.extract %io_va2pa_vaddr from 39 {sv.namehint = "_T_63"} : (i64) -> i25
    %291 = comb.icmp bin eq %274, %c1_i2 {sv.namehint = "_tlb_access_illegal_T"} : i2
    %292 = comb.extract %233 from 3 {sv.namehint = "_tlb_access_illegal_T_7"} : (i10) -> i1
    %293 = comb.xor bin %292, %true {sv.namehint = "_tlb_access_illegal_T_2"} : i1
    %294 = comb.and bin %291, %293 {sv.namehint = "_tlb_access_illegal_T_3"} : i1
    %295 = comb.icmp bin eq %274, %c-2_i2 {sv.namehint = "_tlb_access_illegal_T_4"} : i2
    %296 = comb.extract %233 from 1 {sv.namehint = "_tlb_access_illegal_T_5"} : (i10) -> i1
    %297 = comb.extract %io_mmuState_mstatus from 19 {sv.namehint = "_T_101"} : (i64) -> i1
    %298 = comb.and bin %297, %292 {sv.namehint = "_tlb_access_illegal_T_8"} : i1
    %299 = comb.or bin %296, %298 {sv.namehint = "_tlb_access_illegal_T_9"} : i1
    %300 = comb.xor bin %299, %true {sv.namehint = "_tlb_access_illegal_T_10"} : i1
    %301 = comb.and bin %295, %300 {sv.namehint = "_tlb_access_illegal_T_11"} : i1
    %302 = comb.extract %233 from 2 {sv.namehint = "_tlb_access_illegal_T_14"} : (i10) -> i1
    %303 = comb.xor bin %302, %true {sv.namehint = "_tlb_access_illegal_T_15"} : i1
    %304 = comb.and bin %275, %303 {sv.namehint = "_tlb_access_illegal_T_16"} : i1
    %305 = comb.or bin %294, %301, %304 {sv.namehint = "tlb_access_illegal"} : i1
    %select_prng.io_out_0, %select_prng.io_out_1, %select_prng.io_out_2, %select_prng.io_out_3 = hw.instance "select_prng" @MaxPeriodFibonacciLFSR_3(clock: %clock: i1, reset: %reset: i1) -> (io_out_0: i1, io_out_1: i1, io_out_2: i1, io_out_3: i1)
    %306 = comb.concat %select_prng.io_out_3, %select_prng.io_out_2, %select_prng.io_out_1, %select_prng.io_out_0 {sv.namehint = "select"} : i1, i1, i1, i1
    %select_r = seq.firreg %436 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 2205 : ui64} : i4
    %offset = seq.firreg %486 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 2209 : ui64} : i8
    %level = seq.firreg %492 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 2217 : ui64} : i2
    %wpte_hs_r = seq.firreg %477 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2263 : ui64} : i1
    %307 = comb.icmp bin ne %state, %c0_i2 {sv.namehint = "_T_52"} : i2
    %308 = comb.or bin %12, %307 {sv.namehint = "_T_53"} : i1
    %309 = comb.xor bin %1, %true {sv.namehint = "_T_55"} : i1
    %310 = comb.icmp bin ne %289, %290 {sv.namehint = "_T_56"} : i25
    %311 = comb.and bin %231, %305 {sv.namehint = "_T_57"} : i1
    %312 = comb.or bin %310, %311 {sv.namehint = "_T_58"} : i1
    %313 = hw.array_get %0[%io_va2pa_m_type] {sv.namehint = "_out_excep_r_cause_T_5"} : !hw.array<4xi64>, i2
    %314 = comb.or bin %309, %312 : i1
    %315 = comb.xor %314, %true : i1
    %316 = comb.xor %238, %true : i1
    %317 = comb.and %316, %315, %231 : i1
    %318 = comb.or %317, %283 : i1
    %319 = comb.icmp bin eq %236, %c0_i2 {sv.namehint = "_paddr_mask_T_3"} : i2
    %320 = comb.icmp bin eq %236, %c1_i2 {sv.namehint = "_paddr_mask_T_5"} : i2
    %321 = comb.replicate %319 : (i1) -> i20
    %322 = comb.mux %320, %c-512_i20, %321 : i20
    %323 = comb.icmp bin eq %236, %c-2_i2 {sv.namehint = "_paddr_mask_T_7"} : i2
    %324 = comb.mux %323, %c-262144_i20, %322 : i20
    %325 = comb.concat %232, %c0_i12 {sv.namehint = "_out_paddr_r_T"} : i20, i12
    %326 = comb.xor %324, %c-1_i20 : i20
    %327 = comb.extract %io_va2pa_vaddr from 0 : (i64) -> i32
    %328 = comb.concat %326, %c-1_i12 : i20, i12
    %329 = comb.and %327, %328 : i32
    %330 = comb.concat %324, %c0_i12 : i20, i12
    %331 = comb.and bin %330, %325 : i32
    %332 = comb.or bin %329, %331 : i32
    %333 = comb.xor %231, %true : i1
    %334 = comb.or %238, %314, %333 : i1
    %335 = comb.mux bin %334, %out_paddr_r, %332 : i32
    %336 = comb.and bin %276, %233 {sv.namehint = "_T_59"} : i10
    %337 = comb.icmp bin ne %336, %276 {sv.namehint = "_T_60"} : i10
    %338 = comb.and bin %337, %12 {sv.namehint = "_T_61"} : i1
    %339 = comb.mux bin %338, %c-1_i2, %state : i2
    %340 = comb.and bin %231, %338 : i1
    %341 = comb.xor %340, %true : i1
    %342 = comb.or %314, %341 : i1
    %343 = comb.and %342, %wpte_hs_r : i1
    %344 = comb.mux bin %338, %234, %pte_addr_r : i32
    %345 = comb.or bin %233, %276 {sv.namehint = "wpte_data_r_lo"} : i10
    %346 = comb.concat %c0_i34, %232, %345 {sv.namehint = "_wpte_data_r_T"} : i34, i20, i10
    %347 = comb.xor %340, %true : i1
    %348 = comb.and bin %308, %277 : i1
    %349 = comb.xor %348, %true : i1
    %350 = comb.or %349, %314, %347 : i1
    %351 = comb.mux bin %350, %wpte_data_r, %346 : i64
    %352 = comb.icmp bin eq %235, %c0_i4 : i4
    %353 = comb.and bin %231, %338, %352 : i1
    %354 = comb.xor %353, %true : i1
    %355 = comb.or %314, %354 : i1
    %356 = comb.mux bin %355, %info_0, %345 : i10
    %357 = comb.icmp bin eq %235, %c1_i4 : i4
    %358 = comb.and bin %231, %338, %357 : i1
    %359 = comb.xor %358, %true : i1
    %360 = comb.or %314, %359 : i1
    %361 = comb.mux bin %360, %info_1, %345 : i10
    %362 = comb.icmp bin eq %235, %c2_i4 : i4
    %363 = comb.and bin %231, %338, %362 : i1
    %364 = comb.xor %363, %true : i1
    %365 = comb.or %314, %364 : i1
    %366 = comb.mux bin %365, %info_2, %345 : i10
    %367 = comb.icmp bin eq %235, %c3_i4 : i4
    %368 = comb.and bin %231, %338, %367 : i1
    %369 = comb.xor %368, %true : i1
    %370 = comb.or %314, %369 : i1
    %371 = comb.mux bin %370, %info_3, %345 : i10
    %372 = comb.icmp bin eq %235, %c4_i4 : i4
    %373 = comb.and bin %231, %338, %372 : i1
    %374 = comb.xor %373, %true : i1
    %375 = comb.or %314, %374 : i1
    %376 = comb.mux bin %375, %info_4, %345 : i10
    %377 = comb.icmp bin eq %235, %c5_i4 : i4
    %378 = comb.and bin %231, %338, %377 : i1
    %379 = comb.xor %378, %true : i1
    %380 = comb.or %314, %379 : i1
    %381 = comb.mux bin %380, %info_5, %345 : i10
    %382 = comb.icmp bin eq %235, %c6_i4 : i4
    %383 = comb.and bin %231, %338, %382 : i1
    %384 = comb.xor %383, %true : i1
    %385 = comb.or %314, %384 : i1
    %386 = comb.mux bin %385, %info_6, %345 : i10
    %387 = comb.icmp bin eq %235, %c7_i4 : i4
    %388 = comb.and bin %231, %338, %387 : i1
    %389 = comb.xor %388, %true : i1
    %390 = comb.or %314, %389 : i1
    %391 = comb.mux bin %390, %info_7, %345 : i10
    %392 = comb.icmp bin eq %235, %c-8_i4 : i4
    %393 = comb.and bin %231, %338, %392 : i1
    %394 = comb.xor %393, %true : i1
    %395 = comb.or %314, %394 : i1
    %396 = comb.mux bin %395, %info_8, %345 : i10
    %397 = comb.icmp bin eq %235, %c-7_i4 : i4
    %398 = comb.and bin %231, %338, %397 : i1
    %399 = comb.xor %398, %true : i1
    %400 = comb.or %314, %399 : i1
    %401 = comb.mux bin %400, %info_9, %345 : i10
    %402 = comb.icmp bin eq %235, %c-6_i4 : i4
    %403 = comb.and bin %231, %338, %402 : i1
    %404 = comb.xor %403, %true : i1
    %405 = comb.or %314, %404 : i1
    %406 = comb.mux bin %405, %info_10, %345 : i10
    %407 = comb.icmp bin eq %235, %c-5_i4 : i4
    %408 = comb.and bin %231, %338, %407 : i1
    %409 = comb.xor %408, %true : i1
    %410 = comb.or %314, %409 : i1
    %411 = comb.mux bin %410, %info_11, %345 : i10
    %412 = comb.icmp bin eq %235, %c-4_i4 : i4
    %413 = comb.and bin %231, %338, %412 : i1
    %414 = comb.xor %413, %true : i1
    %415 = comb.or %314, %414 : i1
    %416 = comb.mux bin %415, %info_12, %345 : i10
    %417 = comb.icmp bin eq %235, %c-3_i4 : i4
    %418 = comb.and bin %231, %338, %417 : i1
    %419 = comb.xor %418, %true : i1
    %420 = comb.or %314, %419 : i1
    %421 = comb.mux bin %420, %info_13, %345 : i10
    %422 = comb.icmp bin eq %235, %c-2_i4 : i4
    %423 = comb.and bin %231, %338, %422 : i1
    %424 = comb.xor %423, %true : i1
    %425 = comb.or %314, %424 : i1
    %426 = comb.mux bin %425, %info_14, %345 : i10
    %427 = comb.icmp bin eq %235, %c-1_i4 : i4
    %428 = comb.and bin %231, %338, %427 : i1
    %429 = comb.xor %428, %true : i1
    %430 = comb.or %314, %429 : i1
    %431 = comb.mux bin %430, %info_15, %345 : i10
    %432 = comb.xor bin %231, %true {sv.namehint = "_T_62"} : i1
    %433 = comb.or bin %309, %312, %231 : i1
    %434 = comb.xor %348, %true : i1
    %435 = comb.or %434, %433, %231 : i1
    %436 = comb.mux bin %435, %select_r, %306 : i4
    %437 = comb.xor %348, %true : i1
    %438 = comb.or %437, %433, %231 : i1
    %439 = comb.mux bin %438, %m_type_r, %io_va2pa_m_type : i2
    %440 = hw.array_get %0[%io_va2pa_m_type] {sv.namehint = "_out_excep_r_cause_T_11"} : !hw.array<4xi64>, i2
    %441 = comb.mux bin %231, %out_excep_r_cause, %440 : i64
    %442 = comb.mux bin %312, %313, %441 : i64
    %443 = comb.and %348, %1 : i1
    %444 = comb.mux bin %443, %442, %out_excep_r_cause : i64
    %445 = comb.xor %231, %true : i1
    %446 = comb.or %312, %445 : i1
    %447 = comb.and %348, %1, %446 : i1
    %448 = comb.mux bin %447, %io_va2pa_vaddr, %out_excep_r_tval : i64
    %449 = comb.replicate %288 {sv.namehint = "_T_66"} : (i1) -> i25
    %450 = comb.icmp bin ne %290, %449 {sv.namehint = "_T_67"} : i25
    %451 = comb.xor %231, %true : i1
    %452 = comb.and %451, %432, %450 : i1
    %453 = comb.or %312, %452 : i1
    %454 = comb.and %1, %453 : i1
    %455 = comb.or %454, %285 : i1
    %456 = comb.extract %io_va2pa_vaddr from 30 {sv.namehint = "pte_addr_r_hi_lo"} : (i64) -> i9
    %457 = comb.extract %io_mmuState_satp from 0 : (i64) -> i20
    %458 = comb.concat %457, %456, %c0_i3 : i20, i9, i3
    %459 = comb.or %231, %450 : i1
    %460 = comb.mux bin %459, %pte_addr_r, %458 : i32
    %461 = comb.mux bin %231, %344, %460 : i32
    %462 = comb.mux bin %314, %pte_addr_r, %461 : i32
    %463 = comb.or %433, %231, %450 : i1
    %464 = comb.mux bin %463, %c0_i5, %c7_i5 : i5
    %465 = comb.or %433, %231, %450 : i1
    %466 = comb.mux bin %465, %offset, %c30_i8 : i8
    %467 = comb.or %433, %231, %450 : i1
    %468 = comb.mux bin %467, %level, %c-1_i2 : i2
    %469 = comb.mux bin %231, %339, %c1_i2 : i2
    %470 = comb.mux bin %314, %state, %469 : i2
    %471 = comb.icmp bin eq %state, %c-1_i2 {sv.namehint = "_T_68"} : i2
    %472 = comb.or bin %io_dcacheRW_ready, %wpte_hs_r : i1
    %473 = comb.mux bin %472, %c0_i5, %c11_i5 : i5
    %474 = comb.and bin %471, %io_dcacheRW_ready : i1
    %475 = comb.or %474, %wpte_hs_r : i1
    %476 = comb.mux bin %238, %475, %343 : i1
    %477 = comb.mux bin %308, %476, %wpte_hs_r : i1
    %478 = comb.icmp bin eq %state, %c1_i2 {sv.namehint = "_T_69"} : i2
    %479 = comb.mux bin %287, %c0_i5, %dc_mode_r : i5
    %480 = comb.add %offset, %c-9_i8 {sv.namehint = "_offset_T_1"} : i8
    %481 = comb.and bin %478, %287 : i1
    %482 = comb.xor %481, %true : i1
    %483 = comb.or %471, %482 : i1
    %484 = comb.mux bin %483, %offset, %480 : i8
    %485 = comb.mux bin %238, %484, %466 : i8
    %486 = comb.mux bin %308, %485, %offset : i8
    %487 = comb.add %level, %c-1_i2 {sv.namehint = "_level_T_1"} : i2
    %488 = comb.xor %481, %true : i1
    %489 = comb.or %471, %488 : i1
    %490 = comb.mux bin %489, %level, %487 : i2
    %491 = comb.mux bin %238, %490, %468 : i2
    %492 = comb.mux bin %308, %491, %level : i2
    %493 = comb.extract %io_dcacheRW_rdata from 0 : (i64) -> i4
    %494 = comb.icmp bin eq %493, %c1_i4 {sv.namehint = "_T_74"} : i4
    %495 = comb.extract %io_dcacheRW_rdata from 6 : (i64) -> i2
    %496 = comb.extract %io_dcacheRW_rdata from 4 : (i64) -> i1
    %497 = comb.concat %495, %496 : i2, i1
    %498 = comb.icmp bin ne %497, %c0_i3 {sv.namehint = "_T_78"} : i3
    %499 = comb.or %498, %285 : i1
    %500 = comb.concat %c0_i56, %offset : i56, i8
    %501 = comb.shru bin %pre_addr, %500 {sv.namehint = "_pte_addr_r_T_2"} : i64
    %502 = comb.extract %501 from 0 {sv.namehint = "pte_addr_r_hi_lo_1"} : (i64) -> i9
    %503 = comb.extract %io_dcacheRW_rdata from 10 : (i64) -> i20
    %504 = comb.concat %503, %502, %c0_i3 : i20, i9, i3
    %505 = comb.and bin %io_dcacheRW_rvalid, %494 : i1
    %506 = comb.and bin %478, %505 : i1
    %507 = comb.xor %506, %true : i1
    %508 = comb.or %471, %507, %498 : i1
    %509 = comb.mux bin %508, %pte_addr_r, %504 : i32
    %510 = comb.mux bin %238, %509, %462 : i32
    %511 = comb.mux bin %308, %510, %pte_addr_r : i32
    %512 = comb.xor %505, %true : i1
    %513 = comb.or %512, %498 : i1
    %514 = comb.mux bin %513, %479, %c7_i5 : i5
    %515 = comb.mux bin %478, %514, %dc_mode_r : i5
    %516 = comb.mux bin %471, %473, %515 : i5
    %517 = comb.mux bin %238, %516, %464 : i5
    %518 = comb.mux bin %308, %517, %dc_mode_r : i5
    %519 = comb.extract %io_dcacheRW_rdata from 4 {sv.namehint = "_T_79"} : (i64) -> i1
    %520 = comb.icmp bin eq %io_mmuState_priv, %c1_i2 {sv.namehint = "_T_80"} : i2
    %521 = comb.extract %io_mmuState_mstatus from 18 {sv.namehint = "_T_81"} : (i64) -> i1
    %522 = comb.xor bin %521, %true {sv.namehint = "_T_82"} : i1
    %523 = comb.icmp bin eq %out_excep_r_cause, %c12_i64 {sv.namehint = "_T_95"} : i64
    %524 = comb.or bin %522, %523 {sv.namehint = "_T_84"} : i1
    %525 = comb.and bin %520, %524 {sv.namehint = "_T_85"} : i1
    %526 = comb.icmp bin eq %io_mmuState_priv, %c0_i2 {sv.namehint = "_T_86"} : i2
    %527 = comb.mux bin %519, %525, %526 {sv.namehint = "_T_87"} : i1
    %528 = comb.extract %io_dcacheRW_rdata from 0 {sv.namehint = "_T_88"} : (i64) -> i1
    %529 = comb.xor bin %528, %true {sv.namehint = "_T_89"} : i1
    %530 = comb.extract %io_dcacheRW_rdata from 1 {sv.namehint = "_T_100"} : (i64) -> i1
    %531 = comb.xor bin %530, %true {sv.namehint = "_T_91"} : i1
    %532 = comb.extract %io_dcacheRW_rdata from 2 {sv.namehint = "_T_109"} : (i64) -> i1
    %533 = comb.and bin %531, %532 {sv.namehint = "_T_93"} : i1
    %534 = comb.extract %io_dcacheRW_rdata from 3 {sv.namehint = "_T_102"} : (i64) -> i1
    %535 = comb.xor bin %534, %true {sv.namehint = "_T_97"} : i1
    %536 = comb.and bin %523, %535 {sv.namehint = "_T_98"} : i1
    %537 = comb.icmp bin eq %out_excep_r_cause, %c13_i64 {sv.namehint = "_T_99"} : i64
    %538 = comb.and bin %297, %534 {sv.namehint = "_T_103"} : i1
    %539 = comb.or bin %530, %538 {sv.namehint = "_T_104"} : i1
    %540 = comb.xor bin %539, %true {sv.namehint = "_T_105"} : i1
    %541 = comb.and bin %537, %540 {sv.namehint = "_T_106"} : i1
    %542 = comb.icmp bin eq %out_excep_r_cause, %c15_i64 {sv.namehint = "_T_108"} : i64
    %543 = comb.xor bin %532, %true {sv.namehint = "_T_110"} : i1
    %544 = comb.and bin %542, %543 {sv.namehint = "_T_111"} : i1
    %545 = comb.icmp bin eq %level, %c1_i2 {sv.namehint = "_ppn_mask_T_5"} : i2
    %546 = comb.extract %io_dcacheRW_rdata from 10 {sv.namehint = "_T_114"} : (i64) -> i9
    %547 = comb.icmp bin ne %546, %c0_i9 {sv.namehint = "_T_115"} : i9
    %548 = comb.and bin %545, %547 {sv.namehint = "_T_116"} : i1
    %549 = comb.icmp bin eq %level, %c-2_i2 {sv.namehint = "_ppn_mask_T_7"} : i2
    %550 = comb.extract %io_dcacheRW_rdata from 10 {sv.namehint = "_T_118"} : (i64) -> i18
    %551 = comb.icmp bin ne %550, %c0_i18 {sv.namehint = "_T_119"} : i18
    %552 = comb.and bin %549, %551 {sv.namehint = "_T_120"} : i1
    %553 = comb.or bin %527, %529, %533, %536, %541, %544, %548, %552 : i1
    %554 = comb.or %553, %285 : i1
    %555 = comb.mux bin %494, %499, %554 : i1
    %556 = comb.and bin %478, %io_dcacheRW_rvalid : i1
    %557 = comb.xor %556, %true : i1
    %558 = comb.or %471, %557 : i1
    %559 = comb.mux bin %558, %285, %555 : i1
    %560 = comb.mux bin %238, %559, %455 : i1
    %561 = comb.mux bin %308, %560, %285 : i1
    %562 = comb.xor %494, %true : i1
    %563 = comb.or %562, %498 : i1
    %564 = comb.and %556, %563 : i1
    %565 = comb.mux %471, %io_dcacheRW_rvalid, %564 : i1
    %566 = comb.mux bin %565, %c0_i2, %state : i2
    %567 = comb.mux bin %238, %566, %470 : i2
    %568 = comb.mux bin %308, %567, %state : i2
    %569 = comb.icmp bin eq %level, %c0_i2 {sv.namehint = "_ppn_mask_T_3"} : i2
    %570 = comb.replicate %569 {sv.namehint = "_ppn_mask_T_4"} : (i1) -> i52
    %571 = comb.mux bin %545, %c-512_i52, %570 {sv.namehint = "_ppn_mask_T_6"} : i52
    %572 = comb.mux bin %549, %c-262144_i52, %571 {sv.namehint = "ppn_mask"} : i52
    %573 = comb.extract %pre_addr from 12 {sv.namehint = "_tag_T"} : (i64) -> i52
    %574 = comb.and bin %573, %572 {sv.namehint = "_tag_T_1"} : i52
    %575 = comb.icmp bin eq %select_r, %c0_i4 : i4
    %576 = comb.or bin %494, %553 : i1
    %577 = comb.xor %575, %true : i1
    %578 = comb.xor %556, %true : i1
    %579 = comb.or bin %277, %471 : i1
    %580 = comb.xor %308, %true : i1
    %581 = comb.or %580, %579, %578, %576, %577 : i1
    %582 = comb.mux bin %581, %tag_0, %574 : i52
    %583 = comb.icmp bin eq %select_r, %c1_i4 : i4
    %584 = comb.xor %583, %true : i1
    %585 = comb.xor %556, %true : i1
    %586 = comb.xor %308, %true : i1
    %587 = comb.or %586, %579, %585, %576, %584 : i1
    %588 = comb.mux bin %587, %tag_1, %574 : i52
    %589 = comb.icmp bin eq %select_r, %c2_i4 : i4
    %590 = comb.xor %589, %true : i1
    %591 = comb.xor %556, %true : i1
    %592 = comb.xor %308, %true : i1
    %593 = comb.or %592, %579, %591, %576, %590 : i1
    %594 = comb.mux bin %593, %tag_2, %574 : i52
    %595 = comb.icmp bin eq %select_r, %c3_i4 : i4
    %596 = comb.xor %595, %true : i1
    %597 = comb.xor %556, %true : i1
    %598 = comb.xor %308, %true : i1
    %599 = comb.or %598, %579, %597, %576, %596 : i1
    %600 = comb.mux bin %599, %tag_3, %574 : i52
    %601 = comb.icmp bin eq %select_r, %c4_i4 : i4
    %602 = comb.xor %601, %true : i1
    %603 = comb.xor %556, %true : i1
    %604 = comb.xor %308, %true : i1
    %605 = comb.or %604, %579, %603, %576, %602 : i1
    %606 = comb.mux bin %605, %tag_4, %574 : i52
    %607 = comb.icmp bin eq %select_r, %c5_i4 : i4
    %608 = comb.xor %607, %true : i1
    %609 = comb.xor %556, %true : i1
    %610 = comb.xor %308, %true : i1
    %611 = comb.or %610, %579, %609, %576, %608 : i1
    %612 = comb.mux bin %611, %tag_5, %574 : i52
    %613 = comb.icmp bin eq %select_r, %c6_i4 : i4
    %614 = comb.xor %613, %true : i1
    %615 = comb.xor %556, %true : i1
    %616 = comb.xor %308, %true : i1
    %617 = comb.or %616, %579, %615, %576, %614 : i1
    %618 = comb.mux bin %617, %tag_6, %574 : i52
    %619 = comb.icmp bin eq %select_r, %c7_i4 : i4
    %620 = comb.xor %619, %true : i1
    %621 = comb.xor %556, %true : i1
    %622 = comb.xor %308, %true : i1
    %623 = comb.or %622, %579, %621, %576, %620 : i1
    %624 = comb.mux bin %623, %tag_7, %574 : i52
    %625 = comb.icmp bin eq %select_r, %c-8_i4 : i4
    %626 = comb.xor %625, %true : i1
    %627 = comb.xor %556, %true : i1
    %628 = comb.xor %308, %true : i1
    %629 = comb.or %628, %579, %627, %576, %626 : i1
    %630 = comb.mux bin %629, %tag_8, %574 : i52
    %631 = comb.icmp bin eq %select_r, %c-7_i4 : i4
    %632 = comb.xor %631, %true : i1
    %633 = comb.xor %556, %true : i1
    %634 = comb.xor %308, %true : i1
    %635 = comb.or %634, %579, %633, %576, %632 : i1
    %636 = comb.mux bin %635, %tag_9, %574 : i52
    %637 = comb.icmp bin eq %select_r, %c-6_i4 : i4
    %638 = comb.xor %637, %true : i1
    %639 = comb.xor %556, %true : i1
    %640 = comb.xor %308, %true : i1
    %641 = comb.or %640, %579, %639, %576, %638 : i1
    %642 = comb.mux bin %641, %tag_10, %574 : i52
    %643 = comb.icmp bin eq %select_r, %c-5_i4 : i4
    %644 = comb.xor %643, %true : i1
    %645 = comb.xor %556, %true : i1
    %646 = comb.xor %308, %true : i1
    %647 = comb.or %646, %579, %645, %576, %644 : i1
    %648 = comb.mux bin %647, %tag_11, %574 : i52
    %649 = comb.icmp bin eq %select_r, %c-4_i4 : i4
    %650 = comb.xor %649, %true : i1
    %651 = comb.xor %556, %true : i1
    %652 = comb.xor %308, %true : i1
    %653 = comb.or %652, %579, %651, %576, %650 : i1
    %654 = comb.mux bin %653, %tag_12, %574 : i52
    %655 = comb.icmp bin eq %select_r, %c-3_i4 : i4
    %656 = comb.xor %655, %true : i1
    %657 = comb.xor %556, %true : i1
    %658 = comb.xor %308, %true : i1
    %659 = comb.or %658, %579, %657, %576, %656 : i1
    %660 = comb.mux bin %659, %tag_13, %574 : i52
    %661 = comb.icmp bin eq %select_r, %c-2_i4 : i4
    %662 = comb.xor %661, %true : i1
    %663 = comb.xor %556, %true : i1
    %664 = comb.xor %308, %true : i1
    %665 = comb.or %664, %579, %663, %576, %662 : i1
    %666 = comb.mux bin %665, %tag_14, %574 : i52
    %667 = comb.icmp bin eq %select_r, %c-1_i4 : i4
    %668 = comb.xor %667, %true : i1
    %669 = comb.xor %556, %true : i1
    %670 = comb.xor %308, %true : i1
    %671 = comb.or %670, %579, %669, %576, %668 : i1
    %672 = comb.mux bin %671, %tag_15, %574 : i52
    %673 = comb.xor %576, %true : i1
    %674 = comb.xor %579, %true : i1
    %675 = comb.and %308, %674, %556, %673, %575 : i1
    %676 = comb.or %675, %242 : i1
    %677 = comb.xor %576, %true : i1
    %678 = comb.xor %579, %true : i1
    %679 = comb.and %308, %678, %556, %677, %583 : i1
    %680 = comb.or %679, %244 : i1
    %681 = comb.xor %576, %true : i1
    %682 = comb.xor %579, %true : i1
    %683 = comb.and %308, %682, %556, %681, %589 : i1
    %684 = comb.or %683, %246 : i1
    %685 = comb.xor %576, %true : i1
    %686 = comb.xor %579, %true : i1
    %687 = comb.and %308, %686, %556, %685, %595 : i1
    %688 = comb.or %687, %248 : i1
    %689 = comb.xor %576, %true : i1
    %690 = comb.xor %579, %true : i1
    %691 = comb.and %308, %690, %556, %689, %601 : i1
    %692 = comb.or %691, %250 : i1
    %693 = comb.xor %576, %true : i1
    %694 = comb.xor %579, %true : i1
    %695 = comb.and %308, %694, %556, %693, %607 : i1
    %696 = comb.or %695, %252 : i1
    %697 = comb.xor %576, %true : i1
    %698 = comb.xor %579, %true : i1
    %699 = comb.and %308, %698, %556, %697, %613 : i1
    %700 = comb.or %699, %254 : i1
    %701 = comb.xor %576, %true : i1
    %702 = comb.xor %579, %true : i1
    %703 = comb.and %308, %702, %556, %701, %619 : i1
    %704 = comb.or %703, %256 : i1
    %705 = comb.xor %576, %true : i1
    %706 = comb.xor %579, %true : i1
    %707 = comb.and %308, %706, %556, %705, %625 : i1
    %708 = comb.or %707, %258 : i1
    %709 = comb.xor %576, %true : i1
    %710 = comb.xor %579, %true : i1
    %711 = comb.and %308, %710, %556, %709, %631 : i1
    %712 = comb.or %711, %260 : i1
    %713 = comb.xor %576, %true : i1
    %714 = comb.xor %579, %true : i1
    %715 = comb.and %308, %714, %556, %713, %637 : i1
    %716 = comb.or %715, %262 : i1
    %717 = comb.xor %576, %true : i1
    %718 = comb.xor %579, %true : i1
    %719 = comb.and %308, %718, %556, %717, %643 : i1
    %720 = comb.or %719, %264 : i1
    %721 = comb.xor %576, %true : i1
    %722 = comb.xor %579, %true : i1
    %723 = comb.and %308, %722, %556, %721, %649 : i1
    %724 = comb.or %723, %266 : i1
    %725 = comb.xor %576, %true : i1
    %726 = comb.xor %579, %true : i1
    %727 = comb.and %308, %726, %556, %725, %655 : i1
    %728 = comb.or %727, %268 : i1
    %729 = comb.xor %576, %true : i1
    %730 = comb.xor %579, %true : i1
    %731 = comb.and %308, %730, %556, %729, %661 : i1
    %732 = comb.or %731, %270 : i1
    %733 = comb.xor %576, %true : i1
    %734 = comb.xor %579, %true : i1
    %735 = comb.and %308, %734, %556, %733, %667 : i1
    %736 = comb.or %735, %272 : i1
    %737 = comb.extract %io_dcacheRW_rdata from 10 {sv.namehint = "_update_pa_T"} : (i64) -> i20
    %738 = comb.extract %572 from 0 : (i52) -> i20
    %739 = comb.and bin %738, %737 : i20
    %740 = comb.xor %575, %true : i1
    %741 = comb.xor %556, %true : i1
    %742 = comb.xor %308, %true : i1
    %743 = comb.or %742, %579, %741, %576, %740 : i1
    %744 = comb.mux bin %743, %paddr_0, %739 : i20
    %745 = comb.xor %583, %true : i1
    %746 = comb.xor %556, %true : i1
    %747 = comb.xor %308, %true : i1
    %748 = comb.or %747, %579, %746, %576, %745 : i1
    %749 = comb.mux bin %748, %paddr_1, %739 : i20
    %750 = comb.xor %589, %true : i1
    %751 = comb.xor %556, %true : i1
    %752 = comb.xor %308, %true : i1
    %753 = comb.or %752, %579, %751, %576, %750 : i1
    %754 = comb.mux bin %753, %paddr_2, %739 : i20
    %755 = comb.xor %595, %true : i1
    %756 = comb.xor %556, %true : i1
    %757 = comb.xor %308, %true : i1
    %758 = comb.or %757, %579, %756, %576, %755 : i1
    %759 = comb.mux bin %758, %paddr_3, %739 : i20
    %760 = comb.xor %601, %true : i1
    %761 = comb.xor %556, %true : i1
    %762 = comb.xor %308, %true : i1
    %763 = comb.or %762, %579, %761, %576, %760 : i1
    %764 = comb.mux bin %763, %paddr_4, %739 : i20
    %765 = comb.xor %607, %true : i1
    %766 = comb.xor %556, %true : i1
    %767 = comb.xor %308, %true : i1
    %768 = comb.or %767, %579, %766, %576, %765 : i1
    %769 = comb.mux bin %768, %paddr_5, %739 : i20
    %770 = comb.xor %613, %true : i1
    %771 = comb.xor %556, %true : i1
    %772 = comb.xor %308, %true : i1
    %773 = comb.or %772, %579, %771, %576, %770 : i1
    %774 = comb.mux bin %773, %paddr_6, %739 : i20
    %775 = comb.xor %619, %true : i1
    %776 = comb.xor %556, %true : i1
    %777 = comb.xor %308, %true : i1
    %778 = comb.or %777, %579, %776, %576, %775 : i1
    %779 = comb.mux bin %778, %paddr_7, %739 : i20
    %780 = comb.xor %625, %true : i1
    %781 = comb.xor %556, %true : i1
    %782 = comb.xor %308, %true : i1
    %783 = comb.or %782, %579, %781, %576, %780 : i1
    %784 = comb.mux bin %783, %paddr_8, %739 : i20
    %785 = comb.xor %631, %true : i1
    %786 = comb.xor %556, %true : i1
    %787 = comb.xor %308, %true : i1
    %788 = comb.or %787, %579, %786, %576, %785 : i1
    %789 = comb.mux bin %788, %paddr_9, %739 : i20
    %790 = comb.xor %637, %true : i1
    %791 = comb.xor %556, %true : i1
    %792 = comb.xor %308, %true : i1
    %793 = comb.or %792, %579, %791, %576, %790 : i1
    %794 = comb.mux bin %793, %paddr_10, %739 : i20
    %795 = comb.xor %643, %true : i1
    %796 = comb.xor %556, %true : i1
    %797 = comb.xor %308, %true : i1
    %798 = comb.or %797, %579, %796, %576, %795 : i1
    %799 = comb.mux bin %798, %paddr_11, %739 : i20
    %800 = comb.xor %649, %true : i1
    %801 = comb.xor %556, %true : i1
    %802 = comb.xor %308, %true : i1
    %803 = comb.or %802, %579, %801, %576, %800 : i1
    %804 = comb.mux bin %803, %paddr_12, %739 : i20
    %805 = comb.xor %655, %true : i1
    %806 = comb.xor %556, %true : i1
    %807 = comb.xor %308, %true : i1
    %808 = comb.or %807, %579, %806, %576, %805 : i1
    %809 = comb.mux bin %808, %paddr_13, %739 : i20
    %810 = comb.xor %661, %true : i1
    %811 = comb.xor %556, %true : i1
    %812 = comb.xor %308, %true : i1
    %813 = comb.or %812, %579, %811, %576, %810 : i1
    %814 = comb.mux bin %813, %paddr_14, %739 : i20
    %815 = comb.xor %667, %true : i1
    %816 = comb.xor %556, %true : i1
    %817 = comb.xor %308, %true : i1
    %818 = comb.or %817, %579, %816, %576, %815 : i1
    %819 = comb.mux bin %818, %paddr_15, %739 : i20
    %820 = comb.xor %575, %true : i1
    %821 = comb.xor %556, %true : i1
    %822 = comb.xor %308, %true : i1
    %823 = comb.or %822, %579, %821, %576, %820 : i1
    %824 = comb.mux bin %823, %pte_addr_0, %pte_addr_r : i32
    %825 = comb.xor %583, %true : i1
    %826 = comb.xor %556, %true : i1
    %827 = comb.xor %308, %true : i1
    %828 = comb.or %827, %579, %826, %576, %825 : i1
    %829 = comb.mux bin %828, %pte_addr_1, %pte_addr_r : i32
    %830 = comb.xor %589, %true : i1
    %831 = comb.xor %556, %true : i1
    %832 = comb.xor %308, %true : i1
    %833 = comb.or %832, %579, %831, %576, %830 : i1
    %834 = comb.mux bin %833, %pte_addr_2, %pte_addr_r : i32
    %835 = comb.xor %595, %true : i1
    %836 = comb.xor %556, %true : i1
    %837 = comb.xor %308, %true : i1
    %838 = comb.or %837, %579, %836, %576, %835 : i1
    %839 = comb.mux bin %838, %pte_addr_3, %pte_addr_r : i32
    %840 = comb.xor %601, %true : i1
    %841 = comb.xor %556, %true : i1
    %842 = comb.xor %308, %true : i1
    %843 = comb.or %842, %579, %841, %576, %840 : i1
    %844 = comb.mux bin %843, %pte_addr_4, %pte_addr_r : i32
    %845 = comb.xor %607, %true : i1
    %846 = comb.xor %556, %true : i1
    %847 = comb.xor %308, %true : i1
    %848 = comb.or %847, %579, %846, %576, %845 : i1
    %849 = comb.mux bin %848, %pte_addr_5, %pte_addr_r : i32
    %850 = comb.xor %613, %true : i1
    %851 = comb.xor %556, %true : i1
    %852 = comb.xor %308, %true : i1
    %853 = comb.or %852, %579, %851, %576, %850 : i1
    %854 = comb.mux bin %853, %pte_addr_6, %pte_addr_r : i32
    %855 = comb.xor %619, %true : i1
    %856 = comb.xor %556, %true : i1
    %857 = comb.xor %308, %true : i1
    %858 = comb.or %857, %579, %856, %576, %855 : i1
    %859 = comb.mux bin %858, %pte_addr_7, %pte_addr_r : i32
    %860 = comb.xor %625, %true : i1
    %861 = comb.xor %556, %true : i1
    %862 = comb.xor %308, %true : i1
    %863 = comb.or %862, %579, %861, %576, %860 : i1
    %864 = comb.mux bin %863, %pte_addr_8, %pte_addr_r : i32
    %865 = comb.xor %631, %true : i1
    %866 = comb.xor %556, %true : i1
    %867 = comb.xor %308, %true : i1
    %868 = comb.or %867, %579, %866, %576, %865 : i1
    %869 = comb.mux bin %868, %pte_addr_9, %pte_addr_r : i32
    %870 = comb.xor %637, %true : i1
    %871 = comb.xor %556, %true : i1
    %872 = comb.xor %308, %true : i1
    %873 = comb.or %872, %579, %871, %576, %870 : i1
    %874 = comb.mux bin %873, %pte_addr_10, %pte_addr_r : i32
    %875 = comb.xor %643, %true : i1
    %876 = comb.xor %556, %true : i1
    %877 = comb.xor %308, %true : i1
    %878 = comb.or %877, %579, %876, %576, %875 : i1
    %879 = comb.mux bin %878, %pte_addr_11, %pte_addr_r : i32
    %880 = comb.xor %649, %true : i1
    %881 = comb.xor %556, %true : i1
    %882 = comb.xor %308, %true : i1
    %883 = comb.or %882, %579, %881, %576, %880 : i1
    %884 = comb.mux bin %883, %pte_addr_12, %pte_addr_r : i32
    %885 = comb.xor %655, %true : i1
    %886 = comb.xor %556, %true : i1
    %887 = comb.xor %308, %true : i1
    %888 = comb.or %887, %579, %886, %576, %885 : i1
    %889 = comb.mux bin %888, %pte_addr_13, %pte_addr_r : i32
    %890 = comb.xor %661, %true : i1
    %891 = comb.xor %556, %true : i1
    %892 = comb.xor %308, %true : i1
    %893 = comb.or %892, %579, %891, %576, %890 : i1
    %894 = comb.mux bin %893, %pte_addr_14, %pte_addr_r : i32
    %895 = comb.xor %667, %true : i1
    %896 = comb.xor %556, %true : i1
    %897 = comb.xor %308, %true : i1
    %898 = comb.or %897, %579, %896, %576, %895 : i1
    %899 = comb.mux bin %898, %pte_addr_15, %pte_addr_r : i32
    %900 = comb.xor %575, %true : i1
    %901 = comb.xor %556, %true : i1
    %902 = comb.xor %308, %true : i1
    %903 = comb.or %902, %579, %901, %576, %900 : i1
    %904 = comb.mux bin %903, %pte_level_0, %level : i2
    %905 = comb.xor %583, %true : i1
    %906 = comb.xor %556, %true : i1
    %907 = comb.xor %308, %true : i1
    %908 = comb.or %907, %579, %906, %576, %905 : i1
    %909 = comb.mux bin %908, %pte_level_1, %level : i2
    %910 = comb.xor %589, %true : i1
    %911 = comb.xor %556, %true : i1
    %912 = comb.xor %308, %true : i1
    %913 = comb.or %912, %579, %911, %576, %910 : i1
    %914 = comb.mux bin %913, %pte_level_2, %level : i2
    %915 = comb.xor %595, %true : i1
    %916 = comb.xor %556, %true : i1
    %917 = comb.xor %308, %true : i1
    %918 = comb.or %917, %579, %916, %576, %915 : i1
    %919 = comb.mux bin %918, %pte_level_3, %level : i2
    %920 = comb.xor %601, %true : i1
    %921 = comb.xor %556, %true : i1
    %922 = comb.xor %308, %true : i1
    %923 = comb.or %922, %579, %921, %576, %920 : i1
    %924 = comb.mux bin %923, %pte_level_4, %level : i2
    %925 = comb.xor %607, %true : i1
    %926 = comb.xor %556, %true : i1
    %927 = comb.xor %308, %true : i1
    %928 = comb.or %927, %579, %926, %576, %925 : i1
    %929 = comb.mux bin %928, %pte_level_5, %level : i2
    %930 = comb.xor %613, %true : i1
    %931 = comb.xor %556, %true : i1
    %932 = comb.xor %308, %true : i1
    %933 = comb.or %932, %579, %931, %576, %930 : i1
    %934 = comb.mux bin %933, %pte_level_6, %level : i2
    %935 = comb.xor %619, %true : i1
    %936 = comb.xor %556, %true : i1
    %937 = comb.xor %308, %true : i1
    %938 = comb.or %937, %579, %936, %576, %935 : i1
    %939 = comb.mux bin %938, %pte_level_7, %level : i2
    %940 = comb.xor %625, %true : i1
    %941 = comb.xor %556, %true : i1
    %942 = comb.xor %308, %true : i1
    %943 = comb.or %942, %579, %941, %576, %940 : i1
    %944 = comb.mux bin %943, %pte_level_8, %level : i2
    %945 = comb.xor %631, %true : i1
    %946 = comb.xor %556, %true : i1
    %947 = comb.xor %308, %true : i1
    %948 = comb.or %947, %579, %946, %576, %945 : i1
    %949 = comb.mux bin %948, %pte_level_9, %level : i2
    %950 = comb.xor %637, %true : i1
    %951 = comb.xor %556, %true : i1
    %952 = comb.xor %308, %true : i1
    %953 = comb.or %952, %579, %951, %576, %950 : i1
    %954 = comb.mux bin %953, %pte_level_10, %level : i2
    %955 = comb.xor %643, %true : i1
    %956 = comb.xor %556, %true : i1
    %957 = comb.xor %308, %true : i1
    %958 = comb.or %957, %579, %956, %576, %955 : i1
    %959 = comb.mux bin %958, %pte_level_11, %level : i2
    %960 = comb.xor %649, %true : i1
    %961 = comb.xor %556, %true : i1
    %962 = comb.xor %308, %true : i1
    %963 = comb.or %962, %579, %961, %576, %960 : i1
    %964 = comb.mux bin %963, %pte_level_12, %level : i2
    %965 = comb.xor %655, %true : i1
    %966 = comb.xor %556, %true : i1
    %967 = comb.xor %308, %true : i1
    %968 = comb.or %967, %579, %966, %576, %965 : i1
    %969 = comb.mux bin %968, %pte_level_13, %level : i2
    %970 = comb.xor %661, %true : i1
    %971 = comb.xor %556, %true : i1
    %972 = comb.xor %308, %true : i1
    %973 = comb.or %972, %579, %971, %576, %970 : i1
    %974 = comb.mux bin %973, %pte_level_14, %level : i2
    %975 = comb.xor %667, %true : i1
    %976 = comb.xor %556, %true : i1
    %977 = comb.xor %308, %true : i1
    %978 = comb.or %977, %579, %976, %576, %975 : i1
    %979 = comb.mux bin %978, %pte_level_15, %level : i2
    %980 = comb.extract %io_dcacheRW_rdata from 0 {sv.namehint = "_info_T_1"} : (i64) -> i10
    %981 = comb.xor %575, %true : i1
    %982 = comb.xor %556, %true : i1
    %983 = comb.or %471, %982, %576, %981 : i1
    %984 = comb.mux bin %983, %info_0, %980 : i10
    %985 = comb.mux bin %238, %984, %356 : i10
    %986 = comb.mux bin %308, %985, %info_0 : i10
    %987 = comb.xor %583, %true : i1
    %988 = comb.xor %556, %true : i1
    %989 = comb.or %471, %988, %576, %987 : i1
    %990 = comb.mux bin %989, %info_1, %980 : i10
    %991 = comb.mux bin %238, %990, %361 : i10
    %992 = comb.mux bin %308, %991, %info_1 : i10
    %993 = comb.xor %589, %true : i1
    %994 = comb.xor %556, %true : i1
    %995 = comb.or %471, %994, %576, %993 : i1
    %996 = comb.mux bin %995, %info_2, %980 : i10
    %997 = comb.mux bin %238, %996, %366 : i10
    %998 = comb.mux bin %308, %997, %info_2 : i10
    %999 = comb.xor %595, %true : i1
    %1000 = comb.xor %556, %true : i1
    %1001 = comb.or %471, %1000, %576, %999 : i1
    %1002 = comb.mux bin %1001, %info_3, %980 : i10
    %1003 = comb.mux bin %238, %1002, %371 : i10
    %1004 = comb.mux bin %308, %1003, %info_3 : i10
    %1005 = comb.xor %601, %true : i1
    %1006 = comb.xor %556, %true : i1
    %1007 = comb.or %471, %1006, %576, %1005 : i1
    %1008 = comb.mux bin %1007, %info_4, %980 : i10
    %1009 = comb.mux bin %238, %1008, %376 : i10
    %1010 = comb.mux bin %308, %1009, %info_4 : i10
    %1011 = comb.xor %607, %true : i1
    %1012 = comb.xor %556, %true : i1
    %1013 = comb.or %471, %1012, %576, %1011 : i1
    %1014 = comb.mux bin %1013, %info_5, %980 : i10
    %1015 = comb.mux bin %238, %1014, %381 : i10
    %1016 = comb.mux bin %308, %1015, %info_5 : i10
    %1017 = comb.xor %613, %true : i1
    %1018 = comb.xor %556, %true : i1
    %1019 = comb.or %471, %1018, %576, %1017 : i1
    %1020 = comb.mux bin %1019, %info_6, %980 : i10
    %1021 = comb.mux bin %238, %1020, %386 : i10
    %1022 = comb.mux bin %308, %1021, %info_6 : i10
    %1023 = comb.xor %619, %true : i1
    %1024 = comb.xor %556, %true : i1
    %1025 = comb.or %471, %1024, %576, %1023 : i1
    %1026 = comb.mux bin %1025, %info_7, %980 : i10
    %1027 = comb.mux bin %238, %1026, %391 : i10
    %1028 = comb.mux bin %308, %1027, %info_7 : i10
    %1029 = comb.xor %625, %true : i1
    %1030 = comb.xor %556, %true : i1
    %1031 = comb.or %471, %1030, %576, %1029 : i1
    %1032 = comb.mux bin %1031, %info_8, %980 : i10
    %1033 = comb.mux bin %238, %1032, %396 : i10
    %1034 = comb.mux bin %308, %1033, %info_8 : i10
    %1035 = comb.xor %631, %true : i1
    %1036 = comb.xor %556, %true : i1
    %1037 = comb.or %471, %1036, %576, %1035 : i1
    %1038 = comb.mux bin %1037, %info_9, %980 : i10
    %1039 = comb.mux bin %238, %1038, %401 : i10
    %1040 = comb.mux bin %308, %1039, %info_9 : i10
    %1041 = comb.xor %637, %true : i1
    %1042 = comb.xor %556, %true : i1
    %1043 = comb.or %471, %1042, %576, %1041 : i1
    %1044 = comb.mux bin %1043, %info_10, %980 : i10
    %1045 = comb.mux bin %238, %1044, %406 : i10
    %1046 = comb.mux bin %308, %1045, %info_10 : i10
    %1047 = comb.xor %643, %true : i1
    %1048 = comb.xor %556, %true : i1
    %1049 = comb.or %471, %1048, %576, %1047 : i1
    %1050 = comb.mux bin %1049, %info_11, %980 : i10
    %1051 = comb.mux bin %238, %1050, %411 : i10
    %1052 = comb.mux bin %308, %1051, %info_11 : i10
    %1053 = comb.xor %649, %true : i1
    %1054 = comb.xor %556, %true : i1
    %1055 = comb.or %471, %1054, %576, %1053 : i1
    %1056 = comb.mux bin %1055, %info_12, %980 : i10
    %1057 = comb.mux bin %238, %1056, %416 : i10
    %1058 = comb.mux bin %308, %1057, %info_12 : i10
    %1059 = comb.xor %655, %true : i1
    %1060 = comb.xor %556, %true : i1
    %1061 = comb.or %471, %1060, %576, %1059 : i1
    %1062 = comb.mux bin %1061, %info_13, %980 : i10
    %1063 = comb.mux bin %238, %1062, %421 : i10
    %1064 = comb.mux bin %308, %1063, %info_13 : i10
    %1065 = comb.xor %661, %true : i1
    %1066 = comb.xor %556, %true : i1
    %1067 = comb.or %471, %1066, %576, %1065 : i1
    %1068 = comb.mux bin %1067, %info_14, %980 : i10
    %1069 = comb.mux bin %238, %1068, %426 : i10
    %1070 = comb.mux bin %308, %1069, %info_14 : i10
    %1071 = comb.xor %667, %true : i1
    %1072 = comb.xor %556, %true : i1
    %1073 = comb.or %471, %1072, %576, %1071 : i1
    %1074 = comb.mux bin %1073, %info_15, %980 : i10
    %1075 = comb.mux bin %238, %1074, %431 : i10
    %1076 = comb.mux bin %308, %1075, %info_15 : i10
    %1077 = comb.mux bin %308, %318, %io_va2pa_vvalid : i1
    %1078 = comb.extract %io_va2pa_vaddr from 0 : (i64) -> i32
    %1079 = comb.mux bin %308, %335, %1078 : i32
    hw.output %out_paddr_r, %out_valid_r, %out_excep_r_cause, %out_excep_r_tval, %out_excep_r_en, %pte_addr_r, %wpte_data_r, %dc_mode_r : i32, i1, i64, i64, i1, i32, i64, i5
  }
  hw.module private @DcacheSelector(%clock: i1, %reset: i1, %io_tlb_if2dc_addr: i32, %io_tlb_if2dc_wdata: i64, %io_tlb_if2dc_dc_mode: i5, %io_tlb_mem2dc_addr: i32, %io_tlb_mem2dc_wdata: i64, %io_tlb_mem2dc_dc_mode: i5, %io_mem2dc_addr: i32, %io_mem2dc_wdata: i64, %io_mem2dc_dc_mode: i5, %io_mem2dc_amo: i5, %io_dma2dc_addr: i32, %io_dma2dc_wdata: i64, %io_dma2dc_dc_mode: i5, %io_select_rdata: i64, %io_select_rvalid: i1, %io_select_ready: i1) -> (io_tlb_if2dc_rdata: i64, io_tlb_if2dc_rvalid: i1, io_tlb_if2dc_ready: i1, io_tlb_mem2dc_rdata: i64, io_tlb_mem2dc_rvalid: i1, io_tlb_mem2dc_ready: i1, io_mem2dc_rdata: i64, io_mem2dc_rvalid: i1, io_mem2dc_ready: i1, io_dma2dc_rdata: i64, io_dma2dc_rvalid: i1, io_dma2dc_ready: i1, io_select_addr: i32, io_select_wdata: i64, io_select_dc_mode: i5, io_select_amo: i5) {
    %true = hw.constant true
    %false = hw.constant false
    %c-2_i2 = hw.constant -2 : i2
    %c-1_i2 = hw.constant -1 : i2
    %c0_i32 = hw.constant 0 : i32
    %c0_i64 = hw.constant 0 : i64
    %c0_i2 = hw.constant 0 : i2
    %c1_i2 = hw.constant 1 : i2
    %c0_i5 = hw.constant 0 : i5
    %pre_idx = seq.firreg %20 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 0 : ui64} : i2
    %busy = seq.firreg %24 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2 : ui64} : i1
    %0 = comb.xor %io_select_rvalid, %true : i1
    %1 = comb.and %0, %busy : i1
    %2 = comb.xor bin %io_select_rvalid, %true {sv.namehint = "_T"} : i1
    %3 = comb.and bin %busy, %2 {sv.namehint = "_T_1"} : i1
    %4 = comb.icmp bin ne %io_mem2dc_dc_mode, %c0_i5 {sv.namehint = "_T_2"} : i5
    %5 = comb.xor %3, %true : i1
    %6 = comb.and %5, %4, %io_select_ready : i1
    %7 = comb.icmp bin ne %io_tlb_mem2dc_dc_mode, %c0_i5 {sv.namehint = "_T_3"} : i5
    %8 = comb.or bin %3, %4 : i1
    %9 = comb.xor %8, %true : i1
    %10 = comb.and %9, %7, %io_select_ready : i1
    %11 = comb.icmp bin ne %io_tlb_if2dc_dc_mode, %c0_i5 {sv.namehint = "_T_4"} : i5
    %12 = comb.or bin %3, %4, %7 : i1
    %13 = comb.xor %12, %true : i1
    %14 = comb.and %13, %11, %io_select_ready : i1
    %15 = comb.icmp bin ne %io_dma2dc_dc_mode, %c0_i5 {sv.namehint = "_T_5"} : i5
    %16 = comb.mux bin %15, %c-1_i2, %pre_idx : i2
    %17 = comb.mux bin %11, %c-2_i2, %16 : i2
    %18 = comb.mux bin %7, %c1_i2, %17 : i2
    %19 = comb.mux bin %4, %c0_i2, %18 : i2
    %20 = comb.mux bin %3, %pre_idx, %19 : i2
    %21 = comb.or bin %4, %7, %11, %15 : i1
    %22 = comb.xor %21, %true : i1
    %23 = comb.or %3, %22 : i1
    %24 = comb.mux bin %23, %1, %io_select_ready : i1
    %25 = comb.mux bin %15, %io_dma2dc_addr, %c0_i32 : i32
    %26 = comb.mux bin %11, %io_tlb_if2dc_addr, %25 : i32
    %27 = comb.mux bin %7, %io_tlb_mem2dc_addr, %26 : i32
    %28 = comb.mux bin %4, %io_mem2dc_addr, %27 : i32
    %29 = comb.mux bin %3, %c0_i32, %28 : i32
    %30 = comb.mux bin %15, %io_dma2dc_wdata, %c0_i64 : i64
    %31 = comb.mux bin %11, %io_tlb_if2dc_wdata, %30 : i64
    %32 = comb.mux bin %7, %io_tlb_mem2dc_wdata, %31 : i64
    %33 = comb.mux bin %4, %io_mem2dc_wdata, %32 : i64
    %34 = comb.mux bin %3, %c0_i64, %33 : i64
    %35 = comb.mux bin %15, %io_dma2dc_dc_mode, %c0_i5 : i5
    %36 = comb.mux bin %11, %io_tlb_if2dc_dc_mode, %35 : i5
    %37 = comb.mux bin %7, %io_tlb_mem2dc_dc_mode, %36 : i5
    %38 = comb.mux bin %4, %io_mem2dc_dc_mode, %37 : i5
    %39 = comb.mux bin %3, %c0_i5, %38 : i5
    %40 = comb.xor %4, %true : i1
    %41 = comb.or %3, %40 : i1
    %42 = comb.mux bin %41, %c0_i5, %io_mem2dc_amo : i5
    %43 = comb.or bin %3, %4, %7, %11 : i1
    %44 = comb.xor %43, %true : i1
    %45 = comb.and %44, %15, %io_select_ready : i1
    %46 = comb.icmp bin eq %pre_idx, %c0_i2 {sv.namehint = "_io_mem2dc_rvalid_T"} : i2
    %47 = comb.and bin %io_select_rvalid, %46 {sv.namehint = "_io_mem2dc_rvalid_T_1"} : i1
    %48 = comb.icmp bin eq %pre_idx, %c1_i2 {sv.namehint = "_io_tlb_mem2dc_rvalid_T"} : i2
    %49 = comb.and bin %io_select_rvalid, %48 {sv.namehint = "_io_tlb_mem2dc_rvalid_T_1"} : i1
    %50 = comb.icmp bin eq %pre_idx, %c-2_i2 {sv.namehint = "_io_tlb_if2dc_rvalid_T"} : i2
    %51 = comb.and bin %io_select_rvalid, %50 {sv.namehint = "_io_tlb_if2dc_rvalid_T_1"} : i1
    %52 = comb.icmp bin eq %pre_idx, %c-1_i2 {sv.namehint = "_io_dma2dc_rvalid_T"} : i2
    %53 = comb.and bin %io_select_rvalid, %52 {sv.namehint = "_io_dma2dc_rvalid_T_1"} : i1
    hw.output %io_select_rdata, %51, %14, %io_select_rdata, %49, %10, %io_select_rdata, %47, %6, %io_select_rdata, %53, %45, %29, %34, %39, %42 : i64, i1, i1, i64, i1, i1, i64, i1, i1, i64, i1, i1, i32, i64, i5, i5
  }
  hw.module private @CLINT(%clock: i1, %reset: i1, %io_rw_addr: i32, %io_rw_wdata: i64, %io_rw_wvalid: i1) -> (io_rw_rdata: i64, io_intr_raise: i1, io_intr_clear: i1, io_intr_msip_raise: i1, io_intr_msip_clear: i1) {
    %c1_i64 = hw.constant 1 : i64
    %false = hw.constant false
    %c1_i2 = hw.constant 1 : i2
    %c0_i2 = hw.constant 0 : i2
    %true = hw.constant true
    %c33603576_i32 = hw.constant 33603576 : i32
    %c33570816_i32 = hw.constant 33570816 : i32
    %c33554432_i32 = hw.constant 33554432 : i32
    %c0_i64 = hw.constant 0 : i64
    %mtime = seq.firreg %8 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 0 : ui64} : i64
    %mtimecmp = seq.firreg %12 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 64 : ui64} : i64
    %ipi = seq.firreg %17 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 128 : ui64} : i64
    %count = seq.firreg %0 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 192 : ui64} : i2
    %clear_r = seq.firreg %13 clock %clock reset sync %reset, %false {firrtl.random_init_start = 194 : ui64} : i1
    %0 = comb.add %count, %c1_i2 {sv.namehint = "_count_T_1"} : i2
    %1 = comb.icmp bin eq %count, %c0_i2 {sv.namehint = "_T"} : i2
    %2 = comb.add %mtime, %c1_i64 {sv.namehint = "_mtime_T_1"} : i64
    %3 = comb.mux bin %1, %2, %mtime : i64
    %4 = comb.icmp bin ugt %mtime, %mtimecmp {sv.namehint = "_io_intr_raise_T"} : i64
    %5 = comb.icmp bin eq %io_rw_addr, %c33603576_i32 {sv.namehint = "_T_1"} : i32
    %6 = comb.mux bin %5, %mtime, %c0_i64 : i64
    %7 = comb.and bin %5, %io_rw_wvalid : i1
    %8 = comb.mux bin %7, %io_rw_wdata, %3 : i64
    %9 = comb.icmp bin eq %io_rw_addr, %c33570816_i32 {sv.namehint = "_T_2"} : i32
    %10 = comb.mux bin %9, %mtimecmp, %6 : i64
    %11 = comb.and bin %9, %io_rw_wvalid : i1
    %12 = comb.mux bin %11, %io_rw_wdata, %mtimecmp : i64
    %13 = comb.and %9, %io_rw_wvalid : i1
    %14 = comb.icmp bin eq %io_rw_addr, %c33554432_i32 {sv.namehint = "_T_3"} : i32
    %15 = comb.mux bin %14, %ipi, %10 : i64
    %16 = comb.and bin %14, %io_rw_wvalid : i1
    %17 = comb.mux bin %16, %io_rw_wdata, %ipi : i64
    %18 = comb.extract %io_rw_wdata from 0 {sv.namehint = "_io_intr_msip_clear_T"} : (i64) -> i1
    %19 = comb.and %16, %18 : i1
    %20 = comb.xor bin %18, %true {sv.namehint = "_io_intr_msip_clear_T_1"} : i1
    %21 = comb.and %16, %20 : i1
    hw.output %15, %4, %clear_r, %19, %21 : i64, i1, i1, i1, i1
  }
  hw.module private @Plic(%clock: i1, %reset: i1, %io_intr_in1: i1, %io_rw_addr: i32, %io_rw_wdata: i64, %io_rw_wvalid: i1, %io_rw_arvalid: i1) -> (io_intr_out_m_raise: i1, io_intr_out_m_clear: i1, io_intr_out_s_raise: i1, io_intr_out_s_clear: i1, io_rw_rdata: i64) {
    %c0_i32 = hw.constant 0 : i32
    %c-1_i32 = hw.constant -1 : i32
    %c2_i32 = hw.constant 2 : i32
    %c1_i64 = hw.constant 1 : i64
    %c0_i58 = hw.constant 0 : i58
    %false = hw.constant false
    %c201326596_i32 = hw.constant 201326596 : i32
    %c201334784_i32 = hw.constant 201334784 : i32
    %c201335040_i32 = hw.constant 201335040 : i32
    %c203423748_i32 = hw.constant 203423748 : i32
    %c203427844_i32 = hw.constant 203427844 : i32
    %c203423744_i32 = hw.constant 203423744 : i32
    %c203427840_i32 = hw.constant 203427840 : i32
    %c0_i64 = hw.constant 0 : i64
    %c-3_i32 = hw.constant -3 : i32
    %c1_i32 = hw.constant 1 : i32
    %priority = seq.firreg %15 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 0 : ui64} : i32
    %pending = seq.firreg %59 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 32 : ui64} : i32
    %intr_enable1 = seq.firreg %20 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 64 : ui64} : i32
    %intr_enable2 = seq.firreg %25 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 96 : ui64} : i32
    %threshold1 = seq.firreg %66 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 128 : ui64} : i32
    %threshold2 = seq.firreg %71 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 160 : ui64} : i32
    %claim1 = seq.firreg %43 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 192 : ui64} : i32
    %claim2 = seq.firreg %61 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 224 : ui64} : i32
    %clear_r = seq.firreg %60 clock %clock reset sync %reset, %false {firrtl.random_init_start = 256 : ui64} : i1
    %0 = comb.extract %pending from 1 {sv.namehint = "_io_intr_out_m_raise_T"} : (i32) -> i1
    %1 = comb.icmp bin uge %priority, %threshold2 {sv.namehint = "_io_intr_out_s_raise_T_1"} : i32
    %2 = comb.and bin %0, %1 {sv.namehint = ".io_intr_out_s_raise.output"} : i1
    %3 = comb.icmp bin uge %priority, %threshold1 {sv.namehint = "_io_intr_out_m_raise_T_1"} : i32
    %4 = comb.and bin %0, %3 {sv.namehint = ".io_intr_out_m_raise.output"} : i1
    %5 = comb.and bin %pending, %c-3_i32 : i32
    %6 = comb.or %5, %c2_i32 : i32
    %7 = comb.mux bin %io_intr_in1, %6, %pending : i32
    %8 = comb.mux bin %4, %c1_i32, %claim1 : i32
    %9 = comb.mux bin %2, %c1_i32, %claim2 : i32
    %10 = comb.icmp bin eq %io_rw_addr, %c201326596_i32 {sv.namehint = "_T"} : i32
    %11 = comb.concat %c0_i32, %priority : i32, i32
    %12 = comb.mux bin %10, %11, %c0_i64 : i64
    %13 = comb.extract %io_rw_wdata from 0 : (i64) -> i32
    %14 = comb.and bin %10, %io_rw_wvalid : i1
    %15 = comb.mux bin %14, %13, %priority : i32
    %16 = comb.icmp bin eq %io_rw_addr, %c201334784_i32 {sv.namehint = "_T_1"} : i32
    %17 = comb.concat %c0_i32, %intr_enable1 : i32, i32
    %18 = comb.mux bin %16, %17, %12 : i64
    %19 = comb.and bin %16, %io_rw_wvalid : i1
    %20 = comb.mux bin %19, %13, %intr_enable1 : i32
    %21 = comb.icmp bin eq %io_rw_addr, %c201335040_i32 {sv.namehint = "_T_2"} : i32
    %22 = comb.concat %c0_i32, %intr_enable2 : i32, i32
    %23 = comb.mux bin %21, %22, %18 : i64
    %24 = comb.and bin %21, %io_rw_wvalid : i1
    %25 = comb.mux bin %24, %13, %intr_enable2 : i32
    %26 = comb.icmp bin eq %io_rw_addr, %c203423748_i32 {sv.namehint = "_T_3"} : i32
    %27 = comb.concat %c0_i32, %claim1 : i32, i32
    %28 = comb.mux bin %26, %27, %23 : i64
    %29 = comb.extract %claim1 from 0 {sv.namehint = "pending_bit_idx"} : (i32) -> i6
    %30 = comb.concat %c0_i58, %29 : i58, i6
    %31 = comb.shl bin %c1_i64, %30 {sv.namehint = "pending_mask_1"} : i64
    %32 = comb.extract %31 from 0 : (i64) -> i32
    %33 = comb.xor %32, %c-1_i32 : i32
    %34 = comb.and bin %33, %pending : i32
    %35 = comb.shl bin %c0_i64, %30 {sv.namehint = "_pending_T_7"} : i64
    %36 = comb.extract %35 from 0 : (i64) -> i32
    %37 = comb.extract %31 from 0 : (i64) -> i32
    %38 = comb.and %36, %37 : i32
    %39 = comb.or %34, %38 : i32
    %40 = comb.and bin %26, %io_rw_arvalid : i1
    %41 = comb.mux bin %40, %39, %7 : i32
    %42 = comb.and %26, %io_rw_arvalid : i1
    %43 = comb.mux bin %40, %c0_i32, %8 : i32
    %44 = comb.icmp bin eq %io_rw_addr, %c203427844_i32 {sv.namehint = "_T_4"} : i32
    %45 = comb.concat %c0_i32, %claim2 : i32, i32
    %46 = comb.mux bin %44, %45, %28 : i64
    %47 = comb.extract %claim2 from 0 {sv.namehint = "pending_bit_idx_1"} : (i32) -> i6
    %48 = comb.concat %c0_i58, %47 : i58, i6
    %49 = comb.shl bin %c1_i64, %48 {sv.namehint = "pending_mask_2"} : i64
    %50 = comb.extract %49 from 0 : (i64) -> i32
    %51 = comb.xor %50, %c-1_i32 : i32
    %52 = comb.and bin %51, %pending : i32
    %53 = comb.shl bin %c0_i64, %48 {sv.namehint = "_pending_T_12"} : i64
    %54 = comb.extract %53 from 0 : (i64) -> i32
    %55 = comb.extract %49 from 0 : (i64) -> i32
    %56 = comb.and %54, %55 : i32
    %57 = comb.or %52, %56 : i32
    %58 = comb.and bin %44, %io_rw_arvalid : i1
    %59 = comb.mux bin %58, %57, %41 : i32
    %60 = comb.or %58, %42 : i1
    %61 = comb.mux bin %58, %c0_i32, %9 : i32
    %62 = comb.icmp bin eq %io_rw_addr, %c203423744_i32 {sv.namehint = "_T_5"} : i32
    %63 = comb.concat %c0_i32, %threshold1 : i32, i32
    %64 = comb.mux bin %62, %63, %46 : i64
    %65 = comb.and bin %62, %io_rw_wvalid : i1
    %66 = comb.mux bin %65, %13, %threshold1 : i32
    %67 = comb.icmp bin eq %io_rw_addr, %c203427840_i32 {sv.namehint = "_T_6"} : i32
    %68 = comb.concat %c0_i32, %threshold2 : i32, i32
    %69 = comb.mux bin %67, %68, %64 : i64
    %70 = comb.and bin %67, %io_rw_wvalid : i1
    %71 = comb.mux bin %70, %13, %threshold2 : i32
    hw.output %4, %clear_r, %2, %clear_r, %69 : i1, i1, i1, i1, i64
  }
  hw.module private @DmaBridge(%clock: i1, %reset: i1, %io_dmaAxi_awvalid: i1, %io_dmaAxi_awaddr: i32, %io_dmaAxi_awlen: i8, %io_dmaAxi_wvalid: i1, %io_dmaAxi_wdata: i64, %io_dmaAxi_wstrb: i8, %io_dmaAxi_bready: i1, %io_dmaAxi_arvalid: i1, %io_dmaAxi_araddr: i32, %io_dmaAxi_arlen: i8, %io_dmaAxi_rready: i1, %io_dcRW_rdata: i64, %io_dcRW_rvalid: i1, %io_dcRW_ready: i1) -> (io_dmaAxi_awready: i1, io_dmaAxi_wready: i1, io_dmaAxi_bvalid: i1, io_dmaAxi_arready: i1, io_dmaAxi_rvalid: i1, io_dmaAxi_rdata: i64, io_dmaAxi_rlast: i1, io_dcRW_addr: i32, io_dcRW_wdata: i64, io_dcRW_dc_mode: i5) {
    %true = hw.constant true
    %c1_i32 = hw.constant 1 : i32
    %false = hw.constant false
    %c-1_i8 = hw.constant -1 : i8
    %c-2_i2 = hw.constant -2 : i2
    %c0_i24 = hw.constant 0 : i24
    %c0_i64 = hw.constant 0 : i64
    %c0_i32 = hw.constant 0 : i32
    %c0_i8 = hw.constant 0 : i8
    %c1_i3 = hw.constant 1 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c7_i5 = hw.constant 7 : i5
    %c2_i3 = hw.constant 2 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-1_i3 = hw.constant -1 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c8_i5 = hw.constant 8 : i5
    %c0_i3 = hw.constant 0 : i3
    %c-8_i32 = hw.constant -8 : i32
    %c0_i5 = hw.constant 0 : i5
    %c1_i8 = hw.constant 1 : i8
    %state = seq.firreg %156 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 0 : ui64} : i3
    %awready_r = seq.firreg %55 clock %clock reset sync %reset, %false {firrtl.random_init_start = 3 : ui64} : i1
    %wready_r = seq.firreg %95 clock %clock reset sync %reset, %false {firrtl.random_init_start = 4 : ui64} : i1
    %bvalid_r = seq.firreg %87 clock %clock reset sync %reset, %false {firrtl.random_init_start = 5 : ui64} : i1
    %arready_r = seq.firreg %8 clock %clock reset sync %reset, %false {firrtl.random_init_start = 12 : ui64} : i1
    %rvalid_r = seq.firreg %30 clock %clock reset sync %reset, %false {firrtl.random_init_start = 13 : ui64} : i1
    %rdata_r = seq.firreg %20 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 16 : ui64} : i64
    %rlast_r = seq.firreg %25 clock %clock reset sync %reset, %false {firrtl.random_init_start = 80 : ui64} : i1
    %dc_addr_r = seq.firreg %151 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 85 : ui64} : i32
    %dc_wdata_r = seq.firreg %108 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 117 : ui64} : i64
    %dc_mode_r = seq.firreg %122 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 181 : ui64} : i5
    %data_buf_r = seq.firreg %143 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 186 : ui64} : i64
    %data_strb_r = seq.firreg %132 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 250 : ui64} : i8
    %addr_r = seq.firreg %80 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 261 : ui64} : i32
    %len_r = seq.firreg %102 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 297 : ui64} : i8
    %size_r = seq.firreg %63 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 305 : ui64} : i8
    %0 = comb.icmp bin eq %state, %c0_i3 {sv.namehint = "_T"} : i3
    %1 = comb.mux bin %io_dmaAxi_arvalid, %c1_i3, %state : i3
    %2 = comb.or %io_dmaAxi_arvalid, %arready_r : i1
    %3 = comb.mux bin %io_dmaAxi_awvalid, %c3_i3, %1 : i3
    %4 = comb.or %io_dmaAxi_awvalid, %awready_r : i1
    %5 = comb.icmp bin eq %state, %c1_i3 {sv.namehint = "_T_1"} : i3
    %6 = comb.xor %5, %true : i1
    %7 = comb.and %6, %arready_r : i1
    %8 = comb.mux bin %0, %2, %7 : i1
    %9 = comb.and bin %io_dmaAxi_araddr, %c-8_i32 {sv.namehint = "_dc_addr_r_T_1"} : i32
    %10 = comb.icmp bin eq %state, %c-2_i3 {sv.namehint = "_T_2"} : i3
    %11 = comb.icmp bin ne %dc_mode_r, %c0_i5 {sv.namehint = "_T_3"} : i5
    %12 = comb.and bin %io_dcRW_ready, %11 {sv.namehint = "_T_4"} : i1
    %13 = comb.mux bin %12, %c0_i5, %dc_mode_r : i5
    %14 = comb.mux bin %io_dcRW_rvalid, %io_dcRW_rdata, %data_buf_r : i64
    %15 = comb.mux bin %io_dcRW_rvalid, %c2_i3, %state : i3
    %16 = comb.icmp bin eq %state, %c2_i3 {sv.namehint = "_T_5"} : i3
    %17 = comb.or bin %0, %5, %10 : i1
    %18 = comb.xor %16, %true : i1
    %19 = comb.or %17, %18 : i1
    %20 = comb.mux bin %19, %rdata_r, %data_buf_r : i64
    %21 = comb.icmp bin ne %len_r, %c0_i8 : i8
    %22 = comb.xor bin %21, %true {sv.namehint = "_rlast_r_T"} : i1
    %23 = comb.xor %16, %true : i1
    %24 = comb.or %17, %23 : i1
    %25 = comb.mux bin %24, %rlast_r, %22 : i1
    %26 = comb.and bin %io_dmaAxi_rready, %rvalid_r {sv.namehint = "_T_6"} : i1
    %27 = comb.xor bin %26, %true : i1
    %28 = comb.xor %16, %true : i1
    %29 = comb.or %17, %28 : i1
    %30 = comb.mux bin %29, %rvalid_r, %27 : i1
    %31 = comb.add %len_r, %c-1_i8 {sv.namehint = "_len_r_T_1"} : i8
    %32 = comb.xor %26, %true : i1
    %33 = comb.or %32, %rlast_r : i1
    %34 = comb.mux bin %33, %len_r, %31 : i8
    %35 = comb.concat %c0_i24, %size_r : i24, i8
    %36 = comb.add %addr_r, %35 {sv.namehint = "_dc_addr_r_T_3"} : i32
    %37 = comb.and bin %36, %c-8_i32 {sv.namehint = "_dc_addr_r_T_5"} : i32
    %38 = comb.xor %26, %true : i1
    %39 = comb.or %38, %rlast_r : i1
    %40 = comb.mux bin %39, %dc_addr_r, %37 : i32
    %41 = comb.xor %26, %true : i1
    %42 = comb.or %41, %rlast_r : i1
    %43 = comb.mux bin %42, %addr_r, %36 : i32
    %44 = comb.xor %26, %true : i1
    %45 = comb.or %44, %rlast_r : i1
    %46 = comb.mux bin %45, %dc_mode_r, %c7_i5 : i5
    %47 = comb.mux bin %rlast_r, %c0_i3, %c-2_i3 : i3
    %48 = comb.mux bin %26, %47, %state : i3
    %49 = comb.icmp bin eq %state, %c3_i3 {sv.namehint = "_T_7"} : i3
    %50 = comb.xor %49, %true : i1
    %51 = comb.or bin %10, %16 : i1
    %52 = comb.or bin %5, %51 : i1
    %53 = comb.or %52, %50 : i1
    %54 = comb.and %53, %awready_r : i1
    %55 = comb.mux bin %0, %4, %54 : i1
    %56 = comb.and bin %io_dmaAxi_awaddr, %c-8_i32 {sv.namehint = "_dc_addr_r_T_7"} : i32
    %57 = comb.xor %49, %true : i1
    %58 = comb.or %51, %57 : i1
    %59 = comb.xor %58, %true : i1
    %60 = comb.or %5, %59 : i1
    %61 = comb.xor %60, %true : i1
    %62 = comb.or %0, %61 : i1
    %63 = comb.mux bin %62, %size_r, %c1_i8 : i8
    %64 = comb.icmp bin eq %state, %c-4_i3 {sv.namehint = "_T_8"} : i3
    %65 = comb.and bin %io_dmaAxi_wvalid, %wready_r {sv.namehint = "_T_9"} : i1
    %66 = comb.xor %65, %true : i1
    %67 = comb.and %66, %wready_r : i1
    %68 = comb.mux bin %65, %io_dmaAxi_wdata, %data_buf_r : i64
    %69 = comb.mux bin %65, %io_dmaAxi_wstrb, %data_strb_r : i8
    %70 = comb.mux bin %65, %c-1_i3, %state : i3
    %71 = comb.icmp bin eq %state, %c-1_i3 {sv.namehint = "_T_10"} : i3
    %72 = comb.icmp bin eq %data_strb_r, %c0_i8 {sv.namehint = "_T_11"} : i8
    %73 = comb.concat %c0_i24, %size_r : i24, i8
    %74 = comb.add %addr_r, %73 {sv.namehint = "_addr_r_T_3"} : i32
    %75 = comb.and bin %71, %72 : i1
    %76 = comb.xor %75, %true : i1
    %77 = comb.or %64, %76 : i1
    %78 = comb.mux bin %77, %addr_r, %74 : i32
    %79 = hw.array_create %78, %addr_r, %78, %addr_r, %io_dmaAxi_awaddr, %43, %io_dmaAxi_araddr, %addr_r : i32
    %80 = hw.array_get %79[%state] : !hw.array<8xi32>, i3
    %81 = comb.and bin %74, %c-8_i32 {sv.namehint = "_dc_addr_r_T_11"} : i32
    %82 = comb.xor bin %21, %true {sv.namehint = "_T_12"} : i1
    %83 = comb.or bin %49, %64 : i1
    %84 = comb.or bin %0, %5, %10, %16, %83 : i1
    %85 = comb.xor %84, %true : i1
    %86 = comb.and %85, %71, %72, %82 : i1
    %87 = comb.or %86, %bvalid_r : i1
    %88 = comb.concat %c-2_i2, %82 : i2, i1
    %89 = comb.mux bin %72, %88, %state : i3
    %90 = comb.and %75, %21 : i1
    %91 = comb.or %90, %wready_r : i1
    %92 = comb.mux bin %64, %67, %91 : i1
    %93 = comb.or %49, %92 : i1
    %94 = comb.or bin %0, %52 : i1
    %95 = comb.mux bin %94, %wready_r, %93 : i1
    %96 = comb.add %len_r, %c-1_i8 {sv.namehint = "_len_r_T_3"} : i8
    %97 = comb.and %75, %21 : i1
    %98 = comb.xor %97, %true : i1
    %99 = comb.or %64, %98 : i1
    %100 = comb.mux bin %99, %len_r, %96 : i8
    %101 = hw.array_create %100, %len_r, %100, %len_r, %io_dmaAxi_awlen, %34, %io_dmaAxi_arlen, %len_r : i8
    %102 = hw.array_get %101[%state] : !hw.array<8xi8>, i3
    %103 = comb.extract %data_strb_r from 0 {sv.namehint = "_T_13"} : (i8) -> i1
    %104 = comb.mux bin %103, %c8_i5, %dc_mode_r : i5
    %105 = comb.xor %103, %true : i1
    %106 = comb.xor %71, %true : i1
    %107 = comb.or %84, %106, %72, %105 : i1
    %108 = comb.mux bin %107, %dc_wdata_r, %data_buf_r : i64
    %109 = comb.extract %data_strb_r from 1 : (i8) -> i7
    %110 = comb.concat %false, %109 : i1, i7
    %111 = comb.extract %data_buf_r from 8 : (i64) -> i56
    %112 = comb.concat %c0_i8, %111 : i8, i56
    %113 = comb.add %dc_addr_r, %c1_i32 {sv.namehint = "_dc_addr_r_T_13"} : i32
    %114 = comb.mux bin %103, %dc_addr_r, %113 : i32
    %115 = comb.icmp bin ne %dc_mode_r, %c0_i5 {sv.namehint = "_T_14"} : i5
    %116 = comb.and bin %io_dcRW_ready, %115 {sv.namehint = "_T_15"} : i1
    %117 = comb.mux bin %116, %c0_i5, %104 : i5
    %118 = comb.xor %71, %true : i1
    %119 = comb.or %83, %118, %72 : i1
    %120 = comb.mux bin %119, %dc_mode_r, %117 : i5
    %121 = hw.array_create %120, %13, %120, %dc_mode_r, %dc_mode_r, %46, %c7_i5, %dc_mode_r : i5
    %122 = hw.array_get %121[%state] : !hw.array<8xi5>, i3
    %123 = comb.xor %103, %true : i1
    %124 = comb.or %116, %123 : i1
    %125 = comb.xor %124, %true : i1
    %126 = comb.xor %71, %true : i1
    %127 = comb.or %126, %72, %125 : i1
    %128 = comb.mux bin %127, %data_strb_r, %110 : i8
    %129 = comb.mux bin %64, %69, %128 : i8
    %130 = comb.or bin %16, %49 : i1
    %131 = comb.or bin %0, %5, %10, %130 : i1
    %132 = comb.mux bin %131, %data_strb_r, %129 : i8
    %133 = comb.xor %103, %true : i1
    %134 = comb.or %116, %133 : i1
    %135 = comb.xor %134, %true : i1
    %136 = comb.xor %71, %true : i1
    %137 = comb.or %136, %72, %135 : i1
    %138 = comb.mux bin %137, %data_buf_r, %112 : i64
    %139 = comb.mux bin %64, %68, %138 : i64
    %140 = comb.mux bin %130, %data_buf_r, %139 : i64
    %141 = comb.mux bin %10, %14, %140 : i64
    %142 = comb.or bin %0, %5 : i1
    %143 = comb.mux bin %142, %data_buf_r, %141 : i64
    %144 = comb.add %dc_addr_r, %c1_i32 {sv.namehint = "_dc_addr_r_T_15"} : i32
    %145 = comb.mux bin %116, %144, %114 : i32
    %146 = comb.mux bin %72, %81, %145 : i32
    %147 = comb.xor %71, %true : i1
    %148 = comb.or %64, %147 : i1
    %149 = comb.mux bin %148, %dc_addr_r, %146 : i32
    %150 = hw.array_create %149, %dc_addr_r, %149, %dc_addr_r, %56, %40, %9, %dc_addr_r : i32
    %151 = hw.array_get %150[%state] : !hw.array<8xi32>, i3
    %152 = comb.icmp bin eq %state, %c-3_i3 {sv.namehint = "_T_16"} : i3
    %153 = comb.and bin %152, %io_dmaAxi_bready, %bvalid_r : i1
    %154 = comb.mux bin %153, %c0_i3, %state : i3
    %155 = hw.array_create %89, %15, %154, %70, %c-4_i3, %48, %c-2_i3, %3 : i3
    %156 = hw.array_get %155[%state] : !hw.array<8xi3>, i3
    hw.output %awready_r, %wready_r, %bvalid_r, %arready_r, %rvalid_r, %rdata_r, %rlast_r, %dc_addr_r, %dc_wdata_r, %dc_mode_r : i1, i1, i1, i1, i1, i64, i1, i32, i64, i5
  }
  hw.module private @CPU(%clock: i1, %reset: i1, %io_master_awready: i1, %io_master_wready: i1, %io_master_arready: i1, %io_master_rvalid: i1, %io_master_rdata: i64, %io_master_rlast: i1, %io_slave_awvalid: i1, %io_slave_awaddr: i32, %io_slave_awlen: i8, %io_slave_wvalid: i1, %io_slave_wdata: i64, %io_slave_wstrb: i8, %io_slave_bready: i1, %io_slave_arvalid: i1, %io_slave_araddr: i32, %io_slave_arlen: i8, %io_slave_rready: i1, %io_interrupt: i1) -> (io_master_awvalid: i1, io_master_awaddr: i32, io_master_awlen: i8, io_master_wvalid: i1, io_master_wdata: i64, io_master_wstrb: i8, io_master_wlast: i1, io_master_arvalid: i1, io_master_araddr: i32, io_master_arlen: i8, io_master_rready: i1, io_slave_awready: i1, io_slave_wready: i1, io_slave_bvalid: i1, io_slave_arready: i1, io_slave_rvalid: i1, io_slave_rdata: i64, io_slave_rlast: i1) {
    %false = hw.constant false
    %fetch.io_instRead_addr, %fetch.io_instRead_arvalid, %fetch.io_va2pa_vaddr, %fetch.io_va2pa_vvalid, %fetch.io_if2id_inst, %fetch.io_if2id_pc, %fetch.io_if2id_excep_cause, %fetch.io_if2id_excep_tval, %fetch.io_if2id_excep_en, %fetch.io_if2id_excep_pc, %fetch.io_if2id_excep_etype, %fetch.io_if2id_recov, %fetch.io_if2id_valid = hw.instance "fetch" @Fetch(clock: %clock: i1, reset: %reset: i1, io_instRead_inst: %fetchCrossbar.io_instIO_inst: i64, io_instRead_rvalid: %fetchCrossbar.io_instIO_rvalid: i1, io_va2pa_paddr: %tlb_if.io_va2pa_paddr: i32, io_va2pa_pvalid: %tlb_if.io_va2pa_pvalid: i1, io_va2pa_tlb_excep_cause: %tlb_if.io_va2pa_tlb_excep_cause: i64, io_va2pa_tlb_excep_tval: %tlb_if.io_va2pa_tlb_excep_tval: i64, io_va2pa_tlb_excep_en: %tlb_if.io_va2pa_tlb_excep_en: i1, io_reg2if_seq_pc: %csrs.io_reg2if_seq_pc: i64, io_reg2if_valid: %csrs.io_reg2if_valid: i1, io_wb2if_seq_pc: %writeback.io_wb2if_seq_pc: i64, io_wb2if_valid: %writeback.io_wb2if_valid: i1, io_recov: %writeback.io_recov: i1, io_intr_in_en: %csrs.io_intr_out_en: i1, io_intr_in_cause: %csrs.io_intr_out_cause: i64, io_branchFail_seq_pc: %execute.io_ex2if_seq_pc: i64, io_branchFail_valid: %execute.io_ex2if_valid: i1, io_if2id_drop: %decode.io_if2id_drop: i1, io_if2id_stall: %decode.io_if2id_stall: i1, io_if2id_ready: %decode.io_if2id_ready: i1) -> (io_instRead_addr: i32, io_instRead_arvalid: i1, io_va2pa_vaddr: i64, io_va2pa_vvalid: i1, io_if2id_inst: i32, io_if2id_pc: i64, io_if2id_excep_cause: i64, io_if2id_excep_tval: i64, io_if2id_excep_en: i1, io_if2id_excep_pc: i64, io_if2id_excep_etype: i2, io_if2id_recov: i1, io_if2id_valid: i1)
    %decode.io_if2id_drop, %decode.io_if2id_stall, %decode.io_if2id_ready, %decode.io_id2df_inst, %decode.io_id2df_pc, %decode.io_id2df_excep_cause, %decode.io_id2df_excep_tval, %decode.io_id2df_excep_en, %decode.io_id2df_excep_pc, %decode.io_id2df_excep_etype, %decode.io_id2df_ctrl_aluOp, %decode.io_id2df_ctrl_aluWidth, %decode.io_id2df_ctrl_dcMode, %decode.io_id2df_ctrl_writeRegEn, %decode.io_id2df_ctrl_writeCSREn, %decode.io_id2df_ctrl_brType, %decode.io_id2df_rs1, %decode.io_id2df_rrs1, %decode.io_id2df_rs1_d, %decode.io_id2df_rs2, %decode.io_id2df_rrs2, %decode.io_id2df_rs2_d, %decode.io_id2df_dst, %decode.io_id2df_dst_d, %decode.io_id2df_jmp_type, %decode.io_id2df_special, %decode.io_id2df_swap, %decode.io_id2df_indi, %decode.io_id2df_recov, %decode.io_id2df_valid = hw.instance "decode" @Decode(clock: %clock: i1, reset: %reset: i1, io_if2id_inst: %fetch.io_if2id_inst: i32, io_if2id_pc: %fetch.io_if2id_pc: i64, io_if2id_excep_cause: %fetch.io_if2id_excep_cause: i64, io_if2id_excep_tval: %fetch.io_if2id_excep_tval: i64, io_if2id_excep_en: %fetch.io_if2id_excep_en: i1, io_if2id_excep_pc: %fetch.io_if2id_excep_pc: i64, io_if2id_excep_etype: %fetch.io_if2id_excep_etype: i2, io_if2id_recov: %fetch.io_if2id_recov: i1, io_if2id_valid: %fetch.io_if2id_valid: i1, io_id2df_drop: %forwading.io_id2df_drop: i1, io_id2df_stall: %forwading.io_id2df_stall: i1, io_id2df_ready: %forwading.io_id2df_ready: i1, io_idState_priv: %csrs.io_idState_priv: i2) -> (io_if2id_drop: i1, io_if2id_stall: i1, io_if2id_ready: i1, io_id2df_inst: i32, io_id2df_pc: i64, io_id2df_excep_cause: i64, io_id2df_excep_tval: i64, io_id2df_excep_en: i1, io_id2df_excep_pc: i64, io_id2df_excep_etype: i2, io_id2df_ctrl_aluOp: i5, io_id2df_ctrl_aluWidth: i1, io_id2df_ctrl_dcMode: i5, io_id2df_ctrl_writeRegEn: i1, io_id2df_ctrl_writeCSREn: i1, io_id2df_ctrl_brType: i3, io_id2df_rs1: i5, io_id2df_rrs1: i1, io_id2df_rs1_d: i64, io_id2df_rs2: i12, io_id2df_rrs2: i1, io_id2df_rs2_d: i64, io_id2df_dst: i5, io_id2df_dst_d: i64, io_id2df_jmp_type: i2, io_id2df_special: i2, io_id2df_swap: i6, io_id2df_indi: i2, io_id2df_recov: i1, io_id2df_valid: i1)
    %forwading.io_id2df_drop, %forwading.io_id2df_stall, %forwading.io_id2df_ready, %forwading.io_df2rr_inst, %forwading.io_df2rr_pc, %forwading.io_df2rr_excep_cause, %forwading.io_df2rr_excep_tval, %forwading.io_df2rr_excep_en, %forwading.io_df2rr_excep_pc, %forwading.io_df2rr_excep_etype, %forwading.io_df2rr_ctrl_aluOp, %forwading.io_df2rr_ctrl_aluWidth, %forwading.io_df2rr_ctrl_dcMode, %forwading.io_df2rr_ctrl_writeRegEn, %forwading.io_df2rr_ctrl_writeCSREn, %forwading.io_df2rr_ctrl_brType, %forwading.io_df2rr_rs1, %forwading.io_df2rr_rrs1, %forwading.io_df2rr_rs1_d, %forwading.io_df2rr_rs2, %forwading.io_df2rr_rrs2, %forwading.io_df2rr_rs2_d, %forwading.io_df2rr_dst, %forwading.io_df2rr_dst_d, %forwading.io_df2rr_jmp_type, %forwading.io_df2rr_special, %forwading.io_df2rr_swap, %forwading.io_df2rr_indi, %forwading.io_df2rr_recov, %forwading.io_df2rr_valid = hw.instance "forwading" @Forwarding(clock: %clock: i1, reset: %reset: i1, io_id2df_inst: %decode.io_id2df_inst: i32, io_id2df_pc: %decode.io_id2df_pc: i64, io_id2df_excep_cause: %decode.io_id2df_excep_cause: i64, io_id2df_excep_tval: %decode.io_id2df_excep_tval: i64, io_id2df_excep_en: %decode.io_id2df_excep_en: i1, io_id2df_excep_pc: %decode.io_id2df_excep_pc: i64, io_id2df_excep_etype: %decode.io_id2df_excep_etype: i2, io_id2df_ctrl_aluOp: %decode.io_id2df_ctrl_aluOp: i5, io_id2df_ctrl_aluWidth: %decode.io_id2df_ctrl_aluWidth: i1, io_id2df_ctrl_dcMode: %decode.io_id2df_ctrl_dcMode: i5, io_id2df_ctrl_writeRegEn: %decode.io_id2df_ctrl_writeRegEn: i1, io_id2df_ctrl_writeCSREn: %decode.io_id2df_ctrl_writeCSREn: i1, io_id2df_ctrl_brType: %decode.io_id2df_ctrl_brType: i3, io_id2df_rs1: %decode.io_id2df_rs1: i5, io_id2df_rrs1: %decode.io_id2df_rrs1: i1, io_id2df_rs1_d: %decode.io_id2df_rs1_d: i64, io_id2df_rs2: %decode.io_id2df_rs2: i12, io_id2df_rrs2: %decode.io_id2df_rrs2: i1, io_id2df_rs2_d: %decode.io_id2df_rs2_d: i64, io_id2df_dst: %decode.io_id2df_dst: i5, io_id2df_dst_d: %decode.io_id2df_dst_d: i64, io_id2df_jmp_type: %decode.io_id2df_jmp_type: i2, io_id2df_special: %decode.io_id2df_special: i2, io_id2df_swap: %decode.io_id2df_swap: i6, io_id2df_indi: %decode.io_id2df_indi: i2, io_id2df_recov: %decode.io_id2df_recov: i1, io_id2df_valid: %decode.io_id2df_valid: i1, io_df2rr_drop: %readregs.io_df2rr_drop: i1, io_df2rr_stall: %readregs.io_df2rr_stall: i1, io_df2rr_ready: %readregs.io_df2rr_ready: i1, io_d_rr_id: %readregs.io_d_rr_id: i5, io_d_rr_data: %readregs.io_d_rr_data: i64, io_d_rr_state: %readregs.io_d_rr_state: i2, io_d_ex_id: %execute.io_d_ex_id: i5, io_d_ex_data: %execute.io_d_ex_data: i64, io_d_ex_state: %execute.io_d_ex_state: i2, io_d_mem1_id: %memory.io_d_mem1_id: i5, io_d_mem1_data: %memory.io_d_mem1_data: i64, io_d_mem1_state: %memory.io_d_mem1_state: i2, io_d_mem2_id: %memory.io_d_mem2_id: i5, io_d_mem2_data: %memory.io_d_mem2_data: i64, io_d_mem2_state: %memory.io_d_mem2_state: i2, io_d_mem3_id: %memory.io_d_mem3_id: i5, io_d_mem3_data: %memory.io_d_mem3_data: i64, io_d_mem3_state: %memory.io_d_mem3_state: i2) -> (io_id2df_drop: i1, io_id2df_stall: i1, io_id2df_ready: i1, io_df2rr_inst: i32, io_df2rr_pc: i64, io_df2rr_excep_cause: i64, io_df2rr_excep_tval: i64, io_df2rr_excep_en: i1, io_df2rr_excep_pc: i64, io_df2rr_excep_etype: i2, io_df2rr_ctrl_aluOp: i5, io_df2rr_ctrl_aluWidth: i1, io_df2rr_ctrl_dcMode: i5, io_df2rr_ctrl_writeRegEn: i1, io_df2rr_ctrl_writeCSREn: i1, io_df2rr_ctrl_brType: i3, io_df2rr_rs1: i5, io_df2rr_rrs1: i1, io_df2rr_rs1_d: i64, io_df2rr_rs2: i12, io_df2rr_rrs2: i1, io_df2rr_rs2_d: i64, io_df2rr_dst: i5, io_df2rr_dst_d: i64, io_df2rr_jmp_type: i2, io_df2rr_special: i2, io_df2rr_swap: i6, io_df2rr_indi: i2, io_df2rr_recov: i1, io_df2rr_valid: i1)
    %readregs.io_df2rr_drop, %readregs.io_df2rr_stall, %readregs.io_df2rr_ready, %readregs.io_rr2ex_inst, %readregs.io_rr2ex_pc, %readregs.io_rr2ex_excep_cause, %readregs.io_rr2ex_excep_tval, %readregs.io_rr2ex_excep_en, %readregs.io_rr2ex_excep_pc, %readregs.io_rr2ex_excep_etype, %readregs.io_rr2ex_ctrl_aluOp, %readregs.io_rr2ex_ctrl_aluWidth, %readregs.io_rr2ex_ctrl_dcMode, %readregs.io_rr2ex_ctrl_writeRegEn, %readregs.io_rr2ex_ctrl_writeCSREn, %readregs.io_rr2ex_ctrl_brType, %readregs.io_rr2ex_rs1_d, %readregs.io_rr2ex_rs2, %readregs.io_rr2ex_rs2_d, %readregs.io_rr2ex_dst, %readregs.io_rr2ex_dst_d, %readregs.io_rr2ex_jmp_type, %readregs.io_rr2ex_special, %readregs.io_rr2ex_indi, %readregs.io_rr2ex_recov, %readregs.io_rr2ex_valid, %readregs.io_rs1Read_id, %readregs.io_rs2Read_id, %readregs.io_csrRead_id, %readregs.io_d_rr_id, %readregs.io_d_rr_data, %readregs.io_d_rr_state = hw.instance "readregs" @ReadRegs(clock: %clock: i1, reset: %reset: i1, io_df2rr_inst: %forwading.io_df2rr_inst: i32, io_df2rr_pc: %forwading.io_df2rr_pc: i64, io_df2rr_excep_cause: %forwading.io_df2rr_excep_cause: i64, io_df2rr_excep_tval: %forwading.io_df2rr_excep_tval: i64, io_df2rr_excep_en: %forwading.io_df2rr_excep_en: i1, io_df2rr_excep_pc: %forwading.io_df2rr_excep_pc: i64, io_df2rr_excep_etype: %forwading.io_df2rr_excep_etype: i2, io_df2rr_ctrl_aluOp: %forwading.io_df2rr_ctrl_aluOp: i5, io_df2rr_ctrl_aluWidth: %forwading.io_df2rr_ctrl_aluWidth: i1, io_df2rr_ctrl_dcMode: %forwading.io_df2rr_ctrl_dcMode: i5, io_df2rr_ctrl_writeRegEn: %forwading.io_df2rr_ctrl_writeRegEn: i1, io_df2rr_ctrl_writeCSREn: %forwading.io_df2rr_ctrl_writeCSREn: i1, io_df2rr_ctrl_brType: %forwading.io_df2rr_ctrl_brType: i3, io_df2rr_rs1: %forwading.io_df2rr_rs1: i5, io_df2rr_rrs1: %forwading.io_df2rr_rrs1: i1, io_df2rr_rs1_d: %forwading.io_df2rr_rs1_d: i64, io_df2rr_rs2: %forwading.io_df2rr_rs2: i12, io_df2rr_rrs2: %forwading.io_df2rr_rrs2: i1, io_df2rr_rs2_d: %forwading.io_df2rr_rs2_d: i64, io_df2rr_dst: %forwading.io_df2rr_dst: i5, io_df2rr_dst_d: %forwading.io_df2rr_dst_d: i64, io_df2rr_jmp_type: %forwading.io_df2rr_jmp_type: i2, io_df2rr_special: %forwading.io_df2rr_special: i2, io_df2rr_swap: %forwading.io_df2rr_swap: i6, io_df2rr_indi: %forwading.io_df2rr_indi: i2, io_df2rr_recov: %forwading.io_df2rr_recov: i1, io_df2rr_valid: %forwading.io_df2rr_valid: i1, io_rr2ex_drop: %execute.io_rr2ex_drop: i1, io_rr2ex_stall: %execute.io_rr2ex_stall: i1, io_rr2ex_ready: %execute.io_rr2ex_ready: i1, io_rs1Read_data: %regs.io_rs1_data: i64, io_rs2Read_data: %regs.io_rs2_data: i64, io_csrRead_data: %csrs.io_rs_data: i64, io_csrRead_is_err: %csrs.io_rs_is_err: i1) -> (io_df2rr_drop: i1, io_df2rr_stall: i1, io_df2rr_ready: i1, io_rr2ex_inst: i32, io_rr2ex_pc: i64, io_rr2ex_excep_cause: i64, io_rr2ex_excep_tval: i64, io_rr2ex_excep_en: i1, io_rr2ex_excep_pc: i64, io_rr2ex_excep_etype: i2, io_rr2ex_ctrl_aluOp: i5, io_rr2ex_ctrl_aluWidth: i1, io_rr2ex_ctrl_dcMode: i5, io_rr2ex_ctrl_writeRegEn: i1, io_rr2ex_ctrl_writeCSREn: i1, io_rr2ex_ctrl_brType: i3, io_rr2ex_rs1_d: i64, io_rr2ex_rs2: i12, io_rr2ex_rs2_d: i64, io_rr2ex_dst: i5, io_rr2ex_dst_d: i64, io_rr2ex_jmp_type: i2, io_rr2ex_special: i2, io_rr2ex_indi: i2, io_rr2ex_recov: i1, io_rr2ex_valid: i1, io_rs1Read_id: i5, io_rs2Read_id: i5, io_csrRead_id: i12, io_d_rr_id: i5, io_d_rr_data: i64, io_d_rr_state: i2)
    %execute.io_rr2ex_drop, %execute.io_rr2ex_stall, %execute.io_rr2ex_ready, %execute.io_ex2mem_inst, %execute.io_ex2mem_pc, %execute.io_ex2mem_excep_cause, %execute.io_ex2mem_excep_tval, %execute.io_ex2mem_excep_en, %execute.io_ex2mem_excep_pc, %execute.io_ex2mem_excep_etype, %execute.io_ex2mem_ctrl_dcMode, %execute.io_ex2mem_ctrl_writeRegEn, %execute.io_ex2mem_ctrl_writeCSREn, %execute.io_ex2mem_mem_addr, %execute.io_ex2mem_mem_data, %execute.io_ex2mem_csr_id, %execute.io_ex2mem_csr_d, %execute.io_ex2mem_dst, %execute.io_ex2mem_dst_d, %execute.io_ex2mem_special, %execute.io_ex2mem_indi, %execute.io_ex2mem_recov, %execute.io_ex2mem_valid, %execute.io_d_ex_id, %execute.io_d_ex_data, %execute.io_d_ex_state, %execute.io_ex2if_seq_pc, %execute.io_ex2if_valid = hw.instance "execute" @Execute(clock: %clock: i1, reset: %reset: i1, io_rr2ex_inst: %readregs.io_rr2ex_inst: i32, io_rr2ex_pc: %readregs.io_rr2ex_pc: i64, io_rr2ex_excep_cause: %readregs.io_rr2ex_excep_cause: i64, io_rr2ex_excep_tval: %readregs.io_rr2ex_excep_tval: i64, io_rr2ex_excep_en: %readregs.io_rr2ex_excep_en: i1, io_rr2ex_excep_pc: %readregs.io_rr2ex_excep_pc: i64, io_rr2ex_excep_etype: %readregs.io_rr2ex_excep_etype: i2, io_rr2ex_ctrl_aluOp: %readregs.io_rr2ex_ctrl_aluOp: i5, io_rr2ex_ctrl_aluWidth: %readregs.io_rr2ex_ctrl_aluWidth: i1, io_rr2ex_ctrl_dcMode: %readregs.io_rr2ex_ctrl_dcMode: i5, io_rr2ex_ctrl_writeRegEn: %readregs.io_rr2ex_ctrl_writeRegEn: i1, io_rr2ex_ctrl_writeCSREn: %readregs.io_rr2ex_ctrl_writeCSREn: i1, io_rr2ex_ctrl_brType: %readregs.io_rr2ex_ctrl_brType: i3, io_rr2ex_rs1_d: %readregs.io_rr2ex_rs1_d: i64, io_rr2ex_rs2: %readregs.io_rr2ex_rs2: i12, io_rr2ex_rs2_d: %readregs.io_rr2ex_rs2_d: i64, io_rr2ex_dst: %readregs.io_rr2ex_dst: i5, io_rr2ex_dst_d: %readregs.io_rr2ex_dst_d: i64, io_rr2ex_jmp_type: %readregs.io_rr2ex_jmp_type: i2, io_rr2ex_special: %readregs.io_rr2ex_special: i2, io_rr2ex_indi: %readregs.io_rr2ex_indi: i2, io_rr2ex_recov: %readregs.io_rr2ex_recov: i1, io_rr2ex_valid: %readregs.io_rr2ex_valid: i1, io_ex2mem_drop: %memory.io_ex2mem_drop: i1, io_ex2mem_stall: %memory.io_ex2mem_stall: i1, io_ex2mem_ready: %memory.io_ex2mem_ready: i1, io_updateNextPc_seq_pc: %csrs.io_updateNextPc_seq_pc: i64, io_updateNextPc_valid: %csrs.io_updateNextPc_valid: i1) -> (io_rr2ex_drop: i1, io_rr2ex_stall: i1, io_rr2ex_ready: i1, io_ex2mem_inst: i32, io_ex2mem_pc: i64, io_ex2mem_excep_cause: i64, io_ex2mem_excep_tval: i64, io_ex2mem_excep_en: i1, io_ex2mem_excep_pc: i64, io_ex2mem_excep_etype: i2, io_ex2mem_ctrl_dcMode: i5, io_ex2mem_ctrl_writeRegEn: i1, io_ex2mem_ctrl_writeCSREn: i1, io_ex2mem_mem_addr: i64, io_ex2mem_mem_data: i64, io_ex2mem_csr_id: i12, io_ex2mem_csr_d: i64, io_ex2mem_dst: i5, io_ex2mem_dst_d: i64, io_ex2mem_special: i2, io_ex2mem_indi: i2, io_ex2mem_recov: i1, io_ex2mem_valid: i1, io_d_ex_id: i5, io_d_ex_data: i64, io_d_ex_state: i2, io_ex2if_seq_pc: i64, io_ex2if_valid: i1)
    %memory.io_ex2mem_drop, %memory.io_ex2mem_stall, %memory.io_ex2mem_ready, %memory.io_mem2rb_pc, %memory.io_mem2rb_excep_cause, %memory.io_mem2rb_excep_tval, %memory.io_mem2rb_excep_en, %memory.io_mem2rb_excep_pc, %memory.io_mem2rb_excep_etype, %memory.io_mem2rb_csr_id, %memory.io_mem2rb_csr_d, %memory.io_mem2rb_csr_en, %memory.io_mem2rb_dst, %memory.io_mem2rb_dst_d, %memory.io_mem2rb_dst_en, %memory.io_mem2rb_special, %memory.io_mem2rb_recov, %memory.io_mem2rb_valid, %memory.io_dataRW_addr, %memory.io_dataRW_wdata, %memory.io_dataRW_dc_mode, %memory.io_dataRW_amo, %memory.io_va2pa_vaddr, %memory.io_va2pa_vvalid, %memory.io_va2pa_m_type, %memory.io_d_mem1_id, %memory.io_d_mem1_data, %memory.io_d_mem1_state, %memory.io_d_mem2_id, %memory.io_d_mem2_data, %memory.io_d_mem2_state, %memory.io_d_mem3_id, %memory.io_d_mem3_data, %memory.io_d_mem3_state = hw.instance "memory" @Memory(clock: %clock: i1, reset: %reset: i1, io_ex2mem_inst: %execute.io_ex2mem_inst: i32, io_ex2mem_pc: %execute.io_ex2mem_pc: i64, io_ex2mem_excep_cause: %execute.io_ex2mem_excep_cause: i64, io_ex2mem_excep_tval: %execute.io_ex2mem_excep_tval: i64, io_ex2mem_excep_en: %execute.io_ex2mem_excep_en: i1, io_ex2mem_excep_pc: %execute.io_ex2mem_excep_pc: i64, io_ex2mem_excep_etype: %execute.io_ex2mem_excep_etype: i2, io_ex2mem_ctrl_dcMode: %execute.io_ex2mem_ctrl_dcMode: i5, io_ex2mem_ctrl_writeRegEn: %execute.io_ex2mem_ctrl_writeRegEn: i1, io_ex2mem_ctrl_writeCSREn: %execute.io_ex2mem_ctrl_writeCSREn: i1, io_ex2mem_mem_addr: %execute.io_ex2mem_mem_addr: i64, io_ex2mem_mem_data: %execute.io_ex2mem_mem_data: i64, io_ex2mem_csr_id: %execute.io_ex2mem_csr_id: i12, io_ex2mem_csr_d: %execute.io_ex2mem_csr_d: i64, io_ex2mem_dst: %execute.io_ex2mem_dst: i5, io_ex2mem_dst_d: %execute.io_ex2mem_dst_d: i64, io_ex2mem_special: %execute.io_ex2mem_special: i2, io_ex2mem_indi: %execute.io_ex2mem_indi: i2, io_ex2mem_recov: %execute.io_ex2mem_recov: i1, io_ex2mem_valid: %execute.io_ex2mem_valid: i1, io_mem2rb_drop: %false: i1, io_mem2rb_stall: %false: i1, io_mem2rb_ready: %writeback.io_mem2rb_ready: i1, io_dataRW_rdata: %memCrossbar.io_dataRW_rdata: i64, io_dataRW_rvalid: %memCrossbar.io_dataRW_rvalid: i1, io_dataRW_ready: %memCrossbar.io_dataRW_ready: i1, io_va2pa_paddr: %tlb_mem.io_va2pa_paddr: i32, io_va2pa_pvalid: %tlb_mem.io_va2pa_pvalid: i1, io_va2pa_tlb_excep_cause: %tlb_mem.io_va2pa_tlb_excep_cause: i64, io_va2pa_tlb_excep_tval: %tlb_mem.io_va2pa_tlb_excep_tval: i64, io_va2pa_tlb_excep_en: %tlb_mem.io_va2pa_tlb_excep_en: i1) -> (io_ex2mem_drop: i1, io_ex2mem_stall: i1, io_ex2mem_ready: i1, io_mem2rb_pc: i64, io_mem2rb_excep_cause: i64, io_mem2rb_excep_tval: i64, io_mem2rb_excep_en: i1, io_mem2rb_excep_pc: i64, io_mem2rb_excep_etype: i2, io_mem2rb_csr_id: i12, io_mem2rb_csr_d: i64, io_mem2rb_csr_en: i1, io_mem2rb_dst: i5, io_mem2rb_dst_d: i64, io_mem2rb_dst_en: i1, io_mem2rb_special: i2, io_mem2rb_recov: i1, io_mem2rb_valid: i1, io_dataRW_addr: i32, io_dataRW_wdata: i64, io_dataRW_dc_mode: i5, io_dataRW_amo: i5, io_va2pa_vaddr: i64, io_va2pa_vvalid: i1, io_va2pa_m_type: i2, io_d_mem1_id: i5, io_d_mem1_data: i64, io_d_mem1_state: i2, io_d_mem2_id: i5, io_d_mem2_data: i64, io_d_mem2_state: i2, io_d_mem3_id: i5, io_d_mem3_data: i64, io_d_mem3_state: i2)
    %writeback.io_mem2rb_ready, %writeback.io_wReg_id, %writeback.io_wReg_data, %writeback.io_wReg_en, %writeback.io_wCsr_id, %writeback.io_wCsr_data, %writeback.io_wCsr_en, %writeback.io_excep_cause, %writeback.io_excep_tval, %writeback.io_excep_en, %writeback.io_excep_pc, %writeback.io_excep_etype, %writeback.io_wb2if_seq_pc, %writeback.io_wb2if_valid, %writeback.io_recov, %writeback.io_flush_tlb, %writeback.io_flush_cache = hw.instance "writeback" @Writeback(clock: %clock: i1, reset: %reset: i1, io_mem2rb_pc: %memory.io_mem2rb_pc: i64, io_mem2rb_excep_cause: %memory.io_mem2rb_excep_cause: i64, io_mem2rb_excep_tval: %memory.io_mem2rb_excep_tval: i64, io_mem2rb_excep_en: %memory.io_mem2rb_excep_en: i1, io_mem2rb_excep_pc: %memory.io_mem2rb_excep_pc: i64, io_mem2rb_excep_etype: %memory.io_mem2rb_excep_etype: i2, io_mem2rb_csr_id: %memory.io_mem2rb_csr_id: i12, io_mem2rb_csr_d: %memory.io_mem2rb_csr_d: i64, io_mem2rb_csr_en: %memory.io_mem2rb_csr_en: i1, io_mem2rb_dst: %memory.io_mem2rb_dst: i5, io_mem2rb_dst_d: %memory.io_mem2rb_dst_d: i64, io_mem2rb_dst_en: %memory.io_mem2rb_dst_en: i1, io_mem2rb_special: %memory.io_mem2rb_special: i2, io_mem2rb_recov: %memory.io_mem2rb_recov: i1, io_mem2rb_valid: %memory.io_mem2rb_valid: i1) -> (io_mem2rb_ready: i1, io_wReg_id: i5, io_wReg_data: i64, io_wReg_en: i1, io_wCsr_id: i12, io_wCsr_data: i64, io_wCsr_en: i1, io_excep_cause: i64, io_excep_tval: i64, io_excep_en: i1, io_excep_pc: i64, io_excep_etype: i2, io_wb2if_seq_pc: i64, io_wb2if_valid: i1, io_recov: i1, io_flush_tlb: i1, io_flush_cache: i1)
    %regs.io_rs1_data, %regs.io_rs2_data = hw.instance "regs" @Regs(clock: %clock: i1, reset: %reset: i1, io_rs1_id: %readregs.io_rs1Read_id: i5, io_rs2_id: %readregs.io_rs2Read_id: i5, io_dst_id: %writeback.io_wReg_id: i5, io_dst_data: %writeback.io_wReg_data: i64, io_dst_en: %writeback.io_wReg_en: i1) -> (io_rs1_data: i64, io_rs2_data: i64)
    %csrs.io_rs_data, %csrs.io_rs_is_err, %csrs.io_mmuState_priv, %csrs.io_mmuState_mstatus, %csrs.io_mmuState_satp, %csrs.io_idState_priv, %csrs.io_reg2if_seq_pc, %csrs.io_reg2if_valid, %csrs.io_intr_out_en, %csrs.io_intr_out_cause, %csrs.io_updateNextPc_seq_pc, %csrs.io_updateNextPc_valid = hw.instance "csrs" @Csrs(clock: %clock: i1, reset: %reset: i1, io_rs_id: %readregs.io_csrRead_id: i12, io_rd_id: %writeback.io_wCsr_id: i12, io_rd_data: %writeback.io_wCsr_data: i64, io_rd_en: %writeback.io_wCsr_en: i1, io_excep_cause: %writeback.io_excep_cause: i64, io_excep_tval: %writeback.io_excep_tval: i64, io_excep_en: %writeback.io_excep_en: i1, io_excep_pc: %writeback.io_excep_pc: i64, io_excep_etype: %writeback.io_excep_etype: i2, io_clint_raise: %clint.io_intr_raise: i1, io_clint_clear: %clint.io_intr_clear: i1, io_plic_m_raise: %plic.io_intr_out_m_raise: i1, io_plic_m_clear: %plic.io_intr_out_m_clear: i1, io_plic_s_raise: %plic.io_intr_out_s_raise: i1, io_plic_s_clear: %plic.io_intr_out_s_clear: i1, io_intr_msip_raise: %clint.io_intr_msip_raise: i1, io_intr_msip_clear: %clint.io_intr_msip_clear: i1) -> (io_rs_data: i64, io_rs_is_err: i1, io_mmuState_priv: i2, io_mmuState_mstatus: i64, io_mmuState_satp: i64, io_idState_priv: i2, io_reg2if_seq_pc: i64, io_reg2if_valid: i1, io_intr_out_en: i1, io_intr_out_cause: i64, io_updateNextPc_seq_pc: i64, io_updateNextPc_valid: i1)
    %icache.io_instAxi_ra_valid, %icache.io_instAxi_ra_bits_addr, %icache.io_icRead_inst, %icache.io_icRead_rvalid = hw.instance "icache" @InstCache(clock: %clock: i1, reset: %reset: i1, io_instAxi_ra_ready: %crossBar.io_icAxi_ra_ready: i1, io_instAxi_rd_valid: %crossBar.io_icAxi_rd_valid: i1, io_instAxi_rd_bits_data: %crossBar.io_icAxi_rd_bits_data: i64, io_instAxi_rd_bits_last: %crossBar.io_icAxi_rd_bits_last: i1, io_icRead_addr: %fetchCrossbar.io_icRead_addr: i32, io_icRead_arvalid: %fetchCrossbar.io_icRead_arvalid: i1, io_flush: %writeback.io_flush_cache: i1) -> (io_instAxi_ra_valid: i1, io_instAxi_ra_bits_addr: i32, io_icRead_inst: i64, io_icRead_rvalid: i1)
    %dcache.io_dataAxi_wa_valid, %dcache.io_dataAxi_wa_bits_addr, %dcache.io_dataAxi_wd_valid, %dcache.io_dataAxi_wd_bits_data, %dcache.io_dataAxi_wd_bits_last, %dcache.io_dataAxi_ra_valid, %dcache.io_dataAxi_ra_bits_addr, %dcache.io_dcRW_rdata, %dcache.io_dcRW_rvalid, %dcache.io_dcRW_ready, %dcache.io_flush_out = hw.instance "dcache" @DataCache(clock: %clock: i1, reset: %reset: i1, io_dataAxi_wa_ready: %crossBar.io_memAxi_wa_ready: i1, io_dataAxi_wd_ready: %crossBar.io_memAxi_wd_ready: i1, io_dataAxi_ra_ready: %crossBar.io_memAxi_ra_ready: i1, io_dataAxi_rd_valid: %crossBar.io_memAxi_rd_valid: i1, io_dataAxi_rd_bits_data: %crossBar.io_memAxi_rd_bits_data: i64, io_dataAxi_rd_bits_last: %crossBar.io_memAxi_rd_bits_last: i1, io_dcRW_addr: %dcSelector.io_select_addr: i32, io_dcRW_wdata: %dcSelector.io_select_wdata: i64, io_dcRW_dc_mode: %dcSelector.io_select_dc_mode: i5, io_dcRW_amo: %dcSelector.io_select_amo: i5, io_flush: %writeback.io_flush_cache: i1) -> (io_dataAxi_wa_valid: i1, io_dataAxi_wa_bits_addr: i32, io_dataAxi_wd_valid: i1, io_dataAxi_wd_bits_data: i64, io_dataAxi_wd_bits_last: i1, io_dataAxi_ra_valid: i1, io_dataAxi_ra_bits_addr: i32, io_dcRW_rdata: i64, io_dcRW_rvalid: i1, io_dcRW_ready: i1, io_flush_out: i1)
    %mem2Axi.io_dataIO_rdata, %mem2Axi.io_dataIO_rvalid, %mem2Axi.io_dataIO_ready, %mem2Axi.io_outAxi_wa_valid, %mem2Axi.io_outAxi_wa_bits_addr, %mem2Axi.io_outAxi_wd_valid, %mem2Axi.io_outAxi_wd_bits_data, %mem2Axi.io_outAxi_wd_bits_strb, %mem2Axi.io_outAxi_ra_valid, %mem2Axi.io_outAxi_ra_bits_addr, %mem2Axi.io_outAxi_rd_ready = hw.instance "mem2Axi" @ToAXI(clock: %clock: i1, reset: %reset: i1, io_dataIO_addr: %memCrossbar.io_mmio_addr: i32, io_dataIO_wdata: %memCrossbar.io_mmio_wdata: i64, io_dataIO_dc_mode: %memCrossbar.io_mmio_dc_mode: i5, io_outAxi_wa_ready: %crossBar.io_mmioAxi_wa_ready: i1, io_outAxi_wd_ready: %crossBar.io_mmioAxi_wd_ready: i1, io_outAxi_ra_ready: %crossBar.io_mmioAxi_ra_ready: i1, io_outAxi_rd_valid: %crossBar.io_mmioAxi_rd_valid: i1, io_outAxi_rd_bits_data: %crossBar.io_mmioAxi_rd_bits_data: i64) -> (io_dataIO_rdata: i64, io_dataIO_rvalid: i1, io_dataIO_ready: i1, io_outAxi_wa_valid: i1, io_outAxi_wa_bits_addr: i32, io_outAxi_wd_valid: i1, io_outAxi_wd_bits_data: i64, io_outAxi_wd_bits_strb: i8, io_outAxi_ra_valid: i1, io_outAxi_ra_bits_addr: i32, io_outAxi_rd_ready: i1)
    %flash2Axi.io_dataIO_rdata, %flash2Axi.io_dataIO_rvalid, %flash2Axi.io_dataIO_ready, %flash2Axi.io_outAxi_wa_valid, %flash2Axi.io_outAxi_wa_bits_addr, %flash2Axi.io_outAxi_wd_valid, %flash2Axi.io_outAxi_wd_bits_data, %flash2Axi.io_outAxi_wd_bits_strb, %flash2Axi.io_outAxi_ra_valid, %flash2Axi.io_outAxi_ra_bits_addr, %flash2Axi.io_outAxi_rd_ready = hw.instance "flash2Axi" @ToAXI_1(clock: %clock: i1, reset: %reset: i1, io_dataIO_addr: %split64to32.io_data_out_addr: i32, io_dataIO_dc_mode: %split64to32.io_data_out_dc_mode: i5, io_outAxi_wa_ready: %crossBar.io_flashAxi_wa_ready: i1, io_outAxi_wd_ready: %crossBar.io_flashAxi_wd_ready: i1, io_outAxi_ra_ready: %crossBar.io_flashAxi_ra_ready: i1, io_outAxi_rd_valid: %crossBar.io_flashAxi_rd_valid: i1, io_outAxi_rd_bits_data: %crossBar.io_flashAxi_rd_bits_data: i64) -> (io_dataIO_rdata: i64, io_dataIO_rvalid: i1, io_dataIO_ready: i1, io_outAxi_wa_valid: i1, io_outAxi_wa_bits_addr: i32, io_outAxi_wd_valid: i1, io_outAxi_wd_bits_data: i64, io_outAxi_wd_bits_strb: i8, io_outAxi_ra_valid: i1, io_outAxi_ra_bits_addr: i32, io_outAxi_rd_ready: i1)
    %crossBar.io_icAxi_ra_ready, %crossBar.io_icAxi_rd_valid, %crossBar.io_icAxi_rd_bits_data, %crossBar.io_icAxi_rd_bits_last, %crossBar.io_flashAxi_wa_ready, %crossBar.io_flashAxi_wd_ready, %crossBar.io_flashAxi_ra_ready, %crossBar.io_flashAxi_rd_valid, %crossBar.io_flashAxi_rd_bits_data, %crossBar.io_memAxi_wa_ready, %crossBar.io_memAxi_wd_ready, %crossBar.io_memAxi_ra_ready, %crossBar.io_memAxi_rd_valid, %crossBar.io_memAxi_rd_bits_data, %crossBar.io_memAxi_rd_bits_last, %crossBar.io_mmioAxi_wa_ready, %crossBar.io_mmioAxi_wd_ready, %crossBar.io_mmioAxi_ra_ready, %crossBar.io_mmioAxi_rd_valid, %crossBar.io_mmioAxi_rd_bits_data, %crossBar.io_outAxi_wa_valid, %crossBar.io_outAxi_wa_bits_addr, %crossBar.io_outAxi_wa_bits_len, %crossBar.io_outAxi_wd_valid, %crossBar.io_outAxi_wd_bits_data, %crossBar.io_outAxi_wd_bits_strb, %crossBar.io_outAxi_wd_bits_last, %crossBar.io_outAxi_ra_valid, %crossBar.io_outAxi_ra_bits_addr, %crossBar.io_outAxi_ra_bits_len, %crossBar.io_outAxi_rd_ready = hw.instance "crossBar" @CrossBar(clock: %clock: i1, reset: %reset: i1, io_icAxi_ra_valid: %icache.io_instAxi_ra_valid: i1, io_icAxi_ra_bits_addr: %icache.io_instAxi_ra_bits_addr: i32, io_flashAxi_wa_valid: %flash2Axi.io_outAxi_wa_valid: i1, io_flashAxi_wa_bits_addr: %flash2Axi.io_outAxi_wa_bits_addr: i32, io_flashAxi_wd_valid: %flash2Axi.io_outAxi_wd_valid: i1, io_flashAxi_wd_bits_data: %flash2Axi.io_outAxi_wd_bits_data: i64, io_flashAxi_wd_bits_strb: %flash2Axi.io_outAxi_wd_bits_strb: i8, io_flashAxi_ra_valid: %flash2Axi.io_outAxi_ra_valid: i1, io_flashAxi_ra_bits_addr: %flash2Axi.io_outAxi_ra_bits_addr: i32, io_flashAxi_rd_ready: %flash2Axi.io_outAxi_rd_ready: i1, io_memAxi_wa_valid: %dcache.io_dataAxi_wa_valid: i1, io_memAxi_wa_bits_addr: %dcache.io_dataAxi_wa_bits_addr: i32, io_memAxi_wd_valid: %dcache.io_dataAxi_wd_valid: i1, io_memAxi_wd_bits_data: %dcache.io_dataAxi_wd_bits_data: i64, io_memAxi_wd_bits_last: %dcache.io_dataAxi_wd_bits_last: i1, io_memAxi_ra_valid: %dcache.io_dataAxi_ra_valid: i1, io_memAxi_ra_bits_addr: %dcache.io_dataAxi_ra_bits_addr: i32, io_mmioAxi_wa_valid: %mem2Axi.io_outAxi_wa_valid: i1, io_mmioAxi_wa_bits_addr: %mem2Axi.io_outAxi_wa_bits_addr: i32, io_mmioAxi_wd_valid: %mem2Axi.io_outAxi_wd_valid: i1, io_mmioAxi_wd_bits_data: %mem2Axi.io_outAxi_wd_bits_data: i64, io_mmioAxi_wd_bits_strb: %mem2Axi.io_outAxi_wd_bits_strb: i8, io_mmioAxi_ra_valid: %mem2Axi.io_outAxi_ra_valid: i1, io_mmioAxi_ra_bits_addr: %mem2Axi.io_outAxi_ra_bits_addr: i32, io_mmioAxi_rd_ready: %mem2Axi.io_outAxi_rd_ready: i1, io_outAxi_wa_ready: %io_master_awready: i1, io_outAxi_wd_ready: %io_master_wready: i1, io_outAxi_ra_ready: %io_master_arready: i1, io_outAxi_rd_valid: %io_master_rvalid: i1, io_outAxi_rd_bits_data: %io_master_rdata: i64, io_outAxi_rd_bits_last: %io_master_rlast: i1, io_selectMem: %dcache.io_flush_out: i1) -> (io_icAxi_ra_ready: i1, io_icAxi_rd_valid: i1, io_icAxi_rd_bits_data: i64, io_icAxi_rd_bits_last: i1, io_flashAxi_wa_ready: i1, io_flashAxi_wd_ready: i1, io_flashAxi_ra_ready: i1, io_flashAxi_rd_valid: i1, io_flashAxi_rd_bits_data: i64, io_memAxi_wa_ready: i1, io_memAxi_wd_ready: i1, io_memAxi_ra_ready: i1, io_memAxi_rd_valid: i1, io_memAxi_rd_bits_data: i64, io_memAxi_rd_bits_last: i1, io_mmioAxi_wa_ready: i1, io_mmioAxi_wd_ready: i1, io_mmioAxi_ra_ready: i1, io_mmioAxi_rd_valid: i1, io_mmioAxi_rd_bits_data: i64, io_outAxi_wa_valid: i1, io_outAxi_wa_bits_addr: i32, io_outAxi_wa_bits_len: i8, io_outAxi_wd_valid: i1, io_outAxi_wd_bits_data: i64, io_outAxi_wd_bits_strb: i8, io_outAxi_wd_bits_last: i1, io_outAxi_ra_valid: i1, io_outAxi_ra_bits_addr: i32, io_outAxi_ra_bits_len: i8, io_outAxi_rd_ready: i1)
    %fetchCrossbar.io_instIO_inst, %fetchCrossbar.io_instIO_rvalid, %fetchCrossbar.io_icRead_addr, %fetchCrossbar.io_icRead_arvalid, %fetchCrossbar.io_flashRead_addr, %fetchCrossbar.io_flashRead_dc_mode = hw.instance "fetchCrossbar" @FetchCrossBar(clock: %clock: i1, reset: %reset: i1, io_instIO_addr: %fetch.io_instRead_addr: i32, io_instIO_arvalid: %fetch.io_instRead_arvalid: i1, io_icRead_inst: %icache.io_icRead_inst: i64, io_icRead_rvalid: %icache.io_icRead_rvalid: i1, io_flashRead_rdata: %split64to32.io_data_in_rdata: i64, io_flashRead_rvalid: %split64to32.io_data_in_rvalid: i1) -> (io_instIO_inst: i64, io_instIO_rvalid: i1, io_icRead_addr: i32, io_icRead_arvalid: i1, io_flashRead_addr: i32, io_flashRead_dc_mode: i5)
    %split64to32.io_data_in_rdata, %split64to32.io_data_in_rvalid, %split64to32.io_data_out_addr, %split64to32.io_data_out_dc_mode = hw.instance "split64to32" @Splite64to32(clock: %clock: i1, reset: %reset: i1, io_data_in_addr: %fetchCrossbar.io_flashRead_addr: i32, io_data_in_dc_mode: %fetchCrossbar.io_flashRead_dc_mode: i5, io_data_out_rdata: %flash2Axi.io_dataIO_rdata: i64, io_data_out_rvalid: %flash2Axi.io_dataIO_rvalid: i1, io_data_out_ready: %flash2Axi.io_dataIO_ready: i1) -> (io_data_in_rdata: i64, io_data_in_rvalid: i1, io_data_out_addr: i32, io_data_out_dc_mode: i5)
    %memCrossbar.io_dataRW_rdata, %memCrossbar.io_dataRW_rvalid, %memCrossbar.io_dataRW_ready, %memCrossbar.io_mmio_addr, %memCrossbar.io_mmio_wdata, %memCrossbar.io_mmio_dc_mode, %memCrossbar.io_dcRW_addr, %memCrossbar.io_dcRW_wdata, %memCrossbar.io_dcRW_dc_mode, %memCrossbar.io_dcRW_amo, %memCrossbar.io_clintIO_addr, %memCrossbar.io_clintIO_wdata, %memCrossbar.io_clintIO_wvalid, %memCrossbar.io_plicIO_addr, %memCrossbar.io_plicIO_wdata, %memCrossbar.io_plicIO_wvalid, %memCrossbar.io_plicIO_arvalid = hw.instance "memCrossbar" @MemCrossBar(clock: %clock: i1, reset: %reset: i1, io_dataRW_addr: %memory.io_dataRW_addr: i32, io_dataRW_wdata: %memory.io_dataRW_wdata: i64, io_dataRW_dc_mode: %memory.io_dataRW_dc_mode: i5, io_dataRW_amo: %memory.io_dataRW_amo: i5, io_mmio_rdata: %mem2Axi.io_dataIO_rdata: i64, io_mmio_rvalid: %mem2Axi.io_dataIO_rvalid: i1, io_mmio_ready: %mem2Axi.io_dataIO_ready: i1, io_dcRW_rdata: %dcSelector.io_mem2dc_rdata: i64, io_dcRW_rvalid: %dcSelector.io_mem2dc_rvalid: i1, io_dcRW_ready: %dcSelector.io_mem2dc_ready: i1, io_clintIO_rdata: %clint.io_rw_rdata: i64, io_plicIO_rdata: %plic.io_rw_rdata: i64) -> (io_dataRW_rdata: i64, io_dataRW_rvalid: i1, io_dataRW_ready: i1, io_mmio_addr: i32, io_mmio_wdata: i64, io_mmio_dc_mode: i5, io_dcRW_addr: i32, io_dcRW_wdata: i64, io_dcRW_dc_mode: i5, io_dcRW_amo: i5, io_clintIO_addr: i32, io_clintIO_wdata: i64, io_clintIO_wvalid: i1, io_plicIO_addr: i32, io_plicIO_wdata: i64, io_plicIO_wvalid: i1, io_plicIO_arvalid: i1)
    %tlb_if.io_va2pa_paddr, %tlb_if.io_va2pa_pvalid, %tlb_if.io_va2pa_tlb_excep_cause, %tlb_if.io_va2pa_tlb_excep_tval, %tlb_if.io_va2pa_tlb_excep_en, %tlb_if.io_dcacheRW_addr, %tlb_if.io_dcacheRW_wdata, %tlb_if.io_dcacheRW_dc_mode = hw.instance "tlb_if" @TLB(clock: %clock: i1, reset: %reset: i1, io_va2pa_vaddr: %fetch.io_va2pa_vaddr: i64, io_va2pa_vvalid: %fetch.io_va2pa_vvalid: i1, io_mmuState_priv: %csrs.io_mmuState_priv: i2, io_mmuState_mstatus: %csrs.io_mmuState_mstatus: i64, io_mmuState_satp: %csrs.io_mmuState_satp: i64, io_flush: %writeback.io_flush_tlb: i1, io_dcacheRW_rdata: %dcSelector.io_tlb_if2dc_rdata: i64, io_dcacheRW_rvalid: %dcSelector.io_tlb_if2dc_rvalid: i1, io_dcacheRW_ready: %dcSelector.io_tlb_if2dc_ready: i1) -> (io_va2pa_paddr: i32, io_va2pa_pvalid: i1, io_va2pa_tlb_excep_cause: i64, io_va2pa_tlb_excep_tval: i64, io_va2pa_tlb_excep_en: i1, io_dcacheRW_addr: i32, io_dcacheRW_wdata: i64, io_dcacheRW_dc_mode: i5)
    %tlb_mem.io_va2pa_paddr, %tlb_mem.io_va2pa_pvalid, %tlb_mem.io_va2pa_tlb_excep_cause, %tlb_mem.io_va2pa_tlb_excep_tval, %tlb_mem.io_va2pa_tlb_excep_en, %tlb_mem.io_dcacheRW_addr, %tlb_mem.io_dcacheRW_wdata, %tlb_mem.io_dcacheRW_dc_mode = hw.instance "tlb_mem" @TLB_1(clock: %clock: i1, reset: %reset: i1, io_va2pa_vaddr: %memory.io_va2pa_vaddr: i64, io_va2pa_vvalid: %memory.io_va2pa_vvalid: i1, io_va2pa_m_type: %memory.io_va2pa_m_type: i2, io_mmuState_priv: %csrs.io_mmuState_priv: i2, io_mmuState_mstatus: %csrs.io_mmuState_mstatus: i64, io_mmuState_satp: %csrs.io_mmuState_satp: i64, io_flush: %writeback.io_flush_tlb: i1, io_dcacheRW_rdata: %dcSelector.io_tlb_mem2dc_rdata: i64, io_dcacheRW_rvalid: %dcSelector.io_tlb_mem2dc_rvalid: i1, io_dcacheRW_ready: %dcSelector.io_tlb_mem2dc_ready: i1) -> (io_va2pa_paddr: i32, io_va2pa_pvalid: i1, io_va2pa_tlb_excep_cause: i64, io_va2pa_tlb_excep_tval: i64, io_va2pa_tlb_excep_en: i1, io_dcacheRW_addr: i32, io_dcacheRW_wdata: i64, io_dcacheRW_dc_mode: i5)
    %dcSelector.io_tlb_if2dc_rdata, %dcSelector.io_tlb_if2dc_rvalid, %dcSelector.io_tlb_if2dc_ready, %dcSelector.io_tlb_mem2dc_rdata, %dcSelector.io_tlb_mem2dc_rvalid, %dcSelector.io_tlb_mem2dc_ready, %dcSelector.io_mem2dc_rdata, %dcSelector.io_mem2dc_rvalid, %dcSelector.io_mem2dc_ready, %dcSelector.io_dma2dc_rdata, %dcSelector.io_dma2dc_rvalid, %dcSelector.io_dma2dc_ready, %dcSelector.io_select_addr, %dcSelector.io_select_wdata, %dcSelector.io_select_dc_mode, %dcSelector.io_select_amo = hw.instance "dcSelector" @DcacheSelector(clock: %clock: i1, reset: %reset: i1, io_tlb_if2dc_addr: %tlb_if.io_dcacheRW_addr: i32, io_tlb_if2dc_wdata: %tlb_if.io_dcacheRW_wdata: i64, io_tlb_if2dc_dc_mode: %tlb_if.io_dcacheRW_dc_mode: i5, io_tlb_mem2dc_addr: %tlb_mem.io_dcacheRW_addr: i32, io_tlb_mem2dc_wdata: %tlb_mem.io_dcacheRW_wdata: i64, io_tlb_mem2dc_dc_mode: %tlb_mem.io_dcacheRW_dc_mode: i5, io_mem2dc_addr: %memCrossbar.io_dcRW_addr: i32, io_mem2dc_wdata: %memCrossbar.io_dcRW_wdata: i64, io_mem2dc_dc_mode: %memCrossbar.io_dcRW_dc_mode: i5, io_mem2dc_amo: %memCrossbar.io_dcRW_amo: i5, io_dma2dc_addr: %dmaBridge.io_dcRW_addr: i32, io_dma2dc_wdata: %dmaBridge.io_dcRW_wdata: i64, io_dma2dc_dc_mode: %dmaBridge.io_dcRW_dc_mode: i5, io_select_rdata: %dcache.io_dcRW_rdata: i64, io_select_rvalid: %dcache.io_dcRW_rvalid: i1, io_select_ready: %dcache.io_dcRW_ready: i1) -> (io_tlb_if2dc_rdata: i64, io_tlb_if2dc_rvalid: i1, io_tlb_if2dc_ready: i1, io_tlb_mem2dc_rdata: i64, io_tlb_mem2dc_rvalid: i1, io_tlb_mem2dc_ready: i1, io_mem2dc_rdata: i64, io_mem2dc_rvalid: i1, io_mem2dc_ready: i1, io_dma2dc_rdata: i64, io_dma2dc_rvalid: i1, io_dma2dc_ready: i1, io_select_addr: i32, io_select_wdata: i64, io_select_dc_mode: i5, io_select_amo: i5)
    %clint.io_rw_rdata, %clint.io_intr_raise, %clint.io_intr_clear, %clint.io_intr_msip_raise, %clint.io_intr_msip_clear = hw.instance "clint" @CLINT(clock: %clock: i1, reset: %reset: i1, io_rw_addr: %memCrossbar.io_clintIO_addr: i32, io_rw_wdata: %memCrossbar.io_clintIO_wdata: i64, io_rw_wvalid: %memCrossbar.io_clintIO_wvalid: i1) -> (io_rw_rdata: i64, io_intr_raise: i1, io_intr_clear: i1, io_intr_msip_raise: i1, io_intr_msip_clear: i1)
    %plic.io_intr_out_m_raise, %plic.io_intr_out_m_clear, %plic.io_intr_out_s_raise, %plic.io_intr_out_s_clear, %plic.io_rw_rdata = hw.instance "plic" @Plic(clock: %clock: i1, reset: %reset: i1, io_intr_in1: %io_interrupt: i1, io_rw_addr: %memCrossbar.io_plicIO_addr: i32, io_rw_wdata: %memCrossbar.io_plicIO_wdata: i64, io_rw_wvalid: %memCrossbar.io_plicIO_wvalid: i1, io_rw_arvalid: %memCrossbar.io_plicIO_arvalid: i1) -> (io_intr_out_m_raise: i1, io_intr_out_m_clear: i1, io_intr_out_s_raise: i1, io_intr_out_s_clear: i1, io_rw_rdata: i64)
    %dmaBridge.io_dmaAxi_awready, %dmaBridge.io_dmaAxi_wready, %dmaBridge.io_dmaAxi_bvalid, %dmaBridge.io_dmaAxi_arready, %dmaBridge.io_dmaAxi_rvalid, %dmaBridge.io_dmaAxi_rdata, %dmaBridge.io_dmaAxi_rlast, %dmaBridge.io_dcRW_addr, %dmaBridge.io_dcRW_wdata, %dmaBridge.io_dcRW_dc_mode = hw.instance "dmaBridge" @DmaBridge(clock: %clock: i1, reset: %reset: i1, io_dmaAxi_awvalid: %io_slave_awvalid: i1, io_dmaAxi_awaddr: %io_slave_awaddr: i32, io_dmaAxi_awlen: %io_slave_awlen: i8, io_dmaAxi_wvalid: %io_slave_wvalid: i1, io_dmaAxi_wdata: %io_slave_wdata: i64, io_dmaAxi_wstrb: %io_slave_wstrb: i8, io_dmaAxi_bready: %io_slave_bready: i1, io_dmaAxi_arvalid: %io_slave_arvalid: i1, io_dmaAxi_araddr: %io_slave_araddr: i32, io_dmaAxi_arlen: %io_slave_arlen: i8, io_dmaAxi_rready: %io_slave_rready: i1, io_dcRW_rdata: %dcSelector.io_dma2dc_rdata: i64, io_dcRW_rvalid: %dcSelector.io_dma2dc_rvalid: i1, io_dcRW_ready: %dcSelector.io_dma2dc_ready: i1) -> (io_dmaAxi_awready: i1, io_dmaAxi_wready: i1, io_dmaAxi_bvalid: i1, io_dmaAxi_arready: i1, io_dmaAxi_rvalid: i1, io_dmaAxi_rdata: i64, io_dmaAxi_rlast: i1, io_dcRW_addr: i32, io_dcRW_wdata: i64, io_dcRW_dc_mode: i5)
    hw.output %crossBar.io_outAxi_wa_valid, %crossBar.io_outAxi_wa_bits_addr, %crossBar.io_outAxi_wa_bits_len, %crossBar.io_outAxi_wd_valid, %crossBar.io_outAxi_wd_bits_data, %crossBar.io_outAxi_wd_bits_strb, %crossBar.io_outAxi_wd_bits_last, %crossBar.io_outAxi_ra_valid, %crossBar.io_outAxi_ra_bits_addr, %crossBar.io_outAxi_ra_bits_len, %crossBar.io_outAxi_rd_ready, %dmaBridge.io_dmaAxi_awready, %dmaBridge.io_dmaAxi_wready, %dmaBridge.io_dmaAxi_bvalid, %dmaBridge.io_dmaAxi_arready, %dmaBridge.io_dmaAxi_rvalid, %dmaBridge.io_dmaAxi_rdata, %dmaBridge.io_dmaAxi_rlast : i1, i32, i8, i1, i64, i8, i1, i1, i32, i8, i1, i1, i1, i1, i1, i1, i64, i1
  }
  hw.module private @SimMEM(%clock: i1, %reset: i1, %io_memAxi_wa_valid: i1, %io_memAxi_wa_bits_addr: i32, %io_memAxi_wa_bits_len: i8, %io_memAxi_wd_valid: i1, %io_memAxi_wd_bits_data: i64, %io_memAxi_wd_bits_strb: i8, %io_memAxi_wd_bits_last: i1, %io_memAxi_ra_valid: i1, %io_memAxi_ra_bits_addr: i32, %io_memAxi_ra_bits_len: i8, %io_memAxi_rd_ready: i1, %io_initMemEn: i1, %io_initMemAddr: i32, %io_initMemData: i8) -> (io_memAxi_wa_ready: i1, io_memAxi_wd_ready: i1, io_memAxi_ra_ready: i1, io_memAxi_rd_valid: i1, io_memAxi_rd_bits_data: i64, io_memAxi_rd_bits_last: i1) {
    %c7_i28 = hw.constant 7 : i28
    %false = hw.constant false
    %c6_i28 = hw.constant 6 : i28
    %c5_i28 = hw.constant 5 : i28
    %c4_i28 = hw.constant 4 : i28
    %c3_i28 = hw.constant 3 : i28
    %c2_i28 = hw.constant 2 : i28
    %c1_i28 = hw.constant 1 : i28
    %c0_i17 = hw.constant 0 : i17
    %true = hw.constant true
    %c1_i8 = hw.constant 1 : i8
    %c0_i3 = hw.constant 0 : i3
    %c0_i32 = hw.constant 0 : i32
    %c-1_i2 = hw.constant -1 : i2
    %c1_i2 = hw.constant 1 : i2
    %c0_i8 = hw.constant 0 : i8
    %c0_i2 = hw.constant 0 : i2
    %ram_ext.R0_data, %ram_ext.R1_data, %ram_ext.R2_data, %ram_ext.R3_data, %ram_ext.R4_data, %ram_ext.R5_data, %ram_ext.R6_data, %ram_ext.R7_data, %ram_ext.R8_data, %ram_ext.R9_data, %ram_ext.R10_data, %ram_ext.R11_data, %ram_ext.R12_data, %ram_ext.R13_data, %ram_ext.R14_data, %ram_ext.R15_data = hw.instance "ram_ext" @ram_combMem_0(R0_addr: %73: i28, R0_en: %51: i1, R0_clk: %clock: i1, R1_addr: %79: i28, R1_en: %51: i1, R1_clk: %clock: i1, R2_addr: %85: i28, R2_en: %51: i1, R2_clk: %clock: i1, R3_addr: %91: i28, R3_en: %51: i1, R3_clk: %clock: i1, R4_addr: %3: i28, R4_en: %51: i1, R4_clk: %clock: i1, R5_addr: %55: i28, R5_en: %51: i1, R5_clk: %clock: i1, R6_addr: %61: i28, R6_en: %51: i1, R6_clk: %clock: i1, R7_addr: %67: i28, R7_en: %51: i1, R7_clk: %clock: i1, R8_addr: %6: i28, R8_en: %true: i1, R8_clk: %clock: i1, R9_addr: %9: i28, R9_en: %true: i1, R9_clk: %clock: i1, R10_addr: %12: i28, R10_en: %true: i1, R10_clk: %clock: i1, R11_addr: %15: i28, R11_en: %true: i1, R11_clk: %clock: i1, R12_addr: %18: i28, R12_en: %true: i1, R12_clk: %clock: i1, R13_addr: %21: i28, R13_en: %true: i1, R13_clk: %clock: i1, R14_addr: %24: i28, R14_en: %true: i1, R14_clk: %clock: i1, R15_addr: %27: i28, R15_en: %true: i1, R15_clk: %clock: i1, W0_addr: %0: i28, W0_en: %io_initMemEn: i1, W0_clk: %clock: i1, W0_data: %io_initMemData: i8, W1_addr: %3: i28, W1_en: %51: i1, W1_clk: %clock: i1, W1_data: %54: i8, W2_addr: %79: i28, W2_en: %81: i1, W2_clk: %clock: i1, W2_data: %84: i8, W3_addr: %85: i28, W3_en: %87: i1, W3_clk: %clock: i1, W3_data: %90: i8, W4_addr: %91: i28, W4_en: %93: i1, W4_clk: %clock: i1, W4_data: %96: i8, W5_addr: %55: i28, W5_en: %57: i1, W5_clk: %clock: i1, W5_data: %60: i8, W6_addr: %61: i28, W6_en: %63: i1, W6_clk: %clock: i1, W6_data: %66: i8, W7_addr: %67: i28, W7_en: %69: i1, W7_clk: %clock: i1, W7_data: %72: i8, W8_addr: %73: i28, W8_en: %75: i1, W8_clk: %clock: i1, W8_data: %78: i8) -> (R0_data: i8, R1_data: i8, R2_data: i8, R3_data: i8, R4_data: i8, R5_data: i8, R6_data: i8, R7_data: i8, R8_data: i8, R9_data: i8, R10_data: i8, R11_data: i8, R12_data: i8, R13_data: i8, R14_data: i8, R15_data: i8)
    %0 = comb.extract %io_initMemAddr from 0 {sv.namehint = "_T"} : (i32) -> i28
    %burstLen = seq.firreg %44 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 0 : ui64} : i8
    %offset = seq.firreg %110 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 8 : ui64} : i8
    %waReady = seq.firreg %37 clock %clock reset sync %reset, %false {firrtl.random_init_start = 16 : ui64} : i1
    %wdReady = seq.firreg %103 clock %clock reset sync %reset, %false {firrtl.random_init_start = 17 : ui64} : i1
    %waStart = seq.firreg %34 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 18 : ui64} : i32
    %1 = comb.extract %waStart from 0 : (i32) -> i28
    %2 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %3 = comb.add %1, %2 {sv.namehint = "_T_7"} : i28
    %raReady = seq.firreg %46 clock %clock reset sync %reset, %false {firrtl.random_init_start = 50 : ui64} : i1
    %raStart = seq.firreg %42 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 51 : ui64} : i32
    %rdValid = seq.firreg %115 clock %clock reset sync %reset, %false {firrtl.random_init_start = 83 : ui64} : i1
    %4 = comb.extract %raStart from 0 : (i32) -> i28
    %5 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %6 = comb.add %4, %5, %c7_i28 {sv.namehint = "_rdata_T_6"} : i28
    %7 = comb.extract %raStart from 0 : (i32) -> i28
    %8 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %9 = comb.add %7, %8, %c6_i28 {sv.namehint = "_rdata_T_13"} : i28
    %10 = comb.extract %raStart from 0 : (i32) -> i28
    %11 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %12 = comb.add %10, %11, %c5_i28 {sv.namehint = "_rdata_T_20"} : i28
    %13 = comb.extract %raStart from 0 : (i32) -> i28
    %14 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %15 = comb.add %13, %14, %c4_i28 {sv.namehint = "_rdata_T_27"} : i28
    %16 = comb.extract %raStart from 0 : (i32) -> i28
    %17 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %18 = comb.add %16, %17, %c3_i28 {sv.namehint = "_rdata_T_34"} : i28
    %19 = comb.extract %raStart from 0 : (i32) -> i28
    %20 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %21 = comb.add %19, %20, %c2_i28 {sv.namehint = "_rdata_T_41"} : i28
    %22 = comb.extract %raStart from 0 : (i32) -> i28
    %23 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %24 = comb.add %22, %23, %c1_i28 {sv.namehint = "_rdata_T_48"} : i28
    %25 = comb.extract %raStart from 0 : (i32) -> i28
    %26 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %27 = comb.add %25, %26 {sv.namehint = "_rdata_T_55"} : i28
    %28 = comb.concat %ram_ext.R8_data, %ram_ext.R9_data, %ram_ext.R10_data, %ram_ext.R11_data, %ram_ext.R12_data, %ram_ext.R13_data, %ram_ext.R14_data, %ram_ext.R15_data {sv.namehint = "rdata"} : i8, i8, i8, i8, i8, i8, i8, i8
    %state = seq.firreg %119 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 84 : ui64} : i2
    %29 = comb.icmp bin uge %offset, %burstLen {sv.namehint = "isLast"} : i8
    %30 = comb.icmp bin eq %state, %c0_i2 {sv.namehint = "_T_1"} : i2
    %31 = comb.and bin %io_memAxi_wa_valid, %waReady {sv.namehint = "_T_2"} : i1
    %32 = comb.mux bin %31, %c1_i2, %state : i2
    %33 = comb.and bin %30, %31 : i1
    %34 = comb.mux bin %33, %io_memAxi_wa_bits_addr, %waStart : i32
    %35 = comb.mux bin %31, %io_memAxi_wa_bits_len, %burstLen : i8
    %36 = comb.xor bin %31, %true : i1
    %37 = comb.mux bin %30, %36, %waReady : i1
    %38 = comb.or %31, %wdReady : i1
    %39 = comb.and bin %io_memAxi_ra_valid, %raReady {sv.namehint = "_T_3"} : i1
    %40 = comb.mux bin %39, %c-1_i2, %32 : i2
    %41 = comb.and bin %30, %39 : i1
    %42 = comb.mux bin %41, %io_memAxi_ra_bits_addr, %raStart : i32
    %43 = comb.mux bin %39, %io_memAxi_ra_bits_len, %35 : i8
    %44 = comb.mux bin %30, %43, %burstLen : i8
    %45 = comb.xor bin %39, %true : i1
    %46 = comb.mux bin %30, %45, %raReady : i1
    %47 = comb.or %39, %rdValid : i1
    %48 = comb.icmp bin eq %state, %c1_i2 {sv.namehint = "_T_4"} : i2
    %49 = comb.and %48, %io_memAxi_wd_valid : i1
    %50 = comb.xor %30, %true : i1
    %51 = comb.and %50, %49 : i1
    %52 = comb.extract %io_memAxi_wd_bits_strb from 0 {sv.namehint = "_T_9"} : (i8) -> i1
    %53 = comb.extract %io_memAxi_wd_bits_data from 0 {sv.namehint = "_T_10"} : (i64) -> i8
    %54 = comb.mux bin %52, %53, %ram_ext.R4_data {sv.namehint = "_T_14"} : i8
    %55 = comb.add %3, %c1_i28 {sv.namehint = "_T_17"} : i28
    %56 = comb.xor %30, %true : i1
    %57 = comb.and %56, %49 : i1
    %58 = comb.extract %io_memAxi_wd_bits_strb from 1 {sv.namehint = "_T_19"} : (i8) -> i1
    %59 = comb.extract %io_memAxi_wd_bits_data from 8 {sv.namehint = "_T_20"} : (i64) -> i8
    %60 = comb.mux bin %58, %59, %ram_ext.R5_data {sv.namehint = "_T_24"} : i8
    %61 = comb.add %3, %c2_i28 {sv.namehint = "_T_27"} : i28
    %62 = comb.xor %30, %true : i1
    %63 = comb.and %62, %49 : i1
    %64 = comb.extract %io_memAxi_wd_bits_strb from 2 {sv.namehint = "_T_29"} : (i8) -> i1
    %65 = comb.extract %io_memAxi_wd_bits_data from 16 {sv.namehint = "_T_30"} : (i64) -> i8
    %66 = comb.mux bin %64, %65, %ram_ext.R6_data {sv.namehint = "_T_34"} : i8
    %67 = comb.add %3, %c3_i28 {sv.namehint = "_T_37"} : i28
    %68 = comb.xor %30, %true : i1
    %69 = comb.and %68, %49 : i1
    %70 = comb.extract %io_memAxi_wd_bits_strb from 3 {sv.namehint = "_T_39"} : (i8) -> i1
    %71 = comb.extract %io_memAxi_wd_bits_data from 24 {sv.namehint = "_T_40"} : (i64) -> i8
    %72 = comb.mux bin %70, %71, %ram_ext.R7_data {sv.namehint = "_T_44"} : i8
    %73 = comb.add %3, %c4_i28 {sv.namehint = "_T_47"} : i28
    %74 = comb.xor %30, %true : i1
    %75 = comb.and %74, %49 : i1
    %76 = comb.extract %io_memAxi_wd_bits_strb from 4 {sv.namehint = "_T_49"} : (i8) -> i1
    %77 = comb.extract %io_memAxi_wd_bits_data from 32 {sv.namehint = "_T_50"} : (i64) -> i8
    %78 = comb.mux bin %76, %77, %ram_ext.R0_data {sv.namehint = "_T_54"} : i8
    %79 = comb.add %3, %c5_i28 {sv.namehint = "_T_57"} : i28
    %80 = comb.xor %30, %true : i1
    %81 = comb.and %80, %49 : i1
    %82 = comb.extract %io_memAxi_wd_bits_strb from 5 {sv.namehint = "_T_59"} : (i8) -> i1
    %83 = comb.extract %io_memAxi_wd_bits_data from 40 {sv.namehint = "_T_60"} : (i64) -> i8
    %84 = comb.mux bin %82, %83, %ram_ext.R1_data {sv.namehint = "_T_64"} : i8
    %85 = comb.add %3, %c6_i28 {sv.namehint = "_T_67"} : i28
    %86 = comb.xor %30, %true : i1
    %87 = comb.and %86, %49 : i1
    %88 = comb.extract %io_memAxi_wd_bits_strb from 6 {sv.namehint = "_T_69"} : (i8) -> i1
    %89 = comb.extract %io_memAxi_wd_bits_data from 48 {sv.namehint = "_T_70"} : (i64) -> i8
    %90 = comb.mux bin %88, %89, %ram_ext.R2_data {sv.namehint = "_T_74"} : i8
    %91 = comb.add %3, %c7_i28 {sv.namehint = "_T_77"} : i28
    %92 = comb.xor %30, %true : i1
    %93 = comb.and %92, %49 : i1
    %94 = comb.extract %io_memAxi_wd_bits_strb from 7 {sv.namehint = "_T_79"} : (i8) -> i1
    %95 = comb.extract %io_memAxi_wd_bits_data from 56 {sv.namehint = "_T_80"} : (i64) -> i8
    %96 = comb.mux bin %94, %95, %ram_ext.R3_data {sv.namehint = "_T_84"} : i8
    %97 = comb.add %offset, %c1_i8 {sv.namehint = "_offset_T_1"} : i8
    %98 = comb.mux bin %io_memAxi_wd_valid, %97, %offset : i8
    %99 = comb.and bin %io_memAxi_wd_valid, %io_memAxi_wd_bits_last : i1
    %100 = comb.and bin %48, %99 : i1
    %101 = comb.xor %100, %true : i1
    %102 = comb.and %101, %wdReady : i1
    %103 = comb.mux bin %30, %38, %102 : i1
    %104 = comb.icmp bin eq %state, %c-1_i2 {sv.namehint = "_T_85"} : i2
    %105 = comb.and bin %rdValid, %io_memAxi_rd_ready {sv.namehint = "_T_86"} : i1
    %106 = comb.add %offset, %c1_i8 {sv.namehint = "_offset_T_3"} : i8
    %107 = comb.and bin %104, %105 : i1
    %108 = comb.mux bin %107, %106, %offset : i8
    %109 = comb.mux bin %48, %98, %108 : i8
    %110 = comb.mux bin %30, %c0_i8, %109 : i8
    %111 = comb.xor bin %105, %true : i1
    %112 = comb.xor %104, %true : i1
    %113 = comb.or %48, %112 : i1
    %114 = comb.mux bin %113, %rdValid, %111 : i1
    %115 = comb.mux bin %30, %47, %114 : i1
    %116 = comb.and bin %104, %105, %29 : i1
    %117 = comb.mux %48, %99, %116 : i1
    %118 = comb.mux bin %117, %c0_i2, %state : i2
    %119 = comb.mux bin %30, %40, %118 : i2
    hw.output %waReady, %wdReady, %raReady, %rdValid, %28, %29 : i1, i1, i1, i1, i64, i1
  }
  hw.module private @SimMMIO(%clock: i1, %reset: i1, %io_mmioAxi_wa_valid: i1, %io_mmioAxi_wa_bits_addr: i32, %io_mmioAxi_wd_valid: i1, %io_mmioAxi_wd_bits_data: i64, %io_mmioAxi_wd_bits_strb: i8, %io_mmioAxi_wd_bits_last: i1, %io_mmioAxi_ra_valid: i1, %io_mmioAxi_ra_bits_addr: i32, %io_mmioAxi_rd_ready: i1) -> (io_mmioAxi_wa_ready: i1, io_mmioAxi_wd_ready: i1, io_mmioAxi_ra_ready: i1, io_mmioAxi_rd_valid: i1, io_mmioAxi_rd_bits_data: i64, io_mmioAxi_rd_bits_last: i1, io_uart_valid: i1, io_uart_ch: i8) {
    %true = hw.constant true
    %c1_i8 = hw.constant 1 : i8
    %false = hw.constant false
    %c7_i26 = hw.constant 7 : i26
    %c6_i26 = hw.constant 6 : i26
    %c5_i26 = hw.constant 5 : i26
    %c4_i26 = hw.constant 4 : i26
    %c3_i26 = hw.constant 3 : i26
    %c2_i26 = hw.constant 2 : i26
    %c1_i26 = hw.constant 1 : i26
    %c0_i2 = hw.constant 0 : i2
    %c201326591_i32 = hw.constant 201326591 : i32
    %c203431937_i32 = hw.constant 203431937 : i32
    %c-1610132735_i32 = hw.constant -1610132735 : i32
    %c-1610612737_i32 = hw.constant -1610612737 : i32
    %c0_i3 = hw.constant 0 : i3
    %c0_i58 = hw.constant 0 : i58
    %c268435464_i32 = hw.constant 268435464 : i32
    %c0_i4 = hw.constant 0 : i4
    %c805306367_i32 = hw.constant 805306367 : i32
    %c0_i129 = hw.constant 0 : i129
    %c0_i64 = hw.constant 0 : i64
    %c0_i32 = hw.constant 0 : i32
    %c20_i64 = hw.constant 20 : i64
    %c0_i8 = hw.constant 0 : i8
    %c-2147483646_i32 = hw.constant -2147483646 : i32
    %c0_i127 = hw.constant 0 : i127
    %c-1_i3 = hw.constant -1 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c1_i3 = hw.constant 1 : i3
    %c3_i3 = hw.constant 3 : i3
    %c33603576_i32 = hw.constant 33603576 : i32
    %c33570816_i32 = hw.constant 33570816 : i32
    %c-1593835264_i32 = hw.constant -1593835264 : i32
    %c-1593835448_i32 = hw.constant -1593835448 : i32
    %c1000000_i64 = hw.constant 1000000 : i64
    %c-1593835424_i32 = hw.constant -1593835424 : i32
    %c33554432_i32 = hw.constant 33554432 : i32
    %c-1593834504_i32 = hw.constant -1593834504 : i32
    %c-1593835260_i32 = hw.constant -1593835260 : i32
    %c2_i3 = hw.constant 2 : i3
    %c32_i8 = hw.constant 32 : i8
    %c26214700_i64 = hw.constant 26214700 : i64
    %c-1593835444_i32 = hw.constant -1593835444 : i32
    %c1073741824_i32 = hw.constant 1073741824 : i32
    %c201338880_i32 = hw.constant 201338880 : i32
    %c1140850688_i32 = hw.constant 1140850688 : i32
    %uart_0 = seq.firreg %128 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 0 : ui64} : i8
    %uart_1 = seq.firreg %131 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 8 : ui64} : i8
    %uart_2 = seq.firreg %134 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 16 : ui64} : i8
    %uart_3 = seq.firreg %137 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 24 : ui64} : i8
    %uart_4 = seq.firreg %140 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 32 : ui64} : i8
    %uart_5 = seq.firreg %143 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 40 : ui64} : i8
    %uart_6 = seq.firreg %146 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 48 : ui64} : i8
    %uart_7 = seq.firreg %149 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 56 : ui64} : i8
    %mtime = seq.firreg %0 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 64 : ui64} : i64
    %mtimecmp = seq.firreg %163 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 128 : ui64} : i64
    %disk_ext.R0_data, %disk_ext.R1_data, %disk_ext.R2_data, %disk_ext.R3_data, %disk_ext.R4_data, %disk_ext.R5_data, %disk_ext.R6_data, %disk_ext.R7_data = hw.instance "disk_ext" @disk_combMem(R0_addr: %29: i26, R0_en: %true: i1, R0_clk: %clock: i1, R1_addr: %31: i26, R1_en: %true: i1, R1_clk: %clock: i1, R2_addr: %33: i26, R2_en: %true: i1, R2_clk: %clock: i1, R3_addr: %35: i26, R3_en: %true: i1, R3_clk: %clock: i1, R4_addr: %37: i26, R4_en: %true: i1, R4_clk: %clock: i1, R5_addr: %39: i26, R5_en: %true: i1, R5_clk: %clock: i1, R6_addr: %41: i26, R6_en: %true: i1, R6_clk: %clock: i1, R7_addr: %42: i26, R7_en: %true: i1, R7_clk: %clock: i1, W0_addr: %212: i26, W0_en: %213: i1, W0_clk: %clock: i1, W0_data: %7: i8, W1_addr: %215: i26, W1_en: %216: i1, W1_clk: %clock: i1, W1_data: %4: i8, W2_addr: %191: i26, W2_en: %195: i1, W2_clk: %clock: i1, W2_data: %25: i8, W3_addr: %197: i26, W3_en: %198: i1, W3_clk: %clock: i1, W3_data: %22: i8, W4_addr: %200: i26, W4_en: %201: i1, W4_clk: %clock: i1, W4_data: %19: i8, W5_addr: %203: i26, W5_en: %204: i1, W5_clk: %clock: i1, W5_data: %16: i8, W6_addr: %206: i26, W6_en: %207: i1, W6_clk: %clock: i1, W6_data: %13: i8, W7_addr: %209: i26, W7_en: %210: i1, W7_clk: %clock: i1, W7_data: %10: i8) -> (R0_data: i8, R1_data: i8, R2_data: i8, R3_data: i8, R4_data: i8, R5_data: i8, R6_data: i8, R7_data: i8)
    %waready = seq.firreg %50 clock %clock reset sync %reset, %false {firrtl.random_init_start = 256 : ui64} : i1
    %wdready = seq.firreg %225 clock %clock reset sync %reset, %false {firrtl.random_init_start = 257 : ui64} : i1
    %waddr = seq.firreg %48 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 258 : ui64} : i32
    %raready = seq.firreg %55 clock %clock reset sync %reset, %false {firrtl.random_init_start = 357 : ui64} : i1
    %rdvalid = seq.firreg %240 clock %clock reset sync %reset, %false {firrtl.random_init_start = 358 : ui64} : i1
    %rdata = seq.firreg %113 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 391 : ui64} : i64
    %offset = seq.firreg %235 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 455 : ui64} : i8
    %0 = comb.add %mtime, %c20_i64 {sv.namehint = "_mtime_T_1"} : i64
    %state = seq.firreg %245 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 529 : ui64} : i3
    %1 = comb.icmp bin ne %offset, %c0_i8 : i8
    %2 = comb.xor bin %1, %true {sv.namehint = "islast"} : i1
    %3 = comb.extract %io_mmioAxi_wd_bits_strb from 7 {sv.namehint = "_inputwd_T_1"} : (i8) -> i1
    %4 = comb.extract %io_mmioAxi_wd_bits_data from 56 {sv.namehint = "_T_142"} : (i64) -> i8
    %5 = comb.mux bin %3, %4, %c0_i8 {sv.namehint = "inputwd_hi_hi_hi"} : i8
    %6 = comb.extract %io_mmioAxi_wd_bits_strb from 6 {sv.namehint = "_inputwd_T_4"} : (i8) -> i1
    %7 = comb.extract %io_mmioAxi_wd_bits_data from 48 {sv.namehint = "_T_138"} : (i64) -> i8
    %8 = comb.mux bin %6, %7, %c0_i8 {sv.namehint = "inputwd_hi_hi_lo"} : i8
    %9 = comb.extract %io_mmioAxi_wd_bits_strb from 5 {sv.namehint = "_inputwd_T_7"} : (i8) -> i1
    %10 = comb.extract %io_mmioAxi_wd_bits_data from 40 {sv.namehint = "_T_134"} : (i64) -> i8
    %11 = comb.mux bin %9, %10, %c0_i8 {sv.namehint = "inputwd_hi_lo_hi"} : i8
    %12 = comb.extract %io_mmioAxi_wd_bits_strb from 4 {sv.namehint = "_inputwd_T_10"} : (i8) -> i1
    %13 = comb.extract %io_mmioAxi_wd_bits_data from 32 {sv.namehint = "_T_130"} : (i64) -> i8
    %14 = comb.mux bin %12, %13, %c0_i8 {sv.namehint = "inputwd_hi_lo_lo"} : i8
    %15 = comb.extract %io_mmioAxi_wd_bits_strb from 3 {sv.namehint = "_inputwd_T_13"} : (i8) -> i1
    %16 = comb.extract %io_mmioAxi_wd_bits_data from 24 {sv.namehint = "_T_126"} : (i64) -> i8
    %17 = comb.mux bin %15, %16, %c0_i8 {sv.namehint = "inputwd_lo_hi_hi"} : i8
    %18 = comb.extract %io_mmioAxi_wd_bits_strb from 2 {sv.namehint = "_inputwd_T_16"} : (i8) -> i1
    %19 = comb.extract %io_mmioAxi_wd_bits_data from 16 {sv.namehint = "_T_122"} : (i64) -> i8
    %20 = comb.mux bin %18, %19, %c0_i8 {sv.namehint = "inputwd_lo_hi_lo"} : i8
    %21 = comb.extract %io_mmioAxi_wd_bits_strb from 1 {sv.namehint = "_inputwd_T_19"} : (i8) -> i1
    %22 = comb.extract %io_mmioAxi_wd_bits_data from 8 {sv.namehint = "_T_118"} : (i64) -> i8
    %23 = comb.mux bin %21, %22, %c0_i8 {sv.namehint = "inputwd_lo_lo_hi"} : i8
    %24 = comb.extract %io_mmioAxi_wd_bits_strb from 0 {sv.namehint = "_inputwd_T_22"} : (i8) -> i1
    %25 = comb.extract %io_mmioAxi_wd_bits_data from 0 {sv.namehint = "_T_114"} : (i64) -> i8
    %26 = comb.mux bin %24, %25, %c0_i8 {sv.namehint = "inputwd_lo_lo_lo"} : i8
    %27 = comb.concat %5, %8, %11, %14, %17, %20, %23, %26 {sv.namehint = "inputwd"} : i8, i8, i8, i8, i8, i8, i8, i8
    %28 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %29 = comb.add %28, %c7_i26 {sv.namehint = "_disk_rdata_T_3"} : i26
    %30 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %31 = comb.add %30, %c6_i26 {sv.namehint = "_disk_rdata_T_7"} : i26
    %32 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %33 = comb.add %32, %c5_i26 {sv.namehint = "_disk_rdata_T_11"} : i26
    %34 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %35 = comb.add %34, %c4_i26 {sv.namehint = "_disk_rdata_T_15"} : i26
    %36 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %37 = comb.add %36, %c3_i26 {sv.namehint = "_disk_rdata_T_19"} : i26
    %38 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %39 = comb.add %38, %c2_i26 {sv.namehint = "_disk_rdata_T_23"} : i26
    %40 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %41 = comb.add %40, %c1_i26 {sv.namehint = "_disk_rdata_T_27"} : i26
    %42 = comb.extract %io_mmioAxi_ra_bits_addr from 0 {sv.namehint = "_disk_rdata_T_31"} : (i32) -> i26
    %43 = comb.concat %disk_ext.R0_data, %disk_ext.R1_data, %disk_ext.R2_data, %disk_ext.R3_data, %disk_ext.R4_data, %disk_ext.R5_data, %disk_ext.R6_data, %disk_ext.R7_data {sv.namehint = "disk_rdata"} : i8, i8, i8, i8, i8, i8, i8, i8
    %44 = comb.icmp bin ne %state, %c0_i3 : i3
    %45 = comb.xor bin %44, %true {sv.namehint = "_T_1"} : i1
    %46 = comb.and bin %io_mmioAxi_wa_valid, %waready {sv.namehint = "_T_2"} : i1
    %47 = comb.and bin %45, %46 : i1
    %48 = comb.mux bin %47, %io_mmioAxi_wa_bits_addr, %waddr : i32
    %49 = comb.xor bin %46, %true : i1
    %50 = comb.mux bin %44, %waready, %49 : i1
    %51 = comb.mux bin %46, %c1_i3, %state : i3
    %52 = comb.and bin %io_mmioAxi_ra_valid, %raready {sv.namehint = "_T_3"} : i1
    %53 = comb.and bin %45, %52 : i1
    %54 = comb.xor bin %52, %true : i1
    %55 = comb.mux bin %44, %raready, %54 : i1
    %56 = comb.mux bin %52, %c3_i3, %51 : i3
    %57 = comb.extract %io_mmioAxi_ra_bits_addr from 28 : (i32) -> i4
    %58 = comb.icmp bin ne %57, %c0_i4 {sv.namehint = "_T_4"} : i4
    %59 = comb.icmp bin ult %io_mmioAxi_ra_bits_addr, %c268435464_i32 {sv.namehint = "_T_7"} : i32
    %60 = comb.and bin %58, %59 {sv.namehint = "_T_8"} : i1
    %61 = comb.extract %io_mmioAxi_ra_bits_addr from 0 {sv.namehint = "_rdata_T_2"} : (i32) -> i3
    %62 = comb.extract %io_mmioAxi_ra_bits_addr from 0 {sv.namehint = "_rdata_T_3"} : (i32) -> i3
    %63 = hw.array_create %uart_7, %uart_6, %uart_5, %uart_4, %uart_3, %uart_2, %uart_1, %uart_0 : i8
    %64 = hw.array_get %63[%61] : !hw.array<8xi8>, i3
    %65 = comb.concat %c0_i127, %64 : i127, i8
    %66 = comb.concat %c0_i129, %62, %c0_i3 : i129, i3, i3
    %67 = comb.shl bin %65, %66 {sv.namehint = "_rdata_T_5"} : i135
    %68 = comb.extract %67 from 0 : (i135) -> i64
    %69 = comb.xor bin %60, %true : i1
    %70 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c33603576_i32 {sv.namehint = "_T_9"} : i32
    %71 = comb.xor bin %70, %true : i1
    %72 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c33570816_i32 {sv.namehint = "_T_10"} : i32
    %73 = comb.xor bin %72, %true : i1
    %74 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c-1593835264_i32 {sv.namehint = "_T_11"} : i32
    %75 = comb.xor bin %74, %true : i1
    %76 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c-1593835448_i32 {sv.namehint = "_T_12"} : i32
    %77 = comb.modu bin %mtime, %c1000000_i64 {sv.namehint = "_rdata_T_6"} : i64
    %78 = comb.extract %77 from 0 {sv.namehint = "_rdata_T_7"} : (i64) -> i32
    %79 = comb.concat %c0_i32, %78 : i32, i32
    %80 = comb.xor bin %76, %true : i1
    %81 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c-1593835444_i32 {sv.namehint = "_T_15"} : i32
    %82 = comb.divu bin %mtime, %c1000000_i64 {sv.namehint = "_rdata_T_8"} : i64
    %83 = comb.extract %82 from 0 {sv.namehint = "rdata_hi"} : (i64) -> i32
    %84 = comb.concat %83, %c0_i32 {sv.namehint = "_rdata_T_9"} : i32, i32
    %85 = comb.xor bin %81, %true : i1
    %86 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c-1593835424_i32 {sv.namehint = "_T_16"} : i32
    %87 = comb.xor bin %86, %true : i1
    %88 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c33554432_i32 {sv.namehint = "_T_17"} : i32
    %89 = comb.xor bin %88, %true : i1
    %90 = comb.icmp bin ugt %io_mmioAxi_ra_bits_addr, %c201326591_i32 {sv.namehint = "_T_18"} : i32
    %91 = comb.icmp bin ult %io_mmioAxi_ra_bits_addr, %c201338880_i32 {sv.namehint = "_T_21"} : i32
    %92 = comb.and bin %90, %91 {sv.namehint = "_T_22"} : i1
    %93 = comb.xor bin %92, %true : i1
    %94 = comb.extract %io_mmioAxi_ra_bits_addr from 30 : (i32) -> i2
    %95 = comb.icmp bin ne %94, %c0_i2 {sv.namehint = "_T_23"} : i2
    %96 = comb.icmp bin ult %io_mmioAxi_ra_bits_addr, %c1140850688_i32 {sv.namehint = "_T_26"} : i32
    %97 = comb.and bin %95, %96 {sv.namehint = "_T_27"} : i1
    %98 = comb.xor bin %97, %true : i1
    %99 = comb.icmp bin ugt %io_mmioAxi_ra_bits_addr, %c805306367_i32 {sv.namehint = "_T_28"} : i32
    %100 = comb.icmp bin ult %io_mmioAxi_ra_bits_addr, %c1073741824_i32 {sv.namehint = "_T_31"} : i32
    %101 = comb.and bin %99, %100 {sv.namehint = "_T_32"} : i1
    %102 = comb.xor bin %101, %true : i1
    %103 = comb.mux bin %97, %43, %c0_i64 : i64
    %104 = comb.mux bin %92, %rdata, %103 : i64
    %105 = comb.or bin %86, %88 : i1
    %106 = comb.mux bin %105, %c0_i64, %104 : i64
    %107 = comb.mux bin %81, %84, %106 : i64
    %108 = comb.mux bin %76, %79, %107 : i64
    %109 = comb.mux bin %74, %c26214700_i64, %108 : i64
    %110 = comb.mux bin %72, %mtimecmp, %109 : i64
    %111 = comb.mux bin %70, %mtime, %110 : i64
    %112 = comb.mux bin %60, %68, %111 : i64
    %113 = comb.mux bin %53, %112, %rdata : i64
    %114 = comb.xor bin %reset, %true {sv.namehint = "_T_34"} : i1
    %115 = comb.icmp bin eq %state, %c1_i3 {sv.namehint = "_T_35"} : i3
    %116 = comb.and bin %44, %115, %io_mmioAxi_wd_valid : i1
    %117 = comb.extract %waddr from 28 : (i32) -> i4
    %118 = comb.icmp bin ne %117, %c0_i4 {sv.namehint = "_T_36"} : i4
    %119 = comb.icmp bin ult %waddr, %c268435464_i32 {sv.namehint = "_T_39"} : i32
    %120 = comb.and bin %118, %119 {sv.namehint = "_T_40"} : i1
    %121 = comb.extract %waddr from 0 {sv.namehint = "offset_1"} : (i32) -> i3
    %122 = comb.extract %waddr from 0 {sv.namehint = "_T_43"} : (i32) -> i3
    %123 = comb.concat %c0_i58, %121, %c0_i3 : i58, i3, i3
    %124 = comb.shru bin %27, %123 {sv.namehint = "_uart_T_1"} : i64
    %125 = comb.extract %124 from 0 {sv.namehint = "_uart_T_2"} : (i64) -> i8
    %126 = comb.icmp bin eq %122, %c0_i3 : i3
    %127 = comb.and %44, %115, %io_mmioAxi_wd_valid, %120, %126 : i1
    %128 = comb.mux bin %127, %125, %uart_0 : i8
    %129 = comb.icmp bin eq %122, %c1_i3 : i3
    %130 = comb.and %44, %115, %io_mmioAxi_wd_valid, %120, %129 : i1
    %131 = comb.mux bin %130, %125, %uart_1 : i8
    %132 = comb.icmp bin eq %122, %c2_i3 : i3
    %133 = comb.and %44, %115, %io_mmioAxi_wd_valid, %120, %132 : i1
    %134 = comb.mux bin %133, %125, %uart_2 : i8
    %135 = comb.icmp bin eq %122, %c3_i3 : i3
    %136 = comb.and %44, %115, %io_mmioAxi_wd_valid, %120, %135 : i1
    %137 = comb.mux bin %136, %125, %uart_3 : i8
    %138 = comb.icmp bin eq %122, %c-4_i3 : i3
    %139 = comb.and %44, %115, %io_mmioAxi_wd_valid, %120, %138 : i1
    %140 = comb.mux bin %139, %125, %uart_4 : i8
    %141 = comb.icmp bin eq %122, %c-3_i3 : i3
    %142 = comb.and %44, %115, %io_mmioAxi_wd_valid, %120, %141 : i1
    %143 = comb.mux bin %142, %125, %c32_i8 : i8
    %144 = comb.icmp bin eq %122, %c-2_i3 : i3
    %145 = comb.and %44, %115, %io_mmioAxi_wd_valid, %120, %144 : i1
    %146 = comb.mux bin %145, %125, %uart_6 : i8
    %147 = comb.icmp bin eq %122, %c-1_i3 : i3
    %148 = comb.and %44, %115, %io_mmioAxi_wd_valid, %120, %147 : i1
    %149 = comb.mux bin %148, %125, %uart_7 : i8
    %150 = comb.extract %waddr from 0 : (i32) -> i3
    %151 = comb.icmp bin eq %150, %c0_i3 {sv.namehint = "_T_45"} : i3
    %152 = comb.xor bin %reset, %true {sv.namehint = "_T_48"} : i1
    %153 = comb.and bin %115, %io_mmioAxi_wd_valid : i1
    %154 = comb.and %44, %153, %120, %151 : i1
    %155 = comb.and %44, %115, %io_mmioAxi_wd_valid, %120, %151, %24 : i1
    %156 = comb.mux bin %155, %25, %c0_i8 : i8
    %157 = comb.xor bin %120, %true : i1
    %158 = comb.icmp bin eq %waddr, %c33570816_i32 {sv.namehint = "_T_49"} : i32
    %159 = comb.xor %158, %true : i1
    %160 = comb.xor %153, %true : i1
    %161 = comb.xor %44, %true : i1
    %162 = comb.or %161, %160, %120, %159 : i1
    %163 = comb.mux bin %162, %mtimecmp, %27 : i64
    %164 = comb.xor bin %158, %true : i1
    %165 = comb.and bin %116, %157, %164 : i1
    %166 = comb.icmp bin eq %waddr, %c-1593834504_i32 {sv.namehint = "_T_50"} : i32
    %167 = comb.xor bin %reset, %true {sv.namehint = "_T_53"} : i1
    %168 = comb.xor bin %166, %true : i1
    %169 = comb.icmp bin ugt %waddr, %c-1610612737_i32 {sv.namehint = "_T_54"} : i32
    %170 = comb.icmp bin ult %waddr, %c-1610132735_i32 {sv.namehint = "_T_57"} : i32
    %171 = comb.and bin %169, %170 {sv.namehint = "_T_58"} : i1
    %172 = comb.xor bin %171, %true : i1
    %173 = comb.icmp bin eq %waddr, %c-1593835264_i32 {sv.namehint = "_T_95"} : i32
    %174 = comb.xor bin %173, %true : i1
    %175 = comb.icmp bin eq %waddr, %c-1593835260_i32 {sv.namehint = "_T_96"} : i32
    %176 = comb.xor bin %175, %true : i1
    %177 = comb.icmp bin ugt %waddr, %c201326591_i32 {sv.namehint = "_T_97"} : i32
    %178 = comb.icmp bin ult %waddr, %c203431937_i32 {sv.namehint = "_T_98"} : i32
    %179 = comb.and bin %177, %178 {sv.namehint = "_T_99"} : i1
    %180 = comb.xor bin %179, %true : i1
    %181 = comb.icmp bin eq %waddr, %c33554432_i32 {sv.namehint = "_T_100"} : i32
    %182 = comb.xor bin %181, %true : i1
    %183 = comb.icmp bin ugt %waddr, %c201326591_i32 {sv.namehint = "_T_101"} : i32
    %184 = comb.icmp bin ult %waddr, %c201338880_i32 {sv.namehint = "_T_104"} : i32
    %185 = comb.and bin %183, %184 {sv.namehint = "_T_105"} : i1
    %186 = comb.xor bin %185, %true : i1
    %187 = comb.extract %io_mmioAxi_ra_bits_addr from 30 : (i32) -> i2
    %188 = comb.icmp bin ne %187, %c0_i2 {sv.namehint = "_T_106"} : i2
    %189 = comb.icmp bin ult %io_mmioAxi_ra_bits_addr, %c1140850688_i32 {sv.namehint = "_T_109"} : i32
    %190 = comb.and bin %188, %189 {sv.namehint = "_T_110"} : i1
    %191 = comb.extract %waddr from 0 {sv.namehint = "_T_113"} : (i32) -> i26
    %192 = comb.or bin %120, %158, %166, %171, %173, %175, %179, %181, %185 : i1
    %193 = comb.xor %192, %true : i1
    %194 = comb.and %153, %193, %190 : i1
    %195 = comb.and %44, %194 : i1
    %196 = comb.extract %waddr from 0 : (i32) -> i26
    %197 = comb.add %196, %c1_i26 {sv.namehint = "_T_117"} : i26
    %198 = comb.and %44, %194 : i1
    %199 = comb.extract %waddr from 0 : (i32) -> i26
    %200 = comb.add %199, %c2_i26 {sv.namehint = "_T_121"} : i26
    %201 = comb.and %44, %194 : i1
    %202 = comb.extract %waddr from 0 : (i32) -> i26
    %203 = comb.add %202, %c3_i26 {sv.namehint = "_T_125"} : i26
    %204 = comb.and %44, %194 : i1
    %205 = comb.extract %waddr from 0 : (i32) -> i26
    %206 = comb.add %205, %c4_i26 {sv.namehint = "_T_129"} : i26
    %207 = comb.and %44, %194 : i1
    %208 = comb.extract %waddr from 0 : (i32) -> i26
    %209 = comb.add %208, %c5_i26 {sv.namehint = "_T_133"} : i26
    %210 = comb.and %44, %194 : i1
    %211 = comb.extract %waddr from 0 : (i32) -> i26
    %212 = comb.add %211, %c6_i26 {sv.namehint = "_T_137"} : i26
    %213 = comb.and %44, %194 : i1
    %214 = comb.extract %waddr from 0 : (i32) -> i26
    %215 = comb.add %214, %c7_i26 {sv.namehint = "_T_141"} : i26
    %216 = comb.and %44, %194 : i1
    %217 = comb.xor bin %190, %true : i1
    %218 = comb.xor bin %reset, %true {sv.namehint = "_T_144"} : i1
    sv.ifdef  "SYNTHESIS" {
    } else {
      sv.always posedge %clock {
        %PRINTF_COND_ = sv.macro.ref< "PRINTF_COND_"> : i1
        %246 = comb.and bin %PRINTF_COND_, %53, %69, %71, %73, %75, %80, %85, %87, %89, %93, %98, %102, %114 : i1
        sv.if %246 {
          sv.fwrite %c-2147483646_i32, "mmio invalid raddr: %x\0A"(%io_mmioAxi_ra_bits_addr) : i32
        }
        %247 = comb.and bin %PRINTF_COND_, %116, %120, %151, %152 : i1
        sv.if %247 {
          sv.fwrite %c-2147483646_i32, "%c"(%26) : i8
        }
        %248 = comb.and bin %PRINTF_COND_, %165, %166, %167 : i1
        sv.if %248 {
          sv.fwrite %c-2147483646_i32, "%c"(%26) : i8
        }
        %249 = comb.and bin %PRINTF_COND_, %165, %168, %172, %174, %176, %180, %182, %186, %217, %218 : i1
        sv.if %249 {
          sv.fwrite %c-2147483646_i32, "mmio invalid waddr: %x\0A"(%io_mmioAxi_wa_bits_addr) : i32
        }
      }
    }
    %219 = comb.and bin %io_mmioAxi_wd_valid, %io_mmioAxi_wd_bits_last : i1
    %220 = comb.mux bin %219, %c2_i3, %state : i3
    %221 = comb.xor bin %io_mmioAxi_wd_bits_last, %true : i1
    %222 = comb.xor %io_mmioAxi_wd_valid, %true : i1
    %223 = comb.or %222, %221 : i1
    %224 = comb.and %44, %115 : i1
    %225 = comb.mux bin %224, %223, %wdready : i1
    %226 = comb.icmp bin eq %state, %c2_i3 {sv.namehint = "_T_145"} : i3
    %227 = comb.icmp bin eq %state, %c3_i3 {sv.namehint = "_T_146"} : i3
    %228 = comb.and bin %io_mmioAxi_rd_ready, %rdvalid {sv.namehint = "_T_147"} : i1
    %229 = comb.add %offset, %c1_i8 {sv.namehint = "_offset_T_1"} : i8
    %230 = comb.and bin %227, %228 : i1
    %231 = comb.or bin %115, %226 : i1
    %232 = comb.xor %230, %true : i1
    %233 = comb.or %231, %232 : i1
    %234 = comb.mux bin %233, %offset, %229 : i8
    %235 = comb.mux bin %44, %234, %c0_i8 : i8
    %236 = comb.xor %228, %true : i1
    %237 = comb.or %236, %1 : i1
    %238 = comb.xor %227, %true : i1
    %239 = comb.or %45, %231, %238 : i1
    %240 = comb.mux bin %239, %rdvalid, %237 : i1
    %241 = comb.and bin %227, %228, %2 : i1
    %242 = comb.or bin %226, %241 : i1
    %243 = comb.mux bin %242, %c0_i3, %state : i3
    %244 = comb.mux bin %115, %220, %243 : i3
    %245 = comb.mux bin %44, %244, %56 : i3
    hw.output %waready, %wdready, %raready, %rdvalid, %rdata, %2, %154, %156 : i1, i1, i1, i1, i64, i1, i1, i8
  }
  hw.module private @SimDma(%clock: i1, %reset: i1, %io_dmaAxi_awready: i1, %io_dmaAxi_wready: i1, %io_dmaAxi_bvalid: i1, %io_dmaAxi_arready: i1, %io_dmaAxi_rvalid: i1, %io_dmaAxi_rdata: i64, %io_dmaAxi_rlast: i1) -> (io_dmaAxi_awvalid: i1, io_dmaAxi_wvalid: i1, io_dmaAxi_wdata: i64, io_dmaAxi_wstrb: i8, io_dmaAxi_bready: i1, io_dmaAxi_arvalid: i1, io_dmaAxi_rready: i1) {
    %true = hw.constant true
    %c1_i3 = hw.constant 1 : i3
    %false = hw.constant false
    %c-2147483646_i32 = hw.constant -2147483646 : i32
    %c0_i64 = hw.constant 0 : i64
    %c0_i8 = hw.constant 0 : i8
    %c3_i3 = hw.constant 3 : i3
    %c2_i3 = hw.constant 2 : i3
    %c1311768467139281697_i64 = hw.constant 1311768467139281697 : i64
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c16_i8 = hw.constant 16 : i8
    %c0_i3 = hw.constant 0 : i3
    %state = seq.firreg %72 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 0 : ui64} : i3
    %awvalid_r = seq.firreg %28 clock %clock reset sync %reset, %false {firrtl.random_init_start = 69 : ui64} : i1
    %wvalid_r = seq.firreg %58 clock %clock reset sync %reset, %false {firrtl.random_init_start = 119 : ui64} : i1
    %wdata_r = seq.firreg %40 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 120 : ui64} : i64
    %wstrb_r = seq.firreg %45 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 184 : ui64} : i8
    %wlast_r = seq.firreg %63 clock %clock reset sync %reset, %false {firrtl.random_init_start = 192 : ui64} : i1
    %bready_r = seq.firreg %76 clock %clock reset sync %reset, %false {firrtl.random_init_start = 193 : ui64} : i1
    %arvalid_r = seq.firreg %8 clock %clock reset sync %reset, %false {firrtl.random_init_start = 194 : ui64} : i1
    %rready_r = seq.firreg %21 clock %clock reset sync %reset, %false {firrtl.random_init_start = 242 : ui64} : i1
    %count_r = seq.firreg %50 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 243 : ui64} : i3
    %0 = comb.icmp bin ne %state, %c0_i3 : i3
    %1 = comb.xor bin %0, %true {sv.namehint = "_T_2"} : i1
    %2 = comb.icmp bin eq %state, %c1_i3 {sv.namehint = "_T_3"} : i3
    %3 = comb.and bin %io_dmaAxi_arready, %arvalid_r {sv.namehint = "_T_4"} : i1
    %4 = comb.and bin %2, %3 : i1
    %5 = comb.xor %4, %true : i1
    %6 = comb.xor %0, %true : i1
    %7 = comb.or %6, %5 : i1
    %8 = comb.and %7, %arvalid_r : i1
    %9 = comb.or %3, %rready_r : i1
    %10 = comb.mux bin %3, %c2_i3, %state : i3
    %11 = comb.xor bin %2, %true : i1
    %12 = comb.icmp bin eq %state, %c2_i3 {sv.namehint = "_T_5"} : i3
    %13 = comb.and bin %io_dmaAxi_rvalid, %rready_r {sv.namehint = "_T_6"} : i1
    %14 = comb.xor bin %reset, %true {sv.namehint = "_T_8"} : i1
    sv.ifdef  "SYNTHESIS" {
    } else {
      sv.always posedge %clock {
        %PRINTF_COND_ = sv.macro.ref< "PRINTF_COND_"> : i1
        %77 = comb.and bin %PRINTF_COND_, %0, %11, %12, %13, %14 : i1
        sv.if %77 {
          sv.fwrite %c-2147483646_i32, "dma rdata: %x\0A"(%io_dmaAxi_rdata) : i64
        }
      }
    }
    %15 = comb.and bin %13, %io_dmaAxi_rlast : i1
    %16 = comb.mux bin %15, %c0_i3, %state : i3
    %17 = comb.and bin %12, %15 : i1
    %18 = comb.xor %17, %true : i1
    %19 = comb.and %18, %rready_r : i1
    %20 = comb.mux bin %2, %9, %19 : i1
    %21 = comb.mux bin %0, %20, %rready_r : i1
    %22 = comb.icmp bin eq %state, %c3_i3 {sv.namehint = "_T_9"} : i3
    %23 = comb.and bin %io_dmaAxi_awready, %awvalid_r {sv.namehint = "_T_10"} : i1
    %24 = comb.and bin %22, %23 : i1
    %25 = comb.xor %24, %true : i1
    %26 = comb.or bin %1, %2, %12 : i1
    %27 = comb.or %26, %25 : i1
    %28 = comb.and %27, %awvalid_r : i1
    %29 = comb.mux bin %23, %c1311768467139281697_i64, %wdata_r : i64
    %30 = comb.mux bin %23, %c16_i8, %wstrb_r : i8
    %31 = comb.or %23, %wvalid_r : i1
    %32 = comb.mux bin %23, %c-4_i3, %state : i3
    %33 = comb.icmp bin eq %state, %c-4_i3 {sv.namehint = "_T_11"} : i3
    %34 = comb.and bin %io_dmaAxi_wready, %wvalid_r {sv.namehint = "_T_12"} : i1
    %35 = comb.extract %wdata_r from 8 : (i64) -> i56
    %36 = comb.concat %c0_i8, %35 : i8, i56
    %37 = comb.and bin %33, %34 : i1
    %38 = comb.mux bin %37, %36, %wdata_r : i64
    %39 = comb.mux bin %22, %29, %38 : i64
    %40 = comb.mux bin %26, %wdata_r, %39 : i64
    %41 = comb.extract %wstrb_r from 0 : (i8) -> i7
    %42 = comb.concat %41, %false : i7, i1
    %43 = comb.mux bin %37, %42, %wstrb_r : i8
    %44 = comb.mux bin %22, %30, %43 : i8
    %45 = comb.mux bin %26, %wstrb_r, %44 : i8
    %46 = comb.add %count_r, %c1_i3 {sv.namehint = "_count_r_T_1"} : i3
    %47 = comb.or bin %1, %2, %12, %22 : i1
    %48 = comb.xor %37, %true : i1
    %49 = comb.or %47, %48 : i1
    %50 = comb.mux bin %49, %count_r, %46 : i3
    %51 = comb.icmp bin eq %count_r, %c2_i3 {sv.namehint = "_wlast_r_T"} : i3
    %52 = comb.and bin %34, %wlast_r : i1
    %53 = comb.mux bin %52, %c-3_i3, %state : i3
    %54 = comb.and bin %33, %52 : i1
    %55 = comb.xor %54, %true : i1
    %56 = comb.and %55, %wvalid_r : i1
    %57 = comb.mux bin %22, %31, %56 : i1
    %58 = comb.mux bin %26, %wvalid_r, %57 : i1
    %59 = comb.xor %wlast_r, %true : i1
    %60 = comb.and %59, %51 : i1
    %61 = comb.xor %37, %true : i1
    %62 = comb.or %47, %61 : i1
    %63 = comb.mux bin %62, %wlast_r, %60 : i1
    %64 = comb.or %52, %bready_r : i1
    %65 = comb.icmp bin eq %state, %c-3_i3 {sv.namehint = "_T_13"} : i3
    %66 = comb.and bin %65, %bready_r, %io_dmaAxi_bvalid : i1
    %67 = comb.mux bin %66, %c0_i3, %state : i3
    %68 = comb.mux bin %33, %53, %67 : i3
    %69 = comb.mux bin %22, %32, %68 : i3
    %70 = comb.mux bin %12, %16, %69 : i3
    %71 = comb.mux bin %2, %10, %70 : i3
    %72 = comb.mux bin %0, %71, %state : i3
    %73 = comb.xor %66, %true : i1
    %74 = comb.and %73, %bready_r : i1
    %75 = comb.mux bin %33, %64, %74 : i1
    %76 = comb.mux bin %47, %bready_r, %75 : i1
    hw.output %awvalid_r, %wvalid_r, %wdata_r, %wstrb_r, %bready_r, %arvalid_r, %rready_r : i1, i1, i64, i8, i1, i1, i1
  }
  hw.module private @SimCrossbar(%clock: i1, %reset: i1, %io_inAxi_wa_valid: i1, %io_inAxi_wa_bits_addr: i32, %io_inAxi_wa_bits_len: i8, %io_inAxi_wd_valid: i1, %io_inAxi_wd_bits_data: i64, %io_inAxi_wd_bits_strb: i8, %io_inAxi_wd_bits_last: i1, %io_inAxi_ra_valid: i1, %io_inAxi_ra_bits_addr: i32, %io_inAxi_ra_bits_len: i8, %io_inAxi_rd_ready: i1, %io_memAxi_wa_ready: i1, %io_memAxi_wd_ready: i1, %io_memAxi_ra_ready: i1, %io_memAxi_rd_valid: i1, %io_memAxi_rd_bits_data: i64, %io_memAxi_rd_bits_last: i1, %io_mmioAxi_wa_ready: i1, %io_mmioAxi_wd_ready: i1, %io_mmioAxi_ra_ready: i1, %io_mmioAxi_rd_valid: i1, %io_mmioAxi_rd_bits_data: i64, %io_mmioAxi_rd_bits_last: i1) -> (io_inAxi_wa_ready: i1, io_inAxi_wd_ready: i1, io_inAxi_ra_ready: i1, io_inAxi_rd_valid: i1, io_inAxi_rd_bits_data: i64, io_inAxi_rd_bits_last: i1, io_memAxi_wa_valid: i1, io_memAxi_wa_bits_addr: i32, io_memAxi_wa_bits_len: i8, io_memAxi_wd_valid: i1, io_memAxi_wd_bits_data: i64, io_memAxi_wd_bits_strb: i8, io_memAxi_wd_bits_last: i1, io_memAxi_ra_valid: i1, io_memAxi_ra_bits_addr: i32, io_memAxi_ra_bits_len: i8, io_memAxi_rd_ready: i1, io_mmioAxi_wa_valid: i1, io_mmioAxi_wa_bits_addr: i32, io_mmioAxi_wd_valid: i1, io_mmioAxi_wd_bits_data: i64, io_mmioAxi_wd_bits_strb: i8, io_mmioAxi_wd_bits_last: i1, io_mmioAxi_ra_valid: i1, io_mmioAxi_ra_bits_addr: i32, io_mmioAxi_rd_ready: i1) {
    %true = hw.constant true
    %c-1879048192_i32 = hw.constant -1879048192 : i32
    %c-2_i2 = hw.constant -2 : i2
    %c1_i2 = hw.constant 1 : i2
    %c0_i64 = hw.constant 0 : i64
    %c0_i8 = hw.constant 0 : i8
    %c0_i32 = hw.constant 0 : i32
    %c0_i2 = hw.constant 0 : i2
    %state = seq.firreg %147 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 0 : ui64} : i2
    %0 = comb.icmp bin eq %state, %c0_i2 {sv.namehint = "_T"} : i2
    %1 = comb.icmp bin ugt %io_inAxi_ra_bits_addr, %c-1879048192_i32 {sv.namehint = "_T_1"} : i32
    %2 = comb.extract %io_inAxi_ra_bits_addr from 31 : (i32) -> i1
    %3 = comb.xor bin %2, %true {sv.namehint = "_T_2"} : i1
    %4 = comb.or bin %1, %3 {sv.namehint = "_T_3"} : i1
    %5 = comb.and bin %io_inAxi_ra_valid, %4 {sv.namehint = "_T_4"} : i1
    %6 = comb.icmp bin ugt %io_inAxi_wa_bits_addr, %c-1879048192_i32 {sv.namehint = "_T_5"} : i32
    %7 = comb.extract %io_inAxi_wa_bits_addr from 31 : (i32) -> i1
    %8 = comb.xor bin %7, %true {sv.namehint = "_T_6"} : i1
    %9 = comb.or bin %6, %8 {sv.namehint = "_T_7"} : i1
    %10 = comb.and bin %io_inAxi_wa_valid, %9 {sv.namehint = "_T_8"} : i1
    %11 = comb.or bin %5, %10 {sv.namehint = "_T_9"} : i1
    %12 = comb.and %11, %io_inAxi_rd_ready : i1
    %13 = comb.mux bin %11, %io_inAxi_ra_bits_addr, %c0_i32 : i32
    %14 = comb.and %11, %io_inAxi_ra_valid : i1
    %15 = comb.and %11, %io_inAxi_wd_bits_last : i1
    %16 = comb.mux bin %11, %io_inAxi_wd_bits_strb, %c0_i8 : i8
    %17 = comb.mux bin %11, %io_inAxi_wd_bits_data, %c0_i64 : i64
    %18 = comb.and %11, %io_inAxi_wd_valid : i1
    %19 = comb.mux bin %11, %io_inAxi_wa_bits_addr, %c0_i32 : i32
    %20 = comb.and %11, %io_inAxi_wa_valid : i1
    %21 = comb.or bin %io_inAxi_ra_valid, %io_inAxi_wa_valid {sv.namehint = "_T_10"} : i1
    %22 = comb.mux bin %21, %c1_i2, %state : i2
    %23 = comb.mux bin %11, %c-2_i2, %22 : i2
    %24 = comb.and %21, %io_memAxi_rd_bits_last : i1
    %25 = comb.mux bin %11, %io_mmioAxi_rd_bits_last, %24 : i1
    %26 = comb.mux bin %21, %io_memAxi_rd_bits_data, %c0_i64 : i64
    %27 = comb.mux bin %11, %io_mmioAxi_rd_bits_data, %26 : i64
    %28 = comb.and %21, %io_memAxi_rd_valid : i1
    %29 = comb.mux bin %11, %io_mmioAxi_rd_valid, %28 : i1
    %30 = comb.xor %11, %true : i1
    %31 = comb.and %30, %21, %io_inAxi_rd_ready : i1
    %32 = comb.xor %21, %true : i1
    %33 = comb.or %11, %32 : i1
    %34 = comb.mux bin %33, %c0_i8, %io_inAxi_ra_bits_len : i8
    %35 = comb.xor %21, %true : i1
    %36 = comb.or %11, %35 : i1
    %37 = comb.mux bin %36, %c0_i32, %io_inAxi_ra_bits_addr : i32
    %38 = comb.xor %11, %true : i1
    %39 = comb.and %38, %21, %io_inAxi_ra_valid : i1
    %40 = comb.xor %21, %true : i1
    %41 = comb.or %40, %io_memAxi_ra_ready : i1
    %42 = comb.mux bin %11, %io_mmioAxi_ra_ready, %41 : i1
    %43 = comb.xor %11, %true : i1
    %44 = comb.and %43, %21, %io_inAxi_wd_bits_last : i1
    %45 = comb.xor %21, %true : i1
    %46 = comb.or %11, %45 : i1
    %47 = comb.mux bin %46, %c0_i8, %io_inAxi_wd_bits_strb : i8
    %48 = comb.xor %21, %true : i1
    %49 = comb.or %11, %48 : i1
    %50 = comb.mux bin %49, %c0_i64, %io_inAxi_wd_bits_data : i64
    %51 = comb.xor %11, %true : i1
    %52 = comb.and %51, %21, %io_inAxi_wd_valid : i1
    %53 = comb.and %21, %io_memAxi_wd_ready : i1
    %54 = comb.mux bin %11, %io_mmioAxi_wd_ready, %53 : i1
    %55 = comb.xor %21, %true : i1
    %56 = comb.or %11, %55 : i1
    %57 = comb.mux bin %56, %c0_i8, %io_inAxi_wa_bits_len : i8
    %58 = comb.xor %21, %true : i1
    %59 = comb.or %11, %58 : i1
    %60 = comb.mux bin %59, %c0_i32, %io_inAxi_wa_bits_addr : i32
    %61 = comb.xor %11, %true : i1
    %62 = comb.and %61, %21, %io_inAxi_wa_valid : i1
    %63 = comb.xor %21, %true : i1
    %64 = comb.or %63, %io_memAxi_wa_ready : i1
    %65 = comb.mux bin %11, %io_mmioAxi_wa_ready, %64 : i1
    %66 = comb.icmp bin eq %state, %c1_i2 {sv.namehint = "_T_11"} : i2
    %67 = comb.and %66, %io_inAxi_rd_ready : i1
    %68 = comb.mux bin %0, %31, %67 : i1
    %69 = comb.mux bin %66, %io_inAxi_ra_bits_len, %c0_i8 : i8
    %70 = comb.mux bin %0, %34, %69 : i8
    %71 = comb.mux bin %66, %io_inAxi_ra_bits_addr, %c0_i32 : i32
    %72 = comb.mux bin %0, %37, %71 : i32
    %73 = comb.and %66, %io_inAxi_ra_valid : i1
    %74 = comb.mux bin %0, %39, %73 : i1
    %75 = comb.and %66, %io_inAxi_wd_bits_last : i1
    %76 = comb.mux bin %0, %44, %75 {sv.namehint = ".io_memAxi_wd_bits_last.output"} : i1
    %77 = comb.mux bin %66, %io_inAxi_wd_bits_strb, %c0_i8 : i8
    %78 = comb.mux bin %0, %47, %77 : i8
    %79 = comb.mux bin %66, %io_inAxi_wd_bits_data, %c0_i64 : i64
    %80 = comb.mux bin %0, %50, %79 : i64
    %81 = comb.and %66, %io_inAxi_wd_valid : i1
    %82 = comb.mux bin %0, %52, %81 {sv.namehint = ".io_memAxi_wd_valid.output"} : i1
    %83 = comb.mux bin %66, %io_inAxi_wa_bits_len, %c0_i8 : i8
    %84 = comb.mux bin %0, %57, %83 : i8
    %85 = comb.mux bin %66, %io_inAxi_wa_bits_addr, %c0_i32 : i32
    %86 = comb.mux bin %0, %60, %85 : i32
    %87 = comb.and %66, %io_inAxi_wa_valid : i1
    %88 = comb.mux bin %0, %62, %87 : i1
    %89 = comb.and bin %io_memAxi_rd_valid, %io_memAxi_rd_bits_last {sv.namehint = "_T_12"} : i1
    %90 = comb.and bin %82, %76 {sv.namehint = "_T_13"} : i1
    %91 = comb.or bin %89, %90 {sv.namehint = "_T_14"} : i1
    %92 = comb.icmp bin eq %state, %c-2_i2 {sv.namehint = "_T_15"} : i2
    %93 = comb.and %92, %io_mmioAxi_rd_bits_last : i1
    %94 = comb.mux bin %66, %io_memAxi_rd_bits_last, %93 : i1
    %95 = comb.mux bin %0, %25, %94 : i1
    %96 = hw.array_create %c0_i64, %io_mmioAxi_rd_bits_data, %io_memAxi_rd_bits_data, %27 : i64
    %97 = hw.array_get %96[%state] : !hw.array<4xi64>, i2
    %98 = comb.and %92, %io_mmioAxi_rd_valid : i1
    %99 = comb.mux bin %66, %io_memAxi_rd_valid, %98 : i1
    %100 = comb.mux bin %0, %29, %99 : i1
    %101 = comb.xor %66, %true : i1
    %102 = comb.and %101, %92, %io_inAxi_rd_ready : i1
    %103 = comb.mux bin %0, %12, %102 : i1
    %104 = comb.xor %92, %true : i1
    %105 = comb.or %66, %104 : i1
    %106 = comb.mux bin %105, %c0_i32, %io_inAxi_ra_bits_addr : i32
    %107 = comb.mux bin %0, %13, %106 : i32
    %108 = comb.xor %66, %true : i1
    %109 = comb.and %108, %92, %io_inAxi_ra_valid : i1
    %110 = comb.mux bin %0, %14, %109 : i1
    %111 = comb.and %92, %io_mmioAxi_ra_ready : i1
    %112 = comb.mux bin %66, %io_memAxi_ra_ready, %111 : i1
    %113 = comb.mux bin %0, %42, %112 : i1
    %114 = comb.xor %66, %true : i1
    %115 = comb.and %114, %92, %io_inAxi_wd_bits_last : i1
    %116 = comb.mux bin %0, %15, %115 {sv.namehint = ".io_mmioAxi_wd_bits_last.output"} : i1
    %117 = comb.xor %92, %true : i1
    %118 = comb.or %66, %117 : i1
    %119 = comb.mux bin %118, %c0_i8, %io_inAxi_wd_bits_strb : i8
    %120 = comb.mux bin %0, %16, %119 : i8
    %121 = comb.xor %92, %true : i1
    %122 = comb.or %66, %121 : i1
    %123 = comb.mux bin %122, %c0_i64, %io_inAxi_wd_bits_data : i64
    %124 = comb.mux bin %0, %17, %123 : i64
    %125 = comb.xor %66, %true : i1
    %126 = comb.and %125, %92, %io_inAxi_wd_valid : i1
    %127 = comb.mux bin %0, %18, %126 {sv.namehint = ".io_mmioAxi_wd_valid.output"} : i1
    %128 = comb.and %92, %io_mmioAxi_wd_ready : i1
    %129 = comb.mux bin %66, %io_memAxi_wd_ready, %128 : i1
    %130 = comb.mux bin %0, %54, %129 : i1
    %131 = comb.xor %92, %true : i1
    %132 = comb.or %66, %131 : i1
    %133 = comb.mux bin %132, %c0_i32, %io_inAxi_wa_bits_addr : i32
    %134 = comb.mux bin %0, %19, %133 : i32
    %135 = comb.xor %66, %true : i1
    %136 = comb.and %135, %92, %io_inAxi_wa_valid : i1
    %137 = comb.mux bin %0, %20, %136 : i1
    %138 = comb.and %92, %io_mmioAxi_wa_ready : i1
    %139 = comb.mux bin %66, %io_memAxi_wa_ready, %138 : i1
    %140 = comb.mux bin %0, %65, %139 : i1
    %141 = comb.and bin %io_mmioAxi_rd_valid, %io_mmioAxi_rd_bits_last {sv.namehint = "_T_16"} : i1
    %142 = comb.and bin %127, %116 {sv.namehint = "_T_17"} : i1
    %143 = comb.or bin %141, %142 {sv.namehint = "_T_18"} : i1
    %144 = comb.and bin %92, %143 : i1
    %145 = comb.mux %66, %91, %144 : i1
    %146 = comb.mux bin %145, %c0_i2, %state : i2
    %147 = comb.mux bin %0, %23, %146 : i2
    hw.output %140, %130, %113, %100, %97, %95, %88, %86, %84, %82, %80, %78, %76, %74, %72, %70, %68, %137, %134, %127, %124, %120, %116, %110, %107, %103 : i1, i1, i1, i1, i64, i1, i1, i32, i8, i1, i64, i8, i1, i1, i32, i8, i1, i1, i32, i1, i64, i8, i1, i1, i32, i1
  }
  hw.module private @TransAXI(%io_raw_axi_awvalid: i1, %io_raw_axi_awaddr: i32, %io_raw_axi_awlen: i8, %io_raw_axi_wvalid: i1, %io_raw_axi_wdata: i64, %io_raw_axi_wstrb: i8, %io_raw_axi_wlast: i1, %io_raw_axi_arvalid: i1, %io_raw_axi_araddr: i32, %io_raw_axi_arlen: i8, %io_raw_axi_rready: i1, %io_bun_axi_wa_ready: i1, %io_bun_axi_wd_ready: i1, %io_bun_axi_ra_ready: i1, %io_bun_axi_rd_valid: i1, %io_bun_axi_rd_bits_data: i64, %io_bun_axi_rd_bits_last: i1) -> (io_raw_axi_awready: i1, io_raw_axi_wready: i1, io_raw_axi_arready: i1, io_raw_axi_rvalid: i1, io_raw_axi_rdata: i64, io_raw_axi_rlast: i1, io_bun_axi_wa_valid: i1, io_bun_axi_wa_bits_addr: i32, io_bun_axi_wa_bits_len: i8, io_bun_axi_wd_valid: i1, io_bun_axi_wd_bits_data: i64, io_bun_axi_wd_bits_strb: i8, io_bun_axi_wd_bits_last: i1, io_bun_axi_ra_valid: i1, io_bun_axi_ra_bits_addr: i32, io_bun_axi_ra_bits_len: i8, io_bun_axi_rd_ready: i1) {
    hw.output %io_bun_axi_wa_ready, %io_bun_axi_wd_ready, %io_bun_axi_ra_ready, %io_bun_axi_rd_valid, %io_bun_axi_rd_bits_data, %io_bun_axi_rd_bits_last, %io_raw_axi_awvalid, %io_raw_axi_awaddr, %io_raw_axi_awlen, %io_raw_axi_wvalid, %io_raw_axi_wdata, %io_raw_axi_wstrb, %io_raw_axi_wlast, %io_raw_axi_arvalid, %io_raw_axi_araddr, %io_raw_axi_arlen, %io_raw_axi_rready : i1, i1, i1, i1, i64, i1, i1, i32, i8, i1, i64, i8, i1, i1, i32, i8, i1
  }
  hw.module @newtop(%clock: i1, %reset: i1, %io_initMemEn: i1, %io_initMemAddr: i32, %io_initMemData: i8) -> (io_uart_valid: i1, io_uart_ch: i8) {
    %false = hw.constant false {sv.namehint = "_cpu_io_interrupt_T"}
    %c0_i8 = hw.constant 0 : i8
    %c0_i32 = hw.constant 0 : i32
    %cpu.io_master_awvalid, %cpu.io_master_awaddr, %cpu.io_master_awlen, %cpu.io_master_wvalid, %cpu.io_master_wdata, %cpu.io_master_wstrb, %cpu.io_master_wlast, %cpu.io_master_arvalid, %cpu.io_master_araddr, %cpu.io_master_arlen, %cpu.io_master_rready, %cpu.io_slave_awready, %cpu.io_slave_wready, %cpu.io_slave_bvalid, %cpu.io_slave_arready, %cpu.io_slave_rvalid, %cpu.io_slave_rdata, %cpu.io_slave_rlast = hw.instance "cpu" @CPU(clock: %clock: i1, reset: %reset: i1, io_master_awready: %transAxi.io_raw_axi_awready: i1, io_master_wready: %transAxi.io_raw_axi_wready: i1, io_master_arready: %transAxi.io_raw_axi_arready: i1, io_master_rvalid: %transAxi.io_raw_axi_rvalid: i1, io_master_rdata: %transAxi.io_raw_axi_rdata: i64, io_master_rlast: %transAxi.io_raw_axi_rlast: i1, io_slave_awvalid: %dma.io_dmaAxi_awvalid: i1, io_slave_awaddr: %c0_i32: i32, io_slave_awlen: %c0_i8: i8, io_slave_wvalid: %dma.io_dmaAxi_wvalid: i1, io_slave_wdata: %dma.io_dmaAxi_wdata: i64, io_slave_wstrb: %dma.io_dmaAxi_wstrb: i8, io_slave_bready: %dma.io_dmaAxi_bready: i1, io_slave_arvalid: %dma.io_dmaAxi_arvalid: i1, io_slave_araddr: %c0_i32: i32, io_slave_arlen: %c0_i8: i8, io_slave_rready: %dma.io_dmaAxi_rready: i1, io_interrupt: %false: i1) -> (io_master_awvalid: i1, io_master_awaddr: i32, io_master_awlen: i8, io_master_wvalid: i1, io_master_wdata: i64, io_master_wstrb: i8, io_master_wlast: i1, io_master_arvalid: i1, io_master_araddr: i32, io_master_arlen: i8, io_master_rready: i1, io_slave_awready: i1, io_slave_wready: i1, io_slave_bvalid: i1, io_slave_arready: i1, io_slave_rvalid: i1, io_slave_rdata: i64, io_slave_rlast: i1)
    %mem.io_memAxi_wa_ready, %mem.io_memAxi_wd_ready, %mem.io_memAxi_ra_ready, %mem.io_memAxi_rd_valid, %mem.io_memAxi_rd_bits_data, %mem.io_memAxi_rd_bits_last = hw.instance "mem" @SimMEM(clock: %clock: i1, reset: %reset: i1, io_memAxi_wa_valid: %crossBar.io_memAxi_wa_valid: i1, io_memAxi_wa_bits_addr: %crossBar.io_memAxi_wa_bits_addr: i32, io_memAxi_wa_bits_len: %crossBar.io_memAxi_wa_bits_len: i8, io_memAxi_wd_valid: %crossBar.io_memAxi_wd_valid: i1, io_memAxi_wd_bits_data: %crossBar.io_memAxi_wd_bits_data: i64, io_memAxi_wd_bits_strb: %crossBar.io_memAxi_wd_bits_strb: i8, io_memAxi_wd_bits_last: %crossBar.io_memAxi_wd_bits_last: i1, io_memAxi_ra_valid: %crossBar.io_memAxi_ra_valid: i1, io_memAxi_ra_bits_addr: %crossBar.io_memAxi_ra_bits_addr: i32, io_memAxi_ra_bits_len: %crossBar.io_memAxi_ra_bits_len: i8, io_memAxi_rd_ready: %crossBar.io_memAxi_rd_ready: i1, io_initMemEn: %io_initMemEn: i1, io_initMemAddr: %io_initMemAddr: i32, io_initMemData: %io_initMemData: i8) -> (io_memAxi_wa_ready: i1, io_memAxi_wd_ready: i1, io_memAxi_ra_ready: i1, io_memAxi_rd_valid: i1, io_memAxi_rd_bits_data: i64, io_memAxi_rd_bits_last: i1)
    %mmio.io_mmioAxi_wa_ready, %mmio.io_mmioAxi_wd_ready, %mmio.io_mmioAxi_ra_ready, %mmio.io_mmioAxi_rd_valid, %mmio.io_mmioAxi_rd_bits_data, %mmio.io_mmioAxi_rd_bits_last, %mmio.io_uart_valid, %mmio.io_uart_ch = hw.instance "mmio" @SimMMIO(clock: %clock: i1, reset: %reset: i1, io_mmioAxi_wa_valid: %crossBar.io_mmioAxi_wa_valid: i1, io_mmioAxi_wa_bits_addr: %crossBar.io_mmioAxi_wa_bits_addr: i32, io_mmioAxi_wd_valid: %crossBar.io_mmioAxi_wd_valid: i1, io_mmioAxi_wd_bits_data: %crossBar.io_mmioAxi_wd_bits_data: i64, io_mmioAxi_wd_bits_strb: %crossBar.io_mmioAxi_wd_bits_strb: i8, io_mmioAxi_wd_bits_last: %crossBar.io_mmioAxi_wd_bits_last: i1, io_mmioAxi_ra_valid: %crossBar.io_mmioAxi_ra_valid: i1, io_mmioAxi_ra_bits_addr: %crossBar.io_mmioAxi_ra_bits_addr: i32, io_mmioAxi_rd_ready: %crossBar.io_mmioAxi_rd_ready: i1) -> (io_mmioAxi_wa_ready: i1, io_mmioAxi_wd_ready: i1, io_mmioAxi_ra_ready: i1, io_mmioAxi_rd_valid: i1, io_mmioAxi_rd_bits_data: i64, io_mmioAxi_rd_bits_last: i1, io_uart_valid: i1, io_uart_ch: i8)
    %dma.io_dmaAxi_awvalid, %dma.io_dmaAxi_wvalid, %dma.io_dmaAxi_wdata, %dma.io_dmaAxi_wstrb, %dma.io_dmaAxi_bready, %dma.io_dmaAxi_arvalid, %dma.io_dmaAxi_rready = hw.instance "dma" @SimDma(clock: %clock: i1, reset: %reset: i1, io_dmaAxi_awready: %cpu.io_slave_awready: i1, io_dmaAxi_wready: %cpu.io_slave_wready: i1, io_dmaAxi_bvalid: %cpu.io_slave_bvalid: i1, io_dmaAxi_arready: %cpu.io_slave_arready: i1, io_dmaAxi_rvalid: %cpu.io_slave_rvalid: i1, io_dmaAxi_rdata: %cpu.io_slave_rdata: i64, io_dmaAxi_rlast: %cpu.io_slave_rlast: i1) -> (io_dmaAxi_awvalid: i1, io_dmaAxi_wvalid: i1, io_dmaAxi_wdata: i64, io_dmaAxi_wstrb: i8, io_dmaAxi_bready: i1, io_dmaAxi_arvalid: i1, io_dmaAxi_rready: i1)
    %crossBar.io_inAxi_wa_ready, %crossBar.io_inAxi_wd_ready, %crossBar.io_inAxi_ra_ready, %crossBar.io_inAxi_rd_valid, %crossBar.io_inAxi_rd_bits_data, %crossBar.io_inAxi_rd_bits_last, %crossBar.io_memAxi_wa_valid, %crossBar.io_memAxi_wa_bits_addr, %crossBar.io_memAxi_wa_bits_len, %crossBar.io_memAxi_wd_valid, %crossBar.io_memAxi_wd_bits_data, %crossBar.io_memAxi_wd_bits_strb, %crossBar.io_memAxi_wd_bits_last, %crossBar.io_memAxi_ra_valid, %crossBar.io_memAxi_ra_bits_addr, %crossBar.io_memAxi_ra_bits_len, %crossBar.io_memAxi_rd_ready, %crossBar.io_mmioAxi_wa_valid, %crossBar.io_mmioAxi_wa_bits_addr, %crossBar.io_mmioAxi_wd_valid, %crossBar.io_mmioAxi_wd_bits_data, %crossBar.io_mmioAxi_wd_bits_strb, %crossBar.io_mmioAxi_wd_bits_last, %crossBar.io_mmioAxi_ra_valid, %crossBar.io_mmioAxi_ra_bits_addr, %crossBar.io_mmioAxi_rd_ready = hw.instance "crossBar" @SimCrossbar(clock: %clock: i1, reset: %reset: i1, io_inAxi_wa_valid: %transAxi.io_bun_axi_wa_valid: i1, io_inAxi_wa_bits_addr: %transAxi.io_bun_axi_wa_bits_addr: i32, io_inAxi_wa_bits_len: %transAxi.io_bun_axi_wa_bits_len: i8, io_inAxi_wd_valid: %transAxi.io_bun_axi_wd_valid: i1, io_inAxi_wd_bits_data: %transAxi.io_bun_axi_wd_bits_data: i64, io_inAxi_wd_bits_strb: %transAxi.io_bun_axi_wd_bits_strb: i8, io_inAxi_wd_bits_last: %transAxi.io_bun_axi_wd_bits_last: i1, io_inAxi_ra_valid: %transAxi.io_bun_axi_ra_valid: i1, io_inAxi_ra_bits_addr: %transAxi.io_bun_axi_ra_bits_addr: i32, io_inAxi_ra_bits_len: %transAxi.io_bun_axi_ra_bits_len: i8, io_inAxi_rd_ready: %transAxi.io_bun_axi_rd_ready: i1, io_memAxi_wa_ready: %mem.io_memAxi_wa_ready: i1, io_memAxi_wd_ready: %mem.io_memAxi_wd_ready: i1, io_memAxi_ra_ready: %mem.io_memAxi_ra_ready: i1, io_memAxi_rd_valid: %mem.io_memAxi_rd_valid: i1, io_memAxi_rd_bits_data: %mem.io_memAxi_rd_bits_data: i64, io_memAxi_rd_bits_last: %mem.io_memAxi_rd_bits_last: i1, io_mmioAxi_wa_ready: %mmio.io_mmioAxi_wa_ready: i1, io_mmioAxi_wd_ready: %mmio.io_mmioAxi_wd_ready: i1, io_mmioAxi_ra_ready: %mmio.io_mmioAxi_ra_ready: i1, io_mmioAxi_rd_valid: %mmio.io_mmioAxi_rd_valid: i1, io_mmioAxi_rd_bits_data: %mmio.io_mmioAxi_rd_bits_data: i64, io_mmioAxi_rd_bits_last: %mmio.io_mmioAxi_rd_bits_last: i1) -> (io_inAxi_wa_ready: i1, io_inAxi_wd_ready: i1, io_inAxi_ra_ready: i1, io_inAxi_rd_valid: i1, io_inAxi_rd_bits_data: i64, io_inAxi_rd_bits_last: i1, io_memAxi_wa_valid: i1, io_memAxi_wa_bits_addr: i32, io_memAxi_wa_bits_len: i8, io_memAxi_wd_valid: i1, io_memAxi_wd_bits_data: i64, io_memAxi_wd_bits_strb: i8, io_memAxi_wd_bits_last: i1, io_memAxi_ra_valid: i1, io_memAxi_ra_bits_addr: i32, io_memAxi_ra_bits_len: i8, io_memAxi_rd_ready: i1, io_mmioAxi_wa_valid: i1, io_mmioAxi_wa_bits_addr: i32, io_mmioAxi_wd_valid: i1, io_mmioAxi_wd_bits_data: i64, io_mmioAxi_wd_bits_strb: i8, io_mmioAxi_wd_bits_last: i1, io_mmioAxi_ra_valid: i1, io_mmioAxi_ra_bits_addr: i32, io_mmioAxi_rd_ready: i1)
    %transAxi.io_raw_axi_awready, %transAxi.io_raw_axi_wready, %transAxi.io_raw_axi_arready, %transAxi.io_raw_axi_rvalid, %transAxi.io_raw_axi_rdata, %transAxi.io_raw_axi_rlast, %transAxi.io_bun_axi_wa_valid, %transAxi.io_bun_axi_wa_bits_addr, %transAxi.io_bun_axi_wa_bits_len, %transAxi.io_bun_axi_wd_valid, %transAxi.io_bun_axi_wd_bits_data, %transAxi.io_bun_axi_wd_bits_strb, %transAxi.io_bun_axi_wd_bits_last, %transAxi.io_bun_axi_ra_valid, %transAxi.io_bun_axi_ra_bits_addr, %transAxi.io_bun_axi_ra_bits_len, %transAxi.io_bun_axi_rd_ready = hw.instance "transAxi" @TransAXI(io_raw_axi_awvalid: %cpu.io_master_awvalid: i1, io_raw_axi_awaddr: %cpu.io_master_awaddr: i32, io_raw_axi_awlen: %cpu.io_master_awlen: i8, io_raw_axi_wvalid: %cpu.io_master_wvalid: i1, io_raw_axi_wdata: %cpu.io_master_wdata: i64, io_raw_axi_wstrb: %cpu.io_master_wstrb: i8, io_raw_axi_wlast: %cpu.io_master_wlast: i1, io_raw_axi_arvalid: %cpu.io_master_arvalid: i1, io_raw_axi_araddr: %cpu.io_master_araddr: i32, io_raw_axi_arlen: %cpu.io_master_arlen: i8, io_raw_axi_rready: %cpu.io_master_rready: i1, io_bun_axi_wa_ready: %crossBar.io_inAxi_wa_ready: i1, io_bun_axi_wd_ready: %crossBar.io_inAxi_wd_ready: i1, io_bun_axi_ra_ready: %crossBar.io_inAxi_ra_ready: i1, io_bun_axi_rd_valid: %crossBar.io_inAxi_rd_valid: i1, io_bun_axi_rd_bits_data: %crossBar.io_inAxi_rd_bits_data: i64, io_bun_axi_rd_bits_last: %crossBar.io_inAxi_rd_bits_last: i1) -> (io_raw_axi_awready: i1, io_raw_axi_wready: i1, io_raw_axi_arready: i1, io_raw_axi_rvalid: i1, io_raw_axi_rdata: i64, io_raw_axi_rlast: i1, io_bun_axi_wa_valid: i1, io_bun_axi_wa_bits_addr: i32, io_bun_axi_wa_bits_len: i8, io_bun_axi_wd_valid: i1, io_bun_axi_wd_bits_data: i64, io_bun_axi_wd_bits_strb: i8, io_bun_axi_wd_bits_last: i1, io_bun_axi_ra_valid: i1, io_bun_axi_ra_bits_addr: i32, io_bun_axi_ra_bits_len: i8, io_bun_axi_rd_ready: i1)
    hw.output %mmio.io_uart_valid, %mmio.io_uart_ch : i1, i8
  }
}
