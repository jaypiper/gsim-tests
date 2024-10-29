module {
  sv.macro.decl @SYNTHESIS
  sv.macro.decl @PRINTF_COND
  sv.macro.decl @PRINTF_COND_
  emit.fragment @PRINTF_COND_FRAGMENT {
    sv.verbatim "\0A// Users can define 'PRINTF_COND' to add an extra gate to prints."
    sv.ifdef  @PRINTF_COND_ {
    } else {
      sv.ifdef  @PRINTF_COND {
        sv.macro.def @PRINTF_COND_ "(`PRINTF_COND)"
      } else {
        sv.macro.def @PRINTF_COND_ "1"
      }
    }
  }
  hw.module private @Fetch(in %clock : !seq.clock, in %reset : i1, out io_instRead_addr : i32, in %io_instRead_inst : i64, out io_instRead_arvalid : i1, in %io_instRead_rvalid : i1, out io_va2pa_vaddr : i64, out io_va2pa_vvalid : i1, in %io_va2pa_paddr : i32, in %io_va2pa_pvalid : i1, in %io_va2pa_tlb_excep_cause : i64, in %io_va2pa_tlb_excep_tval : i64, in %io_va2pa_tlb_excep_en : i1, in %io_reg2if_seq_pc : i64, in %io_reg2if_valid : i1, in %io_wb2if_seq_pc : i64, in %io_wb2if_valid : i1, in %io_recov : i1, in %io_intr_in_en : i1, in %io_intr_in_cause : i64, in %io_branchFail_seq_pc : i64, in %io_branchFail_valid : i1, out io_if2id_inst : i32, out io_if2id_pc : i64, out io_if2id_excep_cause : i64, out io_if2id_excep_tval : i64, out io_if2id_excep_en : i1, out io_if2id_excep_pc : i64, out io_if2id_excep_etype : i2, in %io_if2id_drop : i1, in %io_if2id_stall : i1, out io_if2id_recov : i1, out io_if2id_valid : i1, in %io_if2id_ready : i1) {
    %c0_i61 = hw.constant 0 : i61
    %c2_i64 = hw.constant 2 : i64
    %c5_i64 = hw.constant 5 : i64
    %c8_i64 = hw.constant 8 : i64
    %c12_i64 = hw.constant 12 : i64
    %c6_i64 = hw.constant 6 : i64
    %c0_i122 = hw.constant 0 : i122
    %c2147483648_i64 = hw.constant 2147483648 : i64
    %true = hw.constant true
    %c0_i32 = hw.constant 0 : i32
    %c0_i128 = hw.constant 0 : i128
    %c-1_i2 = hw.constant -1 : i2
    %c0_i3 = hw.constant 0 : i3
    %c0_i16 = hw.constant 0 : i16
    %c-4_i3 = hw.constant -4 : i3
    %c1_i2 = hw.constant 1 : i2
    %false = hw.constant false
    %c2_i3 = hw.constant 2 : i3
    %c0_i64 = hw.constant 0 : i64
    %c0_i2 = hw.constant 0 : i2
    %pc = seq.firreg %27 clock %clock reset sync %reset, %c2147483648_i64 {firrtl.random_init_start = 0 : ui64} : i64
    %drop1_r = seq.firreg %30 clock %clock reset sync %reset, %false {firrtl.random_init_start = 64 : ui64} : i1
    %drop2_r = seq.firreg %59 clock %clock reset sync %reset, %false {firrtl.random_init_start = 65 : ui64} : i1
    %drop3_r = seq.firreg %233 clock %clock reset sync %reset, %false {firrtl.random_init_start = 66 : ui64} : i1
    %stall1_r = seq.firreg %30 clock %clock reset sync %reset, %false {firrtl.random_init_start = 67 : ui64} : i1
    %stall2_r = seq.firreg %59 clock %clock reset sync %reset, %false {firrtl.random_init_start = 68 : ui64} : i1
    %stall3_r = seq.firreg %233 clock %clock reset sync %reset, %false {firrtl.random_init_start = 69 : ui64} : i1
    %recov3_r = seq.firreg %234 clock %clock reset sync %reset, %false {firrtl.random_init_start = 72 : ui64, sv.namehint = "recov3_r"} : i1
    %0 = comb.or bin %drop3_r, %io_if2id_drop {sv.namehint = "drop3_in"} : i1
    %1 = comb.or bin %drop2_r, %0 {sv.namehint = "drop2_in"} : i1
    %2 = comb.or bin %drop1_r, %1 {sv.namehint = "drop1_in"} : i1
    %3 = comb.xor bin %io_if2id_drop, %true {sv.namehint = "_io_instRead_arvalid_T_1"} : i1
    %4 = comb.and bin %stall3_r, %3 {sv.namehint = "_stall3_in_T_1"} : i1
    %5 = comb.xor bin %0, %true {sv.namehint = "_stall2_in_T"} : i1
    %6 = comb.and bin %stall2_r, %5 {sv.namehint = "_stall2_in_T_1"} : i1
    %7 = comb.xor bin %1, %true {sv.namehint = "_stall1_in_T"} : i1
    %8 = comb.and bin %stall1_r, %7 {sv.namehint = "_stall1_in_T_1"} : i1
    %9 = comb.or bin %8, %6, %4, %io_if2id_stall {sv.namehint = "stall1_in"} : i1
    %state = seq.firreg %18 clock %clock reset sync %reset, %false {firrtl.random_init_start = 73 : ui64} : i1
    %10 = comb.xor bin %state, %true {sv.namehint = "_hs_in_T"} : i1
    %11 = comb.or %9, %state : i1
    %12 = comb.xor bin %9, %true : i1
    %13 = comb.and bin %2, %12 : i1
    %14 = comb.or bin %13, %io_recov : i1
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
    %21 = comb.add %pc, %c8_i64 {sv.namehint = "_cur_pc_T"} : i64
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
    %36 = comb.and bin %20, %35 {sv.namehint = "io_va2pa_vvalid"} : i1
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
    %42 = comb.xor bin %116, %true : i1
    %43 = comb.and bin %valid2_r, %42 : i1
    %44 = comb.or bin %41, %excep1_r_en : i1
    %45 = comb.xor %43, %true : i1
    %46 = comb.and %7, %45, %44, %valid1_r {sv.namehint = "hs1"} : i1
    %47 = comb.and bin %5, %46 : i1
    %48 = comb.mux bin %47, %pc1_r, %pc2_r : i64
    %49 = comb.xor %116, %true : i1
    %50 = comb.and %49, %valid2_r : i1
    %51 = comb.or %46, %50 : i1
    %52 = comb.xor bin %46, %true : i1
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
    %80 = comb.mux bin %46, %io_va2pa_paddr, %paddr2_r {sv.namehint = "io_instRead_addr"} : i32
    %81 = comb.or bin %io_va2pa_tlb_excep_en, %excep1_r_en {sv.namehint = "_cur_excep_en_T"} : i1
    %82 = comb.mux bin %46, %81, %excep2_r_en {sv.namehint = "cur_excep_en"} : i1
    %83 = comb.or bin %46, %valid2_r {sv.namehint = "_io_instRead_arvalid_T"} : i1
    %84 = comb.xor bin %82, %true {sv.namehint = "_io_instRead_arvalid_T_3"} : i1
    %85 = comb.and bin %83, %3, %84 {sv.namehint = "io_instRead_arvalid"} : i1
    %pc3_r = seq.firreg %210 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 693 : ui64, sv.namehint = "pc3_r"} : i64
    %valid3_r = seq.firreg %238 clock %clock reset sync %reset, %false {firrtl.random_init_start = 757 : ui64, sv.namehint = "valid3_r"} : i1
    %excep3_r_cause = seq.firreg %200 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 758 : ui64, sv.namehint = "excep3_r_cause"} : i64
    %excep3_r_tval = seq.firreg %209 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 822 : ui64, sv.namehint = "excep3_r_tval"} : i64
    %excep3_r_en = seq.firreg %199 clock %clock reset sync %reset, %false {firrtl.random_init_start = 886 : ui64, sv.namehint = "excep3_r_en"} : i1
    %excep3_r_pc = seq.firreg %204 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 887 : ui64, sv.namehint = "excep3_r_pc"} : i64
    %excep3_r_etype = seq.firreg %198 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 951 : ui64, sv.namehint = "excep3_r_etype"} : i2
    %next_pc_r = seq.firreg %216 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 953 : ui64} : i64
    %wait_jmp_pc = seq.firreg %151 clock %clock reset sync %reset, %true {firrtl.random_init_start = 1017 : ui64} : i1
    %inst_buf = seq.firreg %225 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 1018 : ui64} : i128
    %buf_start_pc = seq.firreg %223 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1146 : ui64} : i64
    %buf_bitmap = seq.firreg %228 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1210 : ui64} : i2
    %excep_buf_cause = seq.firreg %107 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1212 : ui64} : i64
    %excep_buf_tval = seq.firreg %104 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1276 : ui64} : i64
    %excep_buf_en = seq.firreg %232 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1340 : ui64} : i1
    %excep_buf_pc = seq.firreg %98 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1341 : ui64} : i64
    %excep_buf_etype = seq.firreg %95 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1405 : ui64} : i2
    %inst_r = seq.firreg %202 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1407 : ui64, sv.namehint = "inst_r"} : i32
    %reset_ic = seq.firreg %150 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1439 : ui64} : i1
    %update_excep_pc = seq.firreg %111 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1440 : ui64} : i1
    %86 = comb.xor %io_instRead_rvalid, %true : i1
    %87 = comb.and %86, %reset_ic : i1
    %88 = comb.sub %next_pc_r, %buf_start_pc {sv.namehint = "_buf_offset_T"} : i64
    %89 = comb.and bin %io_if2id_ready, %valid3_r {sv.namehint = "hs_out"} : i1
    %90 = comb.icmp bin eq %buf_bitmap, %c-1_i2 : i2
    %91 = comb.or bin %90, %excep_buf_en : i1
    %92 = comb.and bin %excep2_r_en, %valid2_r : i1
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
    %112 = comb.xor bin %reset_ic, %true : i1
    %113 = comb.and bin %valid2_r, %io_instRead_rvalid, %112 : i1
    %114 = comb.or %92, %113 : i1
    %115 = comb.xor %91, %true : i1
    %116 = comb.and %5, %115, %114 {sv.namehint = "hs2"} : i1
    %117 = comb.extract %buf_bitmap from 0 : (i2) -> i1
    %118 = comb.extract %inst_buf from 0 {sv.namehint = "next_inst_buf_lo"} : (i128) -> i64
    %119 = comb.concat %io_instRead_inst, %118 {sv.namehint = "_next_inst_buf_T"} : i64, i64
    %120 = comb.concat %c0_i64, %io_instRead_inst {sv.namehint = "_next_inst_buf_T_1"} : i64, i64
    %121 = comb.mux bin %117, %119, %120 : i128
    %122 = comb.or bin %91, %92 : i1
    %123 = comb.xor %113, %true : i1
    %124 = comb.or %0, %122, %123 : i1
    %125 = comb.extract %inst_buf from 64 : (i128) -> i64
    %126 = comb.extract %121 from 64 : (i128) -> i64
    %127 = comb.mux %124, %125, %126 {sv.namehint = "next_inst_buf"} : i64
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
    %144 = comb.mux bin %124, %inst_buf, %121 : i128
    %145 = comb.mux bin %0, %c0_i2, %131 : i2
    %146 = comb.xor bin %excep2_r_en, %true {sv.namehint = "_reset_ic_T"} : i1
    %147 = comb.xor bin %io_instRead_rvalid, %true {sv.namehint = "_reset_ic_T_2"} : i1
    %148 = comb.and bin %valid2_r, %146, %147 {sv.namehint = "_reset_ic_T_3"} : i1
    %149 = comb.or bin %reset_ic, %148 {sv.namehint = "_reset_ic_T_4"} : i1
    %150 = comb.mux bin %0, %149, %87 : i1
    %151 = comb.or %0, %143 : i1
    %152 = comb.extract %88 from 0 {sv.namehint = "top_inst32_hi"} : (i64) -> i3
    %153 = comb.concat %c0_i122, %152, %c0_i3 : i122, i3, i3
    %154 = comb.shru bin %inst_buf, %153 {sv.namehint = "top_inst32"} : i128
    %155 = comb.extract %154 from 0 {sv.namehint = "_top_inst_T"} : (i128) -> i2
    %156 = comb.icmp bin eq %155, %c-1_i2 {sv.namehint = "_top_inst_T_1"} : i2
    %157 = comb.extract %154 from 0 {sv.namehint = "top_inst_lo"} : (i128) -> i16
    %158 = comb.extract %154 from 0 : (i128) -> i32
    %159 = comb.concat %c0_i16, %157 : i16, i16
    %160 = comb.mux %156, %158, %159 {sv.namehint = "_top_inst_T_3"} : i32
    %161 = comb.icmp bin eq %buf_bitmap, %c1_i2 : i2
    %162 = comb.icmp bin eq %88, %c6_i64 : i64
    %163 = comb.extract %154 from 0 {sv.namehint = "_top_inst_T_5"} : (i128) -> i2
    %164 = comb.icmp bin ne %163, %c-1_i2 : i2
    %165 = comb.and bin %162, %164 : i1
    %166 = comb.extract %154 from 0 {sv.namehint = "top_inst_lo_1"} : (i128) -> i16
    %167 = comb.concat %c0_i16, %166 {sv.namehint = "_top_inst_T_4"} : i16, i16
    %168 = comb.icmp bin ult %88, %c5_i64 : i64
    %169 = comb.or %165, %168 : i1
    %170 = comb.and %161, %169 : i1
    %171 = comb.or %90, %170 {sv.namehint = "inst_valid"} : i1
    %172 = comb.icmp bin eq %163, %c-1_i2 {sv.namehint = "_top_inst_T_6"} : i2
    %173 = comb.extract %154 from 0 {sv.namehint = "top_inst_lo_2"} : (i128) -> i16
    %174 = comb.extract %154 from 0 : (i128) -> i32
    %175 = comb.concat %c0_i16, %173 : i16, i16
    %176 = comb.mux %172, %174, %175 {sv.namehint = "_top_inst_T_8"} : i32
    %177 = comb.mux bin %168, %176, %c0_i32 : i32
    %178 = comb.mux bin %165, %167, %177 : i32
    %179 = comb.mux bin %161, %178, %c0_i32 : i32
    %180 = comb.mux bin %90, %160, %179 {sv.namehint = "top_inst"} : i32
    %181 = comb.icmp bin eq %excep_buf_cause, %c12_i64 {sv.namehint = "fetch_page_fault_excep"} : i64
    %182 = comb.icmp bin eq %buf_bitmap, %c1_i2 {sv.namehint = "_cross_page_excep_T"} : i2
    %183 = comb.icmp bin eq %88, %c6_i64 {sv.namehint = "_cross_page_excep_T_2"} : i64
    %184 = comb.extract %154 from 0 {sv.namehint = "_cross_page_excep_T_4"} : (i128) -> i2
    %185 = comb.icmp bin eq %184, %c-1_i2 {sv.namehint = "_cross_page_excep_T_5"} : i2
    %186 = comb.and bin %181, %182, %183, %185 {sv.namehint = "cross_page_excep"} : i1
    %187 = comb.or bin %171, %excep_buf_en : i1
    %188 = comb.xor bin %valid3_r, %true : i1
    %189 = comb.or bin %188, %89 : i1
    %190 = comb.and bin %187, %189 : i1
    %191 = comb.mux bin %171, %c0_i64, %excep_buf_cause {sv.namehint = "_excep3_r_T_cause"} : i64
    %192 = comb.mux bin %171, %c0_i64, %excep_buf_tval {sv.namehint = "_excep3_r_T_tval"} : i64
    %193 = comb.xor %171, %true : i1
    %194 = comb.and %193, %excep_buf_en {sv.namehint = "_excep3_r_T_en"} : i1
    %195 = comb.mux bin %171, %c0_i64, %excep_buf_pc {sv.namehint = "_excep3_r_T_pc"} : i64
    %196 = comb.mux bin %171, %c0_i2, %excep_buf_etype {sv.namehint = "_excep3_r_T_etype"} : i2
    %197 = comb.and bin %3, %190 : i1
    %198 = comb.mux bin %197, %196, %excep3_r_etype : i2
    %199 = comb.mux bin %197, %194, %excep3_r_en : i1
    %200 = comb.mux bin %197, %191, %excep3_r_cause : i64
    %201 = comb.mux bin %171, %180, %c0_i32 {sv.namehint = "_inst_r_T"} : i32
    %202 = comb.mux bin %197, %201, %inst_r : i32
    %203 = comb.mux bin %update_excep_pc, %next_pc_r, %195 : i64
    %204 = comb.mux bin %197, %203, %excep3_r_pc : i64
    %205 = comb.add %next_pc_r, %c2_i64 {sv.namehint = "_excep3_r_tval_T"} : i64
    %206 = comb.mux bin %181, %next_pc_r, %excep_buf_tval {sv.namehint = "_excep3_r_tval_T_2"} : i64
    %207 = comb.mux bin %186, %205, %206 {sv.namehint = "_excep3_r_tval_T_3"} : i64
    %208 = comb.mux bin %update_excep_pc, %207, %192 : i64
    %209 = comb.mux bin %197, %208, %excep3_r_tval : i64
    %210 = comb.mux bin %197, %next_pc_r, %pc3_r : i64
    %211 = comb.extract %180 from 0 {sv.namehint = "_next_pc_w_T"} : (i32) -> i2
    %212 = comb.icmp bin eq %211, %c-1_i2 {sv.namehint = "_next_pc_w_T_1"} : i2
    %213 = comb.mux bin %212, %c-4_i3, %c2_i3 {sv.namehint = "_next_pc_w_T_2"} : i3
    %214 = comb.concat %c0_i61, %213 : i61, i3
    %215 = comb.add %next_pc_r, %214 {sv.namehint = "_next_pc_w_T_3"} : i64
    %216 = comb.mux bin %197, %215, %140 : i64
    %217 = comb.sub %215, %buf_start_pc : i64
    %218 = comb.extract %217 from 3 : (i64) -> i61
    %219 = comb.icmp bin ne %218, %c0_i61 : i61
    %220 = comb.icmp bin ne %buf_bitmap, %c0_i2 : i2
    %221 = comb.add %buf_start_pc, %c8_i64 {sv.namehint = "_buf_start_pc_T_1"} : i64
    %222 = comb.and bin %3, %190, %219, %220 : i1
    %223 = comb.mux bin %222, %221, %136 : i64
    %224 = comb.concat %c0_i64, %127 {sv.namehint = "_inst_buf_T"} : i64, i64
    %225 = comb.mux bin %222, %224, %144 : i128
    %226 = comb.extract %131 from 1 {sv.namehint = "buf_bitmap_lo"} : (i2) -> i1
    %227 = comb.concat %false, %226 {sv.namehint = "_buf_bitmap_T"} : i1, i1
    %228 = comb.mux bin %222, %227, %145 : i2
    %229 = comb.xor bin %171, %true : i1
    %230 = comb.and bin %3, %190, %229 : i1
    %231 = comb.xor %230, %true : i1
    %232 = comb.and %231, %5, %101 : i1
    %233 = comb.and %197, %229 : i1
    %234 = comb.mux bin %197, %229, %recov3_r : i1
    %235 = comb.xor %89, %true : i1
    %236 = comb.and %235, %valid3_r : i1
    %237 = comb.or %190, %236 : i1
    %238 = comb.and %3, %237 : i1
    hw.output %80, %85, %22, %36, %inst_r, %pc3_r, %excep3_r_cause, %excep3_r_tval, %excep3_r_en, %excep3_r_pc, %excep3_r_etype, %recov3_r, %valid3_r : i32, i1, i64, i1, i32, i64, i64, i64, i1, i64, i2, i1, i1
  }
  hw.module private @Decode(in %clock : !seq.clock, in %reset : i1, in %io_if2id_inst : i32, in %io_if2id_pc : i64, in %io_if2id_excep_cause : i64, in %io_if2id_excep_tval : i64, in %io_if2id_excep_en : i1, in %io_if2id_excep_pc : i64, in %io_if2id_excep_etype : i2, out io_if2id_drop : i1, out io_if2id_stall : i1, in %io_if2id_recov : i1, in %io_if2id_valid : i1, out io_if2id_ready : i1, out io_id2df_inst : i32, out io_id2df_pc : i64, out io_id2df_excep_cause : i64, out io_id2df_excep_tval : i64, out io_id2df_excep_en : i1, out io_id2df_excep_pc : i64, out io_id2df_excep_etype : i2, out io_id2df_ctrl_aluOp : i5, out io_id2df_ctrl_aluWidth : i1, out io_id2df_ctrl_dcMode : i5, out io_id2df_ctrl_writeRegEn : i1, out io_id2df_ctrl_writeCSREn : i1, out io_id2df_ctrl_brType : i3, out io_id2df_rs1 : i5, out io_id2df_rrs1 : i1, out io_id2df_rs1_d : i64, out io_id2df_rs2 : i12, out io_id2df_rrs2 : i1, out io_id2df_rs2_d : i64, out io_id2df_dst : i5, out io_id2df_dst_d : i64, out io_id2df_jmp_type : i2, out io_id2df_special : i2, out io_id2df_swap : i6, out io_id2df_indi : i2, in %io_id2df_drop : i1, in %io_id2df_stall : i1, out io_id2df_recov : i1, out io_id2df_valid : i1, in %io_id2df_ready : i1, in %io_idState_priv : i2) {
    %c1_i9 = hw.constant 1 : i9
    %c0_i48 = hw.constant 0 : i48
    %c0_i16 = hw.constant 0 : i16
    %c-251_i9 = hw.constant -251 : i9
    %c4_i64 = hw.constant 4 : i64
    %c-2_i5 = hw.constant -2 : i5
    %c-6_i5 = hw.constant -6 : i5
    %c-26_i6 = hw.constant -26 : i6
    %c-894_i11 = hw.constant -894 : i11
    %c-30_i6 = hw.constant -30 : i6
    %c-1022_i11 = hw.constant -1022 : i11
    %c-3_i5 = hw.constant -3 : i5
    %c-7_i5 = hw.constant -7 : i5
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
    %c-4_i5 = hw.constant -4 : i5
    %c-8_i5 = hw.constant -8 : i5
    %c295027_i22 = hw.constant 295027 : i22
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
    %c3503_i15 = hw.constant 3503 : i15
    %c65967_i20 = hw.constant 65967 : i20
    %c-3793_i15 = hw.constant -3793 : i15
    %c-7889_i15 = hw.constant -7889 : i15
    %c-11985_i15 = hw.constant -11985 : i15
    %c-16081_i15 = hw.constant -16081 : i15
    %c8495_i15 = hw.constant 8495 : i15
    %c12591_i15 = hw.constant 12591 : i15
    %c4399_i15 = hw.constant 4399 : i15
    %c303_i15 = hw.constant 303 : i15
    %c1327_i15 = hw.constant 1327 : i15
    %c3375_i15 = hw.constant 3375 : i15
    %c65839_i20 = hw.constant 65839 : i20
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
    %c-4_i3 = hw.constant -4 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c1_i5 = hw.constant 1 : i5
    %c-11_i5 = hw.constant -11 : i5
    %c5_i5 = hw.constant 5 : i5
    %c9_i5 = hw.constant 9 : i5
    %c8_i5 = hw.constant 8 : i5
    %c7_i5 = hw.constant 7 : i5
    %c10_i5 = hw.constant 10 : i5
    %c3_i5 = hw.constant 3 : i5
    %c-12_i5 = hw.constant -12 : i5
    %c-14_i5 = hw.constant -14 : i5
    %c-15_i5 = hw.constant -15 : i5
    %c13_i5 = hw.constant 13 : i5
    %c-16_i5 = hw.constant -16 : i5
    %c15_i5 = hw.constant 15 : i5
    %c14_i5 = hw.constant 14 : i5
    %c6_i5 = hw.constant 6 : i5
    %c4_i5 = hw.constant 4 : i5
    %c12_i5 = hw.constant 12 : i5
    %c11_i5 = hw.constant 11 : i5
    %c2_i5 = hw.constant 2 : i5
    %true = hw.constant true
    %c-10_i5 = hw.constant -10 : i5
    %c-2_i2 = hw.constant -2 : i2
    %c3_i4 = hw.constant 3 : i4
    %c0_i4 = hw.constant 0 : i4
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
    %c1_i2 = hw.constant 1 : i2
    %c30_i6 = hw.constant 30 : i6
    %c0_i54 = hw.constant 0 : i54
    %c0_i57 = hw.constant 0 : i57
    %c0_i56 = hw.constant 0 : i56
    %c0_i58 = hw.constant 0 : i58
    %c0_i55 = hw.constant 0 : i55
    %c0_i2 = hw.constant 0 : i2
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %c0_i5 = hw.constant 0 : i5
    %c0_i64 = hw.constant 0 : i64
    %c2_i64 = hw.constant 2 : i64
    %c321_i12 = hw.constant 321 : i12
    %c833_i12 = hw.constant 833 : i12
    %drop_r = seq.firreg %1048 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %stall_r = seq.firreg %1048 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %0 = comb.or bin %drop_r, %io_id2df_drop {sv.namehint = "drop_in"} : i1
    %1 = comb.xor bin %io_id2df_drop, %true {sv.namehint = "_io_if2id_stall_T"} : i1
    %2 = comb.and bin %stall_r, %1 {sv.namehint = "_io_if2id_stall_T_1"} : i1
    %3 = comb.or bin %2, %io_id2df_stall {sv.namehint = "io_if2id_stall"} : i1
    %inst_r = seq.firreg %1158 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 2 : ui64, sv.namehint = "inst_r"} : i32
    %pc_r = seq.firreg %1160 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 34 : ui64, sv.namehint = "pc_r"} : i64
    %excep_r_cause = seq.firreg %1165 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 98 : ui64, sv.namehint = "excep_r_cause"} : i64
    %excep_r_tval = seq.firreg %1164 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 162 : ui64, sv.namehint = "excep_r_tval"} : i64
    %excep_r_en = seq.firreg %1163 clock %clock reset sync %reset, %false {firrtl.random_init_start = 226 : ui64, sv.namehint = "excep_r_en"} : i1
    %excep_r_pc = seq.firreg %1162 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 227 : ui64, sv.namehint = "excep_r_pc"} : i64
    %excep_r_etype = seq.firreg %1161 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 291 : ui64, sv.namehint = "excep_r_etype"} : i2
    %ctrl_r_aluOp = seq.firreg %1175 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 293 : ui64, sv.namehint = "ctrl_r_aluOp"} : i5
    %ctrl_r_aluWidth = seq.firreg %1174 clock %clock reset sync %reset, %false {firrtl.random_init_start = 298 : ui64, sv.namehint = "ctrl_r_aluWidth"} : i1
    %ctrl_r_dcMode = seq.firreg %1172 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 299 : ui64, sv.namehint = "ctrl_r_dcMode"} : i5
    %ctrl_r_writeRegEn = seq.firreg %1171 clock %clock reset sync %reset, %false {firrtl.random_init_start = 304 : ui64, sv.namehint = "ctrl_r_writeRegEn"} : i1
    %ctrl_r_writeCSREn = seq.firreg %1169 clock %clock reset sync %reset, %false {firrtl.random_init_start = 305 : ui64, sv.namehint = "ctrl_r_writeCSREn"} : i1
    %ctrl_r_brType = seq.firreg %1166 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 306 : ui64, sv.namehint = "ctrl_r_brType"} : i3
    %rs1_r = seq.firreg %1127 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 309 : ui64, sv.namehint = "rs1_r"} : i5
    %rrs1_r = seq.firreg %1177 clock %clock reset sync %reset, %false {firrtl.random_init_start = 314 : ui64, sv.namehint = "rrs1_r"} : i1
    %rs1_d_r = seq.firreg %1152 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 315 : ui64, sv.namehint = "rs1_d_r"} : i64
    %rs2_r = seq.firreg %1110 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 379 : ui64, sv.namehint = "rs2_r"} : i12
    %rrs2_r = seq.firreg %1179 clock %clock reset sync %reset, %false {firrtl.random_init_start = 391 : ui64, sv.namehint = "rrs2_r"} : i1
    %rs2_d_r = seq.firreg %1147 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 392 : ui64, sv.namehint = "rs2_d_r"} : i64
    %dst_r = seq.firreg %1132 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 456 : ui64, sv.namehint = "dst_r"} : i5
    %dst_d_r = seq.firreg %1154 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 461 : ui64, sv.namehint = "dst_d_r"} : i64
    %jmp_type_r = seq.firreg %1180 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 525 : ui64, sv.namehint = "jmp_type_r"} : i2
    %special_r = seq.firreg %1181 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 527 : ui64, sv.namehint = "special_r"} : i2
    %swap_r = seq.firreg %1183 clock %clock reset sync %reset, %c0_i6 {firrtl.random_init_start = 529 : ui64, sv.namehint = "swap_r"} : i6
    %indi_r = seq.firreg %1182 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 535 : ui64, sv.namehint = "indi_r"} : i2
    %recov_r = seq.firreg %1184 clock %clock reset sync %reset, %false {firrtl.random_init_start = 537 : ui64, sv.namehint = "recov_r"} : i1
    %valid_r = seq.firreg %1193 clock %clock reset sync %reset, %false {firrtl.random_init_start = 538 : ui64, sv.namehint = "valid_r"} : i1
    %4 = comb.and bin %io_id2df_ready, %valid_r {sv.namehint = "hs_out"} : i1
    %5 = comb.and bin %1189, %io_if2id_valid {sv.namehint = "hs_in"} : i1
    %6 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %7 = comb.icmp bin eq %6, %c55_i7 {sv.namehint = "_instType_T_1"} : i7
    %8 = comb.icmp bin eq %6, %c23_i7 {sv.namehint = "_instType_T_3"} : i7
    %9 = comb.icmp bin eq %6, %c-17_i7 {sv.namehint = "_instType_T_5"} : i7
    %10 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %11 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %12 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %13 = comb.concat %11, %12 : i3, i7
    %14 = comb.icmp bin eq %13, %c103_i10 {sv.namehint = "_instType_T_7"} : i10
    %15 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %16 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %17 = comb.concat %15, %16 : i3, i7
    %18 = comb.icmp bin eq %17, %c99_i10 {sv.namehint = "_instType_T_9"} : i10
    %19 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %20 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %21 = comb.concat %19, %20 : i3, i7
    %22 = comb.icmp bin eq %21, %c227_i10 {sv.namehint = "_instType_T_11"} : i10
    %23 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %24 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %25 = comb.concat %23, %24 : i3, i7
    %26 = comb.icmp bin eq %25, %c-413_i10 {sv.namehint = "_instType_T_13"} : i10
    %27 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %28 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %29 = comb.concat %27, %28 : i3, i7
    %30 = comb.icmp bin eq %29, %c-285_i10 {sv.namehint = "_instType_T_15"} : i10
    %31 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %32 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %33 = comb.concat %31, %32 : i3, i7
    %34 = comb.icmp bin eq %33, %c-157_i10 {sv.namehint = "_instType_T_17"} : i10
    %35 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %36 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %37 = comb.concat %35, %36 : i3, i7
    %38 = comb.icmp bin eq %37, %c-29_i10 {sv.namehint = "_instType_T_745"} : i10
    %39 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %40 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %41 = comb.concat %39, %40 : i3, i7
    %42 = comb.icmp bin eq %41, %c3_i10 {sv.namehint = "_instType_T_21"} : i10
    %43 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %44 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %45 = comb.concat %43, %44 : i3, i7
    %46 = comb.icmp bin eq %45, %c131_i10 {sv.namehint = "_instType_T_23"} : i10
    %47 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %48 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %49 = comb.concat %47, %48 : i3, i7
    %50 = comb.icmp bin eq %49, %c259_i10 {sv.namehint = "_instType_T_25"} : i10
    %51 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %52 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %53 = comb.concat %51, %52 : i3, i7
    %54 = comb.icmp bin eq %53, %c387_i10 {sv.namehint = "_instType_T_27"} : i10
    %55 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %56 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %57 = comb.concat %55, %56 : i3, i7
    %58 = comb.icmp bin eq %57, %c-509_i10 {sv.namehint = "_instType_T_29"} : i10
    %59 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %60 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %61 = comb.concat %59, %60 : i3, i7
    %62 = comb.icmp bin eq %61, %c-381_i10 {sv.namehint = "_instType_T_31"} : i10
    %63 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %64 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %65 = comb.concat %63, %64 : i3, i7
    %66 = comb.icmp bin eq %65, %c-253_i10 {sv.namehint = "_instType_T_33"} : i10
    %67 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %68 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %69 = comb.concat %67, %68 : i3, i7
    %70 = comb.icmp bin eq %69, %c35_i10 {sv.namehint = "_instType_T_35"} : i10
    %71 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %72 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %73 = comb.concat %71, %72 : i3, i7
    %74 = comb.icmp bin eq %73, %c163_i10 {sv.namehint = "_instType_T_37"} : i10
    %75 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %76 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %77 = comb.concat %75, %76 : i3, i7
    %78 = comb.icmp bin eq %77, %c291_i10 {sv.namehint = "_instType_T_39"} : i10
    %79 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %80 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %81 = comb.concat %79, %80 : i3, i7
    %82 = comb.icmp bin eq %81, %c419_i10 {sv.namehint = "_instType_T_41"} : i10
    %83 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %84 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %85 = comb.concat %83, %84 : i3, i7
    %86 = comb.icmp bin eq %85, %c19_i10 {sv.namehint = "_instType_T_43"} : i10
    %87 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %88 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %89 = comb.concat %87, %88 : i3, i7
    %90 = comb.icmp bin eq %89, %c275_i10 {sv.namehint = "_instType_T_45"} : i10
    %91 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %92 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %93 = comb.concat %91, %92 : i3, i7
    %94 = comb.icmp bin eq %93, %c403_i10 {sv.namehint = "_instType_T_47"} : i10
    %95 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %96 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %97 = comb.concat %95, %96 : i3, i7
    %98 = comb.icmp bin eq %97, %c-493_i10 {sv.namehint = "_instType_T_49"} : i10
    %99 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %100 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %101 = comb.concat %99, %100 : i3, i7
    %102 = comb.icmp bin eq %101, %c-237_i10 {sv.namehint = "_instType_T_51"} : i10
    %103 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %104 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %105 = comb.concat %103, %104 : i3, i7
    %106 = comb.icmp bin eq %105, %c-109_i10 {sv.namehint = "_instType_T_53"} : i10
    %107 = comb.extract %io_if2id_inst from 26 {sv.namehint = "_instType_T_58"} : (i32) -> i6
    %108 = comb.extract %io_if2id_inst from 26 : (i32) -> i6
    %109 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %110 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %111 = comb.concat %108, %109, %110 : i6, i3, i7
    %112 = comb.icmp bin eq %111, %c147_i16 {sv.namehint = "_instType_T_55"} : i16
    %113 = comb.extract %io_if2id_inst from 26 : (i32) -> i6
    %114 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %115 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %116 = comb.concat %113, %114, %115 : i6, i3, i7
    %117 = comb.icmp bin eq %116, %c659_i16 {sv.namehint = "_instType_T_57"} : i16
    %118 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %119 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %120 = comb.concat %107, %118, %119 : i6, i3, i7
    %121 = comb.icmp bin eq %120, %c17043_i16 {sv.namehint = "_instType_T_59"} : i16
    %122 = comb.extract %io_if2id_inst from 25 {sv.namehint = "_instType_T_122"} : (i32) -> i7
    %123 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %124 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %125 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %126 = comb.concat %123, %124, %125 : i7, i3, i7
    %127 = comb.icmp bin eq %126, %c51_i17 {sv.namehint = "_instType_T_61"} : i17
    %128 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %129 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %130 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %131 = comb.concat %128, %129, %130 : i7, i3, i7
    %132 = comb.icmp bin eq %131, %c32819_i17 {sv.namehint = "_instType_T_63"} : i17
    %133 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %134 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %135 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %136 = comb.concat %133, %134, %135 : i7, i3, i7
    %137 = comb.icmp bin eq %136, %c179_i17 {sv.namehint = "_instType_T_65"} : i17
    %138 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %139 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %140 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %141 = comb.concat %138, %139, %140 : i7, i3, i7
    %142 = comb.icmp bin eq %141, %c307_i17 {sv.namehint = "_instType_T_67"} : i17
    %143 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %144 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %145 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %146 = comb.concat %143, %144, %145 : i7, i3, i7
    %147 = comb.icmp bin eq %146, %c435_i17 {sv.namehint = "_instType_T_69"} : i17
    %148 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %149 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %150 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %151 = comb.concat %148, %149, %150 : i7, i3, i7
    %152 = comb.icmp bin eq %151, %c563_i17 {sv.namehint = "_instType_T_71"} : i17
    %153 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %154 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %155 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %156 = comb.concat %153, %154, %155 : i7, i3, i7
    %157 = comb.icmp bin eq %156, %c691_i17 {sv.namehint = "_instType_T_73"} : i17
    %158 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %159 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %160 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %161 = comb.concat %158, %159, %160 : i7, i3, i7
    %162 = comb.icmp bin eq %161, %c33459_i17 {sv.namehint = "_instType_T_75"} : i17
    %163 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %164 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %165 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %166 = comb.concat %163, %164, %165 : i7, i3, i7
    %167 = comb.icmp bin eq %166, %c819_i17 {sv.namehint = "_instType_T_77"} : i17
    %168 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %169 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %170 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %171 = comb.concat %168, %169, %170 : i7, i3, i7
    %172 = comb.icmp bin eq %171, %c947_i17 {sv.namehint = "_instType_T_79"} : i17
    %173 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %174 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %175 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %176 = comb.concat %173, %174, %175 : i7, i3, i7
    %177 = comb.icmp bin eq %176, %c1075_i17 {sv.namehint = "_instType_T_81"} : i17
    %178 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %179 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %180 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %181 = comb.concat %178, %179, %180 : i7, i3, i7
    %182 = comb.icmp bin eq %181, %c1203_i17 {sv.namehint = "_instType_T_83"} : i17
    %183 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %184 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %185 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %186 = comb.concat %183, %184, %185 : i7, i3, i7
    %187 = comb.icmp bin eq %186, %c1459_i17 {sv.namehint = "_instType_T_85"} : i17
    %188 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %189 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %190 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %191 = comb.concat %188, %189, %190 : i7, i3, i7
    %192 = comb.icmp bin eq %191, %c1331_i17 {sv.namehint = "_instType_T_87"} : i17
    %193 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %194 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %195 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %196 = comb.concat %193, %194, %195 : i7, i3, i7
    %197 = comb.icmp bin eq %196, %c1587_i17 {sv.namehint = "_instType_T_89"} : i17
    %198 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %199 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %200 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %201 = comb.concat %198, %199, %200 : i7, i3, i7
    %202 = comb.icmp bin eq %201, %c1715_i17 {sv.namehint = "_instType_T_91"} : i17
    %203 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %204 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %205 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %206 = comb.concat %203, %204, %205 : i7, i3, i7
    %207 = comb.icmp bin eq %206, %c1843_i17 {sv.namehint = "_instType_T_93"} : i17
    %208 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %209 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %210 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %211 = comb.concat %208, %209, %210 : i7, i3, i7
    %212 = comb.icmp bin eq %211, %c1971_i17 {sv.namehint = "_instType_T_95"} : i17
    %213 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %214 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %215 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %216 = comb.concat %213, %214, %215 : i7, i3, i7
    %217 = comb.icmp bin eq %216, %c1083_i17 {sv.namehint = "_instType_T_97"} : i17
    %218 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %219 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %220 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %221 = comb.concat %218, %219, %220 : i7, i3, i7
    %222 = comb.icmp bin eq %221, %c1595_i17 {sv.namehint = "_instType_T_99"} : i17
    %223 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %224 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %225 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %226 = comb.concat %223, %224, %225 : i7, i3, i7
    %227 = comb.icmp bin eq %226, %c1723_i17 {sv.namehint = "_instType_T_101"} : i17
    %228 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %229 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %230 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %231 = comb.concat %228, %229, %230 : i7, i3, i7
    %232 = comb.icmp bin eq %231, %c1851_i17 {sv.namehint = "_instType_T_103"} : i17
    %233 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %234 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %235 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %236 = comb.concat %233, %234, %235 : i7, i3, i7
    %237 = comb.icmp bin eq %236, %c1979_i17 {sv.namehint = "_instType_T_105"} : i17
    %238 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %239 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %240 = comb.concat %238, %239 : i3, i7
    %241 = comb.icmp bin eq %240, %c27_i10 {sv.namehint = "_instType_T_107"} : i10
    %242 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %243 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %244 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %245 = comb.concat %242, %243, %244 : i7, i3, i7
    %246 = comb.icmp bin eq %245, %c155_i17 {sv.namehint = "_instType_T_109"} : i17
    %247 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %248 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %249 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %250 = comb.concat %247, %248, %249 : i7, i3, i7
    %251 = comb.icmp bin eq %250, %c667_i17 {sv.namehint = "_instType_T_111"} : i17
    %252 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %253 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %254 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %255 = comb.concat %252, %253, %254 : i7, i3, i7
    %256 = comb.icmp bin eq %255, %c33435_i17 {sv.namehint = "_instType_T_113"} : i17
    %257 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %258 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %259 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %260 = comb.concat %257, %258, %259 : i7, i3, i7
    %261 = comb.icmp bin eq %260, %c59_i17 {sv.namehint = "_instType_T_115"} : i17
    %262 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %263 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %264 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %265 = comb.concat %262, %263, %264 : i7, i3, i7
    %266 = comb.icmp bin eq %265, %c32827_i17 {sv.namehint = "_instType_T_117"} : i17
    %267 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %268 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %269 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %270 = comb.concat %267, %268, %269 : i7, i3, i7
    %271 = comb.icmp bin eq %270, %c187_i17 {sv.namehint = "_instType_T_119"} : i17
    %272 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %273 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %274 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %275 = comb.concat %272, %273, %274 : i7, i3, i7
    %276 = comb.icmp bin eq %275, %c699_i17 {sv.namehint = "_instType_T_121"} : i17
    %277 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %278 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %279 = comb.concat %122, %277, %278 : i7, i3, i7
    %280 = comb.icmp bin eq %279, %c33467_i17 {sv.namehint = "_instType_T_411"} : i17
    %281 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %282 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %283 = comb.concat %281, %282 : i3, i7
    %284 = comb.icmp bin eq %283, %c243_i10 {sv.namehint = "_instType_T_125"} : i10
    %285 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %286 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %287 = comb.concat %285, %286 : i3, i7
    %288 = comb.icmp bin eq %287, %c371_i10 {sv.namehint = "_instType_T_127"} : i10
    %289 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %290 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %291 = comb.concat %289, %290 : i3, i7
    %292 = comb.icmp bin eq %291, %c499_i10 {sv.namehint = "_instType_T_129"} : i10
    %293 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %294 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %295 = comb.concat %293, %294 : i3, i7
    %296 = comb.icmp bin eq %295, %c-269_i10 {sv.namehint = "_instType_T_131"} : i10
    %297 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %298 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %299 = comb.concat %297, %298 : i3, i7
    %300 = comb.icmp bin eq %299, %c-141_i10 {sv.namehint = "_instType_T_133"} : i10
    %301 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %302 = comb.concat %10, %301 : i3, i7
    %303 = comb.icmp bin eq %302, %c-13_i10 {sv.namehint = "_instType_T_969"} : i10
    %304 = comb.extract %io_if2id_inst from 27 {sv.namehint = "_indi_r_T_6"} : (i32) -> i5
    %305 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %306 = comb.extract %io_if2id_inst from 20 : (i32) -> i5
    %307 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %308 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %309 = comb.concat %305, %306, %307, %308 : i5, i5, i3, i7
    %310 = comb.icmp bin eq %309, %c65839_i20 {sv.namehint = "_instType_T_137"} : i20
    %311 = comb.extract %io_if2id_inst from 27 {sv.namehint = "_indi_r_T_2"} : (i32) -> i5
    %312 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %313 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %314 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %315 = comb.concat %312, %313, %314 : i5, i3, i7
    %316 = comb.icmp bin eq %315, %c3375_i15 {sv.namehint = "_instType_T_139"} : i15
    %317 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %318 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %319 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %320 = comb.concat %317, %318, %319 : i5, i3, i7
    %321 = comb.icmp bin eq %320, %c1327_i15 {sv.namehint = "_instType_T_141"} : i15
    %322 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %323 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %324 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %325 = comb.concat %322, %323, %324 : i5, i3, i7
    %326 = comb.icmp bin eq %325, %c303_i15 {sv.namehint = "_instType_T_143"} : i15
    %327 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %328 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %329 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %330 = comb.concat %327, %328, %329 : i5, i3, i7
    %331 = comb.icmp bin eq %330, %c4399_i15 {sv.namehint = "_instType_T_145"} : i15
    %332 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %333 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %334 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %335 = comb.concat %332, %333, %334 : i5, i3, i7
    %336 = comb.icmp bin eq %335, %c12591_i15 {sv.namehint = "_instType_T_147"} : i15
    %337 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %338 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %339 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %340 = comb.concat %337, %338, %339 : i5, i3, i7
    %341 = comb.icmp bin eq %340, %c8495_i15 {sv.namehint = "_instType_T_149"} : i15
    %342 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %343 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %344 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %345 = comb.concat %342, %343, %344 : i5, i3, i7
    %346 = comb.icmp bin eq %345, %c-16081_i15 {sv.namehint = "_instType_T_151"} : i15
    %347 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %348 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %349 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %350 = comb.concat %347, %348, %349 : i5, i3, i7
    %351 = comb.icmp bin eq %350, %c-11985_i15 {sv.namehint = "_instType_T_153"} : i15
    %352 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %353 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %354 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %355 = comb.concat %352, %353, %354 : i5, i3, i7
    %356 = comb.icmp bin eq %355, %c-7889_i15 {sv.namehint = "_instType_T_155"} : i15
    %357 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %358 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %359 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %360 = comb.concat %357, %358, %359 : i5, i3, i7
    %361 = comb.icmp bin eq %360, %c-3793_i15 {sv.namehint = "_instType_T_157"} : i15
    %362 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %363 = comb.extract %io_if2id_inst from 20 : (i32) -> i5
    %364 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %365 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %366 = comb.concat %362, %363, %364, %365 : i5, i5, i3, i7
    %367 = comb.icmp bin eq %366, %c65967_i20 {sv.namehint = "_instType_T_159"} : i20
    %368 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %369 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %370 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %371 = comb.concat %368, %369, %370 : i5, i3, i7
    %372 = comb.icmp bin eq %371, %c3503_i15 {sv.namehint = "_instType_T_161"} : i15
    %373 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %374 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %375 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %376 = comb.concat %373, %374, %375 : i5, i3, i7
    %377 = comb.icmp bin eq %376, %c1455_i15 {sv.namehint = "_instType_T_163"} : i15
    %378 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %379 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %380 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %381 = comb.concat %378, %379, %380 : i5, i3, i7
    %382 = comb.icmp bin eq %381, %c431_i15 {sv.namehint = "_instType_T_165"} : i15
    %383 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %384 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %385 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %386 = comb.concat %383, %384, %385 : i5, i3, i7
    %387 = comb.icmp bin eq %386, %c8623_i15 {sv.namehint = "_instType_T_167"} : i15
    %388 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %389 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %390 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %391 = comb.concat %388, %389, %390 : i5, i3, i7
    %392 = comb.icmp bin eq %391, %c4527_i15 {sv.namehint = "_instType_T_169"} : i15
    %393 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %394 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %395 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %396 = comb.concat %393, %394, %395 : i5, i3, i7
    %397 = comb.icmp bin eq %396, %c12719_i15 {sv.namehint = "_instType_T_171"} : i15
    %398 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %399 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %400 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %401 = comb.concat %398, %399, %400 : i5, i3, i7
    %402 = comb.icmp bin eq %401, %c-15953_i15 {sv.namehint = "_instType_T_173"} : i15
    %403 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %404 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %405 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %406 = comb.concat %403, %404, %405 : i5, i3, i7
    %407 = comb.icmp bin eq %406, %c-11857_i15 {sv.namehint = "_instType_T_175"} : i15
    %408 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %409 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %410 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %411 = comb.concat %408, %409, %410 : i5, i3, i7
    %412 = comb.icmp bin eq %411, %c-7761_i15 {sv.namehint = "_instType_T_177"} : i15
    %413 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %414 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %415 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %416 = comb.concat %413, %414, %415 : i5, i3, i7
    %417 = comb.icmp bin eq %416, %c-3665_i15 {sv.namehint = "_instType_T_571"} : i15
    %418 = comb.extract %io_if2id_inst from 28 {sv.namehint = "_instType_T_180"} : (i32) -> i4
    %419 = comb.extract %io_if2id_inst from 0 : (i32) -> i20
    %420 = comb.concat %418, %419 : i4, i20
    %421 = comb.icmp bin eq %420, %c15_i24 {sv.namehint = "_instType_T_181"} : i24
    %422 = comb.icmp bin eq %io_if2id_inst, %c4111_i32 {sv.namehint = "_instType_T_183"} : i32
    %423 = comb.extract %io_if2id_inst from 25 {sv.namehint = "_instType_T_184"} : (i32) -> i7
    %424 = comb.extract %io_if2id_inst from 25 : (i32) -> i7
    %425 = comb.extract %io_if2id_inst from 0 : (i32) -> i15
    %426 = comb.concat %424, %425 : i7, i15
    %427 = comb.icmp bin eq %426, %c295027_i22 {sv.namehint = "_instType_T_185"} : i22
    %428 = comb.icmp bin eq %io_if2id_inst, %c273678451_i32 {sv.namehint = "_instType_T_187"} : i32
    %429 = comb.icmp bin eq %io_if2id_inst, %c107_i32 {sv.namehint = "_instType_T_189"} : i32
    %430 = comb.or bin %421, %422, %427, %428, %429 : i1
    %431 = comb.mux bin %430, %c0_i3, %c-1_i3 {sv.namehint = "_instType_T_194"} : i3
    %432 = comb.or bin %377, %382, %387, %392, %397, %402, %407, %412, %417 : i1
    %433 = comb.or bin %310, %316, %321, %326, %331, %336, %341, %346, %351, %356, %361, %367, %372, %432 : i1
    %434 = comb.mux bin %433, %c1_i3, %431 {sv.namehint = "_instType_T_216"} : i3
    %435 = comb.or bin %284, %288, %292, %296, %300, %303 : i1
    %436 = comb.mux bin %435, %c2_i3, %434 {sv.namehint = "_instType_T_222"} : i3
    %437 = comb.or bin %261, %266, %271, %276, %280 : i1
    %438 = comb.mux bin %437, %c1_i3, %436 {sv.namehint = "_instType_T_227"} : i3
    %439 = comb.or bin %241, %246, %251, %256 : i1
    %440 = comb.mux bin %439, %c2_i3, %438 {sv.namehint = "_instType_T_231"} : i3
    %441 = comb.or bin %127, %132, %137, %142, %147, %152, %157, %162, %167, %172, %177, %182, %187, %192, %197, %202, %207, %212, %217, %222, %227, %232, %237 : i1
    %442 = comb.mux bin %441, %c1_i3, %440 {sv.namehint = "_instType_T_254"} : i3
    %443 = comb.or bin %86, %90, %94, %98, %102, %106, %112, %117, %121 : i1
    %444 = comb.mux bin %443, %c2_i3, %442 {sv.namehint = "_instType_T_263"} : i3
    %445 = comb.or bin %70, %74, %78, %82 : i1
    %446 = comb.mux bin %445, %c3_i3, %444 {sv.namehint = "_instType_T_267"} : i3
    %447 = comb.or bin %42, %46, %50, %54, %58, %62, %66 : i1
    %448 = comb.mux bin %447, %c2_i3, %446 {sv.namehint = "_instType_T_274"} : i3
    %449 = comb.or bin %18, %22, %26, %30, %34, %38 : i1
    %450 = comb.mux bin %449, %c-4_i3, %448 {sv.namehint = "_instType_T_280"} : i3
    %451 = comb.mux bin %14, %c2_i3, %450 {sv.namehint = "_instType_T_281"} : i3
    %452 = comb.mux bin %9, %c-2_i3, %451 {sv.namehint = "_instType_T_282"} : i3
    %453 = comb.or bin %7, %8 : i1
    %454 = comb.mux bin %453, %c-3_i3, %452 {sv.namehint = "dType"} : i3
    %455 = comb.concat %c0_i4, %433 {sv.namehint = "_instType_T_310"} : i4, i1
    %456 = comb.mux bin %303, %c-11_i5, %455 {sv.namehint = "_instType_T_311"} : i5
    %457 = comb.mux bin %300, %c5_i5, %456 {sv.namehint = "_instType_T_312"} : i5
    %458 = comb.mux bin %296, %c1_i5, %457 {sv.namehint = "_instType_T_313"} : i5
    %459 = comb.mux bin %292, %c-11_i5, %458 {sv.namehint = "_instType_T_314"} : i5
    %460 = comb.mux bin %288, %c5_i5, %459 {sv.namehint = "_instType_T_315"} : i5
    %461 = comb.mux bin %284, %c1_i5, %460 {sv.namehint = "_instType_T_316"} : i5
    %462 = comb.mux bin %280, %c9_i5, %461 {sv.namehint = "_instType_T_317"} : i5
    %463 = comb.mux bin %276, %c8_i5, %462 {sv.namehint = "_instType_T_318"} : i5
    %464 = comb.mux bin %271, %c7_i5, %463 {sv.namehint = "_instType_T_319"} : i5
    %465 = comb.mux bin %266, %c10_i5, %464 {sv.namehint = "_instType_T_320"} : i5
    %466 = comb.mux bin %261, %c3_i5, %465 {sv.namehint = "_instType_T_321"} : i5
    %467 = comb.mux bin %256, %c9_i5, %466 {sv.namehint = "_instType_T_322"} : i5
    %468 = comb.mux bin %251, %c8_i5, %467 {sv.namehint = "_instType_T_323"} : i5
    %469 = comb.mux bin %246, %c7_i5, %468 {sv.namehint = "_instType_T_324"} : i5
    %470 = comb.mux bin %241, %c3_i5, %469 {sv.namehint = "_instType_T_325"} : i5
    %471 = comb.mux bin %237, %c-12_i5, %470 {sv.namehint = "_instType_T_326"} : i5
    %472 = comb.mux bin %232, %c-13_i5, %471 {sv.namehint = "_instType_T_327"} : i5
    %473 = comb.mux bin %227, %c-14_i5, %472 {sv.namehint = "_instType_T_328"} : i5
    %474 = comb.mux bin %222, %c-15_i5, %473 {sv.namehint = "_instType_T_329"} : i5
    %475 = comb.mux bin %217, %c13_i5, %474 {sv.namehint = "_instType_T_330"} : i5
    %476 = comb.mux bin %212, %c-12_i5, %475 {sv.namehint = "_instType_T_331"} : i5
    %477 = comb.mux bin %207, %c-13_i5, %476 {sv.namehint = "_instType_T_332"} : i5
    %478 = comb.mux bin %202, %c-14_i5, %477 {sv.namehint = "_instType_T_333"} : i5
    %479 = comb.mux bin %197, %c-15_i5, %478 {sv.namehint = "_instType_T_334"} : i5
    %480 = comb.mux bin %192, %c-16_i5, %479 {sv.namehint = "_instType_T_335"} : i5
    %481 = comb.mux bin %187, %c15_i5, %480 {sv.namehint = "_instType_T_336"} : i5
    %482 = comb.mux bin %182, %c14_i5, %481 {sv.namehint = "_instType_T_337"} : i5
    %483 = comb.mux bin %177, %c13_i5, %482 {sv.namehint = "_instType_T_338"} : i5
    %484 = comb.mux bin %172, %c6_i5, %483 {sv.namehint = "_instType_T_339"} : i5
    %485 = comb.mux bin %167, %c5_i5, %484 {sv.namehint = "_instType_T_340"} : i5
    %486 = comb.mux bin %162, %c9_i5, %485 {sv.namehint = "_instType_T_341"} : i5
    %487 = comb.mux bin %157, %c8_i5, %486 {sv.namehint = "_instType_T_342"} : i5
    %488 = comb.mux bin %152, %c4_i5, %487 {sv.namehint = "_instType_T_343"} : i5
    %489 = comb.mux bin %147, %c12_i5, %488 {sv.namehint = "_instType_T_344"} : i5
    %490 = comb.mux bin %142, %c11_i5, %489 {sv.namehint = "_instType_T_345"} : i5
    %491 = comb.mux bin %137, %c7_i5, %490 {sv.namehint = "_instType_T_346"} : i5
    %492 = comb.mux bin %132, %c10_i5, %491 {sv.namehint = "_instType_T_347"} : i5
    %493 = comb.mux bin %127, %c3_i5, %492 {sv.namehint = "_instType_T_348"} : i5
    %494 = comb.mux bin %121, %c9_i5, %493 {sv.namehint = "_instType_T_349"} : i5
    %495 = comb.mux bin %117, %c8_i5, %494 {sv.namehint = "_instType_T_350"} : i5
    %496 = comb.mux bin %112, %c7_i5, %495 {sv.namehint = "_instType_T_351"} : i5
    %497 = comb.mux bin %106, %c6_i5, %496 {sv.namehint = "_instType_T_352"} : i5
    %498 = comb.mux bin %102, %c5_i5, %497 {sv.namehint = "_instType_T_353"} : i5
    %499 = comb.mux bin %98, %c4_i5, %498 {sv.namehint = "_instType_T_354"} : i5
    %500 = comb.mux bin %94, %c12_i5, %499 {sv.namehint = "_instType_T_355"} : i5
    %501 = comb.mux bin %90, %c11_i5, %500 {sv.namehint = "_instType_T_356"} : i5
    %502 = comb.or bin %42, %46, %50, %54, %58, %62, %66, %70, %74, %78, %82, %86 : i1
    %503 = comb.mux bin %502, %c3_i5, %501 {sv.namehint = "_instType_T_368"} : i5
    %504 = comb.mux bin %449, %c0_i5, %503 {sv.namehint = "_instType_T_374"} : i5
    %505 = comb.or bin %9, %14 : i1
    %506 = comb.mux bin %505, %c2_i5, %504 {sv.namehint = "_instType_T_376"} : i5
    %507 = comb.mux bin %8, %c3_i5, %506 {sv.namehint = "_instType_T_377"} : i5
    %508 = comb.mux bin %7, %c1_i5, %507 {sv.namehint = "instType_1"} : i5
    %509 = comb.or %217, %222, %227, %232, %237, %241, %246, %251, %256, %261, %266, %271, %276, %280 {sv.namehint = "_instType_T_424"} : i1
    %510 = comb.or bin %7, %8, %9, %14, %18, %22, %26, %30, %34, %38, %42, %46, %50, %54, %58, %62, %66, %70, %74, %78, %82, %86, %90, %94, %98, %102, %106, %112, %117, %121, %127, %132, %137, %142, %147, %152, %157, %162, %167, %172, %177, %182, %187, %192, %197, %202, %207, %212 : i1
    %511 = comb.xor %510, %true : i1
    %512 = comb.and %511, %509 {sv.namehint = "instType_2"} : i1
    %513 = comb.mux bin %432, %c15_i5, %c0_i5 {sv.namehint = "_instType_T_485"} : i5
    %514 = comb.mux bin %372, %c11_i5, %513 {sv.namehint = "_instType_T_486"} : i5
    %515 = comb.mux bin %367, %c7_i5, %514 {sv.namehint = "_instType_T_487"} : i5
    %516 = comb.or bin %321, %326, %331, %336, %341, %346, %351, %356, %361 : i1
    %517 = comb.mux bin %516, %c14_i5, %515 {sv.namehint = "_instType_T_496"} : i5
    %518 = comb.mux bin %316, %c10_i5, %517 {sv.namehint = "_instType_T_497"} : i5
    %519 = comb.mux bin %310, %c6_i5, %518 {sv.namehint = "_instType_T_498"} : i5
    %520 = comb.or bin %86, %90, %94, %98, %102, %106, %112, %117, %121, %127, %132, %137, %142, %147, %152, %157, %162, %167, %172, %177, %182, %187, %192, %197, %202, %207, %212, %217, %222, %227, %232, %237, %241, %246, %251, %256, %261, %266, %271, %276, %280, %435 : i1
    %521 = comb.mux bin %520, %c0_i5, %519 {sv.namehint = "_instType_T_545"} : i5
    %522 = comb.mux bin %82, %c11_i5, %521 {sv.namehint = "_instType_T_546"} : i5
    %523 = comb.mux bin %78, %c10_i5, %522 {sv.namehint = "_instType_T_547"} : i5
    %524 = comb.mux bin %74, %c9_i5, %523 {sv.namehint = "_instType_T_548"} : i5
    %525 = comb.mux bin %70, %c8_i5, %524 {sv.namehint = "_instType_T_549"} : i5
    %526 = comb.mux bin %66, %c-10_i5, %525 {sv.namehint = "_instType_T_550"} : i5
    %527 = comb.mux bin %62, %c-11_i5, %526 {sv.namehint = "_instType_T_551"} : i5
    %528 = comb.mux bin %58, %c-12_i5, %527 {sv.namehint = "_instType_T_552"} : i5
    %529 = comb.mux bin %54, %c7_i5, %528 {sv.namehint = "_instType_T_553"} : i5
    %530 = comb.mux bin %50, %c6_i5, %529 {sv.namehint = "_instType_T_554"} : i5
    %531 = comb.mux bin %46, %c5_i5, %530 {sv.namehint = "_instType_T_555"} : i5
    %532 = comb.mux bin %42, %c4_i5, %531 {sv.namehint = "_instType_T_556"} : i5
    %533 = comb.or bin %7, %8, %9, %14, %449 : i1
    %534 = comb.mux bin %533, %c0_i5, %532 {sv.namehint = "instType_3"} : i5
    %535 = comb.or %86, %90, %94, %98, %102, %106, %112, %117, %121, %127, %132, %137, %142, %147, %152, %157, %162, %167, %172, %177, %182, %187, %192, %197, %202, %207, %212, %217, %222, %227, %232, %237, %241, %246, %251, %256, %261, %266, %271, %276, %280, %284, %288, %292, %296, %300, %303, %310, %316, %321, %326, %331, %336, %341, %346, %351, %356, %361, %367, %372, %377, %382, %387, %392, %397, %402, %407, %412, %417 {sv.namehint = "_instType_T_639"} : i1
    %536 = comb.xor %445, %true : i1
    %537 = comb.and %536, %535 {sv.namehint = "_instType_T_643"} : i1
    %538 = comb.or %447, %537 {sv.namehint = "_instType_T_650"} : i1
    %539 = comb.xor %449, %true : i1
    %540 = comb.and %539, %538 {sv.namehint = "_instType_T_656"} : i1
    %541 = comb.or %7, %8, %505, %540 {sv.namehint = "instType_4"} : i1
    %542 = comb.or %9, %14, %18, %22, %26, %30, %34, %38 {sv.namehint = "_instType_T_752"} : i1
    %543 = comb.xor %453, %true : i1
    %544 = comb.and %543, %542 {sv.namehint = "jmp_indi"} : i1
    %545 = comb.or bin %296, %300 : i1
    %546 = comb.or %284, %288, %292, %545, %303 {sv.namehint = "_instType_T_786"} : i1
    %547 = comb.or bin %7, %8, %9, %14, %18, %22, %26, %30, %34, %38, %42, %46, %50, %54, %58, %62, %66, %70, %74, %78, %82, %86, %90, %94, %98, %102, %106, %112, %117, %121, %127, %132, %137, %142, %147, %152, %157, %162, %167, %172, %177, %182, %187, %192, %197, %202, %207, %212, %217, %222, %227, %232, %237, %241, %246, %251, %256, %437 : i1
    %548 = comb.xor %547, %true : i1
    %549 = comb.and %548, %546 {sv.namehint = "instType_6"} : i1
    %550 = comb.or %545, %303 {sv.namehint = "_instType_T_971"} : i1
    %551 = comb.or bin %7, %8, %9, %14, %18, %22, %26, %30, %34, %38, %42, %46, %50, %54, %58, %62, %66, %70, %74, %78, %82, %86, %90, %94, %98, %102, %106, %112, %117, %121, %127, %132, %137, %142, %147, %152, %157, %162, %167, %172, %177, %182, %187, %192, %197, %202, %207, %212, %217, %222, %227, %232, %237, %241, %246, %251, %256, %261, %266, %271, %276, %280, %284, %288, %292 : i1
    %552 = comb.xor %551, %true : i1
    %553 = comb.and %552, %550 {sv.namehint = "instType_8"} : i1
    %554 = comb.extract %io_if2id_inst from 0 {sv.namehint = "inst_c"} : (i32) -> i16
    %555 = comb.extract %io_if2id_inst from 13 {sv.namehint = "_instType_c_T_61"} : (i32) -> i3
    %556 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %557 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %558 = comb.concat %556, %557 : i3, i2
    %559 = comb.icmp bin eq %558, %c0_i5 {sv.namehint = "_instType_c_T_2"} : i5
    %560 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %561 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %562 = comb.concat %560, %561 : i3, i2
    %563 = comb.icmp bin eq %562, %c8_i5 {sv.namehint = "_instType_c_T_4"} : i5
    %564 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %565 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %566 = comb.concat %564, %565 : i3, i2
    %567 = comb.icmp bin eq %566, %c12_i5 {sv.namehint = "_instType_c_T_6"} : i5
    %568 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %569 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %570 = comb.concat %568, %569 : i3, i2
    %571 = comb.icmp bin eq %570, %c-8_i5 {sv.namehint = "_instType_c_T_8"} : i5
    %572 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %573 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %574 = comb.concat %572, %573 : i3, i2
    %575 = comb.icmp bin eq %574, %c-4_i5 {sv.namehint = "_instType_c_T_10"} : i5
    %576 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %577 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %578 = comb.concat %576, %577 : i3, i2
    %579 = comb.icmp bin eq %578, %c1_i5 {sv.namehint = "_instType_c_T_12"} : i5
    %580 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %581 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %582 = comb.concat %580, %581 : i3, i2
    %583 = comb.icmp bin eq %582, %c5_i5 {sv.namehint = "_instType_c_T_14"} : i5
    %584 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %585 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %586 = comb.concat %584, %585 : i3, i2
    %587 = comb.icmp bin eq %586, %c9_i5 {sv.namehint = "_instType_c_T_16"} : i5
    %588 = comb.extract %io_if2id_inst from 13 {sv.namehint = "_instType_c_T_17"} : (i32) -> i3
    %589 = comb.extract %io_if2id_inst from 7 : (i32) -> i5
    %590 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %591 = comb.concat %588, %589, %590 : i3, i5, i2
    %592 = comb.icmp bin eq %591, %c393_i10 {sv.namehint = "_instType_c_T_18"} : i10
    %593 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %594 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %595 = comb.concat %593, %594 : i3, i2
    %596 = comb.icmp bin eq %595, %c13_i5 {sv.namehint = "_instType_c_T_20"} : i5
    %597 = comb.extract %io_if2id_inst from 13 {sv.namehint = "_instType_c_T_25"} : (i32) -> i3
    %598 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %599 = comb.extract %io_if2id_inst from 10 : (i32) -> i2
    %600 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %601 = comb.concat %598, %599, %600 : i3, i2, i2
    %602 = comb.icmp bin eq %601, %c-63_i7 {sv.namehint = "_instType_c_T_22"} : i7
    %603 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %604 = comb.extract %io_if2id_inst from 10 : (i32) -> i2
    %605 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %606 = comb.concat %603, %604, %605 : i3, i2, i2
    %607 = comb.icmp bin eq %606, %c-59_i7 {sv.namehint = "_instType_c_T_24"} : i7
    %608 = comb.extract %io_if2id_inst from 10 : (i32) -> i2
    %609 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %610 = comb.concat %597, %608, %609 : i3, i2, i2
    %611 = comb.icmp bin eq %610, %c-55_i7 {sv.namehint = "_instType_c_T_26"} : i7
    %612 = comb.extract %io_if2id_inst from 10 {sv.namehint = "_instType_c_T_37"} : (i32) -> i6
    %613 = comb.extract %io_if2id_inst from 10 : (i32) -> i6
    %614 = comb.extract %io_if2id_inst from 5 : (i32) -> i2
    %615 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %616 = comb.concat %613, %614, %615 : i6, i2, i2
    %617 = comb.icmp bin eq %616, %c-463_i10 {sv.namehint = "_instType_c_T_28"} : i10
    %618 = comb.extract %io_if2id_inst from 10 : (i32) -> i6
    %619 = comb.extract %io_if2id_inst from 5 : (i32) -> i2
    %620 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %621 = comb.concat %618, %619, %620 : i6, i2, i2
    %622 = comb.icmp bin eq %621, %c-459_i10 {sv.namehint = "_instType_c_T_30"} : i10
    %623 = comb.extract %io_if2id_inst from 10 : (i32) -> i6
    %624 = comb.extract %io_if2id_inst from 5 : (i32) -> i2
    %625 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %626 = comb.concat %623, %624, %625 : i6, i2, i2
    %627 = comb.icmp bin eq %626, %c-455_i10 {sv.namehint = "_instType_c_T_32"} : i10
    %628 = comb.extract %io_if2id_inst from 10 : (i32) -> i6
    %629 = comb.extract %io_if2id_inst from 5 : (i32) -> i2
    %630 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %631 = comb.concat %628, %629, %630 : i6, i2, i2
    %632 = comb.icmp bin eq %631, %c-451_i10 {sv.namehint = "_instType_c_T_34"} : i10
    %633 = comb.extract %io_if2id_inst from 10 : (i32) -> i6
    %634 = comb.extract %io_if2id_inst from 5 : (i32) -> i2
    %635 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %636 = comb.concat %633, %634, %635 : i6, i2, i2
    %637 = comb.icmp bin eq %636, %c-399_i10 {sv.namehint = "_instType_c_T_36"} : i10
    %638 = comb.extract %io_if2id_inst from 5 : (i32) -> i2
    %639 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %640 = comb.concat %612, %638, %639 : i6, i2, i2
    %641 = comb.icmp bin eq %640, %c-395_i10 {sv.namehint = "_instType_c_T_165"} : i10
    %642 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %643 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %644 = comb.concat %642, %643 : i3, i2
    %645 = comb.icmp bin eq %644, %c-11_i5 {sv.namehint = "_instType_c_T_40"} : i5
    %646 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %647 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %648 = comb.concat %646, %647 : i3, i2
    %649 = comb.icmp bin eq %648, %c-7_i5 {sv.namehint = "_instType_c_T_42"} : i5
    %650 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %651 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %652 = comb.concat %650, %651 : i3, i2
    %653 = comb.icmp bin eq %652, %c-3_i5 {sv.namehint = "_instType_c_T_44"} : i5
    %654 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %655 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %656 = comb.concat %654, %655 : i3, i2
    %657 = comb.icmp bin eq %656, %c2_i5 {sv.namehint = "_instType_c_T_46"} : i5
    %658 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %659 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %660 = comb.concat %658, %659 : i3, i2
    %661 = comb.icmp bin eq %660, %c10_i5 {sv.namehint = "_instType_c_T_48"} : i5
    %662 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %663 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %664 = comb.concat %662, %663 : i3, i2
    %665 = comb.icmp bin eq %664, %c14_i5 {sv.namehint = "_instType_c_T_50"} : i5
    %666 = comb.extract %io_if2id_inst from 12 {sv.namehint = "_instType_c_T_55"} : (i32) -> i4
    %667 = comb.extract %io_if2id_inst from 12 : (i32) -> i4
    %668 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %669 = comb.concat %667, %668 : i4, i7
    %670 = comb.icmp bin eq %669, %c-1022_i11 {sv.namehint = "_instType_c_T_52"} : i11
    %671 = comb.extract %io_if2id_inst from 12 {sv.namehint = "_instType_c_T_57"} : (i32) -> i4
    %672 = comb.extract %io_if2id_inst from 12 : (i32) -> i4
    %673 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %674 = comb.concat %672, %673 : i4, i2
    %675 = comb.icmp bin eq %674, %c-30_i6 {sv.namehint = "_instType_c_T_54"} : i6
    %676 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %677 = comb.concat %666, %676 : i4, i7
    %678 = comb.icmp bin eq %677, %c-894_i11 {sv.namehint = "_instType_c_T_56"} : i11
    %679 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %680 = comb.concat %671, %679 : i4, i2
    %681 = comb.icmp bin eq %680, %c-26_i6 {sv.namehint = "_instType_c_T_215"} : i6
    %682 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %683 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %684 = comb.concat %682, %683 : i3, i2
    %685 = comb.icmp bin eq %684, %c-6_i5 {sv.namehint = "_instType_c_T_60"} : i5
    %686 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %687 = comb.concat %555, %686 : i3, i2
    %688 = comb.icmp bin eq %687, %c-2_i5 {sv.namehint = "_instType_c_T_62"} : i5
    %689 = comb.or bin %685, %688 : i1
    %690 = comb.mux bin %689, %c3_i4, %c0_i4 {sv.namehint = "_instType_c_T_64"} : i4
    %691 = comb.or bin %670, %675, %678, %681 : i1
    %692 = comb.mux bin %691, %c1_i4, %690 {sv.namehint = "_instType_c_T_68"} : i4
    %693 = comb.or bin %661, %665 : i1
    %694 = comb.or bin %657, %693 : i1
    %695 = comb.mux bin %694, %c2_i4, %692 {sv.namehint = "_instType_c_T_71"} : i4
    %696 = comb.or bin %649, %653 : i1
    %697 = comb.mux bin %696, %c7_i4, %695 {sv.namehint = "_instType_c_T_73"} : i4
    %698 = comb.mux bin %645, %c-8_i4, %697 {sv.namehint = "_instType_c_T_74"} : i4
    %699 = comb.or bin %617, %622, %627, %632, %637, %641 : i1
    %700 = comb.mux bin %699, %c6_i4, %698 {sv.namehint = "_instType_c_T_80"} : i4
    %701 = comb.or bin %602, %607, %611 : i1
    %702 = comb.mux bin %701, %c7_i4, %700 {sv.namehint = "_instType_c_T_83"} : i4
    %703 = comb.or bin %579, %583, %587, %592, %596 : i1
    %704 = comb.mux bin %703, %c2_i4, %702 {sv.namehint = "_instType_c_T_88"} : i4
    %705 = comb.or bin %571, %575 : i1
    %706 = comb.mux bin %705, %c6_i4, %704 {sv.namehint = "_instType_c_T_90"} : i4
    %707 = comb.or bin %563, %567 : i1
    %708 = comb.mux bin %707, %c5_i4, %706 {sv.namehint = "_instType_c_T_92"} : i4
    %709 = comb.mux bin %559, %c4_i4, %708 {sv.namehint = "instType_c_0"} : i4
    %710 = comb.mux bin %688, %c-3_i4, %c0_i4 {sv.namehint = "_instType_c_T_93"} : i4
    %711 = comb.mux bin %685, %c-4_i4, %710 {sv.namehint = "_instType_c_T_94"} : i4
    %712 = comb.mux bin %691, %c0_i4, %711 {sv.namehint = "_instType_c_T_98"} : i4
    %713 = comb.mux bin %665, %c7_i4, %712 {sv.namehint = "_instType_c_T_99"} : i4
    %714 = comb.mux bin %661, %c6_i4, %713 {sv.namehint = "_instType_c_T_100"} : i4
    %715 = comb.mux bin %657, %c4_i4, %714 {sv.namehint = "_instType_c_T_101"} : i4
    %716 = comb.mux bin %696, %c-5_i4, %715 {sv.namehint = "_instType_c_T_103"} : i4
    %717 = comb.mux bin %645, %c-6_i4, %716 {sv.namehint = "_instType_c_T_104"} : i4
    %718 = comb.mux bin %699, %c0_i4, %717 {sv.namehint = "_instType_c_T_110"} : i4
    %719 = comb.mux bin %611, %c5_i4, %718 {sv.namehint = "_instType_c_T_111"} : i4
    %720 = comb.or bin %602, %607 : i1
    %721 = comb.mux bin %720, %c4_i4, %719 {sv.namehint = "_instType_c_T_113"} : i4
    %722 = comb.mux bin %596, %c-7_i4, %721 {sv.namehint = "_instType_c_T_114"} : i4
    %723 = comb.mux bin %592, %c-8_i4, %722 {sv.namehint = "_instType_c_T_115"} : i4
    %724 = comb.or bin %579, %583, %587 : i1
    %725 = comb.mux bin %724, %c5_i4, %723 {sv.namehint = "_instType_c_T_118"} : i4
    %726 = comb.mux bin %575, %c3_i4, %725 {sv.namehint = "_instType_c_T_119"} : i4
    %727 = comb.mux bin %571, %c2_i4, %726 {sv.namehint = "_instType_c_T_120"} : i4
    %728 = comb.mux bin %567, %c3_i4, %727 {sv.namehint = "_instType_c_T_121"} : i4
    %729 = comb.mux bin %563, %c2_i4, %728 {sv.namehint = "_instType_c_T_122"} : i4
    %730 = comb.mux bin %559, %c1_i4, %729 {sv.namehint = "instType_c_1"} : i4
    %731 = comb.or bin %681, %689 : i1
    %732 = comb.mux bin %731, %c3_i5, %c0_i5 {sv.namehint = "_instType_c_T_125"} : i5
    %733 = comb.or bin %675, %678 : i1
    %734 = comb.mux bin %733, %c2_i5, %732 {sv.namehint = "_instType_c_T_127"} : i5
    %735 = comb.mux bin %670, %c1_i5, %734 {sv.namehint = "_instType_c_T_128"} : i5
    %736 = comb.mux bin %693, %c3_i5, %735 {sv.namehint = "_instType_c_T_130"} : i5
    %737 = comb.mux bin %657, %c7_i5, %736 {sv.namehint = "_instType_c_T_131"} : i5
    %738 = comb.mux bin %696, %c0_i5, %737 {sv.namehint = "_instType_c_T_133"} : i5
    %739 = comb.mux bin %645, %c2_i5, %738 {sv.namehint = "_instType_c_T_134"} : i5
    %740 = comb.mux bin %641, %c3_i5, %739 {sv.namehint = "_instType_c_T_135"} : i5
    %741 = comb.mux bin %637, %c10_i5, %740 {sv.namehint = "_instType_c_T_136"} : i5
    %742 = comb.mux bin %632, %c6_i5, %741 {sv.namehint = "_instType_c_T_137"} : i5
    %743 = comb.mux bin %627, %c5_i5, %742 {sv.namehint = "_instType_c_T_138"} : i5
    %744 = comb.mux bin %622, %c4_i5, %743 {sv.namehint = "_instType_c_T_139"} : i5
    %745 = comb.mux bin %617, %c10_i5, %744 {sv.namehint = "_instType_c_T_140"} : i5
    %746 = comb.mux bin %611, %c6_i5, %745 {sv.namehint = "_instType_c_T_141"} : i5
    %747 = comb.mux bin %607, %c9_i5, %746 {sv.namehint = "_instType_c_T_142"} : i5
    %748 = comb.mux bin %602, %c8_i5, %747 {sv.namehint = "_instType_c_T_143"} : i5
    %749 = comb.mux bin %596, %c2_i5, %748 {sv.namehint = "_instType_c_T_144"} : i5
    %750 = comb.mux bin %592, %c3_i5, %749 {sv.namehint = "_instType_c_T_145"} : i5
    %751 = comb.mux bin %587, %c2_i5, %750 {sv.namehint = "_instType_c_T_146"} : i5
    %752 = comb.or bin %559, %563, %567, %571, %575, %579, %583 : i1
    %753 = comb.mux bin %752, %c3_i5, %751 {sv.namehint = "instType_c_2"} : i5
    %754 = comb.or %637, %641 {sv.namehint = "_instType_c_T_166"} : i1
    %755 = comb.or bin %587, %592, %596, %602, %607, %611, %617, %622, %627, %632 : i1
    %756 = comb.xor %755, %true : i1
    %757 = comb.and %756, %754 {sv.namehint = "_instType_c_T_176"} : i1
    %758 = comb.or %583, %757 {sv.namehint = "_instType_c_T_177"} : i1
    %759 = comb.or bin %559, %563, %567, %571, %575, %579 : i1
    %760 = comb.xor %759, %true : i1
    %761 = comb.and %760, %758 {sv.namehint = "instType_c_3"} : i1
    %762 = comb.mux bin %688, %c11_i5, %c0_i5 {sv.namehint = "_instType_c_T_183"} : i5
    %763 = comb.mux bin %685, %c10_i5, %762 {sv.namehint = "_instType_c_T_184"} : i5
    %764 = comb.mux bin %691, %c0_i5, %763 {sv.namehint = "_instType_c_T_188"} : i5
    %765 = comb.mux bin %665, %c7_i5, %764 {sv.namehint = "_instType_c_T_189"} : i5
    %766 = comb.mux bin %661, %c6_i5, %765 {sv.namehint = "_instType_c_T_190"} : i5
    %767 = comb.or bin %579, %583, %587, %592, %596, %602, %607, %611, %617, %622, %627, %632, %637, %641, %645, %649, %653, %657 : i1
    %768 = comb.mux bin %767, %c0_i5, %766 {sv.namehint = "_instType_c_T_208"} : i5
    %769 = comb.mux bin %575, %c11_i5, %768 {sv.namehint = "_instType_c_T_209"} : i5
    %770 = comb.mux bin %571, %c10_i5, %769 {sv.namehint = "_instType_c_T_210"} : i5
    %771 = comb.mux bin %567, %c7_i5, %770 {sv.namehint = "_instType_c_T_211"} : i5
    %772 = comb.mux bin %563, %c6_i5, %771 {sv.namehint = "_instType_c_T_212"} : i5
    %773 = comb.mux bin %559, %c0_i5, %772 {sv.namehint = "instType_c_4"} : i5
    %774 = comb.or %733, %681 {sv.namehint = "_instType_c_T_217"} : i1
    %775 = comb.xor %670, %true : i1
    %776 = comb.and %775, %774 {sv.namehint = "_instType_c_T_218"} : i1
    %777 = comb.or %694, %776 {sv.namehint = "_instType_c_T_221"} : i1
    %778 = comb.or bin %645, %696 : i1
    %779 = comb.xor %778, %true : i1
    %780 = comb.and %779, %777 {sv.namehint = "_instType_c_T_224"} : i1
    %781 = comb.or %579, %583, %587, %592, %596, %602, %607, %611, %699, %780 {sv.namehint = "_instType_c_T_238"} : i1
    %782 = comb.xor %705, %true : i1
    %783 = comb.and %782, %781 {sv.namehint = "_instType_c_T_240"} : i1
    %784 = comb.or %559, %707, %783 {sv.namehint = "instType_c_5"} : i1
    %785 = comb.extract %io_if2id_inst from 0 {sv.namehint = "_is_compress_T"} : (i32) -> i2
    %786 = comb.icmp bin eq %785, %c-1_i2 : i2
    %787 = comb.xor bin %786, %true {sv.namehint = "is_compress"} : i1
    %788 = comb.icmp bin eq %454, %c2_i3 : i3
    %789 = comb.extract %io_if2id_inst from 20 {sv.namehint = "_imm_T"} : (i32) -> i12
    %790 = comb.extract %io_if2id_inst from 31 : (i32) -> i1
    %791 = comb.replicate %790 : (i1) -> i52
    %792 = comb.concat %791, %789 : i52, i12
    %793 = comb.icmp bin eq %454, %c3_i3 : i3
    %794 = comb.extract %io_if2id_inst from 25 {sv.namehint = "imm_hi"} : (i32) -> i7
    %795 = comb.extract %io_if2id_inst from 7 {sv.namehint = "imm_lo"} : (i32) -> i5
    %796 = comb.extract %io_if2id_inst from 31 : (i32) -> i1
    %797 = comb.replicate %796 : (i1) -> i52
    %798 = comb.concat %797, %794, %795 : i52, i7, i5
    %799 = comb.icmp bin eq %454, %c-4_i3 : i3
    %800 = comb.extract %io_if2id_inst from 31 {sv.namehint = "imm_hi_hi_hi"} : (i32) -> i1
    %801 = comb.extract %io_if2id_inst from 7 {sv.namehint = "imm_hi_hi_lo"} : (i32) -> i1
    %802 = comb.extract %io_if2id_inst from 25 {sv.namehint = "imm_hi_lo"} : (i32) -> i6
    %803 = comb.extract %io_if2id_inst from 8 {sv.namehint = "imm_lo_hi"} : (i32) -> i4
    %804 = comb.replicate %800 : (i1) -> i52
    %805 = comb.concat %804, %801, %802, %803, %false : i52, i1, i6, i4, i1
    %806 = comb.icmp bin eq %454, %c-3_i3 : i3
    %807 = comb.extract %io_if2id_inst from 12 {sv.namehint = "imm_hi_2"} : (i32) -> i20
    %808 = comb.extract %io_if2id_inst from 31 : (i32) -> i1
    %809 = comb.replicate %808 : (i1) -> i32
    %810 = comb.concat %809, %807, %c0_i12 : i32, i20, i12
    %811 = comb.icmp bin eq %454, %c-2_i3 : i3
    %812 = comb.extract %io_if2id_inst from 31 {sv.namehint = "imm_hi_hi_hi_1"} : (i32) -> i1
    %813 = comb.extract %io_if2id_inst from 12 {sv.namehint = "imm_hi_hi_lo_1"} : (i32) -> i8
    %814 = comb.extract %io_if2id_inst from 20 {sv.namehint = "imm_hi_lo_1"} : (i32) -> i1
    %815 = comb.extract %io_if2id_inst from 21 {sv.namehint = "imm_lo_hi_1"} : (i32) -> i10
    %816 = comb.replicate %812 : (i1) -> i44
    %817 = comb.concat %816, %813, %814, %815, %false : i44, i8, i1, i10, i1
    %818 = hw.array_create %c0_i64, %817, %810, %805, %798, %792, %c0_i64, %c0_i64 : i64
    %819 = hw.array_get %818[%454] {sv.namehint = "imm"} : !hw.array<8xi64>, i3
    %820 = comb.xor bin %io_if2id_excep_en, %true : i1
    %821 = comb.and bin %5, %786, %820 : i1
    %822 = comb.mux bin %821, %io_if2id_inst, %inst_r : i32
    %823 = comb.mux bin %821, %508, %ctrl_r_aluOp : i5
    %824 = comb.mux bin %821, %512, %ctrl_r_aluWidth : i1
    %825 = comb.mux bin %821, %534, %ctrl_r_dcMode : i5
    %826 = comb.mux bin %821, %541, %ctrl_r_writeRegEn : i1
    %827 = comb.mux bin %821, %549, %ctrl_r_writeCSREn : i1
    %828 = comb.extract %io_if2id_inst from 15 {sv.namehint = "_rs1_d_r_T"} : (i32) -> i5
    %829 = comb.mux bin %821, %828, %rs1_r : i5
    %830 = comb.extract %io_if2id_inst from 20 {sv.namehint = "_rs2_r_T"} : (i32) -> i12
    %831 = comb.extract %io_if2id_inst from 20 {sv.namehint = "_rs2_r_T_1"} : (i32) -> i5
    %832 = comb.concat %c0_i7, %831 : i7, i5
    %833 = comb.mux bin %549, %830, %832 {sv.namehint = "_rs2_r_T_2"} : i12
    %834 = comb.extract %io_if2id_inst from 7 {sv.namehint = "_dst_r_T"} : (i32) -> i5
    %835 = comb.mux bin %821, %834, %dst_r : i5
    %836 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %837 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %838 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %839 = comb.concat %836, %837, %838 : i5, i3, i7
    %840 = comb.icmp bin eq %839, %c3375_i15 {sv.namehint = "_indi_r_T_1"} : i15
    %841 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %842 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %843 = comb.concat %311, %841, %842 : i5, i3, i7
    %844 = comb.icmp bin eq %843, %c3503_i15 {sv.namehint = "_indi_r_T_3"} : i15
    %845 = comb.or bin %840, %844 {sv.namehint = "indi_r_hi"} : i1
    %846 = comb.extract %io_if2id_inst from 27 : (i32) -> i5
    %847 = comb.extract %io_if2id_inst from 20 : (i32) -> i5
    %848 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %849 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %850 = comb.concat %846, %847, %848, %849 : i5, i5, i3, i7
    %851 = comb.icmp bin eq %850, %c65839_i20 {sv.namehint = "_indi_r_T_5"} : i20
    %852 = comb.extract %io_if2id_inst from 20 : (i32) -> i5
    %853 = comb.extract %io_if2id_inst from 12 : (i32) -> i3
    %854 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %855 = comb.concat %304, %852, %853, %854 : i5, i5, i3, i7
    %856 = comb.icmp bin eq %855, %c65967_i20 {sv.namehint = "_indi_r_T_7"} : i20
    %857 = comb.or bin %851, %856 {sv.namehint = "indi_r_lo"} : i1
    %858 = comb.concat %845, %857 {sv.namehint = "_indi_r_T_8"} : i1, i1
    %859 = comb.mux bin %821, %858, %indi_r : i2
    %860 = comb.icmp bin eq %454, %c-1_i3 : i3
    %861 = comb.and bin %860, %820 : i1
    %862 = comb.mux bin %861, %c2_i64, %io_if2id_excep_cause : i64
    %863 = comb.concat %c0_i32, %io_if2id_inst : i32, i32
    %864 = comb.mux bin %861, %863, %io_if2id_excep_tval : i64
    %865 = comb.mux bin %861, %c0_i2, %io_if2id_excep_etype : i2
    %866 = comb.or %861, %io_if2id_recov : i1
    %867 = comb.icmp bin eq %454, %c1_i3 : i3
    %868 = comb.xor %867, %true : i1
    %869 = comb.concat %c13_i5, %868 : i5, i1
    %870 = comb.and bin %788, %544 : i1
    %871 = comb.concat %false, %870 : i1, i1
    %872 = comb.add %io_if2id_pc, %c4_i64 {sv.namehint = "_rs2_d_r_T"} : i64
    %873 = comb.concat %c0_i59, %828 : i59, i5
    %874 = comb.xor %549, %true : i1
    %875 = comb.xor %788, %true : i1
    %876 = comb.or %875, %544, %874 : i1
    %877 = comb.mux bin %876, %rs1_d_r, %873 : i64
    %878 = comb.xor bin %553, %true {sv.namehint = "_rrs1_r_T"} : i1
    %879 = comb.xor %544, %true : i1
    %880 = comb.and %788, %879, %549 : i1
    %881 = comb.xor %544, %true : i1
    %882 = comb.and %788, %881, %549 : i1
    %883 = comb.or %549, %861, %io_if2id_recov : i1
    %884 = comb.xor %788, %true : i1
    %885 = comb.or %884, %544 : i1
    %886 = comb.mux bin %885, %866, %883 : i1
    %887 = comb.xor %549, %true : i1
    %888 = comb.or %544, %887, %878 : i1
    %889 = comb.mux bin %788, %888, %867 : i1
    %890 = comb.mux bin %549, %rs2_d_r, %819 : i64
    %891 = comb.mux bin %544, %872, %890 : i64
    %892 = comb.mux bin %788, %891, %rs2_d_r : i64
    %893 = comb.mux bin %793, %c30_i6, %869 : i6
    %894 = comb.mux bin %821, %893, %swap_r : i6
    %895 = comb.or %793, %870 : i1
    %896 = comb.mux bin %895, %819, %dst_d_r : i64
    %897 = comb.or bin %799, %793 : i1
    %898 = comb.or %897, %889 : i1
    %899 = comb.mux bin %821, %898, %rrs1_r : i1
    %900 = comb.or %897, %880, %867 : i1
    %901 = comb.mux bin %821, %900, %rrs2_r : i1
    %902 = comb.add %io_if2id_pc, %819 {sv.namehint = "_dst_d_r_T_3"} : i64
    %903 = comb.mux bin %799, %902, %896 : i64
    %904 = comb.extract %io_if2id_inst from 12 {sv.namehint = "_ctrl_r_brType_T"} : (i32) -> i3
    %905 = comb.and bin %821, %799 : i1
    %906 = comb.mux bin %905, %904, %ctrl_r_brType : i3
    %907 = comb.mux bin %799, %c-2_i2, %871 : i2
    %908 = comb.mux bin %806, %819, %877 : i64
    %909 = comb.mux bin %806, %io_if2id_pc, %892 : i64
    %910 = comb.add %io_if2id_pc, %819 {sv.namehint = "_rs1_d_r_T_3"} : i64
    %911 = comb.mux bin %811, %910, %908 : i64
    %912 = comb.mux bin %821, %911, %rs1_d_r : i64
    %913 = comb.add %io_if2id_pc, %c4_i64 {sv.namehint = "_rs2_d_r_T_3"} : i64
    %914 = comb.mux bin %811, %913, %909 : i64
    %915 = comb.mux bin %821, %914, %rs2_d_r : i64
    %916 = comb.mux bin %811, %c0_i64, %903 : i64
    %917 = comb.mux bin %821, %916, %dst_d_r : i64
    %918 = comb.mux bin %811, %c1_i2, %907 : i2
    %919 = comb.icmp bin eq %io_if2id_inst, %c115_i32 : i32
    %920 = comb.icmp bin eq %io_idState_priv, %c-1_i2 {sv.namehint = "_rs2_r_T_3"} : i2
    %921 = comb.icmp bin eq %io_idState_priv, %c1_i2 {sv.namehint = "_excep_r_cause_T_1"} : i2
    %922 = comb.concat %c-4_i3, %921 {sv.namehint = "_excep_r_cause_T_2"} : i3, i1
    %923 = comb.mux bin %920, %c-5_i4, %922 {sv.namehint = "_excep_r_cause_T_3"} : i4
    %924 = comb.concat %c0_i60, %923 : i60, i4
    %925 = comb.mux bin %919, %924, %862 : i64
    %926 = comb.concat %c0_i2, %920, %c-251_i9 : i2, i1, i9
    %927 = comb.mux bin %919, %926, %833 : i12
    %928 = comb.icmp bin eq %io_if2id_inst, %c270532723_i32 : i32
    %929 = comb.mux bin %928, %c-2_i2, %865 : i2
    %930 = comb.mux bin %928, %c321_i12, %927 : i12
    %931 = comb.icmp bin eq %io_if2id_inst, %c807403635_i32 : i32
    %932 = comb.or bin %931, %928, %919, %861 : i1
    %933 = comb.mux bin %932, %io_if2id_pc, %io_if2id_excep_pc : i64
    %934 = comb.mux bin %821, %933, %excep_r_pc : i64
    %935 = comb.or %932, %io_if2id_excep_en : i1
    %936 = comb.mux bin %821, %935, %excep_r_en : i1
    %937 = comb.mux bin %931, %c-1_i2, %929 : i2
    %938 = comb.mux bin %821, %937, %excep_r_etype : i2
    %939 = comb.or bin %931, %928 : i1
    %940 = comb.mux bin %939, %c0_i64, %925 : i64
    %941 = comb.mux bin %821, %940, %excep_r_cause : i64
    %942 = comb.or bin %931, %928, %919 : i1
    %943 = comb.mux bin %942, %c0_i64, %864 : i64
    %944 = comb.mux bin %821, %943, %excep_r_tval : i64
    %945 = comb.mux bin %942, %c-1_i2, %918 : i2
    %946 = comb.mux bin %821, %945, %jmp_type_r : i2
    %947 = comb.mux bin %931, %c833_i12, %930 : i12
    %948 = comb.mux bin %821, %947, %rs2_r : i12
    %949 = comb.icmp bin eq %io_if2id_inst, %c4111_i32 : i32
    %950 = comb.concat %false, %949 : i1, i1
    %951 = comb.extract %io_if2id_inst from 0 : (i32) -> i15
    %952 = comb.concat %423, %951 : i7, i15
    %953 = comb.icmp bin eq %952, %c295027_i22 : i22
    %954 = comb.mux bin %953, %c-2_i2, %950 : i2
    %955 = comb.mux bin %821, %954, %special_r : i2
    %956 = comb.or bin %953, %949, %942 : i1
    %957 = comb.or %956, %882, %861 : i1
    %958 = comb.and %821, %957 : i1
    %959 = comb.or %956, %886 : i1
    %960 = comb.mux bin %821, %959, %recov_r : i1
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
    %1023 = hw.array_get %1022[%730] {sv.namehint = "imm_c"} : !hw.array<16xi64>, i4
    %1024 = comb.and bin %5, %787, %820 : i1
    %1025 = comb.concat %c0_i16, %554 : i16, i16
    %1026 = comb.mux bin %1024, %1025, %822 : i32
    %1027 = comb.mux bin %1024, %753, %823 : i5
    %1028 = comb.mux bin %1024, %761, %824 : i1
    %1029 = comb.mux bin %1024, %773, %825 : i5
    %1030 = comb.mux bin %1024, %784, %826 : i1
    %1031 = comb.extract %io_if2id_inst from 7 {sv.namehint = "_dst_r_T_1"} : (i32) -> i5
    %1032 = comb.extract %io_if2id_inst from 2 {sv.namehint = "_rs2_r_T_6"} : (i32) -> i5
    %1033 = comb.concat %c0_i7, %1032 : i7, i5
    %1034 = comb.icmp bin eq %709, %c0_i4 : i4
    %1035 = comb.and bin %1034, %820 : i1
    %1036 = comb.or %1035, %io_if2id_excep_en : i1
    %1037 = comb.mux bin %1024, %1036, %936 : i1
    %1038 = comb.mux bin %1035, %c2_i64, %io_if2id_excep_cause : i64
    %1039 = comb.mux bin %1024, %1038, %941 : i64
    %1040 = comb.concat %c0_i48, %554 : i48, i16
    %1041 = comb.mux bin %1035, %1040, %io_if2id_excep_tval : i64
    %1042 = comb.mux bin %1024, %1041, %944 : i64
    %1043 = comb.mux bin %1035, %io_if2id_pc, %io_if2id_excep_pc : i64
    %1044 = comb.mux bin %1024, %1043, %934 : i64
    %1045 = comb.mux bin %1035, %c0_i2, %io_if2id_excep_etype : i2
    %1046 = comb.mux bin %1024, %1045, %938 : i2
    %1047 = comb.and bin %1024, %1035 : i1
    %1048 = comb.or %1047, %958 : i1
    %1049 = comb.or %1035, %io_if2id_recov : i1
    %1050 = comb.mux bin %1024, %1049, %960 : i1
    %1051 = comb.icmp bin eq %709, %c1_i4 : i4
    %1052 = comb.extract %io_if2id_inst from 12 : (i32) -> i4
    %1053 = comb.extract %io_if2id_inst from 12 : (i32) -> i4
    %1054 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %1055 = comb.concat %1053, %1054 : i4, i7
    %1056 = comb.icmp bin eq %1055, %c-1022_i11 : i11
    %1057 = comb.extract %io_if2id_inst from 12 : (i32) -> i4
    %1058 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %1059 = comb.concat %1057, %1058 : i4, i7
    %1060 = comb.icmp bin eq %1059, %c-894_i11 : i11
    %1061 = comb.or bin %1060, %1056 : i1
    %1062 = comb.and bin %1051, %1061 : i1
    %1063 = comb.concat %false, %1062 : i1, i1
    %1064 = comb.extract %io_if2id_inst from 0 : (i32) -> i7
    %1065 = comb.concat %1052, %1064 : i4, i7
    %1066 = comb.icmp bin ne %1065, %c-894_i11 : i11
    %1067 = comb.and %1051, %1066 : i1
    %1068 = comb.add %io_if2id_pc, %c2_i64 {sv.namehint = "_rs2_d_r_T_5"} : i64
    %1069 = comb.and bin %1051, %1060 : i1
    %1070 = comb.mux bin %1069, %1068, %915 : i64
    %1071 = comb.mux bin %1062, %c0_i64, %917 : i64
    %1072 = comb.mux bin %1069, %c1_i5, %1031 : i5
    %1073 = comb.icmp bin eq %709, %c2_i4 : i4
    %1074 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %1075 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %1076 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %1077 = comb.concat %1075, %1076 : i3, i2
    %1078 = comb.icmp bin eq %1077, %c10_i5 : i5
    %1079 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %1080 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %1081 = comb.concat %1079, %1080 : i3, i2
    %1082 = comb.icmp bin eq %1081, %c14_i5 : i5
    %1083 = comb.or bin %1078, %1082 : i1
    %1084 = comb.and bin %1073, %1083 : i1
    %1085 = comb.icmp bin eq %709, %c3_i4 : i4
    %1086 = comb.icmp bin eq %709, %c4_i4 : i4
    %1087 = comb.or bin %1086, %1085, %1084 : i1
    %1088 = comb.mux bin %1087, %c2_i5, %1031 : i5
    %1089 = comb.extract %io_if2id_inst from 2 {sv.namehint = "dst_r_lo"} : (i32) -> i3
    %1090 = comb.concat %c1_i2, %1089 : i2, i3
    %1091 = comb.mux bin %1086, %1090, %1072 : i5
    %1092 = comb.icmp bin eq %709, %c5_i4 : i4
    %1093 = comb.extract %io_if2id_inst from 7 {sv.namehint = "rs1_r_lo"} : (i32) -> i3
    %1094 = comb.concat %c1_i2, %1093 : i2, i3
    %1095 = comb.mux bin %1092, %1094, %1088 : i5
    %1096 = comb.or %1092, %1086, %1073 : i1
    %1097 = comb.mux bin %1096, %1023, %1070 : i64
    %1098 = comb.extract %io_if2id_inst from 2 {sv.namehint = "dst_r_lo_1"} : (i32) -> i3
    %1099 = comb.concat %c1_i2, %1098 : i2, i3
    %1100 = comb.mux bin %1092, %1099, %1091 : i5
    %1101 = comb.icmp bin eq %709, %c6_i4 : i4
    %1102 = comb.extract %io_if2id_inst from 7 {sv.namehint = "rs1_r_lo_1"} : (i32) -> i3
    %1103 = comb.concat %c1_i2, %1102 : i2, i3
    %1104 = comb.mux bin %1101, %1103, %1095 : i5
    %1105 = comb.or %1101, %1085, %1067 : i1
    %1106 = comb.mux bin %1024, %1105, %901 : i1
    %1107 = comb.extract %io_if2id_inst from 2 {sv.namehint = "rs2_r_lo"} : (i32) -> i3
    %1108 = comb.concat %c1_i9, %1107 : i9, i3
    %1109 = comb.mux bin %1101, %1108, %1033 : i12
    %1110 = comb.mux bin %1024, %1109, %948 : i12
    %1111 = comb.or %1101, %1085 : i1
    %1112 = comb.mux bin %1111, %1023, %1071 : i64
    %1113 = comb.concat %c1_i2, %1102 : i2, i3
    %1114 = comb.mux bin %1101, %1113, %1100 : i5
    %1115 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %1116 = comb.icmp bin eq %1115, %c0_i2 : i2
    %1117 = comb.and %1101, %1116 : i1
    %1118 = comb.or %1117, %1085 : i1
    %1119 = comb.mux bin %1118, %c30_i6, %c27_i6 : i6
    %1120 = comb.mux bin %1024, %1119, %894 : i6
    %1121 = comb.icmp bin eq %709, %c7_i4 : i4
    %1122 = comb.or %1121, %1101, %1092, %1086, %1085, %1073, %1051 : i1
    %1123 = comb.mux bin %1024, %1122, %899 : i1
    %1124 = comb.extract %io_if2id_inst from 7 {sv.namehint = "rs1_r_lo_2"} : (i32) -> i3
    %1125 = comb.concat %c1_i2, %1124 : i2, i3
    %1126 = comb.mux bin %1121, %1125, %1104 : i5
    %1127 = comb.mux bin %1024, %1126, %829 : i5
    %1128 = comb.add %io_if2id_pc, %1023 {sv.namehint = "_dst_d_r_T_10"} : i64
    %1129 = comb.mux bin %1121, %1128, %1112 : i64
    %1130 = comb.concat %c1_i2, %1124 : i2, i3
    %1131 = comb.mux bin %1121, %1130, %1114 : i5
    %1132 = comb.mux bin %1024, %1131, %835 : i5
    %1133 = comb.extract %io_if2id_inst from 13 : (i32) -> i3
    %1134 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %1135 = comb.concat %1133, %1134 : i3, i2
    %1136 = comb.icmp bin eq %1135, %c-7_i5 : i5
    %1137 = comb.mux bin %1136, %c0_i3, %906 : i3
    %1138 = comb.extract %io_if2id_inst from 0 : (i32) -> i2
    %1139 = comb.concat %1074, %1138 : i3, i2
    %1140 = comb.icmp bin eq %1139, %c-3_i5 : i5
    %1141 = comb.mux bin %1140, %c1_i3, %1137 : i3
    %1142 = comb.and bin %1024, %1121 : i1
    %1143 = comb.mux bin %1142, %1141, %906 : i3
    %1144 = comb.or bin %1140, %1136 : i1
    %1145 = comb.mux bin %1144, %c0_i64, %1023 : i64
    %1146 = comb.mux bin %1121, %1145, %1097 : i64
    %1147 = comb.mux bin %1024, %1146, %915 : i64
    %1148 = comb.and bin %1121, %1144 : i1
    %1149 = comb.mux bin %1148, %c-2_i2, %1063 : i2
    %1150 = comb.icmp bin eq %709, %c-8_i4 : i4
    %1151 = comb.and bin %1024, %1150 : i1
    %1152 = comb.mux bin %1151, %io_if2id_pc, %912 : i64
    %1153 = comb.mux bin %1150, %1023, %1129 : i64
    %1154 = comb.mux bin %1024, %1153, %917 : i64
    %1155 = comb.mux bin %1150, %c1_i2, %1149 : i2
    %1156 = comb.mux bin %1024, %1155, %946 : i2
    %1157 = comb.and bin %5, %io_if2id_excep_en : i1
    %1158 = comb.mux bin %1157, %io_if2id_inst, %1026 : i32
    %1159 = comb.or bin %1157, %1024, %821 : i1
    %1160 = comb.mux bin %1159, %io_if2id_pc, %pc_r : i64
    %1161 = comb.mux bin %1157, %io_if2id_excep_etype, %1046 : i2
    %1162 = comb.mux bin %1157, %io_if2id_excep_pc, %1044 : i64
    %1163 = comb.mux bin %1157, %io_if2id_excep_en, %1037 : i1
    %1164 = comb.mux bin %1157, %io_if2id_excep_tval, %1042 : i64
    %1165 = comb.mux bin %1157, %io_if2id_excep_cause, %1039 : i64
    %1166 = comb.mux bin %1157, %c0_i3, %1143 : i3
    %1167 = comb.or bin %1157, %1024 : i1
    %1168 = comb.xor %1167, %true : i1
    %1169 = comb.and %1168, %827 : i1
    %1170 = comb.xor %1157, %true : i1
    %1171 = comb.and %1170, %1030 : i1
    %1172 = comb.mux bin %1157, %c0_i5, %1029 : i5
    %1173 = comb.xor %1157, %true : i1
    %1174 = comb.and %1173, %1028 : i1
    %1175 = comb.mux bin %1157, %c0_i5, %1027 : i5
    %1176 = comb.xor %1157, %true : i1
    %1177 = comb.and %1176, %1123 : i1
    %1178 = comb.xor %1157, %true : i1
    %1179 = comb.and %1178, %1106 : i1
    %1180 = comb.mux bin %1157, %c0_i2, %1156 : i2
    %1181 = comb.mux bin %1167, %c0_i2, %955 : i2
    %1182 = comb.mux bin %1167, %c0_i2, %859 : i2
    %1183 = comb.mux bin %1157, %c27_i6, %1120 : i6
    %1184 = comb.mux bin %1157, %io_if2id_recov, %1050 : i1
    %1185 = comb.xor bin %0, %true : i1
    %1186 = comb.xor bin %4, %true : i1
    %1187 = comb.and bin %valid_r, %1186 : i1
    %1188 = comb.xor %1187, %true : i1
    %1189 = comb.and %1185, %1188, %io_if2id_valid {sv.namehint = "io_if2id_ready"} : i1
    %1190 = comb.xor %4, %true : i1
    %1191 = comb.and %1190, %valid_r : i1
    %1192 = comb.or %5, %1191 : i1
    %1193 = comb.and %1, %1192 : i1
    hw.output %0, %3, %1189, %inst_r, %pc_r, %excep_r_cause, %excep_r_tval, %excep_r_en, %excep_r_pc, %excep_r_etype, %ctrl_r_aluOp, %ctrl_r_aluWidth, %ctrl_r_dcMode, %ctrl_r_writeRegEn, %ctrl_r_writeCSREn, %ctrl_r_brType, %rs1_r, %rrs1_r, %rs1_d_r, %rs2_r, %rrs2_r, %rs2_d_r, %dst_r, %dst_d_r, %jmp_type_r, %special_r, %swap_r, %indi_r, %recov_r, %valid_r : i1, i1, i1, i32, i64, i64, i64, i1, i64, i2, i5, i1, i5, i1, i1, i3, i5, i1, i64, i12, i1, i64, i5, i64, i2, i2, i6, i2, i1, i1
  }
  hw.module private @Forwarding(in %clock : !seq.clock, in %reset : i1, in %io_id2df_inst : i32, in %io_id2df_pc : i64, in %io_id2df_excep_cause : i64, in %io_id2df_excep_tval : i64, in %io_id2df_excep_en : i1, in %io_id2df_excep_pc : i64, in %io_id2df_excep_etype : i2, in %io_id2df_ctrl_aluOp : i5, in %io_id2df_ctrl_aluWidth : i1, in %io_id2df_ctrl_dcMode : i5, in %io_id2df_ctrl_writeRegEn : i1, in %io_id2df_ctrl_writeCSREn : i1, in %io_id2df_ctrl_brType : i3, in %io_id2df_rs1 : i5, in %io_id2df_rrs1 : i1, in %io_id2df_rs1_d : i64, in %io_id2df_rs2 : i12, in %io_id2df_rrs2 : i1, in %io_id2df_rs2_d : i64, in %io_id2df_dst : i5, in %io_id2df_dst_d : i64, in %io_id2df_jmp_type : i2, in %io_id2df_special : i2, in %io_id2df_swap : i6, in %io_id2df_indi : i2, out io_id2df_drop : i1, out io_id2df_stall : i1, in %io_id2df_recov : i1, in %io_id2df_valid : i1, out io_id2df_ready : i1, out io_df2rr_inst : i32, out io_df2rr_pc : i64, out io_df2rr_excep_cause : i64, out io_df2rr_excep_tval : i64, out io_df2rr_excep_en : i1, out io_df2rr_excep_pc : i64, out io_df2rr_excep_etype : i2, out io_df2rr_ctrl_aluOp : i5, out io_df2rr_ctrl_aluWidth : i1, out io_df2rr_ctrl_dcMode : i5, out io_df2rr_ctrl_writeRegEn : i1, out io_df2rr_ctrl_writeCSREn : i1, out io_df2rr_ctrl_brType : i3, out io_df2rr_rs1 : i5, out io_df2rr_rrs1 : i1, out io_df2rr_rs1_d : i64, out io_df2rr_rs2 : i12, out io_df2rr_rrs2 : i1, out io_df2rr_rs2_d : i64, out io_df2rr_dst : i5, out io_df2rr_dst_d : i64, out io_df2rr_jmp_type : i2, out io_df2rr_special : i2, out io_df2rr_swap : i6, out io_df2rr_indi : i2, in %io_df2rr_drop : i1, in %io_df2rr_stall : i1, out io_df2rr_recov : i1, out io_df2rr_valid : i1, in %io_df2rr_ready : i1, in %io_d_rr_id : i5, in %io_d_rr_data : i64, in %io_d_rr_state : i2, in %io_d_ex_id : i5, in %io_d_ex_data : i64, in %io_d_ex_state : i2, in %io_d_mem1_id : i5, in %io_d_mem1_data : i64, in %io_d_mem1_state : i2, in %io_d_mem2_id : i5, in %io_d_mem2_data : i64, in %io_d_mem2_state : i2, in %io_d_mem3_id : i5, in %io_d_mem3_data : i64, in %io_d_mem3_state : i2) {
    %c0_i7 = hw.constant 0 : i7
    %c0_i32 = hw.constant 0 : i32
    %c0_i12 = hw.constant 0 : i12
    %c0_i6 = hw.constant 0 : i6
    %true = hw.constant true
    %c1_i2 = hw.constant 1 : i2
    %c0_i2 = hw.constant 0 : i2
    %c0_i64 = hw.constant 0 : i64
    %c0_i3 = hw.constant 0 : i3
    %c0_i5 = hw.constant 0 : i5
    %false = hw.constant false
    %0 = comb.xor bin %io_df2rr_drop, %true {sv.namehint = "_io_id2df_stall_T"} : i1
    %inst_r = seq.firreg %107 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 2 : ui64, sv.namehint = "inst_r"} : i32
    %pc_r = seq.firreg %108 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 34 : ui64, sv.namehint = "pc_r"} : i64
    %excep_r_cause = seq.firreg %113 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 98 : ui64, sv.namehint = "excep_r_cause"} : i64
    %excep_r_tval = seq.firreg %112 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 162 : ui64, sv.namehint = "excep_r_tval"} : i64
    %excep_r_en = seq.firreg %111 clock %clock reset sync %reset, %false {firrtl.random_init_start = 226 : ui64, sv.namehint = "excep_r_en"} : i1
    %excep_r_pc = seq.firreg %110 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 227 : ui64, sv.namehint = "excep_r_pc"} : i64
    %excep_r_etype = seq.firreg %109 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 291 : ui64, sv.namehint = "excep_r_etype"} : i2
    %ctrl_r_aluOp = seq.firreg %119 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 293 : ui64, sv.namehint = "ctrl_r_aluOp"} : i5
    %ctrl_r_aluWidth = seq.firreg %118 clock %clock reset sync %reset, %false {firrtl.random_init_start = 298 : ui64, sv.namehint = "ctrl_r_aluWidth"} : i1
    %ctrl_r_dcMode = seq.firreg %117 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 299 : ui64, sv.namehint = "ctrl_r_dcMode"} : i5
    %ctrl_r_writeRegEn = seq.firreg %116 clock %clock reset sync %reset, %false {firrtl.random_init_start = 304 : ui64, sv.namehint = "ctrl_r_writeRegEn"} : i1
    %ctrl_r_writeCSREn = seq.firreg %115 clock %clock reset sync %reset, %false {firrtl.random_init_start = 305 : ui64, sv.namehint = "ctrl_r_writeCSREn"} : i1
    %ctrl_r_brType = seq.firreg %114 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 306 : ui64, sv.namehint = "ctrl_r_brType"} : i3
    %rs1_r = seq.firreg %120 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 309 : ui64, sv.namehint = "rs1_r"} : i5
    %rrs1_r = seq.firreg %136 clock %clock reset sync %reset, %false {firrtl.random_init_start = 314 : ui64, sv.namehint = "rrs1_r"} : i1
    %rs1_d_r = seq.firreg %137 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 315 : ui64, sv.namehint = "rs1_d_r"} : i64
    %rs2_r = seq.firreg %123 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 379 : ui64, sv.namehint = "rs2_r"} : i12
    %rrs2_r = seq.firreg %140 clock %clock reset sync %reset, %false {firrtl.random_init_start = 391 : ui64, sv.namehint = "rrs2_r"} : i1
    %rs2_d_r = seq.firreg %141 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 392 : ui64, sv.namehint = "rs2_d_r"} : i64
    %dst_r = seq.firreg %126 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 456 : ui64, sv.namehint = "dst_r"} : i5
    %dst_d_r = seq.firreg %127 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 461 : ui64, sv.namehint = "dst_d_r"} : i64
    %jmp_type_r = seq.firreg %128 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 525 : ui64, sv.namehint = "jmp_type_r"} : i2
    %special_r = seq.firreg %129 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 527 : ui64, sv.namehint = "special_r"} : i2
    %indi_r = seq.firreg %130 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 529 : ui64, sv.namehint = "indi_r"} : i2
    %swap_r = seq.firreg %131 clock %clock reset sync %reset, %c0_i6 {firrtl.random_init_start = 531 : ui64, sv.namehint = "swap_r"} : i6
    %recov_r = seq.firreg %132 clock %clock reset sync %reset, %false {firrtl.random_init_start = 537 : ui64, sv.namehint = "recov_r"} : i1
    %valid_r = seq.firreg %168 clock %clock reset sync %reset, %false {firrtl.random_init_start = 538 : ui64, sv.namehint = "valid_r"} : i1
    %pre_dst = seq.firreg %142 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 539 : ui64} : i5
    %pre_wr = seq.firreg %145 clock %clock reset sync %reset, %false {firrtl.random_init_start = 544 : ui64} : i1
    %state = seq.firreg %167 clock %clock reset sync %reset, %false {firrtl.random_init_start = 545 : ui64} : i1
    %1 = comb.and bin %150, %io_id2df_valid {sv.namehint = "hs_in"} : i1
    %2 = comb.and bin %io_df2rr_ready, %valid_r {sv.namehint = "hs_out"} : i1
    %3 = comb.mux bin %1, %io_id2df_rs1, %rs1_r {sv.namehint = "cur_rs1"} : i5
    %4 = comb.mux bin %1, %io_id2df_rrs1, %rrs1_r {sv.namehint = "cur_rrs1"} : i1
    %5 = comb.mux bin %1, %io_id2df_rs2, %rs2_r {sv.namehint = "cur_rs2"} : i12
    %6 = comb.mux bin %1, %io_id2df_rrs2, %rrs2_r {sv.namehint = "cur_rrs2"} : i1
    %7 = comb.icmp bin eq %3, %c0_i5 : i5
    %8 = comb.and bin %valid_r, %pre_wr : i1
    %9 = comb.icmp bin eq %3, %pre_dst : i5
    %10 = comb.and bin %8, %9 : i1
    %11 = comb.icmp bin eq %3, %io_d_rr_id : i5
    %12 = comb.icmp bin ne %io_d_rr_state, %c0_i2 : i2
    %13 = comb.and bin %11, %12 : i1
    %14 = comb.icmp bin eq %io_d_rr_state, %c1_i2 : i2
    %15 = comb.mux bin %14, %io_d_rr_data, %c0_i64 : i64
    %16 = comb.icmp bin ne %io_d_rr_state, %c1_i2 : i2
    %17 = comb.icmp bin eq %3, %io_d_ex_id : i5
    %18 = comb.icmp bin ne %io_d_ex_state, %c0_i2 : i2
    %19 = comb.and bin %17, %18 : i1
    %20 = comb.icmp bin eq %io_d_ex_state, %c1_i2 : i2
    %21 = comb.mux bin %20, %io_d_ex_data, %c0_i64 : i64
    %22 = comb.icmp bin ne %io_d_ex_state, %c1_i2 : i2
    %23 = comb.icmp bin eq %3, %io_d_mem1_id : i5
    %24 = comb.icmp bin ne %io_d_mem1_state, %c0_i2 : i2
    %25 = comb.and bin %23, %24 : i1
    %26 = comb.icmp bin eq %io_d_mem1_state, %c1_i2 : i2
    %27 = comb.mux bin %26, %io_d_mem1_data, %c0_i64 : i64
    %28 = comb.icmp bin ne %io_d_mem1_state, %c1_i2 : i2
    %29 = comb.icmp bin eq %3, %io_d_mem2_id : i5
    %30 = comb.icmp bin ne %io_d_mem2_state, %c0_i2 : i2
    %31 = comb.and bin %29, %30 : i1
    %32 = comb.icmp bin eq %io_d_mem2_state, %c1_i2 : i2
    %33 = comb.mux bin %32, %io_d_mem2_data, %c0_i64 : i64
    %34 = comb.icmp bin ne %io_d_mem2_state, %c1_i2 : i2
    %35 = comb.icmp bin eq %3, %io_d_mem3_id : i5
    %36 = comb.icmp bin ne %io_d_mem3_state, %c0_i2 : i2
    %37 = comb.and bin %35, %36 : i1
    %38 = comb.icmp bin eq %io_d_mem3_state, %c1_i2 : i2
    %39 = comb.and bin %37, %38 : i1
    %40 = comb.mux bin %39, %io_d_mem3_data, %c0_i64 : i64
    %41 = comb.mux bin %31, %33, %40 : i64
    %42 = comb.mux bin %25, %27, %41 : i64
    %43 = comb.mux bin %19, %21, %42 : i64
    %44 = comb.mux bin %13, %15, %43 : i64
    %45 = comb.or bin %7, %10 : i1
    %46 = comb.xor %4, %true : i1
    %47 = comb.or %46, %45 : i1
    %48 = comb.mux bin %47, %c0_i64, %44 {sv.namehint = "rs1_data"} : i64
    %49 = comb.and %37, %38 : i1
    %50 = comb.mux bin %31, %32, %49 : i1
    %51 = comb.mux bin %25, %26, %50 : i1
    %52 = comb.mux bin %19, %20, %51 : i1
    %53 = comb.mux bin %13, %14, %52 : i1
    %54 = comb.xor %45, %true : i1
    %55 = comb.icmp bin ne %io_d_mem3_state, %c1_i2 : i2
    %56 = comb.and %37, %55 : i1
    %57 = comb.mux bin %31, %34, %56 : i1
    %58 = comb.mux bin %25, %28, %57 : i1
    %59 = comb.mux bin %19, %22, %58 : i1
    %60 = comb.mux bin %13, %16, %59 : i1
    %61 = comb.or %10, %60 : i1
    %62 = comb.xor %7, %true : i1
    %63 = comb.and %4, %62, %61 {sv.namehint = "rs1_wait"} : i1
    %64 = comb.icmp bin eq %5, %c0_i12 : i12
    %65 = comb.concat %c0_i7, %pre_dst : i7, i5
    %66 = comb.icmp bin eq %5, %65 : i12
    %67 = comb.and bin %8, %66 : i1
    %68 = comb.concat %c0_i7, %io_d_rr_id : i7, i5
    %69 = comb.icmp bin eq %5, %68 : i12
    %70 = comb.and bin %69, %12 : i1
    %71 = comb.concat %c0_i7, %io_d_ex_id : i7, i5
    %72 = comb.icmp bin eq %5, %71 : i12
    %73 = comb.and bin %72, %18 : i1
    %74 = comb.concat %c0_i7, %io_d_mem1_id : i7, i5
    %75 = comb.icmp bin eq %5, %74 : i12
    %76 = comb.and bin %75, %24 : i1
    %77 = comb.concat %c0_i7, %io_d_mem2_id : i7, i5
    %78 = comb.icmp bin eq %5, %77 : i12
    %79 = comb.and bin %78, %30 : i1
    %80 = comb.concat %c0_i7, %io_d_mem3_id : i7, i5
    %81 = comb.icmp bin eq %5, %80 : i12
    %82 = comb.and bin %81, %36 : i1
    %83 = comb.and bin %82, %38 : i1
    %84 = comb.mux bin %83, %io_d_mem3_data, %c0_i64 : i64
    %85 = comb.mux bin %79, %33, %84 : i64
    %86 = comb.mux bin %76, %27, %85 : i64
    %87 = comb.mux bin %73, %21, %86 : i64
    %88 = comb.mux bin %70, %15, %87 : i64
    %89 = comb.or bin %64, %67 : i1
    %90 = comb.xor %6, %true : i1
    %91 = comb.or %90, %89 : i1
    %92 = comb.mux bin %91, %c0_i64, %88 {sv.namehint = "rs2_data"} : i64
    %93 = comb.and %82, %38 : i1
    %94 = comb.mux bin %79, %32, %93 : i1
    %95 = comb.mux bin %76, %26, %94 : i1
    %96 = comb.mux bin %73, %20, %95 : i1
    %97 = comb.mux bin %70, %14, %96 : i1
    %98 = comb.xor %89, %true : i1
    %99 = comb.and %82, %55 : i1
    %100 = comb.mux bin %79, %34, %99 : i1
    %101 = comb.mux bin %76, %28, %100 : i1
    %102 = comb.mux bin %73, %22, %101 : i1
    %103 = comb.mux bin %70, %16, %102 : i1
    %104 = comb.or %67, %103 : i1
    %105 = comb.xor %64, %true : i1
    %106 = comb.and %6, %105, %104 {sv.namehint = "rs2_wait"} : i1
    %107 = comb.mux bin %1, %io_id2df_inst, %inst_r : i32
    %108 = comb.mux bin %1, %io_id2df_pc, %pc_r : i64
    %109 = comb.mux bin %1, %io_id2df_excep_etype, %excep_r_etype : i2
    %110 = comb.mux bin %1, %io_id2df_excep_pc, %excep_r_pc : i64
    %111 = comb.mux bin %1, %io_id2df_excep_en, %excep_r_en : i1
    %112 = comb.mux bin %1, %io_id2df_excep_tval, %excep_r_tval : i64
    %113 = comb.mux bin %1, %io_id2df_excep_cause, %excep_r_cause : i64
    %114 = comb.mux bin %1, %io_id2df_ctrl_brType, %ctrl_r_brType : i3
    %115 = comb.mux bin %1, %io_id2df_ctrl_writeCSREn, %ctrl_r_writeCSREn : i1
    %116 = comb.mux bin %1, %io_id2df_ctrl_writeRegEn, %ctrl_r_writeRegEn : i1
    %117 = comb.mux bin %1, %io_id2df_ctrl_dcMode, %ctrl_r_dcMode : i5
    %118 = comb.mux bin %1, %io_id2df_ctrl_aluWidth, %ctrl_r_aluWidth : i1
    %119 = comb.mux bin %1, %io_id2df_ctrl_aluOp, %ctrl_r_aluOp : i5
    %120 = comb.mux bin %1, %io_id2df_rs1, %rs1_r : i5
    %121 = comb.mux bin %1, %io_id2df_rrs1, %rrs1_r : i1
    %122 = comb.mux bin %1, %io_id2df_rs1_d, %rs1_d_r : i64
    %123 = comb.mux bin %1, %io_id2df_rs2, %rs2_r : i12
    %124 = comb.mux bin %1, %io_id2df_rrs2, %rrs2_r : i1
    %125 = comb.mux bin %1, %io_id2df_rs2_d, %rs2_d_r : i64
    %126 = comb.mux bin %1, %io_id2df_dst, %dst_r : i5
    %127 = comb.mux bin %1, %io_id2df_dst_d, %dst_d_r : i64
    %128 = comb.mux bin %1, %io_id2df_jmp_type, %jmp_type_r : i2
    %129 = comb.mux bin %1, %io_id2df_special, %special_r : i2
    %130 = comb.mux bin %1, %io_id2df_indi, %indi_r : i2
    %131 = comb.mux bin %1, %io_id2df_swap, %swap_r : i6
    %132 = comb.mux bin %1, %io_id2df_recov, %recov_r : i1
    %133 = comb.or bin %1, %state : i1
    %134 = comb.and bin %133, %4, %54, %53 : i1
    %135 = comb.xor %134, %true : i1
    %136 = comb.and %135, %121 : i1
    %137 = comb.mux bin %134, %48, %122 : i64
    %138 = comb.and bin %133, %6, %98, %97 : i1
    %139 = comb.xor %138, %true : i1
    %140 = comb.and %139, %124 : i1
    %141 = comb.mux bin %138, %92, %125 : i64
    %142 = comb.mux bin %1, %io_id2df_dst, %pre_dst : i5
    %143 = comb.xor %2, %true : i1
    %144 = comb.and %143, %pre_wr : i1
    %145 = comb.mux bin %1, %io_id2df_ctrl_writeRegEn, %144 : i1
    %146 = comb.or bin %valid_r, %state : i1
    %147 = comb.xor bin %2, %true : i1
    %148 = comb.and bin %146, %147 : i1
    %149 = comb.xor %148, %true : i1
    %150 = comb.and %0, %149, %io_id2df_valid {sv.namehint = "io_id2df_ready"} : i1
    %151 = comb.xor bin %state, %true : i1
    %152 = comb.or bin %63, %106 : i1
    %153 = comb.and bin %1, %152 : i1
    %154 = comb.and bin %151, %153 : i1
    %155 = comb.or %154, %state : i1
    %156 = comb.xor %2, %true : i1
    %157 = comb.and %156, %valid_r : i1
    %158 = comb.or %1, %157 : i1
    %159 = comb.xor %153, %true : i1
    %160 = comb.and %159, %158 : i1
    %161 = comb.mux bin %state, %valid_r, %160 : i1
    %162 = comb.xor bin %63, %true : i1
    %163 = comb.xor bin %106, %true : i1
    %164 = comb.and bin %state, %162, %163 : i1
    %165 = comb.xor %164, %true : i1
    %166 = comb.or %164, %161 : i1
    %167 = comb.and %0, %165, %155 : i1
    %168 = comb.and %0, %166 : i1
    hw.output %io_df2rr_drop, %io_df2rr_stall, %150, %inst_r, %pc_r, %excep_r_cause, %excep_r_tval, %excep_r_en, %excep_r_pc, %excep_r_etype, %ctrl_r_aluOp, %ctrl_r_aluWidth, %ctrl_r_dcMode, %ctrl_r_writeRegEn, %ctrl_r_writeCSREn, %ctrl_r_brType, %rs1_r, %rrs1_r, %rs1_d_r, %rs2_r, %rrs2_r, %rs2_d_r, %dst_r, %dst_d_r, %jmp_type_r, %special_r, %swap_r, %indi_r, %recov_r, %valid_r : i1, i1, i1, i32, i64, i64, i64, i1, i64, i2, i5, i1, i5, i1, i1, i3, i5, i1, i64, i12, i1, i64, i5, i64, i2, i2, i6, i2, i1, i1
  }
  hw.module private @ReadRegs(in %clock : !seq.clock, in %reset : i1, in %io_df2rr_inst : i32, in %io_df2rr_pc : i64, in %io_df2rr_excep_cause : i64, in %io_df2rr_excep_tval : i64, in %io_df2rr_excep_en : i1, in %io_df2rr_excep_pc : i64, in %io_df2rr_excep_etype : i2, in %io_df2rr_ctrl_aluOp : i5, in %io_df2rr_ctrl_aluWidth : i1, in %io_df2rr_ctrl_dcMode : i5, in %io_df2rr_ctrl_writeRegEn : i1, in %io_df2rr_ctrl_writeCSREn : i1, in %io_df2rr_ctrl_brType : i3, in %io_df2rr_rs1 : i5, in %io_df2rr_rrs1 : i1, in %io_df2rr_rs1_d : i64, in %io_df2rr_rs2 : i12, in %io_df2rr_rrs2 : i1, in %io_df2rr_rs2_d : i64, in %io_df2rr_dst : i5, in %io_df2rr_dst_d : i64, in %io_df2rr_jmp_type : i2, in %io_df2rr_special : i2, in %io_df2rr_swap : i6, in %io_df2rr_indi : i2, out io_df2rr_drop : i1, out io_df2rr_stall : i1, in %io_df2rr_recov : i1, in %io_df2rr_valid : i1, out io_df2rr_ready : i1, out io_rr2ex_inst : i32, out io_rr2ex_pc : i64, out io_rr2ex_excep_cause : i64, out io_rr2ex_excep_tval : i64, out io_rr2ex_excep_en : i1, out io_rr2ex_excep_pc : i64, out io_rr2ex_excep_etype : i2, out io_rr2ex_ctrl_aluOp : i5, out io_rr2ex_ctrl_aluWidth : i1, out io_rr2ex_ctrl_dcMode : i5, out io_rr2ex_ctrl_writeRegEn : i1, out io_rr2ex_ctrl_writeCSREn : i1, out io_rr2ex_ctrl_brType : i3, out io_rr2ex_rs1_d : i64, out io_rr2ex_rs2 : i12, out io_rr2ex_rs2_d : i64, out io_rr2ex_dst : i5, out io_rr2ex_dst_d : i64, out io_rr2ex_jmp_type : i2, out io_rr2ex_special : i2, out io_rr2ex_indi : i2, in %io_rr2ex_drop : i1, in %io_rr2ex_stall : i1, out io_rr2ex_recov : i1, out io_rr2ex_valid : i1, in %io_rr2ex_ready : i1, out io_rs1Read_id : i5, in %io_rs1Read_data : i64, out io_rs2Read_id : i5, in %io_rs2Read_data : i64, out io_csrRead_id : i12, in %io_csrRead_data : i64, in %io_csrRead_is_err : i1, out io_d_rr_id : i5, out io_d_rr_data : i64, out io_d_rr_state : i2) {
    %c0_i32 = hw.constant 0 : i32
    %c0_i12 = hw.constant 0 : i12
    %true = hw.constant true
    %c0_i2 = hw.constant 0 : i2
    %c0_i64 = hw.constant 0 : i64
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %c0_i5 = hw.constant 0 : i5
    %c2_i64 = hw.constant 2 : i64
    %drop_r = seq.firreg %40 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %stall_r = seq.firreg %40 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %recov_r = seq.firreg %42 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2 : ui64, sv.namehint = "recov_r"} : i1
    %0 = comb.or bin %io_rr2ex_drop, %drop_r {sv.namehint = "drop_in"} : i1
    %1 = comb.xor bin %io_rr2ex_drop, %true {sv.namehint = "_io_df2rr_stall_T"} : i1
    %2 = comb.and bin %stall_r, %1 {sv.namehint = "_io_df2rr_stall_T_1"} : i1
    %3 = comb.or bin %2, %io_rr2ex_stall {sv.namehint = "io_df2rr_stall"} : i1
    %inst_r = seq.firreg %11 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 3 : ui64, sv.namehint = "inst_r"} : i32
    %pc_r = seq.firreg %12 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 35 : ui64, sv.namehint = "pc_r"} : i64
    %excep_r_cause = seq.firreg %30 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 99 : ui64, sv.namehint = "excep_r_cause"} : i64
    %excep_r_tval = seq.firreg %33 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 163 : ui64, sv.namehint = "excep_r_tval"} : i64
    %excep_r_en = seq.firreg %35 clock %clock reset sync %reset, %false {firrtl.random_init_start = 227 : ui64, sv.namehint = "excep_r_en"} : i1
    %excep_r_pc = seq.firreg %37 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 228 : ui64, sv.namehint = "excep_r_pc"} : i64
    %excep_r_etype = seq.firreg %39 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 292 : ui64, sv.namehint = "excep_r_etype"} : i2
    %ctrl_r_aluOp = seq.firreg %57 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 294 : ui64, sv.namehint = "ctrl_r_aluOp"} : i5
    %ctrl_r_aluWidth = seq.firreg %55 clock %clock reset sync %reset, %false {firrtl.random_init_start = 299 : ui64, sv.namehint = "ctrl_r_aluWidth"} : i1
    %ctrl_r_dcMode = seq.firreg %52 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 300 : ui64, sv.namehint = "ctrl_r_dcMode"} : i5
    %ctrl_r_writeRegEn = seq.firreg %50 clock %clock reset sync %reset, %false {firrtl.random_init_start = 305 : ui64, sv.namehint = "ctrl_r_writeRegEn"} : i1
    %ctrl_r_writeCSREn = seq.firreg %47 clock %clock reset sync %reset, %false {firrtl.random_init_start = 306 : ui64, sv.namehint = "ctrl_r_writeCSREn"} : i1
    %ctrl_r_brType = seq.firreg %44 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 307 : ui64, sv.namehint = "ctrl_r_brType"} : i3
    %rs1_d_r = seq.firreg %16 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 315 : ui64, sv.namehint = "rs1_d_r"} : i64
    %rs2_r = seq.firreg %17 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 379 : ui64, sv.namehint = "rs2_r"} : i12
    %rs2_d_r = seq.firreg %21 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 391 : ui64, sv.namehint = "rs2_d_r"} : i64
    %dst_r = seq.firreg %22 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 455 : ui64, sv.namehint = "dst_r"} : i5
    %dst_d_r = seq.firreg %26 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 460 : ui64, sv.namehint = "dst_d_r"} : i64
    %jmp_type_r = seq.firreg %59 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 536 : ui64, sv.namehint = "jmp_type_r"} : i2
    %special_r = seq.firreg %61 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 538 : ui64, sv.namehint = "special_r"} : i2
    %indi_r = seq.firreg %27 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 540 : ui64, sv.namehint = "indi_r"} : i2
    %valid_r = seq.firreg %70 clock %clock reset sync %reset, %false {firrtl.random_init_start = 542 : ui64, sv.namehint = "valid_r"} : i1
    %4 = comb.and bin %66, %io_df2rr_valid {sv.namehint = "hs_in"} : i1
    %5 = comb.and bin %io_rr2ex_ready, %valid_r {sv.namehint = "hs_out"} : i1
    %6 = comb.extract %io_df2rr_rs2 from 0 {sv.namehint = "io_rs2Read_id"} : (i12) -> i5
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
    %28 = comb.and bin %io_df2rr_ctrl_writeCSREn, %io_csrRead_is_err : i1
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
    %62 = comb.xor bin %0, %true : i1
    %63 = comb.xor bin %5, %true : i1
    %64 = comb.and bin %valid_r, %63 : i1
    %65 = comb.xor %64, %true : i1
    %66 = comb.and %62, %65, %io_df2rr_valid {sv.namehint = "io_df2rr_ready"} : i1
    %67 = comb.xor %5, %true : i1
    %68 = comb.and %67, %valid_r : i1
    %69 = comb.or %4, %68 : i1
    %70 = comb.and %1, %69 : i1
    %71 = comb.concat %valid_r, %false {sv.namehint = "io_d_rr_state"} : i1, i1
    hw.output %0, %3, %66, %inst_r, %pc_r, %excep_r_cause, %excep_r_tval, %excep_r_en, %excep_r_pc, %excep_r_etype, %ctrl_r_aluOp, %ctrl_r_aluWidth, %ctrl_r_dcMode, %ctrl_r_writeRegEn, %ctrl_r_writeCSREn, %ctrl_r_brType, %rs1_d_r, %rs2_r, %rs2_d_r, %dst_r, %dst_d_r, %jmp_type_r, %special_r, %indi_r, %recov_r, %valid_r, %io_df2rr_rs1, %6, %io_df2rr_rs2, %dst_r, %dst_d_r, %71 : i1, i1, i1, i32, i64, i64, i64, i1, i64, i2, i5, i1, i5, i1, i1, i3, i64, i12, i64, i5, i64, i2, i2, i2, i1, i1, i5, i5, i12, i5, i64, i2
  }
  hw.module private @MUL(in %clock : !seq.clock, in %reset : i1, in %io_a : i64, in %io_b : i64, in %io_aluop : i5, in %io_en : i1, out io_out : i64, out io_valid : i1) {
    %true = hw.constant true
    %c0_i64 = hw.constant 0 : i64
    %c0_i5 = hw.constant 0 : i5
    %false = hw.constant false
    %c0_i2 = hw.constant 0 : i2
    %c1_i2 = hw.constant 1 : i2
    %c13_i5 = hw.constant 13 : i5
    %c14_i5 = hw.constant 14 : i5
    %c15_i5 = hw.constant 15 : i5
    %c-16_i5 = hw.constant -16 : i5
    %out_r = seq.firreg %35 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 0 : ui64, sv.namehint = "out_r"} : i64
    %val1 = seq.firreg %3 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 64 : ui64} : i64
    %val2 = seq.firreg %4 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 128 : ui64} : i64
    %aluop_r = seq.firreg %5 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 192 : ui64} : i5
    %valid_r = seq.firreg %38 clock %clock reset sync %reset, %false {firrtl.random_init_start = 197 : ui64, sv.namehint = "valid_r"} : i1
    %state = seq.firreg %40 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 198 : ui64} : i2
    %0 = comb.icmp bin eq %state, %c0_i2 {sv.namehint = "_io_ready_T"} : i2
    %1 = comb.mux bin %io_en, %c1_i2, %state : i2
    %2 = comb.and bin %0, %io_en : i1
    %3 = comb.mux bin %2, %io_a, %val1 : i64
    %4 = comb.mux bin %2, %io_b, %val2 : i64
    %5 = comb.mux bin %2, %io_aluop, %aluop_r : i5
    %6 = comb.icmp bin eq %state, %c1_i2 : i2
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
    %23 = comb.mul %21, %22 {sv.namehint = "_out_r_T_10"} : i128
    %24 = comb.extract %23 from 64 {sv.namehint = "_out_r_T_15"} : (i128) -> i64
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
  hw.module private @DIV(in %clock : !seq.clock, in %reset : i1, in %io_alu64 : i1, in %io_a : i64, in %io_b : i64, in %io_sign : i1, in %io_en : i1, out io_qua : i64, out io_rem : i64, out io_valid : i1) {
    %c1_i7 = hw.constant 1 : i7
    %c-63_i7 = hw.constant -63 : i7
    %c1_i64 = hw.constant 1 : i64
    %c-1_i64 = hw.constant -1 : i64
    %c0_i64 = hw.constant 0 : i64
    %c0_i128 = hw.constant 0 : i128
    %false = hw.constant false
    %c0_i7 = hw.constant 0 : i7
    %c0_i2 = hw.constant 0 : i2
    %c1_i2 = hw.constant 1 : i2
    %true = hw.constant true
    %c-64_i7 = hw.constant -64 : i7
    %quatient = seq.firreg %45 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 0 : ui64} : i64
    %val1 = seq.firreg %38 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 64 : ui64} : i128
    %val2 = seq.firreg %47 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 192 : ui64} : i128
    %qua_sign = seq.firreg %20 clock %clock reset sync %reset, %false {firrtl.random_init_start = 320 : ui64} : i1
    %rem_sign = seq.firreg %22 clock %clock reset sync %reset, %false {firrtl.random_init_start = 321 : ui64} : i1
    %iter = seq.firreg %31 clock %clock reset sync %reset, %c0_i7 {firrtl.random_init_start = 322 : ui64} : i7
    %pre_alu64 = seq.firreg %23 clock %clock reset sync %reset, %false {firrtl.random_init_start = 329 : ui64} : i1
    %state = seq.firreg %51 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 330 : ui64} : i2
    %0 = comb.icmp bin eq %state, %c0_i2 {sv.namehint = "_io_ready_T"} : i2
    %1 = comb.mux bin %io_en, %c1_i2, %state : i2
    %2 = comb.extract %io_a from 63 {sv.namehint = "_rem_sign_T_1"} : (i64) -> i1
    %3 = comb.and bin %io_sign, %2 {sv.namehint = "_val1_T_2"} : i1
    %4 = comb.xor bin %io_a, %c-1_i64 {sv.namehint = "_val1_T_3"} : i64
    %5 = comb.add %4, %c1_i64 {sv.namehint = "_val1_T_4"} : i64
    %6 = comb.mux bin %3, %5, %io_a {sv.namehint = "val1_lo"} : i64
    %7 = comb.concat %c0_i64, %6 {sv.namehint = "_val1_T_6"} : i64, i64
    %8 = comb.mux bin %io_en, %7, %val1 : i128
    %9 = comb.extract %io_b from 63 {sv.namehint = "_qua_sign_T_1"} : (i64) -> i1
    %10 = comb.and bin %io_sign, %9 {sv.namehint = "_val2_T_2"} : i1
    %11 = comb.xor bin %io_b, %c-1_i64 {sv.namehint = "_val2_T_3"} : i64
    %12 = comb.add %11, %c1_i64 {sv.namehint = "_val2_T_4"} : i64
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
    %26 = comb.icmp bin eq %state, %c1_i2 : i2
    %27 = comb.icmp bin ult %iter, %c-63_i7 : i7
    %28 = comb.add %iter, %c1_i7 {sv.namehint = "_iter_T"} : i7
    %29 = comb.and bin %26, %27 : i1
    %30 = comb.mux bin %29, %28, %iter : i7
    %31 = comb.mux bin %0, %25, %30 : i7
    %32 = comb.icmp bin uge %val1, %val2 : i128
    %33 = comb.extract %quatient from 0 {sv.namehint = "quatient_hi"} : (i64) -> i63
    %34 = comb.concat %33, %true {sv.namehint = "_quatient_T"} : i63, i1
    %35 = comb.sub %val1, %val2 {sv.namehint = "_val1_T_7"} : i128
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
    %52 = comb.icmp bin ugt %iter, %c-64_i7 : i7
    %53 = comb.xor %0, %true : i1
    %54 = comb.and %53, %26, %52 {sv.namehint = "io_valid"} : i1
    %55 = comb.xor bin %quatient, %c-1_i64 {sv.namehint = "_sign_qua_T"} : i64
    %56 = comb.add %55, %c1_i64 {sv.namehint = "_sign_qua_T_1"} : i64
    %57 = comb.mux bin %qua_sign, %56, %quatient {sv.namehint = "sign_qua"} : i64
    %58 = comb.extract %val1 from 0 {sv.namehint = "_sign_rem_T_4"} : (i128) -> i64
    %59 = comb.xor bin %58, %c-1_i64 {sv.namehint = "_sign_rem_T_1"} : i64
    %60 = comb.add %59, %c1_i64 {sv.namehint = "_sign_rem_T_2"} : i64
    %61 = comb.mux bin %rem_sign, %60, %58 {sv.namehint = "sign_rem"} : i64
    %62 = comb.extract %57 from 31 {sv.namehint = "_io_qua_T_1"} : (i64) -> i1
    %63 = comb.replicate %62 {sv.namehint = "io_qua_hi"} : (i1) -> i32
    %64 = comb.extract %57 from 0 {sv.namehint = "io_qua_lo"} : (i64) -> i32
    %65 = comb.concat %63, %64 {sv.namehint = "_io_qua_T_2"} : i32, i32
    %66 = comb.mux bin %pre_alu64, %57, %65 {sv.namehint = "_io_qua_T_3"} : i64
    %67 = comb.xor %26, %true : i1
    %68 = comb.or %0, %67, %27 : i1
    %69 = comb.mux bin %68, %c0_i64, %66 {sv.namehint = "io_qua"} : i64
    %70 = comb.extract %61 from 31 {sv.namehint = "_io_rem_T_1"} : (i64) -> i1
    %71 = comb.replicate %70 {sv.namehint = "io_rem_hi"} : (i1) -> i32
    %72 = comb.extract %61 from 0 {sv.namehint = "io_rem_lo"} : (i64) -> i32
    %73 = comb.concat %71, %72 {sv.namehint = "_io_rem_T_2"} : i32, i32
    %74 = comb.mux bin %pre_alu64, %61, %73 {sv.namehint = "_io_rem_T_3"} : i64
    %75 = comb.xor %26, %true : i1
    %76 = comb.or %0, %75, %27 : i1
    %77 = comb.mux bin %76, %c0_i64, %74 {sv.namehint = "io_rem"} : i64
    hw.output %69, %77, %54 : i64, i64, i1
  }
  hw.module private @ALU(in %clock : !seq.clock, in %reset : i1, in %io_alu_op : i5, in %io_val1 : i64, in %io_val2 : i64, in %io_alu64 : i1, in %io_en : i1, out io_out : i64, out io_valid : i1) {
    %c-1_i64 = hw.constant -1 : i64
    %c0_i32 = hw.constant 0 : i32
    %c0_i26 = hw.constant 0 : i26
    %c0_i58 = hw.constant 0 : i58
    %c0_i121 = hw.constant 0 : i121
    %c0_i63 = hw.constant 0 : i63
    %c0_i5 = hw.constant 0 : i5
    %c0_i2 = hw.constant 0 : i2
    %c-15_i5 = hw.constant -15 : i5
    %c-14_i5 = hw.constant -14 : i5
    %c-13_i5 = hw.constant -13 : i5
    %c-12_i5 = hw.constant -12 : i5
    %true = hw.constant true
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
    %multiplier.io_out, %multiplier.io_valid = hw.instance "multiplier" @MUL(clock: %clock: !seq.clock, reset: %reset: i1, io_a: %io_val1: i64, io_b: %io_val2: i64, io_aluop: %io_alu_op: i5, io_en: %13: i1) -> (io_out: i64, io_valid: i1) {sv.namehint = "multiplier.io_out"}
    %divider.io_qua, %divider.io_rem, %divider.io_valid = hw.instance "divider" @DIV(clock: %clock: !seq.clock, reset: %reset: i1, io_alu64: %io_alu64: i1, io_a: %io_val1: i64, io_b: %io_val2: i64, io_sign: %4: i1, io_en: %20: i1) -> (io_qua: i64, io_rem: i64, io_valid: i1) {sv.namehint = "divider.io_rem"}
    %pre_aluop = seq.firreg %7 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 0 : ui64} : i5
    %state = seq.firreg %99 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 5 : ui64} : i2
    %0 = comb.icmp bin eq %io_alu_op, %c-15_i5 {sv.namehint = "_div_type_T_1"} : i5
    %1 = comb.icmp bin eq %io_alu_op, %c-13_i5 {sv.namehint = "_div_type_T_12"} : i5
    %2 = comb.icmp bin ne %io_alu_op, %c-14_i5 : i5
    %3 = comb.and %2, %1 {sv.namehint = "_div_type_T_13"} : i1
    %4 = comb.or %0, %3 {sv.namehint = "divider.io_sign"} : i1
    %5 = comb.icmp bin eq %state, %c0_i2 {sv.namehint = "_io_ready_T"} : i2
    %6 = comb.and bin %5, %io_en : i1
    %7 = comb.mux bin %6, %io_alu_op, %pre_aluop : i5
    %8 = comb.icmp bin eq %io_alu_op, %c13_i5 : i5
    %9 = comb.icmp bin eq %io_alu_op, %c14_i5 : i5
    %10 = comb.icmp bin eq %io_alu_op, %c15_i5 : i5
    %11 = comb.icmp bin eq %io_alu_op, %c-16_i5 : i5
    %12 = comb.or bin %8, %9, %10, %11 : i1
    %13 = comb.and %6, %12 {sv.namehint = "multiplier.io_en"} : i1
    %14 = comb.icmp bin eq %io_alu_op, %c-15_i5 : i5
    %15 = comb.icmp bin eq %io_alu_op, %c-14_i5 : i5
    %16 = comb.icmp bin eq %io_alu_op, %c-13_i5 : i5
    %17 = comb.icmp bin eq %io_alu_op, %c-12_i5 : i5
    %18 = comb.or bin %14, %15, %16, %17 : i1
    %19 = comb.xor %12, %true : i1
    %20 = comb.and %6, %19, %18 {sv.namehint = "divider.io_en"} : i1
    %21 = comb.mux bin %18, %c-2_i2, %state : i2
    %22 = comb.mux bin %12, %c1_i2, %21 : i2
    %23 = comb.mux bin %io_en, %22, %state : i2
    %24 = comb.add %io_val1, %io_val2 {sv.namehint = "_alu_val_T"} : i64
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
    %43 = comb.sub %io_val1, %io_val2 {sv.namehint = "_alu_val_T_23"} : i64
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
    %62 = comb.mux %60, %61, %59 {sv.namehint = "_alu_val_T_48"} : i64
    %63 = comb.icmp bin eq %io_alu_op, %c8_i5 {sv.namehint = "_alu_val_T_49"} : i5
    %64 = comb.mux %63, %38, %62 {sv.namehint = "_alu_val_T_50"} : i64
    %65 = comb.icmp bin eq %io_alu_op, %c9_i5 {sv.namehint = "_alu_val_T_51"} : i5
    %66 = comb.mux %65, %42, %64 {sv.namehint = "_alu_val_T_52"} : i64
    %67 = comb.icmp bin eq %io_alu_op, %c10_i5 {sv.namehint = "_alu_val_T_53"} : i5
    %68 = comb.mux %67, %43, %66 {sv.namehint = "_alu_val_T_54"} : i64
    %69 = comb.icmp bin eq %io_alu_op, %c11_i5 {sv.namehint = "_alu_val_T_55"} : i5
    %70 = comb.concat %c0_i63, %44 : i63, i1
    %71 = comb.mux %69, %70, %68 {sv.namehint = "_alu_val_T_56"} : i64
    %72 = comb.icmp bin eq %io_alu_op, %c12_i5 {sv.namehint = "_alu_val_T_57"} : i5
    %73 = comb.concat %c0_i63, %45 : i63, i1
    %74 = comb.mux %72, %73, %71 {sv.namehint = "_alu_val_T_58"} : i64
    %75 = comb.icmp bin eq %io_alu_op, %c-11_i5 {sv.namehint = "_alu_val_T_59"} : i5
    %76 = comb.mux %75, %47, %74 {sv.namehint = "alu_val"} : i64
    %77 = comb.xor %io_en, %true : i1
    %78 = comb.or %77, %12, %18 : i1
    %79 = comb.mux bin %78, %c0_i64, %76 : i64
    %80 = comb.xor bin %18, %true : i1
    %81 = comb.xor %12, %true : i1
    %82 = comb.and %io_en, %81, %80 : i1
    %83 = comb.icmp bin eq %state, %c1_i2 : i2
    %84 = comb.mux bin %multiplier.io_valid, %multiplier.io_out, %c0_i64 : i64
    %85 = comb.icmp bin eq %state, %c-2_i2 : i2
    %86 = comb.icmp bin eq %pre_aluop, %c-15_i5 {sv.namehint = "_io_out_T"} : i5
    %87 = comb.icmp bin eq %pre_aluop, %c-14_i5 {sv.namehint = "_io_out_T_1"} : i5
    %88 = comb.or bin %86, %87 {sv.namehint = "_io_out_T_2"} : i1
    %89 = comb.mux bin %88, %divider.io_qua, %divider.io_rem {sv.namehint = "_io_out_T_3"} : i64
    %90 = comb.and bin %85, %divider.io_valid : i1
    %91 = comb.mux bin %90, %89, %c0_i64 : i64
    %92 = comb.mux bin %83, %84, %91 : i64
    %93 = comb.mux bin %5, %79, %92 {sv.namehint = "io_out"} : i64
    %94 = comb.and %85, %divider.io_valid : i1
    %95 = comb.mux bin %83, %multiplier.io_valid, %94 : i1
    %96 = comb.mux bin %5, %82, %95 {sv.namehint = "io_valid"} : i1
    %97 = comb.mux %83, %multiplier.io_valid, %90 : i1
    %98 = comb.mux bin %97, %c0_i2, %state : i2
    %99 = comb.mux bin %5, %23, %98 : i2
    hw.output %93, %96 : i64, i1
  }
  hw.module private @BranchALU(in %io_val1 : i64, in %io_val2 : i64, in %io_brType : i3, out io_is_jmp : i1) {
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
    %9 = hw.array_get %8[%io_brType] {sv.namehint = "io_is_jmp"} : !hw.array<8xi1>, i3
    hw.output %9 : i1
  }
  hw.module private @Execute(in %clock : !seq.clock, in %reset : i1, in %io_rr2ex_inst : i32, in %io_rr2ex_pc : i64, in %io_rr2ex_excep_cause : i64, in %io_rr2ex_excep_tval : i64, in %io_rr2ex_excep_en : i1, in %io_rr2ex_excep_pc : i64, in %io_rr2ex_excep_etype : i2, in %io_rr2ex_ctrl_aluOp : i5, in %io_rr2ex_ctrl_aluWidth : i1, in %io_rr2ex_ctrl_dcMode : i5, in %io_rr2ex_ctrl_writeRegEn : i1, in %io_rr2ex_ctrl_writeCSREn : i1, in %io_rr2ex_ctrl_brType : i3, in %io_rr2ex_rs1_d : i64, in %io_rr2ex_rs2 : i12, in %io_rr2ex_rs2_d : i64, in %io_rr2ex_dst : i5, in %io_rr2ex_dst_d : i64, in %io_rr2ex_jmp_type : i2, in %io_rr2ex_special : i2, in %io_rr2ex_indi : i2, out io_rr2ex_drop : i1, out io_rr2ex_stall : i1, in %io_rr2ex_recov : i1, in %io_rr2ex_valid : i1, out io_rr2ex_ready : i1, out io_ex2mem_inst : i32, out io_ex2mem_pc : i64, out io_ex2mem_excep_cause : i64, out io_ex2mem_excep_tval : i64, out io_ex2mem_excep_en : i1, out io_ex2mem_excep_pc : i64, out io_ex2mem_excep_etype : i2, out io_ex2mem_ctrl_dcMode : i5, out io_ex2mem_ctrl_writeRegEn : i1, out io_ex2mem_ctrl_writeCSREn : i1, out io_ex2mem_mem_addr : i64, out io_ex2mem_mem_data : i64, out io_ex2mem_csr_id : i12, out io_ex2mem_csr_d : i64, out io_ex2mem_dst : i5, out io_ex2mem_dst_d : i64, out io_ex2mem_special : i2, out io_ex2mem_indi : i2, in %io_ex2mem_drop : i1, in %io_ex2mem_stall : i1, out io_ex2mem_recov : i1, out io_ex2mem_valid : i1, in %io_ex2mem_ready : i1, out io_d_ex_id : i5, out io_d_ex_data : i64, out io_d_ex_state : i2, out io_ex2if_seq_pc : i64, out io_ex2if_valid : i1, in %io_updateNextPc_seq_pc : i64, in %io_updateNextPc_valid : i1) {
    %c0_i61 = hw.constant 0 : i61
    %c1_i62 = hw.constant 1 : i62
    %c-1_i2 = hw.constant -1 : i2
    %c0_i3 = hw.constant 0 : i3
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
    %true = hw.constant true
    %c-2_i2 = hw.constant -2 : i2
    %c-4_i3 = hw.constant -4 : i3
    %c1_i2 = hw.constant 1 : i2
    %c0_i2 = hw.constant 0 : i2
    %c0_i5 = hw.constant 0 : i5
    %false = hw.constant false
    %c0_i64 = hw.constant 0 : i64
    %c2_i3 = hw.constant 2 : i3
    %drop_r = seq.firreg %149 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %stall_r = seq.firreg %96 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64} : i1
    %0 = comb.or bin %drop_r, %io_ex2mem_drop {sv.namehint = "drop_in"} : i1
    %1 = comb.xor bin %io_ex2mem_drop, %true {sv.namehint = "_io_ex2if_valid_T"} : i1
    %2 = comb.and bin %stall_r, %1 {sv.namehint = "_io_rr2ex_stall_T_1"} : i1
    %3 = comb.or bin %io_ex2mem_stall, %2 {sv.namehint = "io_rr2ex_stall"} : i1
    %alu.io_out, %alu.io_valid = hw.instance "alu" @ALU(clock: %clock: !seq.clock, reset: %reset: i1, io_alu_op: %io_rr2ex_ctrl_aluOp: i5, io_val1: %21: i64, io_val2: %38: i64, io_alu64: %6: i1, io_en: %104: i1) -> (io_out: i64, io_valid: i1) {sv.namehint = "alu.io_out"}
    %inst_r = seq.firreg %64 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 2 : ui64, sv.namehint = "inst_r"} : i32
    %pc_r = seq.firreg %65 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 34 : ui64, sv.namehint = "pc_r"} : i64
    %excep_r_cause = seq.firreg %87 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 98 : ui64, sv.namehint = "excep_r_cause"} : i64
    %excep_r_tval = seq.firreg %89 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 162 : ui64, sv.namehint = "excep_r_tval"} : i64
    %excep_r_en = seq.firreg %91 clock %clock reset sync %reset, %false {firrtl.random_init_start = 226 : ui64, sv.namehint = "excep_r_en"} : i1
    %excep_r_pc = seq.firreg %93 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 227 : ui64, sv.namehint = "excep_r_pc"} : i64
    %excep_r_etype = seq.firreg %95 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 291 : ui64, sv.namehint = "excep_r_etype"} : i2
    %ctrl_r_dcMode = seq.firreg %82 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 299 : ui64, sv.namehint = "ctrl_r_dcMode"} : i5
    %ctrl_r_writeRegEn = seq.firreg %80 clock %clock reset sync %reset, %false {firrtl.random_init_start = 304 : ui64, sv.namehint = "ctrl_r_writeRegEn"} : i1
    %ctrl_r_writeCSREn = seq.firreg %78 clock %clock reset sync %reset, %false {firrtl.random_init_start = 305 : ui64, sv.namehint = "ctrl_r_writeCSREn"} : i1
    %mem_addr_r = seq.firreg %66 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 309 : ui64, sv.namehint = "mem_addr_r"} : i64
    %mem_data_r = seq.firreg %67 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 373 : ui64, sv.namehint = "mem_data_r"} : i64
    %csr_id_r = seq.firreg %68 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 437 : ui64, sv.namehint = "csr_id_r"} : i12
    %csr_d_r = seq.firreg %69 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 449 : ui64, sv.namehint = "csr_d_r"} : i64
    %dst_r = seq.firreg %70 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 513 : ui64, sv.namehint = "dst_r"} : i5
    %dst_d_r = seq.firreg %121 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 518 : ui64, sv.namehint = "dst_d_r"} : i64
    %special_r = seq.firreg %72 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 594 : ui64, sv.namehint = "special_r"} : i2
    %alu64_r = seq.firreg %73 clock %clock reset sync %reset, %false {firrtl.random_init_start = 596 : ui64} : i1
    %indi_r = seq.firreg %84 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 597 : ui64, sv.namehint = "indi_r"} : i2
    %next_pc_r = seq.firreg %142 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 599 : ui64} : i64
    %recov_r = seq.firreg %98 clock %clock reset sync %reset, %false {firrtl.random_init_start = 663 : ui64, sv.namehint = "recov_r"} : i1
    %valid_r = seq.firreg %126 clock %clock reset sync %reset, %false {firrtl.random_init_start = 664 : ui64, sv.namehint = "valid_r"} : i1
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
    %74 = comb.extract %io_rr2ex_excep_cause from 63 : (i64) -> i1
    %75 = comb.mux bin %74, %next_pc_r, %io_rr2ex_excep_pc : i64
    %76 = comb.xor bin %63, %true : i1
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
    %99 = comb.xor bin %0, %true : i1
    %100 = comb.or bin %valid_r, %state : i1
    %101 = comb.xor bin %5, %true : i1
    %102 = comb.and bin %100, %101 : i1
    %103 = comb.xor %102, %true : i1
    %104 = comb.and %99, %103, %io_rr2ex_valid {sv.namehint = "alu.io_en"} : i1
    %105 = comb.xor bin %state, %true : i1
    %106 = comb.xor bin %alu.io_valid, %true : i1
    %107 = comb.and bin %4, %106 : i1
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
    %branchAlu.io_is_jmp = hw.instance "branchAlu" @BranchALU(io_val1: %21: i64, io_val2: %38: i64, io_brType: %io_rr2ex_ctrl_brType: i3) -> (io_is_jmp: i1) {sv.namehint = "branchAlu.io_is_jmp"}
    %forceJmp_seq_pc = seq.firreg %147 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 667 : ui64, sv.namehint = "forceJmp_seq_pc"} : i64
    %forceJmp_valid = seq.firreg %148 clock %clock reset sync %reset, %false {firrtl.random_init_start = 731 : ui64} : i1
    %129 = comb.icmp bin eq %io_rr2ex_jmp_type, %c1_i2 {sv.namehint = "_real_target_T_7"} : i2
    %130 = comb.icmp bin eq %io_rr2ex_jmp_type, %c-2_i2 {sv.namehint = "_real_is_target_T_2"} : i2
    %131 = comb.mux bin %130, %branchAlu.io_is_jmp, %129 {sv.namehint = "real_is_target"} : i1
    %132 = comb.icmp bin eq %io_rr2ex_jmp_type, %c-1_i2 {sv.namehint = "_real_target_T"} : i2
    %133 = comb.extract %io_rr2ex_inst from 0 {sv.namehint = "_real_target_T_2"} : (i32) -> i2
    %134 = comb.icmp bin eq %133, %c-1_i2 {sv.namehint = "_real_target_T_3"} : i2
    %135 = comb.mux bin %134, %c-4_i3, %c2_i3 {sv.namehint = "_real_target_T_4"} : i3
    %136 = comb.concat %c0_i61, %135 : i61, i3
    %137 = comb.add %io_rr2ex_pc, %136 {sv.namehint = "_real_target_T_5"} : i64
    %138 = comb.add %io_rr2ex_rs1_d, %io_rr2ex_dst_d {sv.namehint = "_real_target_T_8"} : i64
    %139 = comb.mux bin %129, %138, %io_rr2ex_dst_d {sv.namehint = "_real_target_T_10"} : i64
    %140 = comb.mux bin %131, %139, %137 {sv.namehint = "_real_target_T_11"} : i64
    %141 = comb.mux bin %132, %io_rr2ex_rs2_d, %140 {sv.namehint = "real_target"} : i64
    %142 = comb.mux bin %4, %141, %48 : i64
    %143 = comb.xor bin %io_rr2ex_excep_en, %true : i1
    %144 = comb.icmp bin ne %io_rr2ex_jmp_type, %c0_i2 : i2
    %145 = comb.and bin %4, %143, %131, %144 : i1
    %146 = comb.and bin %99, %145 : i1
    %147 = comb.mux bin %146, %141, %forceJmp_seq_pc : i64
    %148 = comb.and %99, %145 : i1
    %149 = comb.or %146, %96 : i1
    %150 = comb.and bin %forceJmp_valid, %1 {sv.namehint = "io_ex2if_valid"} : i1
    %151 = comb.extract %ctrl_r_dcMode from 2 {sv.namehint = "_io_d_ex_state_T"} : (i5) -> i1
    %152 = comb.extract %indi_r from 1 {sv.namehint = "_io_d_ex_state_T_1"} : (i2) -> i1
    %153 = comb.or bin %151, %152 {sv.namehint = "_io_d_ex_state_T_2"} : i1
    %154 = comb.concat %false, %ctrl_r_writeRegEn {sv.namehint = "_io_d_ex_state_T_3"} : i1, i1
    %155 = comb.mux bin %153, %c-2_i2, %154 {sv.namehint = "_io_d_ex_state_T_4"} : i2
    %156 = comb.concat %state, %false : i1, i1
    %157 = comb.mux bin %valid_r, %155, %156 {sv.namehint = "io_d_ex_state"} : i2
    hw.output %0, %3, %104, %inst_r, %pc_r, %excep_r_cause, %excep_r_tval, %excep_r_en, %excep_r_pc, %excep_r_etype, %ctrl_r_dcMode, %ctrl_r_writeRegEn, %ctrl_r_writeCSREn, %mem_addr_r, %mem_data_r, %csr_id_r, %csr_d_r, %dst_r, %dst_d_r, %special_r, %indi_r, %recov_r, %valid_r, %dst_r, %dst_d_r, %157, %forceJmp_seq_pc, %150 : i1, i1, i1, i32, i64, i64, i64, i1, i64, i2, i5, i1, i1, i64, i64, i12, i64, i5, i64, i2, i2, i1, i1, i5, i64, i2, i64, i1
  }
  hw.module private @Memory(in %clock : !seq.clock, in %reset : i1, in %io_ex2mem_inst : i32, in %io_ex2mem_pc : i64, in %io_ex2mem_excep_cause : i64, in %io_ex2mem_excep_tval : i64, in %io_ex2mem_excep_en : i1, in %io_ex2mem_excep_pc : i64, in %io_ex2mem_excep_etype : i2, in %io_ex2mem_ctrl_dcMode : i5, in %io_ex2mem_ctrl_writeRegEn : i1, in %io_ex2mem_ctrl_writeCSREn : i1, in %io_ex2mem_mem_addr : i64, in %io_ex2mem_mem_data : i64, in %io_ex2mem_csr_id : i12, in %io_ex2mem_csr_d : i64, in %io_ex2mem_dst : i5, in %io_ex2mem_dst_d : i64, in %io_ex2mem_special : i2, in %io_ex2mem_indi : i2, out io_ex2mem_drop : i1, out io_ex2mem_stall : i1, in %io_ex2mem_recov : i1, in %io_ex2mem_valid : i1, out io_ex2mem_ready : i1, out io_mem2rb_pc : i64, out io_mem2rb_excep_cause : i64, out io_mem2rb_excep_tval : i64, out io_mem2rb_excep_en : i1, out io_mem2rb_excep_pc : i64, out io_mem2rb_excep_etype : i2, out io_mem2rb_csr_id : i12, out io_mem2rb_csr_d : i64, out io_mem2rb_csr_en : i1, out io_mem2rb_dst : i5, out io_mem2rb_dst_d : i64, out io_mem2rb_dst_en : i1, out io_mem2rb_special : i2, out io_mem2rb_recov : i1, out io_mem2rb_valid : i1, in %io_mem2rb_ready : i1, out io_dataRW_addr : i32, in %io_dataRW_rdata : i64, in %io_dataRW_rvalid : i1, out io_dataRW_wdata : i64, out io_dataRW_dc_mode : i5, out io_dataRW_amo : i5, in %io_dataRW_ready : i1, out io_va2pa_vaddr : i64, out io_va2pa_vvalid : i1, out io_va2pa_m_type : i2, in %io_va2pa_paddr : i32, in %io_va2pa_pvalid : i1, in %io_va2pa_tlb_excep_cause : i64, in %io_va2pa_tlb_excep_tval : i64, in %io_va2pa_tlb_excep_en : i1, out io_d_mem1_id : i5, out io_d_mem1_data : i64, out io_d_mem1_state : i2, out io_d_mem2_id : i5, out io_d_mem2_data : i64, out io_d_mem2_state : i2, out io_d_mem3_id : i5, out io_d_mem3_data : i64, out io_d_mem3_state : i2) {
    %c0_i32 = hw.constant 0 : i32
    %c0_i12 = hw.constant 0 : i12
    %c1_i2 = hw.constant 1 : i2
    %c0_i5 = hw.constant 0 : i5
    %c0_i2 = hw.constant 0 : i2
    %c0_i64 = hw.constant 0 : i64
    %c1_i64 = hw.constant 1 : i64
    %true = hw.constant true
    %false = hw.constant false
    %drop2_r = seq.firreg %135 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64, sv.namehint = "drop2_r"} : i1
    %stall2_r = seq.firreg %135 clock %clock reset sync %reset, %false {firrtl.random_init_start = 4 : ui64, sv.namehint = "stall2_r"} : i1
    %0 = comb.xor bin %drop2_r, %true {sv.namehint = "_stall1_in_T"} : i1
    %inst1_r = seq.firreg %2 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 6 : ui64} : i32
    %pc1_r = seq.firreg %3 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 38 : ui64} : i64
    %excep1_r_cause = seq.firreg %8 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 102 : ui64} : i64
    %excep1_r_tval = seq.firreg %7 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 166 : ui64} : i64
    %excep1_r_en = seq.firreg %6 clock %clock reset sync %reset, %false {firrtl.random_init_start = 230 : ui64} : i1
    %excep1_r_pc = seq.firreg %5 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 231 : ui64} : i64
    %excep1_r_etype = seq.firreg %4 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 295 : ui64} : i2
    %ctrl1_r_dcMode = seq.firreg %9 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 303 : ui64} : i5
    %mem_addr1_r = seq.firreg %10 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 313 : ui64} : i64
    %mem_data1_r = seq.firreg %11 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 377 : ui64} : i64
    %dst1_r = seq.firreg %12 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 441 : ui64, sv.namehint = "dst1_r"} : i5
    %dst_d1_r = seq.firreg %13 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 446 : ui64, sv.namehint = "dst_d1_r"} : i64
    %dst_en1_r = seq.firreg %14 clock %clock reset sync %reset, %false {firrtl.random_init_start = 510 : ui64} : i1
    %csr_id1_r = seq.firreg %15 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 511 : ui64} : i12
    %csr_d1_r = seq.firreg %16 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 523 : ui64} : i64
    %csr_en1_r = seq.firreg %17 clock %clock reset sync %reset, %false {firrtl.random_init_start = 587 : ui64} : i1
    %special1_r = seq.firreg %19 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 600 : ui64} : i2
    %indi1_r = seq.firreg %18 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 602 : ui64} : i2
    %recov1_r = seq.firreg %20 clock %clock reset sync %reset, %false {firrtl.random_init_start = 604 : ui64} : i1
    %valid1_r = seq.firreg %41 clock %clock reset sync %reset, %false {firrtl.random_init_start = 605 : ui64} : i1
    %is_tlb_r = seq.firreg %45 clock %clock reset sync %reset, %false {firrtl.random_init_start = 606 : ui64} : i1
    %drop_tlb = seq.firreg %57 clock %clock reset sync %reset, %false {firrtl.random_init_start = 607 : ui64} : i1
    %1 = comb.and bin %32, %io_ex2mem_valid {sv.namehint = "hs_in"} : i1
    %2 = comb.mux bin %1, %io_ex2mem_inst, %inst1_r : i32
    %3 = comb.mux bin %1, %io_ex2mem_pc, %pc1_r : i64
    %4 = comb.mux bin %1, %io_ex2mem_excep_etype, %excep1_r_etype : i2
    %5 = comb.mux bin %1, %io_ex2mem_excep_pc, %excep1_r_pc : i64
    %6 = comb.mux bin %1, %io_ex2mem_excep_en, %excep1_r_en : i1
    %7 = comb.mux bin %1, %io_ex2mem_excep_tval, %excep1_r_tval : i64
    %8 = comb.mux bin %1, %io_ex2mem_excep_cause, %excep1_r_cause : i64
    %9 = comb.mux bin %1, %io_ex2mem_ctrl_dcMode, %ctrl1_r_dcMode : i5
    %10 = comb.mux bin %1, %io_ex2mem_mem_addr, %mem_addr1_r : i64
    %11 = comb.mux bin %1, %io_ex2mem_mem_data, %mem_data1_r : i64
    %12 = comb.mux bin %1, %io_ex2mem_dst, %dst1_r : i5
    %13 = comb.mux bin %1, %io_ex2mem_dst_d, %dst_d1_r : i64
    %14 = comb.mux bin %1, %io_ex2mem_ctrl_writeRegEn, %dst_en1_r : i1
    %15 = comb.mux bin %1, %io_ex2mem_csr_id, %csr_id1_r : i12
    %16 = comb.mux bin %1, %io_ex2mem_csr_d, %csr_d1_r : i64
    %17 = comb.mux bin %1, %io_ex2mem_ctrl_writeCSREn, %csr_en1_r : i1
    %18 = comb.mux bin %1, %io_ex2mem_indi, %indi1_r : i2
    %19 = comb.mux bin %1, %io_ex2mem_special, %special1_r : i2
    %20 = comb.mux bin %1, %io_ex2mem_recov, %recov1_r : i1
    %21 = comb.icmp bin ne %io_ex2mem_ctrl_dcMode, %c0_i5 {sv.namehint = "access_tlb"} : i5
    %22 = comb.mux bin %1, %io_ex2mem_mem_addr, %mem_addr1_r {sv.namehint = "io_va2pa_vaddr"} : i64
    %23 = comb.xor bin %drop2_r, %true {sv.namehint = "_io_va2pa_vvalid_T"} : i1
    %24 = comb.xor bin %122, %true {sv.namehint = "_io_va2pa_vvalid_T_2"} : i1
    %25 = comb.and bin %23, %is_tlb_r, %24 {sv.namehint = "_io_va2pa_vvalid_T_3"} : i1
    %26 = comb.extract %io_ex2mem_ctrl_dcMode from 3 : (i5) -> i1
    %27 = comb.extract %ctrl1_r_dcMode from 3 : (i5) -> i1
    %28 = comb.mux %1, %26, %27 {sv.namehint = "cur_mode"} : i1
    %29 = comb.concat %true, %28 {sv.namehint = "io_va2pa_m_type"} : i1, i1
    %30 = comb.and bin %valid1_r, %24 : i1
    %31 = comb.xor %30, %true : i1
    %32 = comb.and %23, %31, %io_ex2mem_valid {sv.namehint = "io_ex2mem_ready"} : i1
    %33 = comb.and bin %0, %1 : i1
    %34 = comb.mux bin %33, %21, %25 {sv.namehint = "io_va2pa_vvalid"} : i1
    %35 = comb.xor %122, %true : i1
    %36 = comb.and %35, %valid1_r : i1
    %37 = comb.or %1, %36 : i1
    %38 = comb.xor %122, %true : i1
    %39 = comb.and %38, %is_tlb_r : i1
    %40 = comb.mux bin %1, %21, %39 : i1
    %41 = comb.and %0, %37 : i1
    %42 = comb.xor bin %io_va2pa_pvalid, %true {sv.namehint = "_drop_tlb_T"} : i1
    %43 = comb.and bin %is_tlb_r, %42 {sv.namehint = "_drop_tlb_T_1"} : i1
    %44 = comb.mux bin %drop2_r, %43, %drop_tlb : i1
    %45 = comb.and %0, %40 : i1
    %46 = comb.extract %ctrl1_r_dcMode from 2 : (i5) -> i1
    %47 = comb.extract %indi1_r from 1 : (i2) -> i1
    %48 = comb.or bin %46, %47 : i1
    %49 = comb.xor bin %48, %true : i1
    %50 = comb.and bin %valid1_r, %49 : i1
    %51 = comb.concat %valid1_r, %false : i1, i1
    %52 = comb.mux bin %50, %c1_i2, %51 : i2
    %53 = comb.mux bin %dst_en1_r, %52, %c0_i2 {sv.namehint = "io_d_mem1_state"} : i2
    %inst2_r = seq.firreg %59 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 608 : ui64} : i32
    %pc2_r = seq.firreg %60 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 640 : ui64} : i64
    %excep2_r_cause = seq.firreg %125 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 704 : ui64} : i64
    %excep2_r_tval = seq.firreg %126 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 768 : ui64} : i64
    %excep2_r_en = seq.firreg %127 clock %clock reset sync %reset, %false {firrtl.random_init_start = 832 : ui64} : i1
    %excep2_r_pc = seq.firreg %128 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 833 : ui64} : i64
    %excep2_r_etype = seq.firreg %129 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 897 : ui64} : i2
    %ctrl2_r_dcMode = seq.firreg %130 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 905 : ui64} : i5
    %mem_data2_r = seq.firreg %66 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 915 : ui64} : i64
    %dst2_r = seq.firreg %67 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 979 : ui64, sv.namehint = "dst2_r"} : i5
    %dst_d2_r = seq.firreg %107 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 984 : ui64, sv.namehint = "dst_d2_r"} : i64
    %dst_en2_r = seq.firreg %132 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1048 : ui64} : i1
    %csr_id2_r = seq.firreg %68 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 1049 : ui64} : i12
    %csr_d2_r = seq.firreg %69 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1061 : ui64} : i64
    %csr_en2_r = seq.firreg %134 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1125 : ui64} : i1
    %special2_r = seq.firreg %71 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1138 : ui64} : i2
    %paddr2_r = seq.firreg %73 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1140 : ui64} : i32
    %recov2_r = seq.firreg %136 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1174 : ui64} : i1
    %valid2_r = seq.firreg %143 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1175 : ui64} : i1
    %dc_hs_r = seq.firreg %146 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1176 : ui64} : i1
    %lr_addr_r = seq.firreg %79 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1177 : ui64} : i32
    %lr_valid_r = seq.firreg %84 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1209 : ui64} : i1
    %54 = comb.or bin %io_va2pa_pvalid, %io_va2pa_tlb_excep_en {sv.namehint = "inp_tlb_valid2"} : i1
    %55 = comb.and bin %54, %drop_tlb : i1
    %56 = comb.xor %55, %true : i1
    %57 = comb.and %56, %44 : i1
    %58 = comb.or bin %excep1_r_en, %io_va2pa_tlb_excep_en {sv.namehint = "stage2_is_excep"} : i1
    %59 = comb.mux bin %122, %inst1_r, %inst2_r : i32
    %60 = comb.mux bin %122, %pc1_r, %pc2_r : i64
    %61 = comb.mux bin %122, %excep1_r_etype, %excep2_r_etype : i2
    %62 = comb.mux bin %122, %excep1_r_pc, %excep2_r_pc : i64
    %63 = comb.mux bin %122, %excep1_r_en, %excep2_r_en : i1
    %64 = comb.mux bin %122, %excep1_r_tval, %excep2_r_tval : i64
    %65 = comb.mux bin %122, %excep1_r_cause, %excep2_r_cause : i64
    %66 = comb.mux bin %122, %mem_data1_r, %mem_data2_r : i64
    %67 = comb.mux bin %122, %dst1_r, %dst2_r : i5
    %68 = comb.mux bin %122, %csr_id1_r, %csr_id2_r : i12
    %69 = comb.mux bin %122, %csr_d1_r, %csr_d2_r : i64
    %70 = comb.mux bin %122, %csr_en1_r, %csr_en2_r : i1
    %71 = comb.mux bin %122, %special1_r, %special2_r : i2
    %72 = comb.mux bin %122, %recov1_r, %recov2_r : i1
    %73 = comb.mux bin %122, %io_va2pa_paddr, %paddr2_r : i32
    %74 = comb.extract %indi1_r from 0 : (i2) -> i1
    %75 = comb.xor bin %58, %true : i1
    %76 = comb.and bin %74, %75 : i1
    %77 = comb.or %76, %lr_valid_r : i1
    %78 = comb.and bin %122, %76 : i1
    %79 = comb.mux bin %78, %io_va2pa_paddr, %lr_addr_r : i32
    %80 = comb.extract %excep1_r_cause from 63 : (i64) -> i1
    %81 = comb.and bin %excep1_r_en, %80 : i1
    %82 = comb.xor %81, %true : i1
    %83 = comb.and %82, %77 : i1
    %84 = comb.mux bin %122, %83, %lr_valid_r : i1
    %85 = comb.icmp bin ne %ctrl2_r_dcMode, %c0_i5 {sv.namehint = "is_dc_r"} : i5
    %drop_dc = seq.firreg %167 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1210 : ui64} : i1
    %86 = comb.mux bin %122, %io_va2pa_paddr, %paddr2_r {sv.namehint = "io_dataRW_addr"} : i32
    %87 = comb.mux bin %122, %mem_data1_r, %mem_data2_r {sv.namehint = "io_dataRW_wdata"} : i64
    %88 = comb.extract %inst1_r from 27 {sv.namehint = "_io_dataRW_amo_T"} : (i32) -> i5
    %89 = comb.extract %inst2_r from 27 {sv.namehint = "_io_dataRW_amo_T_1"} : (i32) -> i5
    %90 = comb.mux bin %122, %88, %89 {sv.namehint = "io_dataRW_amo"} : i5
    %91 = comb.icmp bin eq %io_va2pa_paddr, %lr_addr_r {sv.namehint = "_sc_valid_T"} : i32
    %92 = comb.and bin %47, %91, %lr_valid_r : i1
    %93 = comb.xor %47, %true : i1
    %94 = comb.or %92, %93 : i1
    %95 = comb.xor %94, %true : i1
    %96 = comb.or %58, %95 : i1
    %97 = comb.mux bin %96, %c0_i5, %ctrl1_r_dcMode : i5
    %98 = comb.mux bin %122, %97, %ctrl2_r_dcMode : i5
    %99 = comb.or %92, %47 : i1
    %100 = comb.xor %58, %true : i1
    %101 = comb.and %100, %99 : i1
    %102 = comb.or %101, %dst_en1_r : i1
    %103 = comb.mux bin %122, %102, %dst_en2_r : i1
    %104 = comb.mux bin %47, %c1_i64, %dst_d1_r : i64
    %105 = comb.mux bin %92, %c0_i64, %104 : i64
    %106 = comb.mux bin %58, %dst_d1_r, %105 : i64
    %107 = comb.mux bin %122, %106, %dst_d2_r : i64
    %108 = comb.xor bin %dc_hs_r, %true {sv.namehint = "_io_dataRW_dc_mode_T"} : i1
    %109 = comb.and bin %valid2_r, %108 {sv.namehint = "_io_dataRW_dc_mode_T_1"} : i1
    %110 = comb.mux bin %109, %ctrl2_r_dcMode, %c0_i5 {sv.namehint = "_io_dataRW_dc_mode_T_2"} : i5
    %111 = comb.mux bin %122, %97, %110 {sv.namehint = "io_dataRW_dc_mode"} : i5
    %112 = comb.xor bin %is_tlb_r, %true {sv.namehint = "_tlb_valid2_T"} : i1
    %113 = comb.xor bin %drop_tlb, %true {sv.namehint = "_tlb_valid2_T_1"} : i1
    %114 = comb.and bin %54, %113 {sv.namehint = "_tlb_valid2_T_2"} : i1
    %115 = comb.or bin %112, %114 {sv.namehint = "tlb_valid2"} : i1
    %116 = comb.icmp bin ne %111, %c0_i5 {sv.namehint = "_dc_hs_T"} : i5
    %117 = comb.and bin %116, %io_dataRW_ready {sv.namehint = "dc_hs"} : i1
    %118 = comb.or %117, %dc_hs_r : i1
    %119 = comb.xor bin %175, %true : i1
    %120 = comb.and bin %valid2_r, %119 : i1
    %121 = comb.xor %120, %true : i1
    %122 = comb.and %0, %121, %valid1_r, %115 {sv.namehint = "hs1"} : i1
    %123 = comb.and bin %io_va2pa_tlb_excep_en, %113 : i1
    %124 = comb.and bin %122, %123 : i1
    %125 = comb.mux bin %124, %io_va2pa_tlb_excep_cause, %65 : i64
    %126 = comb.mux bin %124, %io_va2pa_tlb_excep_tval, %64 : i64
    %127 = comb.or %124, %63 : i1
    %128 = comb.mux bin %124, %pc1_r, %62 : i64
    %129 = comb.mux bin %124, %c0_i2, %61 : i2
    %130 = comb.mux bin %124, %c0_i5, %98 : i5
    %131 = comb.xor %124, %true : i1
    %132 = comb.and %131, %103 : i1
    %133 = comb.xor %124, %true : i1
    %134 = comb.and %133, %70 : i1
    %135 = comb.and %122, %123 : i1
    %136 = comb.or %124, %72 : i1
    %137 = comb.icmp bin eq %ctrl1_r_dcMode, %c0_i5 : i5
    %138 = comb.and %137, %dc_hs_r : i1
    %139 = comb.or %138, %117 : i1
    %140 = comb.mux bin %123, %118, %139 : i1
    %141 = comb.xor %175, %true : i1
    %142 = comb.and %141, %valid2_r : i1
    %143 = comb.or %122, %142 : i1
    %144 = comb.xor %175, %true : i1
    %145 = comb.and %144, %118 : i1
    %146 = comb.mux bin %122, %140, %145 : i1
    %147 = comb.xor bin %85, %true : i1
    %148 = comb.and bin %valid2_r, %147 : i1
    %149 = comb.concat %valid2_r, %false : i1, i1
    %150 = comb.mux bin %148, %c1_i2, %149 : i2
    %151 = comb.mux bin %dst_en2_r, %150, %c0_i2 {sv.namehint = "io_d_mem2_state"} : i2
    %pc3_r = seq.firreg %152 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1243 : ui64, sv.namehint = "pc3_r"} : i64
    %excep3_r_cause = seq.firreg %157 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1307 : ui64, sv.namehint = "excep3_r_cause"} : i64
    %excep3_r_tval = seq.firreg %156 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1371 : ui64, sv.namehint = "excep3_r_tval"} : i64
    %excep3_r_en = seq.firreg %155 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1435 : ui64, sv.namehint = "excep3_r_en"} : i1
    %excep3_r_pc = seq.firreg %154 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1436 : ui64, sv.namehint = "excep3_r_pc"} : i64
    %excep3_r_etype = seq.firreg %153 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1500 : ui64, sv.namehint = "excep3_r_etype"} : i2
    %dst3_r = seq.firreg %158 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 1502 : ui64, sv.namehint = "dst3_r"} : i5
    %dst_d3_r = seq.firreg %177 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1507 : ui64, sv.namehint = "dst_d3_r"} : i64
    %dst_en3_r = seq.firreg %160 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1571 : ui64, sv.namehint = "dst_en3_r"} : i1
    %csr_id3_r = seq.firreg %161 clock %clock reset sync %reset, %c0_i12 {firrtl.random_init_start = 1572 : ui64, sv.namehint = "csr_id3_r"} : i12
    %csr_d3_r = seq.firreg %162 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1584 : ui64, sv.namehint = "csr_d3_r"} : i64
    %csr_en3_r = seq.firreg %163 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1648 : ui64, sv.namehint = "csr_en3_r"} : i1
    %special3_r = seq.firreg %164 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1661 : ui64, sv.namehint = "special3_r"} : i2
    %recov3_r = seq.firreg %165 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1664 : ui64, sv.namehint = "recov3_r"} : i1
    %valid3_r = seq.firreg %180 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1665 : ui64, sv.namehint = "valid3_r"} : i1
    %152 = comb.mux bin %175, %pc2_r, %pc3_r : i64
    %153 = comb.mux bin %175, %excep2_r_etype, %excep3_r_etype : i2
    %154 = comb.mux bin %175, %excep2_r_pc, %excep3_r_pc : i64
    %155 = comb.mux bin %175, %excep2_r_en, %excep3_r_en : i1
    %156 = comb.mux bin %175, %excep2_r_tval, %excep3_r_tval : i64
    %157 = comb.mux bin %175, %excep2_r_cause, %excep3_r_cause : i64
    %158 = comb.mux bin %175, %dst2_r, %dst3_r : i5
    %159 = comb.mux bin %175, %dst_d2_r, %dst_d3_r : i64
    %160 = comb.mux bin %175, %dst_en2_r, %dst_en3_r : i1
    %161 = comb.mux bin %175, %csr_id2_r, %csr_id3_r : i12
    %162 = comb.mux bin %175, %csr_d2_r, %csr_d3_r : i64
    %163 = comb.mux bin %175, %csr_en2_r, %csr_en3_r : i1
    %164 = comb.mux bin %175, %special2_r, %special3_r : i2
    %165 = comb.mux bin %175, %recov2_r, %recov3_r : i1
    %166 = comb.xor %io_dataRW_rvalid, %true : i1
    %167 = comb.and %166, %drop_dc : i1
    %168 = comb.xor bin %85, %true {sv.namehint = "_dc_valid3_T"} : i1
    %169 = comb.xor bin %drop_dc, %true {sv.namehint = "_dc_valid3_T_1"} : i1
    %170 = comb.and bin %io_dataRW_rvalid, %169 {sv.namehint = "_dc_valid3_T_2"} : i1
    %171 = comb.or bin %168, %170 {sv.namehint = "dc_valid3"} : i1
    %172 = comb.xor bin %io_mem2rb_ready, %true : i1
    %173 = comb.and bin %valid3_r, %172 : i1
    %174 = comb.xor %173, %true : i1
    %175 = comb.and %174, %valid2_r, %171 {sv.namehint = "hs2"} : i1
    %176 = comb.and bin %175, %85 : i1
    %177 = comb.mux bin %176, %io_dataRW_rdata, %159 : i64
    %178 = comb.xor %io_mem2rb_ready, %true : i1
    %179 = comb.and %178, %valid3_r : i1
    %180 = comb.or %175, %179 : i1
    %181 = comb.and bin %valid3_r, %dst_en3_r : i1
    %182 = comb.concat %false, %181 {sv.namehint = "io_d_mem3_state"} : i1, i1
    hw.output %drop2_r, %stall2_r, %32, %pc3_r, %excep3_r_cause, %excep3_r_tval, %excep3_r_en, %excep3_r_pc, %excep3_r_etype, %csr_id3_r, %csr_d3_r, %csr_en3_r, %dst3_r, %dst_d3_r, %dst_en3_r, %special3_r, %recov3_r, %valid3_r, %86, %87, %111, %90, %22, %34, %29, %dst1_r, %dst_d1_r, %53, %dst2_r, %dst_d2_r, %151, %dst3_r, %dst_d3_r, %182 : i1, i1, i1, i64, i64, i64, i1, i64, i2, i12, i64, i1, i5, i64, i1, i2, i1, i1, i32, i64, i5, i5, i64, i1, i2, i5, i64, i2, i5, i64, i2, i5, i64, i2
  }
  hw.module private @Writeback(in %clock : !seq.clock, in %reset : i1, in %io_mem2rb_pc : i64, in %io_mem2rb_excep_cause : i64, in %io_mem2rb_excep_tval : i64, in %io_mem2rb_excep_en : i1, in %io_mem2rb_excep_pc : i64, in %io_mem2rb_excep_etype : i2, in %io_mem2rb_csr_id : i12, in %io_mem2rb_csr_d : i64, in %io_mem2rb_csr_en : i1, in %io_mem2rb_dst : i5, in %io_mem2rb_dst_d : i64, in %io_mem2rb_dst_en : i1, in %io_mem2rb_special : i2, in %io_mem2rb_recov : i1, in %io_mem2rb_valid : i1, out io_mem2rb_ready : i1, out io_wReg_id : i5, out io_wReg_data : i64, out io_wReg_en : i1, out io_wCsr_id : i12, out io_wCsr_data : i64, out io_wCsr_en : i1, out io_excep_cause : i64, out io_excep_tval : i64, out io_excep_en : i1, out io_excep_pc : i64, out io_excep_etype : i2, out io_wb2if_seq_pc : i64, out io_wb2if_valid : i1, out io_recov : i1, out io_flush_tlb : i1, out io_flush_cache : i1) {
    %c4_i64 = hw.constant 4 : i64
    %true = hw.constant true
    %c0_i2 = hw.constant 0 : i2
    %c1_i2 = hw.constant 1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %false = hw.constant false
    %c0_i64 = hw.constant 0 : i64
    %recov_r = seq.firreg %3 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64, sv.namehint = "recov_r"} : i1
    %forceJmp_seq_pc = seq.firreg %11 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 3 : ui64, sv.namehint = "forceJmp_seq_pc"} : i64
    %forceJmp_valid = seq.firreg %8 clock %clock reset sync %reset, %false {firrtl.random_init_start = 67 : ui64, sv.namehint = "forceJmp_valid"} : i1
    %tlb_r = seq.firreg %16 clock %clock reset sync %reset, %false {firrtl.random_init_start = 68 : ui64, sv.namehint = "tlb_r"} : i1
    %cache_r = seq.firreg %13 clock %clock reset sync %reset, %false {firrtl.random_init_start = 69 : ui64, sv.namehint = "cache_r"} : i1
    %0 = comb.and %io_mem2rb_valid, %io_mem2rb_dst_en {sv.namehint = "io_wReg_en"} : i1
    %1 = comb.and %io_mem2rb_valid, %io_mem2rb_csr_en {sv.namehint = "io_wCsr_en"} : i1
    %2 = comb.and %io_mem2rb_valid, %io_mem2rb_excep_en {sv.namehint = "io_excep_en"} : i1
    %3 = comb.and %io_mem2rb_valid, %io_mem2rb_recov : i1
    %4 = comb.icmp bin ne %io_mem2rb_special, %c0_i2 : i2
    %5 = comb.xor bin %io_mem2rb_excep_en, %true : i1
    %6 = comb.and bin %io_mem2rb_recov, %5 : i1
    %7 = comb.or bin %4, %6 : i1
    %8 = comb.and %io_mem2rb_valid, %7 : i1
    %9 = comb.add %io_mem2rb_pc, %c4_i64 {sv.namehint = "_forceJmp_seq_pc_T"} : i64
    %10 = comb.and bin %io_mem2rb_valid, %7 : i1
    %11 = comb.mux bin %10, %9, %forceJmp_seq_pc : i64
    %12 = comb.icmp bin eq %io_mem2rb_special, %c1_i2 : i2
    %13 = comb.and %10, %12 : i1
    %14 = comb.icmp bin eq %io_mem2rb_special, %c-2_i2 : i2
    %15 = comb.xor %12, %true : i1
    %16 = comb.and %10, %15, %14 : i1
    hw.output %io_mem2rb_valid, %io_mem2rb_dst, %io_mem2rb_dst_d, %0, %io_mem2rb_csr_id, %io_mem2rb_csr_d, %1, %io_mem2rb_excep_cause, %io_mem2rb_excep_tval, %2, %io_mem2rb_excep_pc, %io_mem2rb_excep_etype, %forceJmp_seq_pc, %forceJmp_valid, %recov_r, %tlb_r, %cache_r : i1, i5, i64, i1, i12, i64, i1, i64, i64, i1, i64, i2, i64, i1, i1, i1, i1
  }
  hw.module private @Regs(in %clock : !seq.clock, in %reset : i1, in %io_rs1_id : i5, out io_rs1_data : i64, in %io_rs2_id : i5, out io_rs2_data : i64, in %io_dst_id : i5, in %io_dst_data : i64, in %io_dst_en : i1) {
    %c-1_i5 = hw.constant -1 : i5
    %true = hw.constant true
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
    %1 = hw.array_get %0[%io_rs1_id] {sv.namehint = "io_rs1_data"} : !hw.array<32xi64>, i5
    %2 = hw.array_get %0[%io_rs2_id] {sv.namehint = "io_rs2_data"} : !hw.array<32xi64>, i5
    %3 = comb.icmp bin ne %io_dst_id, %c0_i5 : i5
    %4 = comb.and bin %io_dst_en, %3 : i1
    %5 = comb.xor bin %3, %true : i1
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
  hw.module private @Csrs(in %clock : !seq.clock, in %reset : i1, in %io_rs_id : i12, out io_rs_data : i64, out io_rs_is_err : i1, in %io_rd_id : i12, in %io_rd_data : i64, in %io_rd_en : i1, in %io_excep_cause : i64, in %io_excep_tval : i64, in %io_excep_en : i1, in %io_excep_pc : i64, in %io_excep_etype : i2, out io_mmuState_priv : i2, out io_mmuState_mstatus : i64, out io_mmuState_satp : i64, out io_idState_priv : i2, out io_reg2if_seq_pc : i64, out io_reg2if_valid : i1, out io_intr_out_en : i1, out io_intr_out_cause : i64, in %io_clint_raise : i1, in %io_clint_clear : i1, in %io_plic_m_raise : i1, in %io_plic_m_clear : i1, in %io_plic_s_raise : i1, in %io_plic_s_clear : i1, out io_updateNextPc_seq_pc : i64, out io_updateNextPc_valid : i1, in %io_intr_msip_raise : i1, in %io_intr_msip_clear : i1) {
    %c0_i42 = hw.constant 0 : i42
    %c-69487_i19 = hw.constant -69487 : i19
    %c-909603_i62 = hw.constant -909603 : i62
    %c0_i63 = hw.constant 0 : i63
    %c-144115188075855872_i58 = hw.constant -144115188075855872 : i58
    %c0_i5 = hw.constant 0 : i5
    %c0_i4 = hw.constant 0 : i4
    %c8_i11 = hw.constant 8 : i11
    %c0_i44 = hw.constant 0 : i44
    %c-17_i7 = hw.constant -17 : i7
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
    %true = hw.constant true
    %c0_i2 = hw.constant 0 : i2
    %c-1_i64 = hw.constant -1 : i64
    %c-1_i6 = hw.constant -1 : i6
    %c-236_i12 = hw.constant -236 : i12
    %c45833_i64 = hw.constant 45833 : i64
    %c-1152903912420802561_i64 = hw.constant -1152903912420802561 : i64
    %c18014398509481983_i64 = hw.constant 18014398509481983 : i64
    %c0_i64 = hw.constant 0 : i64
    %false = hw.constant false
    %c546_i64 = hw.constant 546 : i64
    %c-9223372023968964318_i64 = hw.constant -9223372023968964318 : i64
    %c8290218_i64 = hw.constant 8290218 : i64
    %c34_i64 = hw.constant 34 : i64
    %c-909603_i64 = hw.constant -909603 : i64
    %c-129_i64 = hw.constant -129 : i64
    %c128_i64 = hw.constant 128 : i64
    %c-2049_i64 = hw.constant -2049 : i64
    %c2048_i64 = hw.constant 2048 : i64
    %c-9_i64 = hw.constant -9 : i64
    %c8_i64 = hw.constant 8 : i64
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
    %c-547_i64 = hw.constant -547 : i64
    %priv = seq.firreg %85 clock %clock reset sync %reset, %c-1_i2 {firrtl.random_init_start = 0 : ui64, sv.namehint = "priv"} : i2
    %misa = seq.firreg %209 clock %clock reset sync %reset, %c-9223372036853460691_i64 {firrtl.random_init_start = 2 : ui64} : i64
    %mstatus = seq.firreg %315 clock %clock reset sync %reset, %c42949672960_i64 {firrtl.random_init_start = 66 : ui64, sv.namehint = "mstatus"} : i64
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
    %satp = seq.firreg %292 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1026 : ui64, sv.namehint = "satp"} : i64
    %scause = seq.firreg %296 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1090 : ui64} : i64
    %pmpaddr0 = seq.firreg %340 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1154 : ui64} : i64
    %pmpaddr1 = seq.firreg %345 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1218 : ui64} : i64
    %pmpaddr2 = seq.firreg %350 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1282 : ui64} : i64
    %pmpaddr3 = seq.firreg %355 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1346 : ui64} : i64
    %uscratch = seq.firreg %360 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1410 : ui64} : i64
    %mhartid = seq.firreg %363 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1538 : ui64} : i64
    %0 = comb.and bin %mstatus, %c-9223372023968964318_i64 {sv.namehint = "sstatus"} : i64
    %forceJmp_seq_pc = seq.firreg %60 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1602 : ui64, sv.namehint = "forceJmp_seq_pc"} : i64
    %forceJmp_valid = seq.firreg %io_excep_en clock %clock reset sync %reset, %false {firrtl.random_init_start = 1666 : ui64, sv.namehint = "forceJmp_valid"} : i1
    %1 = comb.icmp bin eq %io_excep_etype, %c-2_i2 : i2
    %2 = comb.extract %mstatus from 8 {sv.namehint = "priv_lo"} : (i64) -> i1
    %3 = comb.concat %false, %2 {sv.namehint = "_priv_T"} : i1, i1
    %4 = comb.extract %mstatus from 5 {sv.namehint = "new_sstatus_lo_hi_lo"} : (i64) -> i1
    %5 = comb.and bin %mstatus, %c-909603_i64 {sv.namehint = "_mstatus_T_1"} : i64
    %6 = comb.extract %mstatus from 13 : (i64) -> i7
    %7 = comb.and %6, %c-17_i7 : i7
    %8 = comb.concat %c0_i44, %7, %c8_i11, %4, %false {sv.namehint = "_mstatus_T_2"} : i44, i7, i11, i1, i1
    %9 = comb.or bin %5, %8 {sv.namehint = "_mstatus_T_3"} : i64
    %10 = comb.icmp bin eq %io_excep_etype, %c-1_i2 : i2
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
    %21 = comb.xor bin %20, %true : i1
    %22 = comb.extract %io_excep_cause from 0 : (i64) -> i63
    %23 = comb.concat %false, %22 : i1, i63
    %24 = comb.shru bin %19, %23 : i64
    %25 = comb.extract %24 from 0 : (i64) -> i1
    %26 = comb.and bin %21, %25 : i1
    %27 = comb.extract %stvec from 1 {sv.namehint = "_seq_pc_T_1"} : (i64) -> i1
    %28 = comb.extract %io_excep_cause from 0 : (i64) -> i62
    %29 = comb.concat %28, %c0_i2 : i62, i2
    %30 = comb.mux %27, %29, %c0_i64 {sv.namehint = "_seq_pc_T_3"} : i64
    %31 = comb.add %stvec, %30 {sv.namehint = "_seq_pc_T_4"} : i64
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
    %42 = comb.extract %mstatus from 1 {sv.namehint = "new_sstatus_hi_lo_lo"} : (i64) -> i1
    %43 = comb.and bin %mstatus, %c-909603_i64 {sv.namehint = "_mstatus_T_5"} : i64
    %44 = comb.extract %mstatus from 13 : (i64) -> i7
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
    %55 = comb.mux %52, %54, %c0_i64 {sv.namehint = "_seq_pc_T_7"} : i64
    %56 = comb.add %mtvec, %55 {sv.namehint = "_seq_pc_T_8"} : i64
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
    %intr_out_r_en = seq.firreg %126 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1667 : ui64, sv.namehint = "intr_out_r_en"} : i1
    %intr_out_r_cause = seq.firreg %139 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1668 : ui64, sv.namehint = "intr_out_r_cause"} : i64
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
    %140 = comb.icmp bin eq %io_rs_id, %c769_i12 : i12
    %141 = comb.icmp bin eq %io_rs_id, %c768_i12 : i12
    %142 = comb.icmp bin eq %io_rs_id, %c833_i12 : i12
    %143 = comb.icmp bin eq %io_rs_id, %c835_i12 : i12
    %144 = comb.icmp bin eq %io_rs_id, %c832_i12 : i12
    %145 = comb.icmp bin eq %io_rs_id, %c773_i12 : i12
    %146 = comb.icmp bin eq %io_rs_id, %c772_i12 : i12
    %147 = comb.icmp bin eq %io_rs_id, %c836_i12 : i12
    %148 = comb.icmp bin eq %io_rs_id, %c834_i12 : i12
    %149 = comb.icmp bin eq %io_rs_id, %c770_i12 : i12
    %150 = comb.icmp bin eq %io_rs_id, %c771_i12 : i12
    %151 = comb.icmp bin eq %io_rs_id, %c774_i12 : i12
    %152 = comb.concat %c0_i32, %mcounteren : i32, i32
    %153 = comb.icmp bin eq %io_rs_id, %c262_i12 : i12
    %154 = comb.concat %c0_i32, %scounteren : i32, i32
    %155 = comb.icmp bin eq %io_rs_id, %c321_i12 : i12
    %156 = comb.icmp bin eq %io_rs_id, %c323_i12 : i12
    %157 = comb.icmp bin eq %io_rs_id, %c320_i12 : i12
    %158 = comb.icmp bin eq %io_rs_id, %c261_i12 : i12
    %159 = comb.icmp bin eq %io_rs_id, %c384_i12 : i12
    %160 = comb.icmp bin eq %io_rs_id, %c322_i12 : i12
    %161 = comb.icmp bin eq %io_rs_id, %c256_i12 : i12
    %162 = comb.icmp bin eq %io_rs_id, %c260_i12 : i12
    %163 = comb.and bin %mie, %mideleg {sv.namehint = "_io_rs_data_T"} : i64
    %164 = comb.icmp bin eq %io_rs_id, %c324_i12 : i12
    %165 = comb.and bin %mip, %c546_i64 {sv.namehint = "_io_rs_data_T_1"} : i64
    %166 = comb.icmp bin eq %io_rs_id, %c944_i12 : i12
    %167 = comb.icmp bin eq %io_rs_id, %c945_i12 : i12
    %168 = comb.icmp bin eq %io_rs_id, %c946_i12 : i12
    %169 = comb.icmp bin eq %io_rs_id, %c947_i12 : i12
    %170 = comb.icmp bin eq %io_rs_id, %c928_i12 : i12
    %171 = comb.icmp bin eq %io_rs_id, %c64_i12 : i12
    %172 = comb.icmp bin eq %io_rs_id, %c-236_i12 : i12
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
    %201 = comb.mux bin %140, %misa, %200 {sv.namehint = "io_rs_data"} : i64
    %202 = comb.icmp bin ne %io_rs_id, %c-236_i12 : i12
    %203 = comb.or bin %140, %141, %142, %143, %144, %145, %146, %147, %148, %149, %150, %151, %153, %155, %156, %157, %158, %159, %160, %161, %162, %164, %166, %167, %168, %169, %170, %171 : i1
    %204 = comb.xor %203, %true : i1
    %205 = comb.and %204, %202 {sv.namehint = "io_rs_is_err"} : i1
    %206 = comb.xor bin %io_rd_en, %true : i1
    %207 = comb.icmp bin eq %io_rd_id, %c769_i12 : i12
    %208 = comb.and %io_rd_en, %207 : i1
    %209 = comb.mux bin %208, %io_rd_data, %misa : i64
    %210 = comb.icmp bin eq %io_rd_id, %c768_i12 : i12
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
    %222 = comb.icmp bin eq %io_rd_id, %c833_i12 : i12
    %223 = comb.xor %222, %true : i1
    %224 = comb.or %206, %207, %210, %223 : i1
    %225 = comb.mux bin %224, %67, %io_rd_data : i64
    %226 = comb.icmp bin eq %io_rd_id, %c835_i12 : i12
    %227 = comb.xor %226, %true : i1
    %228 = comb.or %206, %207, %210, %222, %227 : i1
    %229 = comb.mux bin %228, %80, %io_rd_data : i64
    %230 = comb.icmp bin eq %io_rd_id, %c832_i12 : i12
    %231 = comb.xor %230, %true : i1
    %232 = comb.or %206, %207, %210, %222, %226, %231 : i1
    %233 = comb.mux bin %232, %mscratch, %io_rd_data : i64
    %234 = comb.icmp bin eq %io_rd_id, %c773_i12 : i12
    %235 = comb.xor %234, %true : i1
    %236 = comb.or %206, %207, %210, %222, %226, %230, %235 : i1
    %237 = comb.mux bin %236, %mtvec, %io_rd_data : i64
    %238 = comb.icmp bin eq %io_rd_id, %c772_i12 : i12
    %239 = comb.icmp bin eq %io_rd_id, %c836_i12 : i12
    %240 = comb.and bin %mip, %c-35_i64 {sv.namehint = "_mip_T_28"} : i64
    %241 = comb.and bin %io_rd_data, %c34_i64 {sv.namehint = "_mip_T_29"} : i64
    %242 = comb.or bin %240, %241 {sv.namehint = "_mip_T_30"} : i64
    %243 = comb.extract %242 from 0 : (i64) -> i10
    %244 = comb.or bin %243, %104 : i10
    %245 = comb.extract %242 from 10 : (i64) -> i54
    %246 = comb.concat %245, %244 {sv.namehint = "_mip_T_32"} : i54, i10
    %247 = comb.icmp bin eq %io_rd_id, %c834_i12 : i12
    %248 = comb.xor %247, %true : i1
    %249 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %248 : i1
    %250 = comb.mux bin %249, %64, %io_rd_data : i64
    %251 = comb.icmp bin eq %io_rd_id, %c770_i12 : i12
    %252 = comb.and bin %io_rd_data, %c45833_i64 {sv.namehint = "_medeleg_T"} : i64
    %253 = comb.xor %251, %true : i1
    %254 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %253 : i1
    %255 = comb.mux bin %254, %medeleg, %252 : i64
    %256 = comb.icmp bin eq %io_rd_id, %c771_i12 : i12
    %257 = comb.and bin %io_rd_data, %c546_i64 {sv.namehint = "_mideleg_T"} : i64
    %258 = comb.xor %256, %true : i1
    %259 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %258 : i1
    %260 = comb.mux bin %259, %mideleg, %257 : i64
    %261 = comb.icmp bin eq %io_rd_id, %c774_i12 : i12
    %262 = comb.extract %io_rd_data from 0 : (i64) -> i32
    %263 = comb.xor %261, %true : i1
    %264 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %263 : i1
    %265 = comb.mux bin %264, %mcounteren, %262 : i32
    %266 = comb.icmp bin eq %io_rd_id, %c262_i12 : i12
    %267 = comb.xor %266, %true : i1
    %268 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %267 : i1
    %269 = comb.mux bin %268, %scounteren, %262 : i32
    %270 = comb.icmp bin eq %io_rd_id, %c321_i12 : i12
    %271 = comb.xor %270, %true : i1
    %272 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %271 : i1
    %273 = comb.mux bin %272, %40, %io_rd_data : i64
    %274 = comb.icmp bin eq %io_rd_id, %c323_i12 : i12
    %275 = comb.xor %274, %true : i1
    %276 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %275 : i1
    %277 = comb.mux bin %276, %51, %io_rd_data : i64
    %278 = comb.icmp bin eq %io_rd_id, %c320_i12 : i12
    %279 = comb.xor %278, %true : i1
    %280 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %279 : i1
    %281 = comb.mux bin %280, %sscratch, %io_rd_data : i64
    %282 = comb.icmp bin eq %io_rd_id, %c261_i12 : i12
    %283 = comb.xor %282, %true : i1
    %284 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %283 : i1
    %285 = comb.mux bin %284, %stvec, %io_rd_data : i64
    %286 = comb.icmp bin eq %io_rd_id, %c384_i12 : i12
    %287 = comb.and bin %satp, %c1152903912420802560_i64 {sv.namehint = "_satp_T_1"} : i64
    %288 = comb.and bin %io_rd_data, %c-1152903912420802561_i64 {sv.namehint = "_satp_T_2"} : i64
    %289 = comb.or bin %287, %288 {sv.namehint = "_satp_T_3"} : i64
    %290 = comb.xor %286, %true : i1
    %291 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %290 : i1
    %292 = comb.mux bin %291, %satp, %289 : i64
    %293 = comb.icmp bin eq %io_rd_id, %c322_i12 : i12
    %294 = comb.xor %293, %true : i1
    %295 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %294 : i1
    %296 = comb.mux bin %295, %36, %io_rd_data : i64
    %297 = comb.icmp bin eq %io_rd_id, %c256_i12 : i12
    %298 = comb.extract %mstatus from 0 : (i64) -> i62
    %299 = comb.and %298, %c-909603_i62 {sv.namehint = "_new_mstatus_T_1"} : i62
    %300 = comb.extract %io_rd_data from 1 : (i64) -> i19
    %301 = comb.and %300, %c-69487_i19 : i19
    %302 = comb.concat %c0_i42, %301, %false : i42, i19, i1
    %303 = comb.or %299, %302 {sv.namehint = "new_mstatus_3"} : i62
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
    %316 = comb.icmp bin eq %io_rd_id, %c260_i12 : i12
    %317 = comb.and bin %mie, %115 {sv.namehint = "_mie_T_1"} : i64
    %318 = comb.and bin %io_rd_data, %mideleg {sv.namehint = "_mie_T_2"} : i64
    %319 = comb.or bin %317, %318 {sv.namehint = "_mie_T_3"} : i64
    %320 = comb.xor %316, %true : i1
    %321 = comb.or %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %320 : i1
    %322 = comb.mux bin %321, %mie, %319 : i64
    %323 = comb.mux bin %238, %io_rd_data, %322 : i64
    %324 = comb.or bin %206, %207, %210, %222, %226, %230, %234 : i1
    %325 = comb.mux bin %324, %mie, %323 : i64
    %326 = comb.icmp bin eq %io_rd_id, %c324_i12 : i12
    %327 = comb.and bin %mip, %c-547_i64 {sv.namehint = "_mip_T_34"} : i64
    %328 = comb.and bin %io_rd_data, %c546_i64 {sv.namehint = "_mip_T_35"} : i64
    %329 = comb.or bin %327, %328 {sv.namehint = "_mip_T_36"} : i64
    %330 = comb.xor %326, %true : i1
    %331 = comb.or %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %330 : i1
    %332 = comb.mux bin %331, %103, %329 : i64
    %333 = comb.mux bin %239, %246, %332 : i64
    %334 = comb.or bin %206, %207, %210, %222, %226, %230, %234, %238 : i1
    %335 = comb.mux bin %334, %103, %333 : i64
    %336 = comb.icmp bin eq %io_rd_id, %c944_i12 : i12
    %337 = comb.and bin %io_rd_data, %c18014398509481983_i64 {sv.namehint = "_pmpaddr0_T"} : i64
    %338 = comb.xor %336, %true : i1
    %339 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %326, %338 : i1
    %340 = comb.mux bin %339, %pmpaddr0, %337 : i64
    %341 = comb.icmp bin eq %io_rd_id, %c945_i12 : i12
    %342 = comb.and bin %io_rd_data, %c18014398509481983_i64 {sv.namehint = "_pmpaddr1_T"} : i64
    %343 = comb.xor %341, %true : i1
    %344 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %326, %336, %343 : i1
    %345 = comb.mux bin %344, %pmpaddr1, %342 : i64
    %346 = comb.icmp bin eq %io_rd_id, %c946_i12 : i12
    %347 = comb.and bin %io_rd_data, %c18014398509481983_i64 {sv.namehint = "_pmpaddr2_T"} : i64
    %348 = comb.xor %346, %true : i1
    %349 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %326, %336, %341, %348 : i1
    %350 = comb.mux bin %349, %pmpaddr2, %347 : i64
    %351 = comb.icmp bin eq %io_rd_id, %c947_i12 : i12
    %352 = comb.and bin %io_rd_data, %c18014398509481983_i64 {sv.namehint = "_pmpaddr3_T"} : i64
    %353 = comb.xor %351, %true : i1
    %354 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %326, %336, %341, %346, %353 : i1
    %355 = comb.mux bin %354, %pmpaddr3, %352 : i64
    %356 = comb.icmp bin eq %io_rd_id, %c928_i12 : i12
    %357 = comb.icmp bin eq %io_rd_id, %c64_i12 : i12
    %358 = comb.xor %357, %true : i1
    %359 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %326, %336, %341, %346, %351, %356, %358 : i1
    %360 = comb.mux bin %359, %uscratch, %io_rd_data : i64
    %361 = comb.icmp bin ne %io_rd_id, %c-236_i12 : i12
    %362 = comb.or %206, %207, %210, %222, %226, %230, %234, %238, %239, %247, %251, %256, %261, %266, %270, %274, %278, %282, %286, %293, %297, %316, %326, %336, %341, %346, %351, %356, %357, %361 : i1
    %363 = comb.mux bin %362, %mhartid, %io_rd_data : i64
    hw.output %201, %205, %priv, %mstatus, %satp, %priv, %forceJmp_seq_pc, %forceJmp_valid, %intr_out_r_en, %intr_out_r_cause, %forceJmp_seq_pc, %forceJmp_valid : i64, i1, i2, i64, i64, i2, i64, i1, i1, i64, i64, i1
  }
  hw.module private @S011HD1P_X32Y2D128_BW(in %clock : !seq.clock, in %reset : i1, out io_Q : i128, in %io_CEN : i1, in %io_WEN : i1, in %io_BWEN : i128, in %io_A : i6, in %io_D : i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %c0_i128 = hw.constant 0 : i128
    %ram = seq.firmem 0, 1, undefined, port_order {prefix = ""} : <64 x 128>
    seq.firmem.write_port %ram[%io_A] = %8, clock %clock enable %4 : <64 x 128>
    %0 = seq.firmem.read_port %ram[%io_A], clock %clock enable %4 : <64 x 128>
    %1 = seq.firmem.read_port %ram[%io_A], clock %clock enable %9 : <64 x 128>
    %output = seq.firreg %10 clock %clock reset sync %reset, %c0_i128 {firrtl.random_init_start = 0 : ui64, sv.namehint = "output"} : i128
    %2 = comb.xor bin %io_CEN, %true : i1
    %3 = comb.xor bin %io_WEN, %true : i1
    %4 = comb.and bin %2, %3 : i1
    %5 = comb.xor bin %io_BWEN, %c-1_i128 : i128
    %6 = comb.and bin %io_D, %5 : i128
    %7 = comb.and bin %0, %io_BWEN : i128
    %8 = comb.or bin %6, %7 : i128
    %9 = comb.xor bin %4, %true : i1
    %10 = comb.mux bin %4, %c0_i128, %1 : i128
    hw.output %output : i128
  }
  hw.module private @Ram_bw(in %clock : !seq.clock, in %reset : i1, in %io_cen : i1, in %io_wen : i1, in %io_addr : i6, out io_rdata : i128, in %io_wdata : i128, in %io_mask : i128) {
    %c-1_i128 = hw.constant -1 : i128
    %true = hw.constant true
    %ram.io_Q = hw.instance "ram" @S011HD1P_X32Y2D128_BW(clock: %clock: !seq.clock, reset: %reset: i1, io_CEN: %0: i1, io_WEN: %1: i1, io_BWEN: %2: i128, io_A: %io_addr: i6, io_D: %io_wdata: i128) -> (io_Q: i128) {sv.namehint = "ram.io_Q"}
    %0 = comb.xor bin %io_cen, %true {sv.namehint = "ram.io_CEN"} : i1
    %1 = comb.xor bin %io_wen, %true {sv.namehint = "ram.io_WEN"} : i1
    %2 = comb.xor bin %io_mask, %c-1_i128 {sv.namehint = "ram.io_BWEN"} : i128
    hw.output %ram.io_Q : i128
  }
  hw.module private @MaxPeriodFibonacciLFSR(in %clock : !seq.clock, in %reset : i1, out io_out_0 : i1, out io_out_1 : i1) {
    %true = hw.constant true
    %false = hw.constant false
    %state_0 = seq.firreg %0 clock %clock reset sync %reset, %true {firrtl.random_init_start = 0 : ui64, sv.namehint = "state_0"} : i1
    %state_1 = seq.firreg %state_0 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64, sv.namehint = "state_1"} : i1
    %0 = comb.xor bin %state_1, %state_0 : i1
    hw.output %state_0, %state_1 : i1, i1
  }
  hw.module private @InstCache(in %clock : !seq.clock, in %reset : i1, in %io_instAxi_ra_ready : i1, out io_instAxi_ra_valid : i1, out io_instAxi_ra_bits_addr : i32, in %io_instAxi_rd_valid : i1, in %io_instAxi_rd_bits_data : i64, in %io_instAxi_rd_bits_last : i1, in %io_icRead_addr : i32, out io_icRead_inst : i64, in %io_icRead_arvalid : i1, out io_icRead_rvalid : i1, in %io_flush : i1) {
    %c1_i3 = hw.constant 1 : i3
    %c-1_i4 = hw.constant -1 : i4
    %c0_i5 = hw.constant 0 : i5
    %c-1_i2 = hw.constant -1 : i2
    %c0_i30 = hw.constant 0 : i30
    %c0_i4 = hw.constant 0 : i4
    %c-2_i2 = hw.constant -2 : i2
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
    %c1_i2 = hw.constant 1 : i2
    %c0_i32 = hw.constant 0 : i32
    %c0_i3 = hw.constant 0 : i3
    %c0_i2 = hw.constant 0 : i2
    %c0_i64 = hw.constant 0 : i64
    %false = hw.constant false
    %true = hw.constant true
    %c0_i6 = hw.constant 0 : i6
    %c0_i128 = hw.constant 0 : i128
    %tag_0_0 = seq.firreg %258 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 0 : ui64} : i22
    %tag_0_1 = seq.firreg %263 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 22 : ui64} : i22
    %tag_0_2 = seq.firreg %268 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 44 : ui64} : i22
    %tag_0_3 = seq.firreg %273 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 66 : ui64} : i22
    %tag_0_4 = seq.firreg %278 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 88 : ui64} : i22
    %tag_0_5 = seq.firreg %283 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 110 : ui64} : i22
    %tag_0_6 = seq.firreg %288 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 132 : ui64} : i22
    %tag_0_7 = seq.firreg %293 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 154 : ui64} : i22
    %tag_0_8 = seq.firreg %298 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 176 : ui64} : i22
    %tag_0_9 = seq.firreg %303 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 198 : ui64} : i22
    %tag_0_10 = seq.firreg %308 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 220 : ui64} : i22
    %tag_0_11 = seq.firreg %313 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 242 : ui64} : i22
    %tag_0_12 = seq.firreg %318 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 264 : ui64} : i22
    %tag_0_13 = seq.firreg %323 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 286 : ui64} : i22
    %tag_0_14 = seq.firreg %328 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 308 : ui64} : i22
    %tag_0_15 = seq.firreg %333 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 330 : ui64} : i22
    %tag_1_0 = seq.firreg %338 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 352 : ui64} : i22
    %tag_1_1 = seq.firreg %342 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 374 : ui64} : i22
    %tag_1_2 = seq.firreg %346 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 396 : ui64} : i22
    %tag_1_3 = seq.firreg %350 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 418 : ui64} : i22
    %tag_1_4 = seq.firreg %354 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 440 : ui64} : i22
    %tag_1_5 = seq.firreg %358 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 462 : ui64} : i22
    %tag_1_6 = seq.firreg %362 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 484 : ui64} : i22
    %tag_1_7 = seq.firreg %366 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 506 : ui64} : i22
    %tag_1_8 = seq.firreg %370 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 528 : ui64} : i22
    %tag_1_9 = seq.firreg %374 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 550 : ui64} : i22
    %tag_1_10 = seq.firreg %378 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 572 : ui64} : i22
    %tag_1_11 = seq.firreg %382 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 594 : ui64} : i22
    %tag_1_12 = seq.firreg %386 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 616 : ui64} : i22
    %tag_1_13 = seq.firreg %390 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 638 : ui64} : i22
    %tag_1_14 = seq.firreg %394 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 660 : ui64} : i22
    %tag_1_15 = seq.firreg %398 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 682 : ui64} : i22
    %tag_2_0 = seq.firreg %403 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 704 : ui64} : i22
    %tag_2_1 = seq.firreg %407 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 726 : ui64} : i22
    %tag_2_2 = seq.firreg %411 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 748 : ui64} : i22
    %tag_2_3 = seq.firreg %415 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 770 : ui64} : i22
    %tag_2_4 = seq.firreg %419 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 792 : ui64} : i22
    %tag_2_5 = seq.firreg %423 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 814 : ui64} : i22
    %tag_2_6 = seq.firreg %427 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 836 : ui64} : i22
    %tag_2_7 = seq.firreg %431 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 858 : ui64} : i22
    %tag_2_8 = seq.firreg %435 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 880 : ui64} : i22
    %tag_2_9 = seq.firreg %439 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 902 : ui64} : i22
    %tag_2_10 = seq.firreg %443 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 924 : ui64} : i22
    %tag_2_11 = seq.firreg %447 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 946 : ui64} : i22
    %tag_2_12 = seq.firreg %451 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 968 : ui64} : i22
    %tag_2_13 = seq.firreg %455 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 990 : ui64} : i22
    %tag_2_14 = seq.firreg %459 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1012 : ui64} : i22
    %tag_2_15 = seq.firreg %463 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1034 : ui64} : i22
    %tag_3_0 = seq.firreg %468 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1056 : ui64} : i22
    %tag_3_1 = seq.firreg %472 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1078 : ui64} : i22
    %tag_3_2 = seq.firreg %476 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1100 : ui64} : i22
    %tag_3_3 = seq.firreg %480 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1122 : ui64} : i22
    %tag_3_4 = seq.firreg %484 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1144 : ui64} : i22
    %tag_3_5 = seq.firreg %488 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1166 : ui64} : i22
    %tag_3_6 = seq.firreg %492 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1188 : ui64} : i22
    %tag_3_7 = seq.firreg %496 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1210 : ui64} : i22
    %tag_3_8 = seq.firreg %500 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1232 : ui64} : i22
    %tag_3_9 = seq.firreg %504 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1254 : ui64} : i22
    %tag_3_10 = seq.firreg %508 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1276 : ui64} : i22
    %tag_3_11 = seq.firreg %512 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1298 : ui64} : i22
    %tag_3_12 = seq.firreg %516 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1320 : ui64} : i22
    %tag_3_13 = seq.firreg %520 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1342 : ui64} : i22
    %tag_3_14 = seq.firreg %524 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1364 : ui64} : i22
    %tag_3_15 = seq.firreg %528 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1386 : ui64} : i22
    %valid_0_0 = seq.firreg %531 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1408 : ui64} : i1
    %valid_0_1 = seq.firreg %534 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1409 : ui64} : i1
    %valid_0_2 = seq.firreg %537 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1410 : ui64} : i1
    %valid_0_3 = seq.firreg %540 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1411 : ui64} : i1
    %valid_0_4 = seq.firreg %543 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1412 : ui64} : i1
    %valid_0_5 = seq.firreg %546 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1413 : ui64} : i1
    %valid_0_6 = seq.firreg %549 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1414 : ui64} : i1
    %valid_0_7 = seq.firreg %552 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1415 : ui64} : i1
    %valid_0_8 = seq.firreg %555 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1416 : ui64} : i1
    %valid_0_9 = seq.firreg %558 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1417 : ui64} : i1
    %valid_0_10 = seq.firreg %561 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1418 : ui64} : i1
    %valid_0_11 = seq.firreg %564 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1419 : ui64} : i1
    %valid_0_12 = seq.firreg %567 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1420 : ui64} : i1
    %valid_0_13 = seq.firreg %570 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1421 : ui64} : i1
    %valid_0_14 = seq.firreg %573 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1422 : ui64} : i1
    %valid_0_15 = seq.firreg %576 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1423 : ui64} : i1
    %valid_1_0 = seq.firreg %579 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1424 : ui64} : i1
    %valid_1_1 = seq.firreg %582 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1425 : ui64} : i1
    %valid_1_2 = seq.firreg %585 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1426 : ui64} : i1
    %valid_1_3 = seq.firreg %588 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1427 : ui64} : i1
    %valid_1_4 = seq.firreg %591 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1428 : ui64} : i1
    %valid_1_5 = seq.firreg %594 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1429 : ui64} : i1
    %valid_1_6 = seq.firreg %597 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1430 : ui64} : i1
    %valid_1_7 = seq.firreg %600 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1431 : ui64} : i1
    %valid_1_8 = seq.firreg %603 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1432 : ui64} : i1
    %valid_1_9 = seq.firreg %606 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1433 : ui64} : i1
    %valid_1_10 = seq.firreg %609 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1434 : ui64} : i1
    %valid_1_11 = seq.firreg %612 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1435 : ui64} : i1
    %valid_1_12 = seq.firreg %615 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1436 : ui64} : i1
    %valid_1_13 = seq.firreg %618 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1437 : ui64} : i1
    %valid_1_14 = seq.firreg %621 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1438 : ui64} : i1
    %valid_1_15 = seq.firreg %624 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1439 : ui64} : i1
    %valid_2_0 = seq.firreg %627 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1440 : ui64} : i1
    %valid_2_1 = seq.firreg %630 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1441 : ui64} : i1
    %valid_2_2 = seq.firreg %633 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1442 : ui64} : i1
    %valid_2_3 = seq.firreg %636 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1443 : ui64} : i1
    %valid_2_4 = seq.firreg %639 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1444 : ui64} : i1
    %valid_2_5 = seq.firreg %642 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1445 : ui64} : i1
    %valid_2_6 = seq.firreg %645 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1446 : ui64} : i1
    %valid_2_7 = seq.firreg %648 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1447 : ui64} : i1
    %valid_2_8 = seq.firreg %651 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1448 : ui64} : i1
    %valid_2_9 = seq.firreg %654 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1449 : ui64} : i1
    %valid_2_10 = seq.firreg %657 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1450 : ui64} : i1
    %valid_2_11 = seq.firreg %660 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1451 : ui64} : i1
    %valid_2_12 = seq.firreg %663 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1452 : ui64} : i1
    %valid_2_13 = seq.firreg %666 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1453 : ui64} : i1
    %valid_2_14 = seq.firreg %669 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1454 : ui64} : i1
    %valid_2_15 = seq.firreg %672 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1455 : ui64} : i1
    %valid_3_0 = seq.firreg %675 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1456 : ui64} : i1
    %valid_3_1 = seq.firreg %678 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1457 : ui64} : i1
    %valid_3_2 = seq.firreg %681 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1458 : ui64} : i1
    %valid_3_3 = seq.firreg %684 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1459 : ui64} : i1
    %valid_3_4 = seq.firreg %687 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1460 : ui64} : i1
    %valid_3_5 = seq.firreg %690 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1461 : ui64} : i1
    %valid_3_6 = seq.firreg %693 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1462 : ui64} : i1
    %valid_3_7 = seq.firreg %696 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1463 : ui64} : i1
    %valid_3_8 = seq.firreg %699 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1464 : ui64} : i1
    %valid_3_9 = seq.firreg %702 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1465 : ui64} : i1
    %valid_3_10 = seq.firreg %705 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1466 : ui64} : i1
    %valid_3_11 = seq.firreg %708 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1467 : ui64} : i1
    %valid_3_12 = seq.firreg %711 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1468 : ui64} : i1
    %valid_3_13 = seq.firreg %714 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1469 : ui64} : i1
    %valid_3_14 = seq.firreg %717 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1470 : ui64} : i1
    %valid_3_15 = seq.firreg %720 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1471 : ui64} : i1
    %Ram_bw.io_rdata = hw.instance "Ram_bw" @Ram_bw(clock: %clock: !seq.clock, reset: %reset: i1, io_cen: %194: i1, io_wen: %198: i1, io_addr: %186: i6, io_wdata: %203: i128, io_mask: %207: i128) -> (io_rdata: i128) {sv.namehint = "data_0_rdata"}
    %Ram_bw_1.io_rdata = hw.instance "Ram_bw_1" @Ram_bw(clock: %clock: !seq.clock, reset: %reset: i1, io_cen: %195: i1, io_wen: %199: i1, io_addr: %188: i6, io_wdata: %204: i128, io_mask: %208: i128) -> (io_rdata: i128) {sv.namehint = "data_1_rdata"}
    %Ram_bw_2.io_rdata = hw.instance "Ram_bw_2" @Ram_bw(clock: %clock: !seq.clock, reset: %reset: i1, io_cen: %196: i1, io_wen: %200: i1, io_addr: %190: i6, io_wdata: %205: i128, io_mask: %209: i128) -> (io_rdata: i128) {sv.namehint = "data_2_rdata"}
    %Ram_bw_3.io_rdata = hw.instance "Ram_bw_3" @Ram_bw(clock: %clock: !seq.clock, reset: %reset: i1, io_cen: %197: i1, io_wen: %201: i1, io_addr: %192: i6, io_wdata: %206: i128, io_mask: %210: i128) -> (io_rdata: i128) {sv.namehint = "data_3_rdata"}
    %wait_r = seq.firreg %228 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1472 : ui64} : i1
    %valid_r = seq.firreg %224 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1473 : ui64, sv.namehint = "valid_r"} : i1
    %0 = comb.xor bin %io_flush, %true {sv.namehint = "_valid_in_T"} : i1
    %1 = comb.and bin %io_icRead_arvalid, %0, %2 {sv.namehint = "hs_in"} : i1
    %2 = comb.xor bin %wait_r, %true {sv.namehint = "_io_icRead_ready_T"} : i1
    %addr_r = seq.firreg %46 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1474 : ui64} : i32
    %matchWay_r = seq.firreg %47 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1506 : ui64} : i32
    %axiOffset = seq.firreg %727 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 1538 : ui64} : i3
    %databuf = seq.firreg %247 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1541 : ui64} : i64
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
    %37 = comb.or %32, %20 {sv.namehint = "_matchWay_T_1"} : i1
    %38 = comb.concat %36, %37 {sv.namehint = "_matchWay_T_2"} : i1, i1
    %matchWay_prng.io_out_0, %matchWay_prng.io_out_1 = hw.instance "matchWay_prng" @MaxPeriodFibonacciLFSR(clock: %clock: !seq.clock, reset: %reset: i1) -> (io_out_0: i1, io_out_1: i1) {sv.namehint = "matchWay_prng.io_out_1"}
    %39 = comb.concat %matchWay_prng.io_out_1, %matchWay_prng.io_out_0 {sv.namehint = "_matchWay_T_3"} : i1, i1
    %40 = comb.mux bin %34, %38, %39 {sv.namehint = "matchWay"} : i2
    %41 = comb.concat %c0_i30, %40 : i30, i2
    %42 = comb.extract %matchWay_r from 0 : (i32) -> i2
    %43 = comb.mux %1, %40, %42 {sv.namehint = "cur_way"} : i2
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
    %state = seq.firreg %723 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1605 : ui64} : i2
    %176 = comb.extract %matchWay_r from 0 {sv.namehint = "_rdata128_T"} : (i32) -> i2
    %177 = comb.extract %addr_r from 3 {sv.namehint = "_io_icRead_inst_T_3"} : (i32) -> i1
    %178 = hw.array_create %Ram_bw_3.io_rdata, %Ram_bw_2.io_rdata, %Ram_bw_1.io_rdata, %Ram_bw.io_rdata : i128
    %179 = hw.array_get %178[%176] : !hw.array<4xi128>, i2
    %180 = comb.extract %179 from 0 {sv.namehint = "_io_icRead_inst_T_1"} : (i128) -> i64
    %181 = comb.extract %179 from 64 {sv.namehint = "_io_icRead_inst_T_2"} : (i128) -> i64
    %182 = comb.mux bin %177, %181, %180 {sv.namehint = "io_icRead_inst"} : i64
    %183 = comb.icmp bin eq %state, %c-2_i2 {sv.namehint = "_data_addr_T"} : i2
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
    %198 = comb.and %185, %244 {sv.namehint = "data_0_wen"} : i1
    %199 = comb.and %187, %244 {sv.namehint = "data_1_wen"} : i1
    %200 = comb.and %189, %244 {sv.namehint = "data_2_wen"} : i1
    %201 = comb.and %191, %244 {sv.namehint = "data_3_wen"} : i1
    %202 = comb.concat %io_instAxi_rd_bits_data, %databuf {sv.namehint = "_data_wdata_T"} : i64, i64
    %203 = comb.mux bin %185, %202, %c0_i128 {sv.namehint = "data_0_wdata"} : i128
    %204 = comb.mux bin %187, %202, %c0_i128 {sv.namehint = "data_1_wdata"} : i128
    %205 = comb.mux bin %189, %202, %c0_i128 {sv.namehint = "data_2_wdata"} : i128
    %206 = comb.mux bin %191, %202, %c0_i128 {sv.namehint = "data_3_wdata"} : i128
    %207 = comb.replicate %185 {sv.namehint = "data_0_mask"} : (i1) -> i128
    %208 = comb.replicate %187 {sv.namehint = "data_1_mask"} : (i1) -> i128
    %209 = comb.replicate %189 {sv.namehint = "data_2_mask"} : (i1) -> i128
    %210 = comb.replicate %191 {sv.namehint = "data_3_mask"} : (i1) -> i128
    %raddrEn = seq.firreg %235 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1607 : ui64, sv.namehint = "raddrEn"} : i1
    %raddr = seq.firreg %219 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1608 : ui64, sv.namehint = "raddr"} : i32
    %rdataEn = seq.firreg %252 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1640 : ui64} : i1
    %211 = comb.icmp bin eq %state, %c0_i2 : i2
    %212 = comb.xor bin %1, %true : i1
    %213 = comb.and bin %212, %2 : i1
    %214 = comb.and bin %3, %c-64_i32 {sv.namehint = "_raddr_T"} : i32
    %215 = comb.concat %213, %32, %26, %20, %14 : i1, i1, i1, i1, i1
    %216 = comb.icmp bin ne %215, %c0_i5 : i5
    %217 = comb.xor %211, %true : i1
    %218 = comb.or %217, %216 : i1
    %219 = comb.mux bin %218, %raddr, %214 : i32
    %220 = comb.xor %216, %true : i1
    %221 = comb.or %220, %raddrEn : i1
    %222 = comb.mux bin %216, %state, %c1_i2 : i2
    %223 = comb.xor %213, %true : i1
    %224 = comb.and %211, %223, %34 : i1
    %225 = comb.xor bin %34, %true : i1
    %226 = comb.xor %211, %true : i1
    %227 = comb.or %226, %213 : i1
    %228 = comb.mux bin %227, %wait_r, %225 : i1
    %229 = comb.icmp bin eq %state, %c1_i2 : i2
    %230 = comb.and bin %raddrEn, %io_instAxi_ra_ready : i1
    %231 = comb.mux bin %230, %c-2_i2, %state : i2
    %232 = comb.and bin %229, %230 : i1
    %233 = comb.xor %232, %true : i1
    %234 = comb.and %233, %raddrEn : i1
    %235 = comb.mux bin %211, %221, %234 : i1
    %236 = comb.or %230, %rdataEn : i1
    %237 = comb.mux bin %230, %c0_i3, %axiOffset : i3
    %238 = comb.and bin %rdataEn, %io_instAxi_rd_valid : i1
    %239 = comb.add %axiOffset, %c1_i3 {sv.namehint = "_axiOffset_T"} : i3
    %240 = comb.extract %axiOffset from 0 : (i3) -> i1
    %241 = comb.and bin %183, %238 : i1
    %242 = comb.or bin %211, %229 : i1
    %243 = comb.xor %242, %true : i1
    %244 = comb.and %243, %241, %240 {sv.namehint = "wen"} : i1
    %245 = comb.xor %241, %true : i1
    %246 = comb.or %242, %245, %240 : i1
    %247 = comb.mux bin %246, %databuf, %io_instAxi_rd_bits_data : i64
    %248 = comb.and bin %183, %238, %io_instAxi_rd_bits_last : i1
    %249 = comb.xor %248, %true : i1
    %250 = comb.and %249, %rdataEn : i1
    %251 = comb.mux bin %229, %236, %250 : i1
    %252 = comb.mux bin %211, %rdataEn, %251 : i1
    %253 = comb.icmp bin eq %176, %c0_i2 : i2
    %254 = comb.icmp bin eq %44, %c0_i4 : i4
    %255 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %254 : i1
    %256 = comb.xor %255, %true : i1
    %257 = comb.or %242, %256 : i1
    %258 = comb.mux bin %257, %tag_0_0, %45 : i22
    %259 = comb.icmp bin eq %44, %c1_i4 : i4
    %260 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %259 : i1
    %261 = comb.xor %260, %true : i1
    %262 = comb.or %242, %261 : i1
    %263 = comb.mux bin %262, %tag_0_1, %45 : i22
    %264 = comb.icmp bin eq %44, %c2_i4 : i4
    %265 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %264 : i1
    %266 = comb.xor %265, %true : i1
    %267 = comb.or %242, %266 : i1
    %268 = comb.mux bin %267, %tag_0_2, %45 : i22
    %269 = comb.icmp bin eq %44, %c3_i4 : i4
    %270 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %269 : i1
    %271 = comb.xor %270, %true : i1
    %272 = comb.or %242, %271 : i1
    %273 = comb.mux bin %272, %tag_0_3, %45 : i22
    %274 = comb.icmp bin eq %44, %c4_i4 : i4
    %275 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %274 : i1
    %276 = comb.xor %275, %true : i1
    %277 = comb.or %242, %276 : i1
    %278 = comb.mux bin %277, %tag_0_4, %45 : i22
    %279 = comb.icmp bin eq %44, %c5_i4 : i4
    %280 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %279 : i1
    %281 = comb.xor %280, %true : i1
    %282 = comb.or %242, %281 : i1
    %283 = comb.mux bin %282, %tag_0_5, %45 : i22
    %284 = comb.icmp bin eq %44, %c6_i4 : i4
    %285 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %284 : i1
    %286 = comb.xor %285, %true : i1
    %287 = comb.or %242, %286 : i1
    %288 = comb.mux bin %287, %tag_0_6, %45 : i22
    %289 = comb.icmp bin eq %44, %c7_i4 : i4
    %290 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %289 : i1
    %291 = comb.xor %290, %true : i1
    %292 = comb.or %242, %291 : i1
    %293 = comb.mux bin %292, %tag_0_7, %45 : i22
    %294 = comb.icmp bin eq %44, %c-8_i4 : i4
    %295 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %294 : i1
    %296 = comb.xor %295, %true : i1
    %297 = comb.or %242, %296 : i1
    %298 = comb.mux bin %297, %tag_0_8, %45 : i22
    %299 = comb.icmp bin eq %44, %c-7_i4 : i4
    %300 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %299 : i1
    %301 = comb.xor %300, %true : i1
    %302 = comb.or %242, %301 : i1
    %303 = comb.mux bin %302, %tag_0_9, %45 : i22
    %304 = comb.icmp bin eq %44, %c-6_i4 : i4
    %305 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %304 : i1
    %306 = comb.xor %305, %true : i1
    %307 = comb.or %242, %306 : i1
    %308 = comb.mux bin %307, %tag_0_10, %45 : i22
    %309 = comb.icmp bin eq %44, %c-5_i4 : i4
    %310 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %309 : i1
    %311 = comb.xor %310, %true : i1
    %312 = comb.or %242, %311 : i1
    %313 = comb.mux bin %312, %tag_0_11, %45 : i22
    %314 = comb.icmp bin eq %44, %c-4_i4 : i4
    %315 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %314 : i1
    %316 = comb.xor %315, %true : i1
    %317 = comb.or %242, %316 : i1
    %318 = comb.mux bin %317, %tag_0_12, %45 : i22
    %319 = comb.icmp bin eq %44, %c-3_i4 : i4
    %320 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %319 : i1
    %321 = comb.xor %320, %true : i1
    %322 = comb.or %242, %321 : i1
    %323 = comb.mux bin %322, %tag_0_13, %45 : i22
    %324 = comb.icmp bin eq %44, %c-2_i4 : i4
    %325 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %324 : i1
    %326 = comb.xor %325, %true : i1
    %327 = comb.or %242, %326 : i1
    %328 = comb.mux bin %327, %tag_0_14, %45 : i22
    %329 = comb.icmp bin eq %44, %c-1_i4 : i4
    %330 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %253, %329 : i1
    %331 = comb.xor %330, %true : i1
    %332 = comb.or %242, %331 : i1
    %333 = comb.mux bin %332, %tag_0_15, %45 : i22
    %334 = comb.icmp bin eq %176, %c1_i2 : i2
    %335 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %254 : i1
    %336 = comb.xor %335, %true : i1
    %337 = comb.or %242, %336 : i1
    %338 = comb.mux bin %337, %tag_1_0, %45 : i22
    %339 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %259 : i1
    %340 = comb.xor %339, %true : i1
    %341 = comb.or %242, %340 : i1
    %342 = comb.mux bin %341, %tag_1_1, %45 : i22
    %343 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %264 : i1
    %344 = comb.xor %343, %true : i1
    %345 = comb.or %242, %344 : i1
    %346 = comb.mux bin %345, %tag_1_2, %45 : i22
    %347 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %269 : i1
    %348 = comb.xor %347, %true : i1
    %349 = comb.or %242, %348 : i1
    %350 = comb.mux bin %349, %tag_1_3, %45 : i22
    %351 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %274 : i1
    %352 = comb.xor %351, %true : i1
    %353 = comb.or %242, %352 : i1
    %354 = comb.mux bin %353, %tag_1_4, %45 : i22
    %355 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %279 : i1
    %356 = comb.xor %355, %true : i1
    %357 = comb.or %242, %356 : i1
    %358 = comb.mux bin %357, %tag_1_5, %45 : i22
    %359 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %284 : i1
    %360 = comb.xor %359, %true : i1
    %361 = comb.or %242, %360 : i1
    %362 = comb.mux bin %361, %tag_1_6, %45 : i22
    %363 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %289 : i1
    %364 = comb.xor %363, %true : i1
    %365 = comb.or %242, %364 : i1
    %366 = comb.mux bin %365, %tag_1_7, %45 : i22
    %367 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %294 : i1
    %368 = comb.xor %367, %true : i1
    %369 = comb.or %242, %368 : i1
    %370 = comb.mux bin %369, %tag_1_8, %45 : i22
    %371 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %299 : i1
    %372 = comb.xor %371, %true : i1
    %373 = comb.or %242, %372 : i1
    %374 = comb.mux bin %373, %tag_1_9, %45 : i22
    %375 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %304 : i1
    %376 = comb.xor %375, %true : i1
    %377 = comb.or %242, %376 : i1
    %378 = comb.mux bin %377, %tag_1_10, %45 : i22
    %379 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %309 : i1
    %380 = comb.xor %379, %true : i1
    %381 = comb.or %242, %380 : i1
    %382 = comb.mux bin %381, %tag_1_11, %45 : i22
    %383 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %314 : i1
    %384 = comb.xor %383, %true : i1
    %385 = comb.or %242, %384 : i1
    %386 = comb.mux bin %385, %tag_1_12, %45 : i22
    %387 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %319 : i1
    %388 = comb.xor %387, %true : i1
    %389 = comb.or %242, %388 : i1
    %390 = comb.mux bin %389, %tag_1_13, %45 : i22
    %391 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %324 : i1
    %392 = comb.xor %391, %true : i1
    %393 = comb.or %242, %392 : i1
    %394 = comb.mux bin %393, %tag_1_14, %45 : i22
    %395 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %334, %329 : i1
    %396 = comb.xor %395, %true : i1
    %397 = comb.or %242, %396 : i1
    %398 = comb.mux bin %397, %tag_1_15, %45 : i22
    %399 = comb.icmp bin eq %176, %c-2_i2 : i2
    %400 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %254 : i1
    %401 = comb.xor %400, %true : i1
    %402 = comb.or %242, %401 : i1
    %403 = comb.mux bin %402, %tag_2_0, %45 : i22
    %404 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %259 : i1
    %405 = comb.xor %404, %true : i1
    %406 = comb.or %242, %405 : i1
    %407 = comb.mux bin %406, %tag_2_1, %45 : i22
    %408 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %264 : i1
    %409 = comb.xor %408, %true : i1
    %410 = comb.or %242, %409 : i1
    %411 = comb.mux bin %410, %tag_2_2, %45 : i22
    %412 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %269 : i1
    %413 = comb.xor %412, %true : i1
    %414 = comb.or %242, %413 : i1
    %415 = comb.mux bin %414, %tag_2_3, %45 : i22
    %416 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %274 : i1
    %417 = comb.xor %416, %true : i1
    %418 = comb.or %242, %417 : i1
    %419 = comb.mux bin %418, %tag_2_4, %45 : i22
    %420 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %279 : i1
    %421 = comb.xor %420, %true : i1
    %422 = comb.or %242, %421 : i1
    %423 = comb.mux bin %422, %tag_2_5, %45 : i22
    %424 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %284 : i1
    %425 = comb.xor %424, %true : i1
    %426 = comb.or %242, %425 : i1
    %427 = comb.mux bin %426, %tag_2_6, %45 : i22
    %428 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %289 : i1
    %429 = comb.xor %428, %true : i1
    %430 = comb.or %242, %429 : i1
    %431 = comb.mux bin %430, %tag_2_7, %45 : i22
    %432 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %294 : i1
    %433 = comb.xor %432, %true : i1
    %434 = comb.or %242, %433 : i1
    %435 = comb.mux bin %434, %tag_2_8, %45 : i22
    %436 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %299 : i1
    %437 = comb.xor %436, %true : i1
    %438 = comb.or %242, %437 : i1
    %439 = comb.mux bin %438, %tag_2_9, %45 : i22
    %440 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %304 : i1
    %441 = comb.xor %440, %true : i1
    %442 = comb.or %242, %441 : i1
    %443 = comb.mux bin %442, %tag_2_10, %45 : i22
    %444 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %309 : i1
    %445 = comb.xor %444, %true : i1
    %446 = comb.or %242, %445 : i1
    %447 = comb.mux bin %446, %tag_2_11, %45 : i22
    %448 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %314 : i1
    %449 = comb.xor %448, %true : i1
    %450 = comb.or %242, %449 : i1
    %451 = comb.mux bin %450, %tag_2_12, %45 : i22
    %452 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %319 : i1
    %453 = comb.xor %452, %true : i1
    %454 = comb.or %242, %453 : i1
    %455 = comb.mux bin %454, %tag_2_13, %45 : i22
    %456 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %324 : i1
    %457 = comb.xor %456, %true : i1
    %458 = comb.or %242, %457 : i1
    %459 = comb.mux bin %458, %tag_2_14, %45 : i22
    %460 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %399, %329 : i1
    %461 = comb.xor %460, %true : i1
    %462 = comb.or %242, %461 : i1
    %463 = comb.mux bin %462, %tag_2_15, %45 : i22
    %464 = comb.icmp bin eq %176, %c-1_i2 : i2
    %465 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %254 : i1
    %466 = comb.xor %465, %true : i1
    %467 = comb.or %242, %466 : i1
    %468 = comb.mux bin %467, %tag_3_0, %45 : i22
    %469 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %259 : i1
    %470 = comb.xor %469, %true : i1
    %471 = comb.or %242, %470 : i1
    %472 = comb.mux bin %471, %tag_3_1, %45 : i22
    %473 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %264 : i1
    %474 = comb.xor %473, %true : i1
    %475 = comb.or %242, %474 : i1
    %476 = comb.mux bin %475, %tag_3_2, %45 : i22
    %477 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %269 : i1
    %478 = comb.xor %477, %true : i1
    %479 = comb.or %242, %478 : i1
    %480 = comb.mux bin %479, %tag_3_3, %45 : i22
    %481 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %274 : i1
    %482 = comb.xor %481, %true : i1
    %483 = comb.or %242, %482 : i1
    %484 = comb.mux bin %483, %tag_3_4, %45 : i22
    %485 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %279 : i1
    %486 = comb.xor %485, %true : i1
    %487 = comb.or %242, %486 : i1
    %488 = comb.mux bin %487, %tag_3_5, %45 : i22
    %489 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %284 : i1
    %490 = comb.xor %489, %true : i1
    %491 = comb.or %242, %490 : i1
    %492 = comb.mux bin %491, %tag_3_6, %45 : i22
    %493 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %289 : i1
    %494 = comb.xor %493, %true : i1
    %495 = comb.or %242, %494 : i1
    %496 = comb.mux bin %495, %tag_3_7, %45 : i22
    %497 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %294 : i1
    %498 = comb.xor %497, %true : i1
    %499 = comb.or %242, %498 : i1
    %500 = comb.mux bin %499, %tag_3_8, %45 : i22
    %501 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %299 : i1
    %502 = comb.xor %501, %true : i1
    %503 = comb.or %242, %502 : i1
    %504 = comb.mux bin %503, %tag_3_9, %45 : i22
    %505 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %304 : i1
    %506 = comb.xor %505, %true : i1
    %507 = comb.or %242, %506 : i1
    %508 = comb.mux bin %507, %tag_3_10, %45 : i22
    %509 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %309 : i1
    %510 = comb.xor %509, %true : i1
    %511 = comb.or %242, %510 : i1
    %512 = comb.mux bin %511, %tag_3_11, %45 : i22
    %513 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %314 : i1
    %514 = comb.xor %513, %true : i1
    %515 = comb.or %242, %514 : i1
    %516 = comb.mux bin %515, %tag_3_12, %45 : i22
    %517 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %319 : i1
    %518 = comb.xor %517, %true : i1
    %519 = comb.or %242, %518 : i1
    %520 = comb.mux bin %519, %tag_3_13, %45 : i22
    %521 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %324 : i1
    %522 = comb.xor %521, %true : i1
    %523 = comb.or %242, %522 : i1
    %524 = comb.mux bin %523, %tag_3_14, %45 : i22
    %525 = comb.and bin %183, %238, %io_instAxi_rd_bits_last, %464, %329 : i1
    %526 = comb.xor %525, %true : i1
    %527 = comb.or %242, %526 : i1
    %528 = comb.mux bin %527, %tag_3_15, %45 : i22
    %529 = comb.xor %242, %true : i1
    %530 = comb.and %529, %255 : i1
    %531 = comb.or %530, %49 : i1
    %532 = comb.xor %242, %true : i1
    %533 = comb.and %532, %260 : i1
    %534 = comb.or %533, %51 : i1
    %535 = comb.xor %242, %true : i1
    %536 = comb.and %535, %265 : i1
    %537 = comb.or %536, %53 : i1
    %538 = comb.xor %242, %true : i1
    %539 = comb.and %538, %270 : i1
    %540 = comb.or %539, %55 : i1
    %541 = comb.xor %242, %true : i1
    %542 = comb.and %541, %275 : i1
    %543 = comb.or %542, %57 : i1
    %544 = comb.xor %242, %true : i1
    %545 = comb.and %544, %280 : i1
    %546 = comb.or %545, %59 : i1
    %547 = comb.xor %242, %true : i1
    %548 = comb.and %547, %285 : i1
    %549 = comb.or %548, %61 : i1
    %550 = comb.xor %242, %true : i1
    %551 = comb.and %550, %290 : i1
    %552 = comb.or %551, %63 : i1
    %553 = comb.xor %242, %true : i1
    %554 = comb.and %553, %295 : i1
    %555 = comb.or %554, %65 : i1
    %556 = comb.xor %242, %true : i1
    %557 = comb.and %556, %300 : i1
    %558 = comb.or %557, %67 : i1
    %559 = comb.xor %242, %true : i1
    %560 = comb.and %559, %305 : i1
    %561 = comb.or %560, %69 : i1
    %562 = comb.xor %242, %true : i1
    %563 = comb.and %562, %310 : i1
    %564 = comb.or %563, %71 : i1
    %565 = comb.xor %242, %true : i1
    %566 = comb.and %565, %315 : i1
    %567 = comb.or %566, %73 : i1
    %568 = comb.xor %242, %true : i1
    %569 = comb.and %568, %320 : i1
    %570 = comb.or %569, %75 : i1
    %571 = comb.xor %242, %true : i1
    %572 = comb.and %571, %325 : i1
    %573 = comb.or %572, %77 : i1
    %574 = comb.xor %242, %true : i1
    %575 = comb.and %574, %330 : i1
    %576 = comb.or %575, %79 : i1
    %577 = comb.xor %242, %true : i1
    %578 = comb.and %577, %335 : i1
    %579 = comb.or %578, %81 : i1
    %580 = comb.xor %242, %true : i1
    %581 = comb.and %580, %339 : i1
    %582 = comb.or %581, %83 : i1
    %583 = comb.xor %242, %true : i1
    %584 = comb.and %583, %343 : i1
    %585 = comb.or %584, %85 : i1
    %586 = comb.xor %242, %true : i1
    %587 = comb.and %586, %347 : i1
    %588 = comb.or %587, %87 : i1
    %589 = comb.xor %242, %true : i1
    %590 = comb.and %589, %351 : i1
    %591 = comb.or %590, %89 : i1
    %592 = comb.xor %242, %true : i1
    %593 = comb.and %592, %355 : i1
    %594 = comb.or %593, %91 : i1
    %595 = comb.xor %242, %true : i1
    %596 = comb.and %595, %359 : i1
    %597 = comb.or %596, %93 : i1
    %598 = comb.xor %242, %true : i1
    %599 = comb.and %598, %363 : i1
    %600 = comb.or %599, %95 : i1
    %601 = comb.xor %242, %true : i1
    %602 = comb.and %601, %367 : i1
    %603 = comb.or %602, %97 : i1
    %604 = comb.xor %242, %true : i1
    %605 = comb.and %604, %371 : i1
    %606 = comb.or %605, %99 : i1
    %607 = comb.xor %242, %true : i1
    %608 = comb.and %607, %375 : i1
    %609 = comb.or %608, %101 : i1
    %610 = comb.xor %242, %true : i1
    %611 = comb.and %610, %379 : i1
    %612 = comb.or %611, %103 : i1
    %613 = comb.xor %242, %true : i1
    %614 = comb.and %613, %383 : i1
    %615 = comb.or %614, %105 : i1
    %616 = comb.xor %242, %true : i1
    %617 = comb.and %616, %387 : i1
    %618 = comb.or %617, %107 : i1
    %619 = comb.xor %242, %true : i1
    %620 = comb.and %619, %391 : i1
    %621 = comb.or %620, %109 : i1
    %622 = comb.xor %242, %true : i1
    %623 = comb.and %622, %395 : i1
    %624 = comb.or %623, %111 : i1
    %625 = comb.xor %242, %true : i1
    %626 = comb.and %625, %400 : i1
    %627 = comb.or %626, %113 : i1
    %628 = comb.xor %242, %true : i1
    %629 = comb.and %628, %404 : i1
    %630 = comb.or %629, %115 : i1
    %631 = comb.xor %242, %true : i1
    %632 = comb.and %631, %408 : i1
    %633 = comb.or %632, %117 : i1
    %634 = comb.xor %242, %true : i1
    %635 = comb.and %634, %412 : i1
    %636 = comb.or %635, %119 : i1
    %637 = comb.xor %242, %true : i1
    %638 = comb.and %637, %416 : i1
    %639 = comb.or %638, %121 : i1
    %640 = comb.xor %242, %true : i1
    %641 = comb.and %640, %420 : i1
    %642 = comb.or %641, %123 : i1
    %643 = comb.xor %242, %true : i1
    %644 = comb.and %643, %424 : i1
    %645 = comb.or %644, %125 : i1
    %646 = comb.xor %242, %true : i1
    %647 = comb.and %646, %428 : i1
    %648 = comb.or %647, %127 : i1
    %649 = comb.xor %242, %true : i1
    %650 = comb.and %649, %432 : i1
    %651 = comb.or %650, %129 : i1
    %652 = comb.xor %242, %true : i1
    %653 = comb.and %652, %436 : i1
    %654 = comb.or %653, %131 : i1
    %655 = comb.xor %242, %true : i1
    %656 = comb.and %655, %440 : i1
    %657 = comb.or %656, %133 : i1
    %658 = comb.xor %242, %true : i1
    %659 = comb.and %658, %444 : i1
    %660 = comb.or %659, %135 : i1
    %661 = comb.xor %242, %true : i1
    %662 = comb.and %661, %448 : i1
    %663 = comb.or %662, %137 : i1
    %664 = comb.xor %242, %true : i1
    %665 = comb.and %664, %452 : i1
    %666 = comb.or %665, %139 : i1
    %667 = comb.xor %242, %true : i1
    %668 = comb.and %667, %456 : i1
    %669 = comb.or %668, %141 : i1
    %670 = comb.xor %242, %true : i1
    %671 = comb.and %670, %460 : i1
    %672 = comb.or %671, %143 : i1
    %673 = comb.xor %242, %true : i1
    %674 = comb.and %673, %465 : i1
    %675 = comb.or %674, %145 : i1
    %676 = comb.xor %242, %true : i1
    %677 = comb.and %676, %469 : i1
    %678 = comb.or %677, %147 : i1
    %679 = comb.xor %242, %true : i1
    %680 = comb.and %679, %473 : i1
    %681 = comb.or %680, %149 : i1
    %682 = comb.xor %242, %true : i1
    %683 = comb.and %682, %477 : i1
    %684 = comb.or %683, %151 : i1
    %685 = comb.xor %242, %true : i1
    %686 = comb.and %685, %481 : i1
    %687 = comb.or %686, %153 : i1
    %688 = comb.xor %242, %true : i1
    %689 = comb.and %688, %485 : i1
    %690 = comb.or %689, %155 : i1
    %691 = comb.xor %242, %true : i1
    %692 = comb.and %691, %489 : i1
    %693 = comb.or %692, %157 : i1
    %694 = comb.xor %242, %true : i1
    %695 = comb.and %694, %493 : i1
    %696 = comb.or %695, %159 : i1
    %697 = comb.xor %242, %true : i1
    %698 = comb.and %697, %497 : i1
    %699 = comb.or %698, %161 : i1
    %700 = comb.xor %242, %true : i1
    %701 = comb.and %700, %501 : i1
    %702 = comb.or %701, %163 : i1
    %703 = comb.xor %242, %true : i1
    %704 = comb.and %703, %505 : i1
    %705 = comb.or %704, %165 : i1
    %706 = comb.xor %242, %true : i1
    %707 = comb.and %706, %509 : i1
    %708 = comb.or %707, %167 : i1
    %709 = comb.xor %242, %true : i1
    %710 = comb.and %709, %513 : i1
    %711 = comb.or %710, %169 : i1
    %712 = comb.xor %242, %true : i1
    %713 = comb.and %712, %517 : i1
    %714 = comb.or %713, %171 : i1
    %715 = comb.xor %242, %true : i1
    %716 = comb.and %715, %521 : i1
    %717 = comb.or %716, %173 : i1
    %718 = comb.xor %242, %true : i1
    %719 = comb.and %718, %525 : i1
    %720 = comb.or %719, %175 : i1
    %721 = comb.mux bin %248, %c0_i2, %state : i2
    %722 = comb.mux bin %229, %231, %721 : i2
    %723 = comb.mux bin %211, %222, %722 : i2
    %724 = comb.mux bin %io_instAxi_rd_bits_last, %c0_i3, %239 : i3
    %725 = comb.mux bin %241, %724, %axiOffset : i3
    %726 = comb.mux bin %229, %237, %725 : i3
    %727 = comb.mux bin %211, %axiOffset, %726 : i3
    hw.output %raddrEn, %raddr, %182, %valid_r : i1, i32, i64, i1
  }
  hw.module private @DataCache(in %clock : !seq.clock, in %reset : i1, in %io_dataAxi_wa_ready : i1, out io_dataAxi_wa_valid : i1, out io_dataAxi_wa_bits_addr : i32, in %io_dataAxi_wd_ready : i1, out io_dataAxi_wd_valid : i1, out io_dataAxi_wd_bits_data : i64, out io_dataAxi_wd_bits_last : i1, in %io_dataAxi_ra_ready : i1, out io_dataAxi_ra_valid : i1, out io_dataAxi_ra_bits_addr : i32, in %io_dataAxi_rd_valid : i1, in %io_dataAxi_rd_bits_data : i64, in %io_dataAxi_rd_bits_last : i1, in %io_dcRW_addr : i32, out io_dcRW_rdata : i64, out io_dcRW_rvalid : i1, in %io_dcRW_wdata : i64, in %io_dcRW_dc_mode : i5, in %io_dcRW_amo : i5, out io_dcRW_ready : i1, in %io_flush : i1, out io_flush_out : i1) {
    %0 = hw.aggregate_constant [18446744073709551615 : i128, 4294967295 : i128, 65535 : i128, 255 : i128] : !hw.array<4xi128>
    %c-1_i3 = hw.constant -1 : i3
    %c0_i248 = hw.constant 0 : i248
    %c0_i184 = hw.constant 0 : i184
    %c0_i127 = hw.constant 0 : i127
    %c0_i121 = hw.constant 0 : i121
    %c0_i5 = hw.constant 0 : i5
    %c0_i64 = hw.constant 0 : i64
    %c0_i32 = hw.constant 0 : i32
    %c0_i2 = hw.constant 0 : i2
    %c0_i3 = hw.constant 0 : i3
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
    %c1_i4 = hw.constant 1 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c4_i4 = hw.constant 4 : i4
    %c5_i4 = hw.constant 5 : i4
    %c6_i4 = hw.constant 6 : i4
    %c7_i4 = hw.constant 7 : i4
    %c-64_i32 = hw.constant -64 : i32
    %c0_i6 = hw.constant 0 : i6
    %c1_i3 = hw.constant 1 : i3
    %c2_i3 = hw.constant 2 : i3
    %c0_i22 = hw.constant 0 : i22
    %false = hw.constant false
    %c0_i4 = hw.constant 0 : i4
    %c1_i2 = hw.constant 1 : i2
    %c3_i3 = hw.constant 3 : i3
    %true = hw.constant true
    %c0_i128 = hw.constant 0 : i128
    %c-1_i128 = hw.constant -1 : i128
    %tag_0_0 = seq.firreg %636 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 0 : ui64} : i22
    %tag_0_1 = seq.firreg %642 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 22 : ui64} : i22
    %tag_0_2 = seq.firreg %648 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 44 : ui64} : i22
    %tag_0_3 = seq.firreg %654 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 66 : ui64} : i22
    %tag_0_4 = seq.firreg %660 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 88 : ui64} : i22
    %tag_0_5 = seq.firreg %666 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 110 : ui64} : i22
    %tag_0_6 = seq.firreg %672 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 132 : ui64} : i22
    %tag_0_7 = seq.firreg %678 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 154 : ui64} : i22
    %tag_0_8 = seq.firreg %684 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 176 : ui64} : i22
    %tag_0_9 = seq.firreg %690 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 198 : ui64} : i22
    %tag_0_10 = seq.firreg %696 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 220 : ui64} : i22
    %tag_0_11 = seq.firreg %702 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 242 : ui64} : i22
    %tag_0_12 = seq.firreg %708 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 264 : ui64} : i22
    %tag_0_13 = seq.firreg %714 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 286 : ui64} : i22
    %tag_0_14 = seq.firreg %720 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 308 : ui64} : i22
    %tag_0_15 = seq.firreg %726 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 330 : ui64} : i22
    %tag_1_0 = seq.firreg %732 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 352 : ui64} : i22
    %tag_1_1 = seq.firreg %737 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 374 : ui64} : i22
    %tag_1_2 = seq.firreg %742 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 396 : ui64} : i22
    %tag_1_3 = seq.firreg %747 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 418 : ui64} : i22
    %tag_1_4 = seq.firreg %752 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 440 : ui64} : i22
    %tag_1_5 = seq.firreg %757 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 462 : ui64} : i22
    %tag_1_6 = seq.firreg %762 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 484 : ui64} : i22
    %tag_1_7 = seq.firreg %767 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 506 : ui64} : i22
    %tag_1_8 = seq.firreg %772 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 528 : ui64} : i22
    %tag_1_9 = seq.firreg %777 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 550 : ui64} : i22
    %tag_1_10 = seq.firreg %782 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 572 : ui64} : i22
    %tag_1_11 = seq.firreg %787 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 594 : ui64} : i22
    %tag_1_12 = seq.firreg %792 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 616 : ui64} : i22
    %tag_1_13 = seq.firreg %797 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 638 : ui64} : i22
    %tag_1_14 = seq.firreg %802 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 660 : ui64} : i22
    %tag_1_15 = seq.firreg %807 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 682 : ui64} : i22
    %tag_2_0 = seq.firreg %813 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 704 : ui64} : i22
    %tag_2_1 = seq.firreg %818 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 726 : ui64} : i22
    %tag_2_2 = seq.firreg %823 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 748 : ui64} : i22
    %tag_2_3 = seq.firreg %828 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 770 : ui64} : i22
    %tag_2_4 = seq.firreg %833 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 792 : ui64} : i22
    %tag_2_5 = seq.firreg %838 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 814 : ui64} : i22
    %tag_2_6 = seq.firreg %843 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 836 : ui64} : i22
    %tag_2_7 = seq.firreg %848 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 858 : ui64} : i22
    %tag_2_8 = seq.firreg %853 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 880 : ui64} : i22
    %tag_2_9 = seq.firreg %858 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 902 : ui64} : i22
    %tag_2_10 = seq.firreg %863 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 924 : ui64} : i22
    %tag_2_11 = seq.firreg %868 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 946 : ui64} : i22
    %tag_2_12 = seq.firreg %873 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 968 : ui64} : i22
    %tag_2_13 = seq.firreg %878 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 990 : ui64} : i22
    %tag_2_14 = seq.firreg %883 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1012 : ui64} : i22
    %tag_2_15 = seq.firreg %888 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1034 : ui64} : i22
    %tag_3_0 = seq.firreg %894 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1056 : ui64} : i22
    %tag_3_1 = seq.firreg %899 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1078 : ui64} : i22
    %tag_3_2 = seq.firreg %904 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1100 : ui64} : i22
    %tag_3_3 = seq.firreg %909 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1122 : ui64} : i22
    %tag_3_4 = seq.firreg %914 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1144 : ui64} : i22
    %tag_3_5 = seq.firreg %919 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1166 : ui64} : i22
    %tag_3_6 = seq.firreg %924 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1188 : ui64} : i22
    %tag_3_7 = seq.firreg %929 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1210 : ui64} : i22
    %tag_3_8 = seq.firreg %934 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1232 : ui64} : i22
    %tag_3_9 = seq.firreg %939 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1254 : ui64} : i22
    %tag_3_10 = seq.firreg %944 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1276 : ui64} : i22
    %tag_3_11 = seq.firreg %949 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1298 : ui64} : i22
    %tag_3_12 = seq.firreg %954 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1320 : ui64} : i22
    %tag_3_13 = seq.firreg %959 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1342 : ui64} : i22
    %tag_3_14 = seq.firreg %964 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1364 : ui64} : i22
    %tag_3_15 = seq.firreg %969 clock %clock reset sync %reset, %c0_i22 {firrtl.random_init_start = 1386 : ui64} : i22
    %valid_0_0 = seq.firreg %1553 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1408 : ui64} : i1
    %valid_0_1 = seq.firreg %1560 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1409 : ui64} : i1
    %valid_0_2 = seq.firreg %1567 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1410 : ui64} : i1
    %valid_0_3 = seq.firreg %1574 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1411 : ui64} : i1
    %valid_0_4 = seq.firreg %1581 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1412 : ui64} : i1
    %valid_0_5 = seq.firreg %1588 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1413 : ui64} : i1
    %valid_0_6 = seq.firreg %1595 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1414 : ui64} : i1
    %valid_0_7 = seq.firreg %1602 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1415 : ui64} : i1
    %valid_0_8 = seq.firreg %1609 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1416 : ui64} : i1
    %valid_0_9 = seq.firreg %1616 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1417 : ui64} : i1
    %valid_0_10 = seq.firreg %1623 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1418 : ui64} : i1
    %valid_0_11 = seq.firreg %1630 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1419 : ui64} : i1
    %valid_0_12 = seq.firreg %1637 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1420 : ui64} : i1
    %valid_0_13 = seq.firreg %1644 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1421 : ui64} : i1
    %valid_0_14 = seq.firreg %1651 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1422 : ui64} : i1
    %valid_0_15 = seq.firreg %1658 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1423 : ui64} : i1
    %valid_1_0 = seq.firreg %1665 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1424 : ui64} : i1
    %valid_1_1 = seq.firreg %1672 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1425 : ui64} : i1
    %valid_1_2 = seq.firreg %1679 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1426 : ui64} : i1
    %valid_1_3 = seq.firreg %1686 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1427 : ui64} : i1
    %valid_1_4 = seq.firreg %1693 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1428 : ui64} : i1
    %valid_1_5 = seq.firreg %1700 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1429 : ui64} : i1
    %valid_1_6 = seq.firreg %1707 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1430 : ui64} : i1
    %valid_1_7 = seq.firreg %1714 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1431 : ui64} : i1
    %valid_1_8 = seq.firreg %1721 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1432 : ui64} : i1
    %valid_1_9 = seq.firreg %1728 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1433 : ui64} : i1
    %valid_1_10 = seq.firreg %1735 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1434 : ui64} : i1
    %valid_1_11 = seq.firreg %1742 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1435 : ui64} : i1
    %valid_1_12 = seq.firreg %1749 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1436 : ui64} : i1
    %valid_1_13 = seq.firreg %1756 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1437 : ui64} : i1
    %valid_1_14 = seq.firreg %1763 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1438 : ui64} : i1
    %valid_1_15 = seq.firreg %1770 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1439 : ui64} : i1
    %valid_2_0 = seq.firreg %1777 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1440 : ui64} : i1
    %valid_2_1 = seq.firreg %1784 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1441 : ui64} : i1
    %valid_2_2 = seq.firreg %1791 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1442 : ui64} : i1
    %valid_2_3 = seq.firreg %1798 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1443 : ui64} : i1
    %valid_2_4 = seq.firreg %1805 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1444 : ui64} : i1
    %valid_2_5 = seq.firreg %1812 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1445 : ui64} : i1
    %valid_2_6 = seq.firreg %1819 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1446 : ui64} : i1
    %valid_2_7 = seq.firreg %1826 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1447 : ui64} : i1
    %valid_2_8 = seq.firreg %1833 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1448 : ui64} : i1
    %valid_2_9 = seq.firreg %1840 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1449 : ui64} : i1
    %valid_2_10 = seq.firreg %1847 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1450 : ui64} : i1
    %valid_2_11 = seq.firreg %1854 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1451 : ui64} : i1
    %valid_2_12 = seq.firreg %1861 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1452 : ui64} : i1
    %valid_2_13 = seq.firreg %1868 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1453 : ui64} : i1
    %valid_2_14 = seq.firreg %1875 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1454 : ui64} : i1
    %valid_2_15 = seq.firreg %1882 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1455 : ui64} : i1
    %valid_3_0 = seq.firreg %1889 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1456 : ui64} : i1
    %valid_3_1 = seq.firreg %1896 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1457 : ui64} : i1
    %valid_3_2 = seq.firreg %1903 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1458 : ui64} : i1
    %valid_3_3 = seq.firreg %1910 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1459 : ui64} : i1
    %valid_3_4 = seq.firreg %1917 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1460 : ui64} : i1
    %valid_3_5 = seq.firreg %1924 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1461 : ui64} : i1
    %valid_3_6 = seq.firreg %1931 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1462 : ui64} : i1
    %valid_3_7 = seq.firreg %1938 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1463 : ui64} : i1
    %valid_3_8 = seq.firreg %1945 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1464 : ui64} : i1
    %valid_3_9 = seq.firreg %1952 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1465 : ui64} : i1
    %valid_3_10 = seq.firreg %1959 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1466 : ui64} : i1
    %valid_3_11 = seq.firreg %1966 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1467 : ui64} : i1
    %valid_3_12 = seq.firreg %1973 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1468 : ui64} : i1
    %valid_3_13 = seq.firreg %1980 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1469 : ui64} : i1
    %valid_3_14 = seq.firreg %1987 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1470 : ui64} : i1
    %valid_3_15 = seq.firreg %1994 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1471 : ui64} : i1
    %dirty_0_0 = seq.firreg %1270 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1472 : ui64} : i1
    %dirty_0_1 = seq.firreg %1274 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1473 : ui64} : i1
    %dirty_0_2 = seq.firreg %1278 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1474 : ui64} : i1
    %dirty_0_3 = seq.firreg %1282 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1475 : ui64} : i1
    %dirty_0_4 = seq.firreg %1286 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1476 : ui64} : i1
    %dirty_0_5 = seq.firreg %1290 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1477 : ui64} : i1
    %dirty_0_6 = seq.firreg %1294 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1478 : ui64} : i1
    %dirty_0_7 = seq.firreg %1298 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1479 : ui64} : i1
    %dirty_0_8 = seq.firreg %1302 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1480 : ui64} : i1
    %dirty_0_9 = seq.firreg %1306 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1481 : ui64} : i1
    %dirty_0_10 = seq.firreg %1310 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1482 : ui64} : i1
    %dirty_0_11 = seq.firreg %1314 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1483 : ui64} : i1
    %dirty_0_12 = seq.firreg %1318 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1484 : ui64} : i1
    %dirty_0_13 = seq.firreg %1322 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1485 : ui64} : i1
    %dirty_0_14 = seq.firreg %1326 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1486 : ui64} : i1
    %dirty_0_15 = seq.firreg %1330 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1487 : ui64} : i1
    %dirty_1_0 = seq.firreg %1334 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1488 : ui64} : i1
    %dirty_1_1 = seq.firreg %1338 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1489 : ui64} : i1
    %dirty_1_2 = seq.firreg %1342 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1490 : ui64} : i1
    %dirty_1_3 = seq.firreg %1346 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1491 : ui64} : i1
    %dirty_1_4 = seq.firreg %1350 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1492 : ui64} : i1
    %dirty_1_5 = seq.firreg %1354 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1493 : ui64} : i1
    %dirty_1_6 = seq.firreg %1358 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1494 : ui64} : i1
    %dirty_1_7 = seq.firreg %1362 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1495 : ui64} : i1
    %dirty_1_8 = seq.firreg %1366 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1496 : ui64} : i1
    %dirty_1_9 = seq.firreg %1370 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1497 : ui64} : i1
    %dirty_1_10 = seq.firreg %1374 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1498 : ui64} : i1
    %dirty_1_11 = seq.firreg %1378 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1499 : ui64} : i1
    %dirty_1_12 = seq.firreg %1382 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1500 : ui64} : i1
    %dirty_1_13 = seq.firreg %1386 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1501 : ui64} : i1
    %dirty_1_14 = seq.firreg %1390 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1502 : ui64} : i1
    %dirty_1_15 = seq.firreg %1394 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1503 : ui64} : i1
    %dirty_2_0 = seq.firreg %1398 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1504 : ui64} : i1
    %dirty_2_1 = seq.firreg %1402 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1505 : ui64} : i1
    %dirty_2_2 = seq.firreg %1406 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1506 : ui64} : i1
    %dirty_2_3 = seq.firreg %1410 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1507 : ui64} : i1
    %dirty_2_4 = seq.firreg %1414 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1508 : ui64} : i1
    %dirty_2_5 = seq.firreg %1418 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1509 : ui64} : i1
    %dirty_2_6 = seq.firreg %1422 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1510 : ui64} : i1
    %dirty_2_7 = seq.firreg %1426 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1511 : ui64} : i1
    %dirty_2_8 = seq.firreg %1430 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1512 : ui64} : i1
    %dirty_2_9 = seq.firreg %1434 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1513 : ui64} : i1
    %dirty_2_10 = seq.firreg %1438 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1514 : ui64} : i1
    %dirty_2_11 = seq.firreg %1442 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1515 : ui64} : i1
    %dirty_2_12 = seq.firreg %1446 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1516 : ui64} : i1
    %dirty_2_13 = seq.firreg %1450 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1517 : ui64} : i1
    %dirty_2_14 = seq.firreg %1454 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1518 : ui64} : i1
    %dirty_2_15 = seq.firreg %1458 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1519 : ui64} : i1
    %dirty_3_0 = seq.firreg %1462 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1520 : ui64} : i1
    %dirty_3_1 = seq.firreg %1466 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1521 : ui64} : i1
    %dirty_3_2 = seq.firreg %1470 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1522 : ui64} : i1
    %dirty_3_3 = seq.firreg %1474 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1523 : ui64} : i1
    %dirty_3_4 = seq.firreg %1478 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1524 : ui64} : i1
    %dirty_3_5 = seq.firreg %1482 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1525 : ui64} : i1
    %dirty_3_6 = seq.firreg %1486 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1526 : ui64} : i1
    %dirty_3_7 = seq.firreg %1490 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1527 : ui64} : i1
    %dirty_3_8 = seq.firreg %1494 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1528 : ui64} : i1
    %dirty_3_9 = seq.firreg %1498 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1529 : ui64} : i1
    %dirty_3_10 = seq.firreg %1502 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1530 : ui64} : i1
    %dirty_3_11 = seq.firreg %1506 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1531 : ui64} : i1
    %dirty_3_12 = seq.firreg %1510 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1532 : ui64} : i1
    %dirty_3_13 = seq.firreg %1514 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1533 : ui64} : i1
    %dirty_3_14 = seq.firreg %1518 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1534 : ui64} : i1
    %dirty_3_15 = seq.firreg %1522 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1535 : ui64} : i1
    %Ram_bw.io_rdata = hw.instance "Ram_bw" @Ram_bw(clock: %clock: !seq.clock, reset: %reset: i1, io_cen: %335: i1, io_wen: %339: i1, io_addr: %327: i6, io_wdata: %348: i128, io_mask: %352: i128) -> (io_rdata: i128) {sv.namehint = "data_0_rdata"}
    %Ram_bw_1.io_rdata = hw.instance "Ram_bw_1" @Ram_bw(clock: %clock: !seq.clock, reset: %reset: i1, io_cen: %336: i1, io_wen: %340: i1, io_addr: %329: i6, io_wdata: %349: i128, io_mask: %353: i128) -> (io_rdata: i128) {sv.namehint = "data_1_rdata"}
    %Ram_bw_2.io_rdata = hw.instance "Ram_bw_2" @Ram_bw(clock: %clock: !seq.clock, reset: %reset: i1, io_cen: %337: i1, io_wen: %341: i1, io_addr: %331: i6, io_wdata: %350: i128, io_mask: %354: i128) -> (io_rdata: i128) {sv.namehint = "data_2_rdata"}
    %Ram_bw_3.io_rdata = hw.instance "Ram_bw_3" @Ram_bw(clock: %clock: !seq.clock, reset: %reset: i1, io_cen: %338: i1, io_wen: %342: i1, io_addr: %333: i6, io_wdata: %351: i128, io_mask: %355: i128) -> (io_rdata: i128) {sv.namehint = "data_3_rdata"}
    %wait_r = seq.firreg %1539 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1536 : ui64} : i1
    %valid_r = seq.firreg %602 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1537 : ui64, sv.namehint = "valid_r"} : i1
    %flush_r = seq.firreg %1546 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1538 : ui64, sv.namehint = "flush_r"} : i1
    %mode_r = seq.firreg %44 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 1539 : ui64} : i5
    %wdata_r = seq.firreg %45 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1544 : ui64} : i64
    %amo_r = seq.firreg %46 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 1608 : ui64} : i5
    %1 = comb.icmp bin ne %io_dcRW_dc_mode, %c0_i5 {sv.namehint = "_hs_in_T"} : i5
    %2 = comb.xor bin %io_flush, %true {sv.namehint = "_valid_in_T_1"} : i1
    %3 = comb.xor bin %wait_r, %true {sv.namehint = "_io_dcRW_ready_T"} : i1
    %4 = comb.and bin %1, %2, %3 {sv.namehint = "io_dcRW_ready"} : i1
    %addr_r = seq.firreg %42 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1613 : ui64} : i32
    %5 = comb.mux bin %4, %io_dcRW_addr, %addr_r {sv.namehint = "cur_addr"} : i32
    %matchWay_r = seq.firreg %2007 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1645 : ui64} : i2
    %offset = seq.firreg %1049 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 1647 : ui64} : i3
    %rdatabuf = seq.firreg %623 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1650 : ui64} : i64
    %6 = comb.extract %5 from 6 {sv.namehint = "blockIdx"} : (i32) -> i4
    %blockIdx_r = seq.firreg %2010 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 1714 : ui64} : i4
    %7 = comb.extract %5 from 10 {sv.namehint = "cur_tag"} : (i32) -> i22
    %8 = hw.array_create %tag_0_15, %tag_0_14, %tag_0_13, %tag_0_12, %tag_0_11, %tag_0_10, %tag_0_9, %tag_0_8, %tag_0_7, %tag_0_6, %tag_0_5, %tag_0_4, %tag_0_3, %tag_0_2, %tag_0_1, %tag_0_0 : i22
    %9 = hw.array_get %8[%6] : !hw.array<16xi22>, i4
    %10 = comb.icmp bin eq %9, %7 {sv.namehint = "_cache_hit_vec_T"} : i22
    %11 = hw.array_create %valid_0_15, %valid_0_14, %valid_0_13, %valid_0_12, %valid_0_11, %valid_0_10, %valid_0_9, %valid_0_8, %valid_0_7, %valid_0_6, %valid_0_5, %valid_0_4, %valid_0_3, %valid_0_2, %valid_0_1, %valid_0_0 : i1
    %12 = hw.array_get %11[%6] : !hw.array<16xi1>, i4
    %13 = comb.and bin %10, %12 {sv.namehint = "cache_hit_vec_0"} : i1
    %14 = hw.array_create %tag_1_15, %tag_1_14, %tag_1_13, %tag_1_12, %tag_1_11, %tag_1_10, %tag_1_9, %tag_1_8, %tag_1_7, %tag_1_6, %tag_1_5, %tag_1_4, %tag_1_3, %tag_1_2, %tag_1_1, %tag_1_0 : i22
    %15 = hw.array_get %14[%6] : !hw.array<16xi22>, i4
    %16 = comb.icmp bin eq %15, %7 {sv.namehint = "_cache_hit_vec_T_2"} : i22
    %17 = hw.array_create %valid_1_15, %valid_1_14, %valid_1_13, %valid_1_12, %valid_1_11, %valid_1_10, %valid_1_9, %valid_1_8, %valid_1_7, %valid_1_6, %valid_1_5, %valid_1_4, %valid_1_3, %valid_1_2, %valid_1_1, %valid_1_0 : i1
    %18 = hw.array_get %17[%6] : !hw.array<16xi1>, i4
    %19 = comb.and bin %16, %18 {sv.namehint = "cache_hit_vec_1"} : i1
    %20 = hw.array_create %tag_2_15, %tag_2_14, %tag_2_13, %tag_2_12, %tag_2_11, %tag_2_10, %tag_2_9, %tag_2_8, %tag_2_7, %tag_2_6, %tag_2_5, %tag_2_4, %tag_2_3, %tag_2_2, %tag_2_1, %tag_2_0 : i22
    %21 = hw.array_get %20[%6] : !hw.array<16xi22>, i4
    %22 = comb.icmp bin eq %21, %7 {sv.namehint = "_cache_hit_vec_T_4"} : i22
    %23 = hw.array_create %valid_2_15, %valid_2_14, %valid_2_13, %valid_2_12, %valid_2_11, %valid_2_10, %valid_2_9, %valid_2_8, %valid_2_7, %valid_2_6, %valid_2_5, %valid_2_4, %valid_2_3, %valid_2_2, %valid_2_1, %valid_2_0 : i1
    %24 = hw.array_get %23[%6] : !hw.array<16xi1>, i4
    %25 = comb.and bin %22, %24 {sv.namehint = "cache_hit_vec_2"} : i1
    %26 = hw.array_create %tag_3_15, %tag_3_14, %tag_3_13, %tag_3_12, %tag_3_11, %tag_3_10, %tag_3_9, %tag_3_8, %tag_3_7, %tag_3_6, %tag_3_5, %tag_3_4, %tag_3_3, %tag_3_2, %tag_3_1, %tag_3_0 : i22
    %27 = hw.array_get %26[%6] : !hw.array<16xi22>, i4
    %28 = comb.icmp bin eq %27, %7 {sv.namehint = "_cache_hit_vec_T_6"} : i22
    %29 = hw.array_create %valid_3_15, %valid_3_14, %valid_3_13, %valid_3_12, %valid_3_11, %valid_3_10, %valid_3_9, %valid_3_8, %valid_3_7, %valid_3_6, %valid_3_5, %valid_3_4, %valid_3_3, %valid_3_2, %valid_3_1, %valid_3_0 : i1
    %30 = hw.array_get %29[%6] : !hw.array<16xi1>, i4
    %31 = comb.and bin %28, %30 {sv.namehint = "cache_hit_vec_3"} : i1
    %32 = comb.concat %31, %25, %19, %13 {sv.namehint = "_cacheHit_T"} : i1, i1, i1, i1
    %33 = comb.icmp bin ne %32, %c0_i4 {sv.namehint = "cacheHit"} : i4
    %34 = comb.concat %31, %25 {sv.namehint = "matchWay_hi_1"} : i1, i1
    %35 = comb.icmp bin ne %34, %c0_i2 {sv.namehint = "matchWay_hi_2"} : i2
    %36 = comb.or %31, %19 {sv.namehint = "_matchWay_T_1"} : i1
    %37 = comb.concat %35, %36 {sv.namehint = "_matchWay_T_2"} : i1, i1
    %matchWay_prng.io_out_0, %matchWay_prng.io_out_1 = hw.instance "matchWay_prng" @MaxPeriodFibonacciLFSR(clock: %clock: !seq.clock, reset: %reset: i1) -> (io_out_0: i1, io_out_1: i1) {sv.namehint = "matchWay_prng.io_out_1"}
    %38 = comb.concat %matchWay_prng.io_out_1, %matchWay_prng.io_out_0 {sv.namehint = "_matchWay_T_3"} : i1, i1
    %39 = comb.mux bin %4, %38, %matchWay_r {sv.namehint = "_matchWay_T_4"} : i2
    %40 = comb.mux bin %33, %37, %39 {sv.namehint = "matchWay"} : i2
    %41 = comb.mux bin %33, %37, %38 : i2
    %42 = comb.mux bin %4, %io_dcRW_addr, %addr_r : i32
    %43 = comb.mux bin %4, %41, %matchWay_r : i2
    %44 = comb.mux bin %4, %io_dcRW_dc_mode, %mode_r : i5
    %45 = comb.mux bin %4, %io_dcRW_wdata, %wdata_r : i64
    %46 = comb.mux bin %4, %io_dcRW_amo, %amo_r : i5
    %47 = comb.extract %io_dcRW_addr from 6 {sv.namehint = "_blockIdx_r_T"} : (i32) -> i4
    %48 = comb.mux bin %4, %47, %blockIdx_r : i4
    %49 = comb.or %io_flush, %flush_r : i1
    %50 = comb.and bin %valid_0_0, %dirty_0_0 : i1
    %51 = comb.xor bin %50, %true : i1
    %52 = comb.and bin %valid_0_1, %dirty_0_1 : i1
    %53 = comb.concat %c0_i3, %52 : i3, i1
    %54 = comb.and bin %valid_0_2, %dirty_0_2 : i1
    %55 = comb.mux bin %54, %c2_i4, %53 : i4
    %56 = comb.and bin %valid_0_3, %dirty_0_3 : i1
    %57 = comb.mux bin %56, %c3_i4, %55 : i4
    %58 = comb.and bin %valid_0_4, %dirty_0_4 : i1
    %59 = comb.mux bin %58, %c4_i4, %57 : i4
    %60 = comb.and bin %valid_0_5, %dirty_0_5 : i1
    %61 = comb.mux bin %60, %c5_i4, %59 : i4
    %62 = comb.and bin %valid_0_6, %dirty_0_6 : i1
    %63 = comb.mux bin %62, %c6_i4, %61 : i4
    %64 = comb.and bin %valid_0_7, %dirty_0_7 : i1
    %65 = comb.mux bin %64, %c7_i4, %63 : i4
    %66 = comb.and bin %valid_0_8, %dirty_0_8 : i1
    %67 = comb.mux bin %66, %c-8_i4, %65 : i4
    %68 = comb.and bin %valid_0_9, %dirty_0_9 : i1
    %69 = comb.mux bin %68, %c-7_i4, %67 : i4
    %70 = comb.and bin %valid_0_10, %dirty_0_10 : i1
    %71 = comb.mux bin %70, %c-6_i4, %69 : i4
    %72 = comb.and bin %valid_0_11, %dirty_0_11 : i1
    %73 = comb.mux bin %72, %c-5_i4, %71 : i4
    %74 = comb.and bin %valid_0_12, %dirty_0_12 : i1
    %75 = comb.mux bin %74, %c-4_i4, %73 : i4
    %76 = comb.and bin %valid_0_13, %dirty_0_13 : i1
    %77 = comb.mux bin %76, %c-3_i4, %75 : i4
    %78 = comb.and bin %valid_0_14, %dirty_0_14 : i1
    %79 = comb.mux bin %78, %c-2_i4, %77 : i4
    %80 = comb.and bin %valid_0_15, %dirty_0_15 : i1
    %81 = comb.mux bin %80, %c-1_i4, %79 : i4
    %82 = comb.and bin %valid_1_0, %dirty_1_0 : i1
    %83 = comb.mux bin %82, %c0_i4, %81 : i4
    %84 = comb.and bin %valid_1_1, %dirty_1_1 : i1
    %85 = comb.mux bin %84, %c1_i4, %83 : i4
    %86 = comb.and bin %valid_1_2, %dirty_1_2 : i1
    %87 = comb.mux bin %86, %c2_i4, %85 : i4
    %88 = comb.and bin %valid_1_3, %dirty_1_3 : i1
    %89 = comb.mux bin %88, %c3_i4, %87 : i4
    %90 = comb.and bin %valid_1_4, %dirty_1_4 : i1
    %91 = comb.mux bin %90, %c4_i4, %89 : i4
    %92 = comb.and bin %valid_1_5, %dirty_1_5 : i1
    %93 = comb.mux bin %92, %c5_i4, %91 : i4
    %94 = comb.and bin %valid_1_6, %dirty_1_6 : i1
    %95 = comb.mux bin %94, %c6_i4, %93 : i4
    %96 = comb.and bin %valid_1_7, %dirty_1_7 : i1
    %97 = comb.mux bin %96, %c7_i4, %95 : i4
    %98 = comb.and bin %valid_1_8, %dirty_1_8 : i1
    %99 = comb.mux bin %98, %c-8_i4, %97 : i4
    %100 = comb.and bin %valid_1_9, %dirty_1_9 : i1
    %101 = comb.mux bin %100, %c-7_i4, %99 : i4
    %102 = comb.and bin %valid_1_10, %dirty_1_10 : i1
    %103 = comb.mux bin %102, %c-6_i4, %101 : i4
    %104 = comb.and bin %valid_1_11, %dirty_1_11 : i1
    %105 = comb.mux bin %104, %c-5_i4, %103 : i4
    %106 = comb.and bin %valid_1_12, %dirty_1_12 : i1
    %107 = comb.mux bin %106, %c-4_i4, %105 : i4
    %108 = comb.and bin %valid_1_13, %dirty_1_13 : i1
    %109 = comb.mux bin %108, %c-3_i4, %107 : i4
    %110 = comb.and bin %valid_1_14, %dirty_1_14 : i1
    %111 = comb.mux bin %110, %c-2_i4, %109 : i4
    %112 = comb.and bin %valid_1_15, %dirty_1_15 : i1
    %113 = comb.or bin %112, %110, %108, %106, %104, %102, %100, %98, %96, %94, %92, %90, %88, %86, %84, %82 : i1
    %114 = comb.concat %false, %113 : i1, i1
    %115 = comb.mux bin %112, %c-1_i4, %111 : i4
    %116 = comb.and bin %valid_2_0, %dirty_2_0 : i1
    %117 = comb.mux bin %116, %c0_i4, %115 : i4
    %118 = comb.and bin %valid_2_1, %dirty_2_1 : i1
    %119 = comb.mux bin %118, %c1_i4, %117 : i4
    %120 = comb.and bin %valid_2_2, %dirty_2_2 : i1
    %121 = comb.mux bin %120, %c2_i4, %119 : i4
    %122 = comb.and bin %valid_2_3, %dirty_2_3 : i1
    %123 = comb.mux bin %122, %c3_i4, %121 : i4
    %124 = comb.and bin %valid_2_4, %dirty_2_4 : i1
    %125 = comb.mux bin %124, %c4_i4, %123 : i4
    %126 = comb.and bin %valid_2_5, %dirty_2_5 : i1
    %127 = comb.mux bin %126, %c5_i4, %125 : i4
    %128 = comb.and bin %valid_2_6, %dirty_2_6 : i1
    %129 = comb.mux bin %128, %c6_i4, %127 : i4
    %130 = comb.and bin %valid_2_7, %dirty_2_7 : i1
    %131 = comb.mux bin %130, %c7_i4, %129 : i4
    %132 = comb.and bin %valid_2_8, %dirty_2_8 : i1
    %133 = comb.mux bin %132, %c-8_i4, %131 : i4
    %134 = comb.and bin %valid_2_9, %dirty_2_9 : i1
    %135 = comb.mux bin %134, %c-7_i4, %133 : i4
    %136 = comb.and bin %valid_2_10, %dirty_2_10 : i1
    %137 = comb.mux bin %136, %c-6_i4, %135 : i4
    %138 = comb.and bin %valid_2_11, %dirty_2_11 : i1
    %139 = comb.mux bin %138, %c-5_i4, %137 : i4
    %140 = comb.and bin %valid_2_12, %dirty_2_12 : i1
    %141 = comb.mux bin %140, %c-4_i4, %139 : i4
    %142 = comb.and bin %valid_2_13, %dirty_2_13 : i1
    %143 = comb.mux bin %142, %c-3_i4, %141 : i4
    %144 = comb.and bin %valid_2_14, %dirty_2_14 : i1
    %145 = comb.mux bin %144, %c-2_i4, %143 : i4
    %146 = comb.and bin %valid_2_15, %dirty_2_15 : i1
    %147 = comb.or bin %146, %144, %142, %140, %138, %136, %134, %132, %130, %128, %126, %124, %122, %120, %118, %116 : i1
    %148 = comb.mux bin %147, %c-2_i2, %114 : i2
    %149 = comb.mux bin %146, %c-1_i4, %145 : i4
    %150 = comb.and bin %valid_3_0, %dirty_3_0 : i1
    %151 = comb.mux bin %150, %c0_i4, %149 : i4
    %152 = comb.and bin %valid_3_1, %dirty_3_1 : i1
    %153 = comb.mux bin %152, %c1_i4, %151 : i4
    %154 = comb.and bin %valid_3_2, %dirty_3_2 : i1
    %155 = comb.mux bin %154, %c2_i4, %153 : i4
    %156 = comb.and bin %valid_3_3, %dirty_3_3 : i1
    %157 = comb.mux bin %156, %c3_i4, %155 : i4
    %158 = comb.and bin %valid_3_4, %dirty_3_4 : i1
    %159 = comb.mux bin %158, %c4_i4, %157 : i4
    %160 = comb.and bin %valid_3_5, %dirty_3_5 : i1
    %161 = comb.mux bin %160, %c5_i4, %159 : i4
    %162 = comb.and bin %valid_3_6, %dirty_3_6 : i1
    %163 = comb.mux bin %162, %c6_i4, %161 : i4
    %164 = comb.and bin %valid_3_7, %dirty_3_7 : i1
    %165 = comb.mux bin %164, %c7_i4, %163 : i4
    %166 = comb.and bin %valid_3_8, %dirty_3_8 : i1
    %167 = comb.mux bin %166, %c-8_i4, %165 : i4
    %168 = comb.and bin %valid_3_9, %dirty_3_9 : i1
    %169 = comb.mux bin %168, %c-7_i4, %167 : i4
    %170 = comb.and bin %valid_3_10, %dirty_3_10 : i1
    %171 = comb.mux bin %170, %c-6_i4, %169 : i4
    %172 = comb.and bin %valid_3_11, %dirty_3_11 : i1
    %173 = comb.mux bin %172, %c-5_i4, %171 : i4
    %174 = comb.and bin %valid_3_12, %dirty_3_12 : i1
    %175 = comb.mux bin %174, %c-4_i4, %173 : i4
    %176 = comb.and bin %valid_3_13, %dirty_3_13 : i1
    %177 = comb.mux bin %176, %c-3_i4, %175 : i4
    %178 = comb.and bin %valid_3_14, %dirty_3_14 : i1
    %179 = comb.mux bin %178, %c-2_i4, %177 : i4
    %180 = comb.and bin %valid_3_15, %dirty_3_15 : i1
    %181 = comb.or bin %180, %178, %176, %174, %172, %170, %168, %166, %164, %162, %160, %158, %156, %154, %152, %150 : i1
    %182 = comb.mux bin %181, %c-1_i2, %148 {sv.namehint = "flush_way"} : i2
    %183 = comb.mux bin %180, %c-1_i4, %179 {sv.namehint = "flush_idx"} : i4
    %184 = comb.or bin %180, %178, %176, %174, %172, %170, %168, %166, %164, %162, %160, %158, %156, %154, %152, %150, %146, %144, %142, %140, %138, %136, %134, %132, %130, %128, %126, %124, %122, %120, %118, %116, %112, %110, %108, %106, %104, %102, %100, %98, %96, %94, %92, %90, %88, %86, %84, %82, %80, %78, %76, %74, %72, %70, %68, %66, %64, %62, %60, %58, %56, %54, %52 : i1
    %185 = comb.xor %184, %true : i1
    %186 = comb.and %185, %51 {sv.namehint = "flush_done"} : i1
    %187 = comb.mux bin %4, %41, %matchWay_r {sv.namehint = "cur_way"} : i2
    %188 = comb.extract %5 from 4 {sv.namehint = "cur_ram_addr"} : (i32) -> i6
    %189 = comb.extract %offset from 1 {sv.namehint = "cur_axi_addr_lo"} : (i3) -> i2
    %190 = comb.mux bin %flush_r, %183, %6 : i4
    %191 = comb.concat %190, %189 {sv.namehint = "cur_axi_addr"} : i4, i2
    %192 = comb.extract %io_dcRW_dc_mode from 0 : (i5) -> i4
    %193 = comb.extract %mode_r from 0 : (i5) -> i4
    %194 = comb.mux %4, %192, %193 {sv.namehint = "cur_mode"} : i4
    %195 = comb.mux bin %4, %io_dcRW_wdata, %wdata_r {sv.namehint = "cur_wdata"} : i64
    %196 = comb.extract %addr_r from 6 {sv.namehint = "pre_blockIdx"} : (i32) -> i4
    %197 = comb.extract %addr_r from 10 {sv.namehint = "pre_tag"} : (i32) -> i22
    %state = seq.firreg %1997 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 1718 : ui64} : i3
    %198 = comb.extract %addr_r from 0 {sv.namehint = "rdata64_hi"} : (i32) -> i4
    %199 = hw.array_create %Ram_bw_3.io_rdata, %Ram_bw_2.io_rdata, %Ram_bw_1.io_rdata, %Ram_bw.io_rdata : i128
    %200 = hw.array_get %199[%matchWay_r] : !hw.array<4xi128>, i2
    %201 = comb.concat %c0_i121, %198, %c0_i3 : i121, i4, i3
    %202 = comb.shru bin %200, %201 {sv.namehint = "rdata64"} : i128
    %203 = comb.extract %202 from 7 {sv.namehint = "_amo_rdata_ans_T_8"} : (i128) -> i1
    %204 = comb.replicate %203 {sv.namehint = "io_dcRW_rdata_hi"} : (i1) -> i56
    %205 = comb.extract %202 from 0 {sv.namehint = "io_dcRW_rdata_lo"} : (i128) -> i8
    %206 = comb.concat %204, %205 {sv.namehint = "_io_dcRW_rdata_T_2"} : i56, i8
    %207 = comb.extract %202 from 15 {sv.namehint = "_amo_rdata_ans_T_5"} : (i128) -> i1
    %208 = comb.replicate %207 {sv.namehint = "io_dcRW_rdata_hi_1"} : (i1) -> i48
    %209 = comb.extract %202 from 0 {sv.namehint = "io_dcRW_rdata_lo_1"} : (i128) -> i16
    %210 = comb.concat %208, %209 {sv.namehint = "_io_dcRW_rdata_T_6"} : i48, i16
    %211 = comb.extract %202 from 31 {sv.namehint = "_amo_rdata_ans_T_2"} : (i128) -> i1
    %212 = comb.replicate %211 {sv.namehint = "io_dcRW_rdata_hi_2"} : (i1) -> i32
    %213 = comb.extract %202 from 0 {sv.namehint = "amo_rdata_ans_lo"} : (i128) -> i32
    %214 = comb.concat %212, %213 {sv.namehint = "_io_dcRW_rdata_T_10"} : i32, i32
    %215 = comb.replicate %211 {sv.namehint = "io_dcRW_rdata_hi_3"} : (i1) -> i32
    %216 = comb.icmp bin eq %mode_r, %c4_i5 {sv.namehint = "_io_dcRW_rdata_T_15"} : i5
    %217 = comb.mux bin %216, %206, %c0_i64 {sv.namehint = "_io_dcRW_rdata_T_16"} : i64
    %218 = comb.icmp bin eq %mode_r, %c-12_i5 {sv.namehint = "_io_dcRW_rdata_T_17"} : i5
    %219 = comb.concat %c0_i56, %205 : i56, i8
    %220 = comb.mux bin %218, %219, %217 {sv.namehint = "_io_dcRW_rdata_T_18"} : i64
    %221 = comb.icmp bin eq %mode_r, %c5_i5 {sv.namehint = "_io_dcRW_rdata_T_19"} : i5
    %222 = comb.mux bin %221, %210, %220 {sv.namehint = "_io_dcRW_rdata_T_20"} : i64
    %223 = comb.icmp bin eq %mode_r, %c-11_i5 {sv.namehint = "_io_dcRW_rdata_T_21"} : i5
    %224 = comb.concat %c0_i48, %209 : i48, i16
    %225 = comb.mux bin %223, %224, %222 {sv.namehint = "_io_dcRW_rdata_T_22"} : i64
    %226 = comb.icmp bin eq %mode_r, %c6_i5 {sv.namehint = "_io_dcRW_rdata_T_23"} : i5
    %227 = comb.mux bin %226, %214, %225 {sv.namehint = "_io_dcRW_rdata_T_24"} : i64
    %228 = comb.icmp bin eq %mode_r, %c-10_i5 {sv.namehint = "_io_dcRW_rdata_T_25"} : i5
    %229 = comb.concat %c0_i32, %213 : i32, i32
    %230 = comb.mux bin %228, %229, %227 {sv.namehint = "_io_dcRW_rdata_T_26"} : i64
    %231 = comb.icmp bin eq %mode_r, %c7_i5 {sv.namehint = "_io_dcRW_rdata_T_27"} : i5
    %232 = comb.extract %202 from 0 : (i128) -> i64
    %233 = comb.mux %231, %232, %230 {sv.namehint = "_io_dcRW_rdata_T_28"} : i64
    %234 = comb.icmp bin eq %mode_r, %c14_i5 {sv.namehint = "_io_dcRW_rdata_T_29"} : i5
    %235 = comb.concat %215, %213 : i32, i32
    %236 = comb.mux %234, %235, %233 {sv.namehint = "_io_dcRW_rdata_T_30"} : i64
    %237 = comb.icmp bin eq %mode_r, %c15_i5 {sv.namehint = "_io_dcRW_rdata_T_31"} : i5
    %238 = comb.extract %202 from 0 : (i128) -> i64
    %239 = comb.mux %237, %238, %236 {sv.namehint = "_io_dcRW_rdata_T_32"} : i64
    %240 = comb.extract %194 from 2 {sv.namehint = "cur_mode_sl"} : (i4) -> i2
    %241 = comb.extract %194 from 3 {sv.namehint = "cur_mode_s"} : (i4) -> i1
    %242 = comb.extract %mode_r from 0 {sv.namehint = "_amo_wdata_T"} : (i5) -> i2
    %243 = comb.extract %202 from 0 {sv.namehint = "_amo_rdata_ans_T"} : (i128) -> i64
    %244 = comb.replicate %211 {sv.namehint = "amo_rdata_ans_hi"} : (i1) -> i32
    %245 = comb.concat %244, %213 {sv.namehint = "_amo_rdata_ans_T_3"} : i32, i32
    %246 = comb.replicate %207 {sv.namehint = "amo_rdata_ans_hi_1"} : (i1) -> i48
    %247 = comb.concat %246, %209 {sv.namehint = "_amo_rdata_ans_T_6"} : i48, i16
    %248 = comb.replicate %203 {sv.namehint = "amo_rdata_ans_hi_2"} : (i1) -> i56
    %249 = comb.concat %248, %205 {sv.namehint = "_amo_rdata_ans_T_9"} : i56, i8
    %250 = comb.icmp bin eq %242, %c-2_i2 {sv.namehint = "_amo_rdata_ans_T_10"} : i2
    %251 = comb.mux bin %250, %245, %243 {sv.namehint = "_amo_rdata_ans_T_11"} : i64
    %252 = comb.icmp bin eq %242, %c1_i2 {sv.namehint = "_amo_rdata_ans_T_12"} : i2
    %253 = comb.mux bin %252, %247, %251 {sv.namehint = "_amo_rdata_ans_T_13"} : i64
    %254 = comb.icmp bin ne %242, %c0_i2 : i2
    %255 = comb.mux bin %254, %253, %249 {sv.namehint = "amo_rdata"} : i64
    %256 = comb.extract %wdata_r from 31 {sv.namehint = "_amo_imm_ans_T_2"} : (i64) -> i1
    %257 = comb.replicate %256 {sv.namehint = "amo_imm_ans_hi"} : (i1) -> i32
    %258 = comb.extract %wdata_r from 0 {sv.namehint = "amo_imm_ans_lo"} : (i64) -> i32
    %259 = comb.concat %257, %258 {sv.namehint = "_amo_imm_ans_T_3"} : i32, i32
    %260 = comb.extract %wdata_r from 15 {sv.namehint = "_amo_imm_ans_T_5"} : (i64) -> i1
    %261 = comb.replicate %260 {sv.namehint = "amo_imm_ans_hi_1"} : (i1) -> i48
    %262 = comb.extract %wdata_r from 0 {sv.namehint = "amo_imm_ans_lo_1"} : (i64) -> i16
    %263 = comb.concat %261, %262 {sv.namehint = "_amo_imm_ans_T_6"} : i48, i16
    %264 = comb.extract %wdata_r from 7 {sv.namehint = "_amo_imm_ans_T_8"} : (i64) -> i1
    %265 = comb.replicate %264 {sv.namehint = "amo_imm_ans_hi_2"} : (i1) -> i56
    %266 = comb.extract %wdata_r from 0 {sv.namehint = "amo_imm_ans_lo_2"} : (i64) -> i8
    %267 = comb.concat %265, %266 {sv.namehint = "_amo_imm_ans_T_9"} : i56, i8
    %268 = comb.icmp bin eq %242, %c-2_i2 {sv.namehint = "_amo_imm_ans_T_10"} : i2
    %269 = comb.mux bin %268, %259, %wdata_r {sv.namehint = "_amo_imm_ans_T_11"} : i64
    %270 = comb.icmp bin eq %242, %c1_i2 {sv.namehint = "_amo_imm_ans_T_12"} : i2
    %271 = comb.mux bin %270, %263, %269 {sv.namehint = "_amo_imm_ans_T_13"} : i64
    %272 = comb.mux bin %254, %271, %267 {sv.namehint = "amo_imm"} : i64
    %273 = comb.add %272, %255 {sv.namehint = "_amo_alu_T"} : i64
    %274 = comb.xor bin %272, %255 {sv.namehint = "_amo_alu_T_2"} : i64
    %275 = comb.and bin %272, %255 {sv.namehint = "_amo_alu_T_3"} : i64
    %276 = comb.or bin %272, %255 {sv.namehint = "_amo_alu_T_4"} : i64
    %277 = comb.icmp bin sgt %272, %255 {sv.namehint = "_amo_alu_T_7"} : i64
    %278 = comb.mux bin %277, %255, %272 {sv.namehint = "_amo_alu_T_8"} : i64
    %279 = comb.icmp bin sgt %272, %255 {sv.namehint = "_amo_alu_T_11"} : i64
    %280 = comb.mux bin %279, %272, %255 {sv.namehint = "_amo_alu_T_12"} : i64
    %281 = comb.icmp bin ugt %272, %255 {sv.namehint = "_amo_alu_T_15"} : i64
    %282 = comb.mux bin %281, %272, %255 {sv.namehint = "_amo_alu_T_16"} : i64
    %283 = comb.icmp bin eq %amo_r, %c1_i5 {sv.namehint = "_amo_alu_T_17"} : i5
    %284 = comb.mux bin %283, %272, %c0_i64 {sv.namehint = "_amo_alu_T_18"} : i64
    %285 = comb.icmp bin eq %amo_r, %c0_i5 {sv.namehint = "_amo_alu_T_19"} : i5
    %286 = comb.mux bin %285, %273, %284 {sv.namehint = "_amo_alu_T_20"} : i64
    %287 = comb.icmp bin eq %amo_r, %c4_i5 {sv.namehint = "_amo_alu_T_21"} : i5
    %288 = comb.mux bin %287, %274, %286 {sv.namehint = "_amo_alu_T_22"} : i64
    %289 = comb.icmp bin eq %amo_r, %c12_i5 {sv.namehint = "_amo_alu_T_23"} : i5
    %290 = comb.mux bin %289, %275, %288 {sv.namehint = "_amo_alu_T_24"} : i64
    %291 = comb.icmp bin eq %amo_r, %c8_i5 {sv.namehint = "_amo_alu_T_25"} : i5
    %292 = comb.mux bin %291, %276, %290 {sv.namehint = "_amo_alu_T_26"} : i64
    %293 = comb.icmp bin eq %amo_r, %c-16_i5 {sv.namehint = "_amo_alu_T_27"} : i5
    %294 = comb.mux bin %293, %278, %292 {sv.namehint = "_amo_alu_T_28"} : i64
    %295 = comb.icmp bin eq %amo_r, %c-12_i5 {sv.namehint = "_amo_alu_T_29"} : i5
    %296 = comb.mux bin %295, %280, %294 {sv.namehint = "_amo_alu_T_30"} : i64
    %297 = comb.icmp bin eq %amo_r, %c-4_i5 {sv.namehint = "_amo_alu_T_33"} : i5
    %298 = comb.mux bin %297, %282, %296 {sv.namehint = "amo_alu"} : i64
    %299 = comb.extract %298 from 0 {sv.namehint = "amo_wdata_ans_lo"} : (i64) -> i32
    %300 = comb.concat %c0_i32, %299 {sv.namehint = "_amo_wdata_ans_T_1"} : i32, i32
    %301 = comb.extract %298 from 0 {sv.namehint = "amo_wdata_ans_lo_1"} : (i64) -> i16
    %302 = comb.concat %c0_i48, %301 {sv.namehint = "_amo_wdata_ans_T_2"} : i48, i16
    %303 = comb.extract %298 from 0 {sv.namehint = "amo_wdata_ans_lo_2"} : (i64) -> i8
    %304 = comb.concat %c0_i56, %303 {sv.namehint = "_amo_wdata_ans_T_3"} : i56, i8
    %305 = comb.icmp bin eq %242, %c-2_i2 {sv.namehint = "_amo_wdata_ans_T_4"} : i2
    %306 = comb.mux bin %305, %300, %298 {sv.namehint = "_amo_wdata_ans_T_5"} : i64
    %307 = comb.icmp bin eq %242, %c1_i2 {sv.namehint = "_amo_wdata_ans_T_6"} : i2
    %308 = comb.mux bin %307, %302, %306 {sv.namehint = "_amo_wdata_ans_T_7"} : i64
    %309 = comb.mux bin %254, %308, %304 {sv.namehint = "amo_wdata_ans"} : i64
    %310 = comb.extract %5 from 0 {sv.namehint = "inp_mask_hi"} : (i32) -> i4
    %311 = comb.concat %c0_i127, %309 : i127, i64
    %312 = comb.concat %c0_i184, %310, %c0_i3 : i184, i4, i3
    %313 = comb.shl bin %311, %312 {sv.namehint = "amo_wdata"} : i191
    %314 = comb.concat %c0_i127, %195 : i127, i64
    %315 = comb.concat %c0_i184, %310, %c0_i3 : i184, i4, i3
    %316 = comb.shl bin %314, %315 {sv.namehint = "inp_wdata"} : i191
    %317 = comb.extract %194 from 0 {sv.namehint = "_inp_mask_T"} : (i4) -> i2
    %318 = hw.array_get %0[%317] {sv.namehint = "_inp_mask_T_6"} : !hw.array<4xi128>, i2
    %319 = comb.concat %c0_i127, %318 : i127, i128
    %320 = comb.concat %c0_i248, %310, %c0_i3 : i248, i4, i3
    %321 = comb.shl bin %319, %320 {sv.namehint = "inp_mask"} : i255
    %322 = comb.icmp bin eq %state, %c0_i3 {sv.namehint = "_data_wdata_T_1"} : i3
    %323 = comb.icmp bin eq %state, %c-3_i3 {sv.namehint = "_data_wdata_T"} : i3
    %324 = comb.or bin %322, %323 {sv.namehint = "_data_addr_T_2"} : i1
    %325 = comb.mux bin %324, %188, %191 {sv.namehint = "_data_addr_T_3"} : i6
    %326 = comb.icmp bin eq %187, %c0_i2 : i2
    %327 = comb.mux bin %326, %325, %c0_i6 {sv.namehint = "data_0_addr"} : i6
    %328 = comb.icmp bin eq %187, %c1_i2 : i2
    %329 = comb.mux bin %328, %325, %c0_i6 {sv.namehint = "data_1_addr"} : i6
    %330 = comb.icmp bin eq %187, %c-2_i2 : i2
    %331 = comb.mux bin %330, %325, %c0_i6 {sv.namehint = "data_2_addr"} : i6
    %332 = comb.icmp bin eq %187, %c-1_i2 : i2
    %333 = comb.mux bin %332, %325, %c0_i6 {sv.namehint = "data_3_addr"} : i6
    %334 = comb.or bin %wait_r, %4, %flush_r {sv.namehint = "_data_cen_T_1"} : i1
    %335 = comb.and %326, %334 {sv.namehint = "data_0_cen"} : i1
    %336 = comb.and %328, %334 {sv.namehint = "data_1_cen"} : i1
    %337 = comb.and %330, %334 {sv.namehint = "data_2_cen"} : i1
    %338 = comb.and %332, %334 {sv.namehint = "data_3_cen"} : i1
    %339 = comb.and %326, %1529 {sv.namehint = "data_0_wen"} : i1
    %340 = comb.and %328, %1529 {sv.namehint = "data_1_wen"} : i1
    %341 = comb.and %330, %1529 {sv.namehint = "data_2_wen"} : i1
    %342 = comb.and %332, %1529 {sv.namehint = "data_3_wen"} : i1
    %343 = comb.extract %316 from 0 : (i191) -> i128
    %344 = comb.concat %io_dataAxi_rd_bits_data, %rdatabuf : i64, i64
    %345 = comb.mux %322, %343, %344 {sv.namehint = "_data_wdata_T_3"} : i128
    %346 = comb.extract %313 from 0 : (i191) -> i128
    %347 = comb.mux %323, %346, %345 {sv.namehint = "_data_wdata_T_4"} : i128
    %348 = comb.mux bin %326, %347, %c0_i128 {sv.namehint = "data_0_wdata"} : i128
    %349 = comb.mux bin %328, %347, %c0_i128 {sv.namehint = "data_1_wdata"} : i128
    %350 = comb.mux bin %330, %347, %c0_i128 {sv.namehint = "data_2_wdata"} : i128
    %351 = comb.mux bin %332, %347, %c0_i128 {sv.namehint = "data_3_wdata"} : i128
    %352 = comb.mux bin %326, %1535, %c0_i128 {sv.namehint = "data_0_mask"} : i128
    %353 = comb.mux bin %328, %1535, %c0_i128 {sv.namehint = "data_1_mask"} : i128
    %354 = comb.mux bin %330, %1535, %c0_i128 {sv.namehint = "data_2_mask"} : i128
    %355 = comb.mux bin %332, %1535, %c0_i128 {sv.namehint = "data_3_mask"} : i128
    %356 = comb.or bin %322, %323 : i1
    %357 = comb.and bin %1529, %356 : i1
    %358 = comb.icmp bin eq %6, %c0_i4 : i4
    %359 = comb.and bin %357, %326, %358 : i1
    %360 = comb.or %359, %dirty_0_0 : i1
    %361 = comb.icmp bin eq %6, %c1_i4 : i4
    %362 = comb.and bin %357, %326, %361 : i1
    %363 = comb.or %362, %dirty_0_1 : i1
    %364 = comb.icmp bin eq %6, %c2_i4 : i4
    %365 = comb.and bin %357, %326, %364 : i1
    %366 = comb.or %365, %dirty_0_2 : i1
    %367 = comb.icmp bin eq %6, %c3_i4 : i4
    %368 = comb.and bin %357, %326, %367 : i1
    %369 = comb.or %368, %dirty_0_3 : i1
    %370 = comb.icmp bin eq %6, %c4_i4 : i4
    %371 = comb.and bin %357, %326, %370 : i1
    %372 = comb.or %371, %dirty_0_4 : i1
    %373 = comb.icmp bin eq %6, %c5_i4 : i4
    %374 = comb.and bin %357, %326, %373 : i1
    %375 = comb.or %374, %dirty_0_5 : i1
    %376 = comb.icmp bin eq %6, %c6_i4 : i4
    %377 = comb.and bin %357, %326, %376 : i1
    %378 = comb.or %377, %dirty_0_6 : i1
    %379 = comb.icmp bin eq %6, %c7_i4 : i4
    %380 = comb.and bin %357, %326, %379 : i1
    %381 = comb.or %380, %dirty_0_7 : i1
    %382 = comb.icmp bin eq %6, %c-8_i4 : i4
    %383 = comb.and bin %357, %326, %382 : i1
    %384 = comb.or %383, %dirty_0_8 : i1
    %385 = comb.icmp bin eq %6, %c-7_i4 : i4
    %386 = comb.and bin %357, %326, %385 : i1
    %387 = comb.or %386, %dirty_0_9 : i1
    %388 = comb.icmp bin eq %6, %c-6_i4 : i4
    %389 = comb.and bin %357, %326, %388 : i1
    %390 = comb.or %389, %dirty_0_10 : i1
    %391 = comb.icmp bin eq %6, %c-5_i4 : i4
    %392 = comb.and bin %357, %326, %391 : i1
    %393 = comb.or %392, %dirty_0_11 : i1
    %394 = comb.icmp bin eq %6, %c-4_i4 : i4
    %395 = comb.and bin %357, %326, %394 : i1
    %396 = comb.or %395, %dirty_0_12 : i1
    %397 = comb.icmp bin eq %6, %c-3_i4 : i4
    %398 = comb.and bin %357, %326, %397 : i1
    %399 = comb.or %398, %dirty_0_13 : i1
    %400 = comb.icmp bin eq %6, %c-2_i4 : i4
    %401 = comb.and bin %357, %326, %400 : i1
    %402 = comb.or %401, %dirty_0_14 : i1
    %403 = comb.icmp bin eq %6, %c-1_i4 : i4
    %404 = comb.and bin %357, %326, %403 : i1
    %405 = comb.or %404, %dirty_0_15 : i1
    %406 = comb.and bin %357, %328, %358 : i1
    %407 = comb.or %406, %dirty_1_0 : i1
    %408 = comb.and bin %357, %328, %361 : i1
    %409 = comb.or %408, %dirty_1_1 : i1
    %410 = comb.and bin %357, %328, %364 : i1
    %411 = comb.or %410, %dirty_1_2 : i1
    %412 = comb.and bin %357, %328, %367 : i1
    %413 = comb.or %412, %dirty_1_3 : i1
    %414 = comb.and bin %357, %328, %370 : i1
    %415 = comb.or %414, %dirty_1_4 : i1
    %416 = comb.and bin %357, %328, %373 : i1
    %417 = comb.or %416, %dirty_1_5 : i1
    %418 = comb.and bin %357, %328, %376 : i1
    %419 = comb.or %418, %dirty_1_6 : i1
    %420 = comb.and bin %357, %328, %379 : i1
    %421 = comb.or %420, %dirty_1_7 : i1
    %422 = comb.and bin %357, %328, %382 : i1
    %423 = comb.or %422, %dirty_1_8 : i1
    %424 = comb.and bin %357, %328, %385 : i1
    %425 = comb.or %424, %dirty_1_9 : i1
    %426 = comb.and bin %357, %328, %388 : i1
    %427 = comb.or %426, %dirty_1_10 : i1
    %428 = comb.and bin %357, %328, %391 : i1
    %429 = comb.or %428, %dirty_1_11 : i1
    %430 = comb.and bin %357, %328, %394 : i1
    %431 = comb.or %430, %dirty_1_12 : i1
    %432 = comb.and bin %357, %328, %397 : i1
    %433 = comb.or %432, %dirty_1_13 : i1
    %434 = comb.and bin %357, %328, %400 : i1
    %435 = comb.or %434, %dirty_1_14 : i1
    %436 = comb.and bin %357, %328, %403 : i1
    %437 = comb.or %436, %dirty_1_15 : i1
    %438 = comb.and bin %357, %330, %358 : i1
    %439 = comb.or %438, %dirty_2_0 : i1
    %440 = comb.and bin %357, %330, %361 : i1
    %441 = comb.or %440, %dirty_2_1 : i1
    %442 = comb.and bin %357, %330, %364 : i1
    %443 = comb.or %442, %dirty_2_2 : i1
    %444 = comb.and bin %357, %330, %367 : i1
    %445 = comb.or %444, %dirty_2_3 : i1
    %446 = comb.and bin %357, %330, %370 : i1
    %447 = comb.or %446, %dirty_2_4 : i1
    %448 = comb.and bin %357, %330, %373 : i1
    %449 = comb.or %448, %dirty_2_5 : i1
    %450 = comb.and bin %357, %330, %376 : i1
    %451 = comb.or %450, %dirty_2_6 : i1
    %452 = comb.and bin %357, %330, %379 : i1
    %453 = comb.or %452, %dirty_2_7 : i1
    %454 = comb.and bin %357, %330, %382 : i1
    %455 = comb.or %454, %dirty_2_8 : i1
    %456 = comb.and bin %357, %330, %385 : i1
    %457 = comb.or %456, %dirty_2_9 : i1
    %458 = comb.and bin %357, %330, %388 : i1
    %459 = comb.or %458, %dirty_2_10 : i1
    %460 = comb.and bin %357, %330, %391 : i1
    %461 = comb.or %460, %dirty_2_11 : i1
    %462 = comb.and bin %357, %330, %394 : i1
    %463 = comb.or %462, %dirty_2_12 : i1
    %464 = comb.and bin %357, %330, %397 : i1
    %465 = comb.or %464, %dirty_2_13 : i1
    %466 = comb.and bin %357, %330, %400 : i1
    %467 = comb.or %466, %dirty_2_14 : i1
    %468 = comb.and bin %357, %330, %403 : i1
    %469 = comb.or %468, %dirty_2_15 : i1
    %470 = comb.and bin %357, %332, %358 : i1
    %471 = comb.or %470, %dirty_3_0 : i1
    %472 = comb.and bin %357, %332, %361 : i1
    %473 = comb.or %472, %dirty_3_1 : i1
    %474 = comb.and bin %357, %332, %364 : i1
    %475 = comb.or %474, %dirty_3_2 : i1
    %476 = comb.and bin %357, %332, %367 : i1
    %477 = comb.or %476, %dirty_3_3 : i1
    %478 = comb.and bin %357, %332, %370 : i1
    %479 = comb.or %478, %dirty_3_4 : i1
    %480 = comb.and bin %357, %332, %373 : i1
    %481 = comb.or %480, %dirty_3_5 : i1
    %482 = comb.and bin %357, %332, %376 : i1
    %483 = comb.or %482, %dirty_3_6 : i1
    %484 = comb.and bin %357, %332, %379 : i1
    %485 = comb.or %484, %dirty_3_7 : i1
    %486 = comb.and bin %357, %332, %382 : i1
    %487 = comb.or %486, %dirty_3_8 : i1
    %488 = comb.and bin %357, %332, %385 : i1
    %489 = comb.or %488, %dirty_3_9 : i1
    %490 = comb.and bin %357, %332, %388 : i1
    %491 = comb.or %490, %dirty_3_10 : i1
    %492 = comb.and bin %357, %332, %391 : i1
    %493 = comb.or %492, %dirty_3_11 : i1
    %494 = comb.and bin %357, %332, %394 : i1
    %495 = comb.or %494, %dirty_3_12 : i1
    %496 = comb.and bin %357, %332, %397 : i1
    %497 = comb.or %496, %dirty_3_13 : i1
    %498 = comb.and bin %357, %332, %400 : i1
    %499 = comb.or %498, %dirty_3_14 : i1
    %500 = comb.and bin %357, %332, %403 : i1
    %501 = comb.or %500, %dirty_3_15 : i1
    %axiRaddrEn = seq.firreg %612 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1721 : ui64, sv.namehint = "axiRaddrEn"} : i1
    %502 = comb.and bin %5, %c-64_i32 {sv.namehint = "axiRaddr"} : i32
    %axiRdataEn = seq.firreg %629 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1722 : ui64} : i1
    %axiWaddrEn = seq.firreg %2004 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1723 : ui64, sv.namehint = "axiWaddrEn"} : i1
    %503 = hw.array_create %tag_3_0, %tag_2_0, %tag_1_0, %tag_0_0 : i22
    %504 = hw.array_get %503[%matchWay_r] : !hw.array<4xi22>, i2
    %505 = hw.array_create %tag_3_1, %tag_2_1, %tag_1_1, %tag_0_1 : i22
    %506 = hw.array_get %505[%matchWay_r] : !hw.array<4xi22>, i2
    %507 = hw.array_create %tag_3_2, %tag_2_2, %tag_1_2, %tag_0_2 : i22
    %508 = hw.array_get %507[%matchWay_r] : !hw.array<4xi22>, i2
    %509 = hw.array_create %tag_3_3, %tag_2_3, %tag_1_3, %tag_0_3 : i22
    %510 = hw.array_get %509[%matchWay_r] : !hw.array<4xi22>, i2
    %511 = hw.array_create %tag_3_4, %tag_2_4, %tag_1_4, %tag_0_4 : i22
    %512 = hw.array_get %511[%matchWay_r] : !hw.array<4xi22>, i2
    %513 = hw.array_create %tag_3_5, %tag_2_5, %tag_1_5, %tag_0_5 : i22
    %514 = hw.array_get %513[%matchWay_r] : !hw.array<4xi22>, i2
    %515 = hw.array_create %tag_3_6, %tag_2_6, %tag_1_6, %tag_0_6 : i22
    %516 = hw.array_get %515[%matchWay_r] : !hw.array<4xi22>, i2
    %517 = hw.array_create %tag_3_7, %tag_2_7, %tag_1_7, %tag_0_7 : i22
    %518 = hw.array_get %517[%matchWay_r] : !hw.array<4xi22>, i2
    %519 = hw.array_create %tag_3_8, %tag_2_8, %tag_1_8, %tag_0_8 : i22
    %520 = hw.array_get %519[%matchWay_r] : !hw.array<4xi22>, i2
    %521 = hw.array_create %tag_3_9, %tag_2_9, %tag_1_9, %tag_0_9 : i22
    %522 = hw.array_get %521[%matchWay_r] : !hw.array<4xi22>, i2
    %523 = hw.array_create %tag_3_10, %tag_2_10, %tag_1_10, %tag_0_10 : i22
    %524 = hw.array_get %523[%matchWay_r] : !hw.array<4xi22>, i2
    %525 = hw.array_create %tag_3_11, %tag_2_11, %tag_1_11, %tag_0_11 : i22
    %526 = hw.array_get %525[%matchWay_r] : !hw.array<4xi22>, i2
    %527 = hw.array_create %tag_3_12, %tag_2_12, %tag_1_12, %tag_0_12 : i22
    %528 = hw.array_get %527[%matchWay_r] : !hw.array<4xi22>, i2
    %529 = hw.array_create %tag_3_13, %tag_2_13, %tag_1_13, %tag_0_13 : i22
    %530 = hw.array_get %529[%matchWay_r] : !hw.array<4xi22>, i2
    %531 = hw.array_create %tag_3_14, %tag_2_14, %tag_1_14, %tag_0_14 : i22
    %532 = hw.array_get %531[%matchWay_r] : !hw.array<4xi22>, i2
    %533 = hw.array_create %tag_3_15, %tag_2_15, %tag_1_15, %tag_0_15 : i22
    %534 = hw.array_get %533[%matchWay_r] : !hw.array<4xi22>, i2
    %535 = hw.array_create %534, %532, %530, %528, %526, %524, %522, %520, %518, %516, %514, %512, %510, %508, %506, %504 : i22
    %536 = hw.array_get %535[%blockIdx_r] : !hw.array<16xi22>, i4
    %537 = comb.concat %536, %blockIdx_r, %c0_i6 {sv.namehint = "axiWaddr"} : i22, i4, i6
    %538 = comb.extract %offset from 0 {sv.namehint = "_axiWdata_T"} : (i3) -> i1
    %539 = comb.extract %200 from 64 {sv.namehint = "_axiWdata_T_1"} : (i128) -> i64
    %540 = comb.extract %200 from 0 {sv.namehint = "_axiWdata_T_2"} : (i128) -> i64
    %541 = comb.mux bin %538, %539, %540 {sv.namehint = "axiWdata"} : i64
    %axiWdataEn = seq.firreg %1057 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1724 : ui64, sv.namehint = "axiWdataEn"} : i1
    %542 = comb.icmp bin eq %offset, %c-1_i3 {sv.namehint = "axiWdataLast"} : i3
    %543 = comb.or bin %flush_r, %io_flush : i1
    %544 = comb.xor bin %4, %true : i1
    %545 = comb.and bin %544, %3 : i1
    %546 = comb.icmp bin eq %240, %c-1_i2 : i2
    %547 = comb.mux bin %546, %c-3_i3, %state : i3
    %548 = comb.xor %546, %true : i1
    %549 = comb.or bin %543, %545 : i1
    %550 = comb.xor %549, %true : i1
    %551 = comb.and %550, %33, %548, %241 : i1
    %552 = comb.extract %321 from 0 : (i255) -> i128
    %553 = comb.xor %33, %true : i1
    %554 = comb.or %549, %553, %546 : i1
    %555 = comb.mux bin %554, %c-1_i128, %552 : i128
    %556 = hw.array_create %dirty_3_0, %dirty_2_0, %dirty_1_0, %dirty_0_0 : i1
    %557 = hw.array_get %556[%40] : !hw.array<4xi1>, i2
    %558 = hw.array_create %dirty_3_1, %dirty_2_1, %dirty_1_1, %dirty_0_1 : i1
    %559 = hw.array_get %558[%40] : !hw.array<4xi1>, i2
    %560 = hw.array_create %dirty_3_2, %dirty_2_2, %dirty_1_2, %dirty_0_2 : i1
    %561 = hw.array_get %560[%40] : !hw.array<4xi1>, i2
    %562 = hw.array_create %dirty_3_3, %dirty_2_3, %dirty_1_3, %dirty_0_3 : i1
    %563 = hw.array_get %562[%40] : !hw.array<4xi1>, i2
    %564 = hw.array_create %dirty_3_4, %dirty_2_4, %dirty_1_4, %dirty_0_4 : i1
    %565 = hw.array_get %564[%40] : !hw.array<4xi1>, i2
    %566 = hw.array_create %dirty_3_5, %dirty_2_5, %dirty_1_5, %dirty_0_5 : i1
    %567 = hw.array_get %566[%40] : !hw.array<4xi1>, i2
    %568 = hw.array_create %dirty_3_6, %dirty_2_6, %dirty_1_6, %dirty_0_6 : i1
    %569 = hw.array_get %568[%40] : !hw.array<4xi1>, i2
    %570 = hw.array_create %dirty_3_7, %dirty_2_7, %dirty_1_7, %dirty_0_7 : i1
    %571 = hw.array_get %570[%40] : !hw.array<4xi1>, i2
    %572 = hw.array_create %dirty_3_8, %dirty_2_8, %dirty_1_8, %dirty_0_8 : i1
    %573 = hw.array_get %572[%40] : !hw.array<4xi1>, i2
    %574 = hw.array_create %dirty_3_9, %dirty_2_9, %dirty_1_9, %dirty_0_9 : i1
    %575 = hw.array_get %574[%40] : !hw.array<4xi1>, i2
    %576 = hw.array_create %dirty_3_10, %dirty_2_10, %dirty_1_10, %dirty_0_10 : i1
    %577 = hw.array_get %576[%40] : !hw.array<4xi1>, i2
    %578 = hw.array_create %dirty_3_11, %dirty_2_11, %dirty_1_11, %dirty_0_11 : i1
    %579 = hw.array_get %578[%40] : !hw.array<4xi1>, i2
    %580 = hw.array_create %dirty_3_12, %dirty_2_12, %dirty_1_12, %dirty_0_12 : i1
    %581 = hw.array_get %580[%40] : !hw.array<4xi1>, i2
    %582 = hw.array_create %dirty_3_13, %dirty_2_13, %dirty_1_13, %dirty_0_13 : i1
    %583 = hw.array_get %582[%40] : !hw.array<4xi1>, i2
    %584 = hw.array_create %dirty_3_14, %dirty_2_14, %dirty_1_14, %dirty_0_14 : i1
    %585 = hw.array_get %584[%40] : !hw.array<4xi1>, i2
    %586 = hw.array_create %dirty_3_15, %dirty_2_15, %dirty_1_15, %dirty_0_15 : i1
    %587 = hw.array_get %586[%40] : !hw.array<4xi1>, i2
    %588 = hw.array_create %587, %585, %583, %581, %579, %577, %575, %573, %571, %569, %567, %565, %563, %561, %559, %557 : i1
    %589 = hw.array_get %588[%6] : !hw.array<16xi1>, i4
    %590 = comb.concat %543, %545, %31, %25, %19, %13 : i1, i1, i1, i1, i1, i1
    %591 = comb.icmp bin eq %590, %c0_i6 : i6
    %592 = comb.and %591, %589 : i1
    %593 = comb.or %592, %axiWaddrEn : i1
    %594 = comb.concat %false, %589, %true : i1, i1, i1
    %595 = comb.mux bin %33, %547, %594 : i3
    %596 = comb.mux bin %545, %state, %595 : i3
    %597 = comb.mux bin %543, %c-2_i3, %596 : i3
    %598 = comb.or bin %543, %545, %33, %589 : i1
    %599 = comb.xor %598, %true : i1
    %600 = comb.or %599, %axiRaddrEn : i1
    %601 = comb.xor %549, %true : i1
    %602 = comb.and %322, %601, %33 : i1
    %603 = comb.xor %33, %true : i1
    %604 = comb.or %603, %546 : i1
    %605 = comb.mux bin %549, %wait_r, %604 : i1
    %606 = comb.icmp bin eq %state, %c1_i3 : i3
    %607 = comb.and bin %axiRaddrEn, %io_dataAxi_ra_ready : i1
    %608 = comb.mux bin %607, %c2_i3, %state : i3
    %609 = comb.and bin %606, %607 : i1
    %610 = comb.xor %609, %true : i1
    %611 = comb.and %610, %axiRaddrEn : i1
    %612 = comb.mux bin %322, %600, %611 : i1
    %613 = comb.or %607, %axiRdataEn : i1
    %614 = comb.icmp bin eq %state, %c2_i3 : i3
    %615 = comb.and bin %axiRdataEn, %io_dataAxi_rd_valid : i1
    %616 = comb.add %offset, %c1_i3 {sv.namehint = "_offset_T"} : i3
    %617 = comb.mux bin %615, %616, %offset : i3
    %618 = comb.and %615, %538 : i1
    %619 = comb.and bin %614, %615 : i1
    %620 = comb.xor %619, %true : i1
    %621 = comb.or bin %322, %606 : i1
    %622 = comb.or %621, %620, %538 : i1
    %623 = comb.mux bin %622, %rdatabuf, %io_dataAxi_rd_bits_data : i64
    %624 = comb.and bin %615, %io_dataAxi_rd_bits_last : i1
    %625 = comb.and bin %614, %624 : i1
    %626 = comb.xor %625, %true : i1
    %627 = comb.and %626, %axiRdataEn : i1
    %628 = comb.mux bin %606, %613, %627 : i1
    %629 = comb.mux bin %322, %axiRdataEn, %628 : i1
    %630 = comb.icmp bin eq %matchWay_r, %c0_i2 : i2
    %631 = comb.icmp bin eq %196, %c0_i4 : i4
    %632 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %631 : i1
    %633 = comb.and bin %614, %632 : i1
    %634 = comb.xor %633, %true : i1
    %635 = comb.or %621, %634 : i1
    %636 = comb.mux bin %635, %tag_0_0, %197 : i22
    %637 = comb.icmp bin eq %196, %c1_i4 : i4
    %638 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %637 : i1
    %639 = comb.and bin %614, %638 : i1
    %640 = comb.xor %639, %true : i1
    %641 = comb.or %621, %640 : i1
    %642 = comb.mux bin %641, %tag_0_1, %197 : i22
    %643 = comb.icmp bin eq %196, %c2_i4 : i4
    %644 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %643 : i1
    %645 = comb.and bin %614, %644 : i1
    %646 = comb.xor %645, %true : i1
    %647 = comb.or %621, %646 : i1
    %648 = comb.mux bin %647, %tag_0_2, %197 : i22
    %649 = comb.icmp bin eq %196, %c3_i4 : i4
    %650 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %649 : i1
    %651 = comb.and bin %614, %650 : i1
    %652 = comb.xor %651, %true : i1
    %653 = comb.or %621, %652 : i1
    %654 = comb.mux bin %653, %tag_0_3, %197 : i22
    %655 = comb.icmp bin eq %196, %c4_i4 : i4
    %656 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %655 : i1
    %657 = comb.and bin %614, %656 : i1
    %658 = comb.xor %657, %true : i1
    %659 = comb.or %621, %658 : i1
    %660 = comb.mux bin %659, %tag_0_4, %197 : i22
    %661 = comb.icmp bin eq %196, %c5_i4 : i4
    %662 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %661 : i1
    %663 = comb.and bin %614, %662 : i1
    %664 = comb.xor %663, %true : i1
    %665 = comb.or %621, %664 : i1
    %666 = comb.mux bin %665, %tag_0_5, %197 : i22
    %667 = comb.icmp bin eq %196, %c6_i4 : i4
    %668 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %667 : i1
    %669 = comb.and bin %614, %668 : i1
    %670 = comb.xor %669, %true : i1
    %671 = comb.or %621, %670 : i1
    %672 = comb.mux bin %671, %tag_0_6, %197 : i22
    %673 = comb.icmp bin eq %196, %c7_i4 : i4
    %674 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %673 : i1
    %675 = comb.and bin %614, %674 : i1
    %676 = comb.xor %675, %true : i1
    %677 = comb.or %621, %676 : i1
    %678 = comb.mux bin %677, %tag_0_7, %197 : i22
    %679 = comb.icmp bin eq %196, %c-8_i4 : i4
    %680 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %679 : i1
    %681 = comb.and bin %614, %680 : i1
    %682 = comb.xor %681, %true : i1
    %683 = comb.or %621, %682 : i1
    %684 = comb.mux bin %683, %tag_0_8, %197 : i22
    %685 = comb.icmp bin eq %196, %c-7_i4 : i4
    %686 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %685 : i1
    %687 = comb.and bin %614, %686 : i1
    %688 = comb.xor %687, %true : i1
    %689 = comb.or %621, %688 : i1
    %690 = comb.mux bin %689, %tag_0_9, %197 : i22
    %691 = comb.icmp bin eq %196, %c-6_i4 : i4
    %692 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %691 : i1
    %693 = comb.and bin %614, %692 : i1
    %694 = comb.xor %693, %true : i1
    %695 = comb.or %621, %694 : i1
    %696 = comb.mux bin %695, %tag_0_10, %197 : i22
    %697 = comb.icmp bin eq %196, %c-5_i4 : i4
    %698 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %697 : i1
    %699 = comb.and bin %614, %698 : i1
    %700 = comb.xor %699, %true : i1
    %701 = comb.or %621, %700 : i1
    %702 = comb.mux bin %701, %tag_0_11, %197 : i22
    %703 = comb.icmp bin eq %196, %c-4_i4 : i4
    %704 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %703 : i1
    %705 = comb.and bin %614, %704 : i1
    %706 = comb.xor %705, %true : i1
    %707 = comb.or %621, %706 : i1
    %708 = comb.mux bin %707, %tag_0_12, %197 : i22
    %709 = comb.icmp bin eq %196, %c-3_i4 : i4
    %710 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %709 : i1
    %711 = comb.and bin %614, %710 : i1
    %712 = comb.xor %711, %true : i1
    %713 = comb.or %621, %712 : i1
    %714 = comb.mux bin %713, %tag_0_13, %197 : i22
    %715 = comb.icmp bin eq %196, %c-2_i4 : i4
    %716 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %715 : i1
    %717 = comb.and bin %614, %716 : i1
    %718 = comb.xor %717, %true : i1
    %719 = comb.or %621, %718 : i1
    %720 = comb.mux bin %719, %tag_0_14, %197 : i22
    %721 = comb.icmp bin eq %196, %c-1_i4 : i4
    %722 = comb.and bin %615, %io_dataAxi_rd_bits_last, %630, %721 : i1
    %723 = comb.and bin %614, %722 : i1
    %724 = comb.xor %723, %true : i1
    %725 = comb.or %621, %724 : i1
    %726 = comb.mux bin %725, %tag_0_15, %197 : i22
    %727 = comb.icmp bin eq %matchWay_r, %c1_i2 : i2
    %728 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %631 : i1
    %729 = comb.and bin %614, %728 : i1
    %730 = comb.xor %729, %true : i1
    %731 = comb.or %621, %730 : i1
    %732 = comb.mux bin %731, %tag_1_0, %197 : i22
    %733 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %637 : i1
    %734 = comb.and bin %614, %733 : i1
    %735 = comb.xor %734, %true : i1
    %736 = comb.or %621, %735 : i1
    %737 = comb.mux bin %736, %tag_1_1, %197 : i22
    %738 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %643 : i1
    %739 = comb.and bin %614, %738 : i1
    %740 = comb.xor %739, %true : i1
    %741 = comb.or %621, %740 : i1
    %742 = comb.mux bin %741, %tag_1_2, %197 : i22
    %743 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %649 : i1
    %744 = comb.and bin %614, %743 : i1
    %745 = comb.xor %744, %true : i1
    %746 = comb.or %621, %745 : i1
    %747 = comb.mux bin %746, %tag_1_3, %197 : i22
    %748 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %655 : i1
    %749 = comb.and bin %614, %748 : i1
    %750 = comb.xor %749, %true : i1
    %751 = comb.or %621, %750 : i1
    %752 = comb.mux bin %751, %tag_1_4, %197 : i22
    %753 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %661 : i1
    %754 = comb.and bin %614, %753 : i1
    %755 = comb.xor %754, %true : i1
    %756 = comb.or %621, %755 : i1
    %757 = comb.mux bin %756, %tag_1_5, %197 : i22
    %758 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %667 : i1
    %759 = comb.and bin %614, %758 : i1
    %760 = comb.xor %759, %true : i1
    %761 = comb.or %621, %760 : i1
    %762 = comb.mux bin %761, %tag_1_6, %197 : i22
    %763 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %673 : i1
    %764 = comb.and bin %614, %763 : i1
    %765 = comb.xor %764, %true : i1
    %766 = comb.or %621, %765 : i1
    %767 = comb.mux bin %766, %tag_1_7, %197 : i22
    %768 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %679 : i1
    %769 = comb.and bin %614, %768 : i1
    %770 = comb.xor %769, %true : i1
    %771 = comb.or %621, %770 : i1
    %772 = comb.mux bin %771, %tag_1_8, %197 : i22
    %773 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %685 : i1
    %774 = comb.and bin %614, %773 : i1
    %775 = comb.xor %774, %true : i1
    %776 = comb.or %621, %775 : i1
    %777 = comb.mux bin %776, %tag_1_9, %197 : i22
    %778 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %691 : i1
    %779 = comb.and bin %614, %778 : i1
    %780 = comb.xor %779, %true : i1
    %781 = comb.or %621, %780 : i1
    %782 = comb.mux bin %781, %tag_1_10, %197 : i22
    %783 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %697 : i1
    %784 = comb.and bin %614, %783 : i1
    %785 = comb.xor %784, %true : i1
    %786 = comb.or %621, %785 : i1
    %787 = comb.mux bin %786, %tag_1_11, %197 : i22
    %788 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %703 : i1
    %789 = comb.and bin %614, %788 : i1
    %790 = comb.xor %789, %true : i1
    %791 = comb.or %621, %790 : i1
    %792 = comb.mux bin %791, %tag_1_12, %197 : i22
    %793 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %709 : i1
    %794 = comb.and bin %614, %793 : i1
    %795 = comb.xor %794, %true : i1
    %796 = comb.or %621, %795 : i1
    %797 = comb.mux bin %796, %tag_1_13, %197 : i22
    %798 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %715 : i1
    %799 = comb.and bin %614, %798 : i1
    %800 = comb.xor %799, %true : i1
    %801 = comb.or %621, %800 : i1
    %802 = comb.mux bin %801, %tag_1_14, %197 : i22
    %803 = comb.and bin %615, %io_dataAxi_rd_bits_last, %727, %721 : i1
    %804 = comb.and bin %614, %803 : i1
    %805 = comb.xor %804, %true : i1
    %806 = comb.or %621, %805 : i1
    %807 = comb.mux bin %806, %tag_1_15, %197 : i22
    %808 = comb.icmp bin eq %matchWay_r, %c-2_i2 : i2
    %809 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %631 : i1
    %810 = comb.and bin %614, %809 : i1
    %811 = comb.xor %810, %true : i1
    %812 = comb.or %621, %811 : i1
    %813 = comb.mux bin %812, %tag_2_0, %197 : i22
    %814 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %637 : i1
    %815 = comb.and bin %614, %814 : i1
    %816 = comb.xor %815, %true : i1
    %817 = comb.or %621, %816 : i1
    %818 = comb.mux bin %817, %tag_2_1, %197 : i22
    %819 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %643 : i1
    %820 = comb.and bin %614, %819 : i1
    %821 = comb.xor %820, %true : i1
    %822 = comb.or %621, %821 : i1
    %823 = comb.mux bin %822, %tag_2_2, %197 : i22
    %824 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %649 : i1
    %825 = comb.and bin %614, %824 : i1
    %826 = comb.xor %825, %true : i1
    %827 = comb.or %621, %826 : i1
    %828 = comb.mux bin %827, %tag_2_3, %197 : i22
    %829 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %655 : i1
    %830 = comb.and bin %614, %829 : i1
    %831 = comb.xor %830, %true : i1
    %832 = comb.or %621, %831 : i1
    %833 = comb.mux bin %832, %tag_2_4, %197 : i22
    %834 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %661 : i1
    %835 = comb.and bin %614, %834 : i1
    %836 = comb.xor %835, %true : i1
    %837 = comb.or %621, %836 : i1
    %838 = comb.mux bin %837, %tag_2_5, %197 : i22
    %839 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %667 : i1
    %840 = comb.and bin %614, %839 : i1
    %841 = comb.xor %840, %true : i1
    %842 = comb.or %621, %841 : i1
    %843 = comb.mux bin %842, %tag_2_6, %197 : i22
    %844 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %673 : i1
    %845 = comb.and bin %614, %844 : i1
    %846 = comb.xor %845, %true : i1
    %847 = comb.or %621, %846 : i1
    %848 = comb.mux bin %847, %tag_2_7, %197 : i22
    %849 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %679 : i1
    %850 = comb.and bin %614, %849 : i1
    %851 = comb.xor %850, %true : i1
    %852 = comb.or %621, %851 : i1
    %853 = comb.mux bin %852, %tag_2_8, %197 : i22
    %854 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %685 : i1
    %855 = comb.and bin %614, %854 : i1
    %856 = comb.xor %855, %true : i1
    %857 = comb.or %621, %856 : i1
    %858 = comb.mux bin %857, %tag_2_9, %197 : i22
    %859 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %691 : i1
    %860 = comb.and bin %614, %859 : i1
    %861 = comb.xor %860, %true : i1
    %862 = comb.or %621, %861 : i1
    %863 = comb.mux bin %862, %tag_2_10, %197 : i22
    %864 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %697 : i1
    %865 = comb.and bin %614, %864 : i1
    %866 = comb.xor %865, %true : i1
    %867 = comb.or %621, %866 : i1
    %868 = comb.mux bin %867, %tag_2_11, %197 : i22
    %869 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %703 : i1
    %870 = comb.and bin %614, %869 : i1
    %871 = comb.xor %870, %true : i1
    %872 = comb.or %621, %871 : i1
    %873 = comb.mux bin %872, %tag_2_12, %197 : i22
    %874 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %709 : i1
    %875 = comb.and bin %614, %874 : i1
    %876 = comb.xor %875, %true : i1
    %877 = comb.or %621, %876 : i1
    %878 = comb.mux bin %877, %tag_2_13, %197 : i22
    %879 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %715 : i1
    %880 = comb.and bin %614, %879 : i1
    %881 = comb.xor %880, %true : i1
    %882 = comb.or %621, %881 : i1
    %883 = comb.mux bin %882, %tag_2_14, %197 : i22
    %884 = comb.and bin %615, %io_dataAxi_rd_bits_last, %808, %721 : i1
    %885 = comb.and bin %614, %884 : i1
    %886 = comb.xor %885, %true : i1
    %887 = comb.or %621, %886 : i1
    %888 = comb.mux bin %887, %tag_2_15, %197 : i22
    %889 = comb.icmp bin eq %matchWay_r, %c-1_i2 : i2
    %890 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %631 : i1
    %891 = comb.and bin %614, %890 : i1
    %892 = comb.xor %891, %true : i1
    %893 = comb.or %621, %892 : i1
    %894 = comb.mux bin %893, %tag_3_0, %197 : i22
    %895 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %637 : i1
    %896 = comb.and bin %614, %895 : i1
    %897 = comb.xor %896, %true : i1
    %898 = comb.or %621, %897 : i1
    %899 = comb.mux bin %898, %tag_3_1, %197 : i22
    %900 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %643 : i1
    %901 = comb.and bin %614, %900 : i1
    %902 = comb.xor %901, %true : i1
    %903 = comb.or %621, %902 : i1
    %904 = comb.mux bin %903, %tag_3_2, %197 : i22
    %905 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %649 : i1
    %906 = comb.and bin %614, %905 : i1
    %907 = comb.xor %906, %true : i1
    %908 = comb.or %621, %907 : i1
    %909 = comb.mux bin %908, %tag_3_3, %197 : i22
    %910 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %655 : i1
    %911 = comb.and bin %614, %910 : i1
    %912 = comb.xor %911, %true : i1
    %913 = comb.or %621, %912 : i1
    %914 = comb.mux bin %913, %tag_3_4, %197 : i22
    %915 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %661 : i1
    %916 = comb.and bin %614, %915 : i1
    %917 = comb.xor %916, %true : i1
    %918 = comb.or %621, %917 : i1
    %919 = comb.mux bin %918, %tag_3_5, %197 : i22
    %920 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %667 : i1
    %921 = comb.and bin %614, %920 : i1
    %922 = comb.xor %921, %true : i1
    %923 = comb.or %621, %922 : i1
    %924 = comb.mux bin %923, %tag_3_6, %197 : i22
    %925 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %673 : i1
    %926 = comb.and bin %614, %925 : i1
    %927 = comb.xor %926, %true : i1
    %928 = comb.or %621, %927 : i1
    %929 = comb.mux bin %928, %tag_3_7, %197 : i22
    %930 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %679 : i1
    %931 = comb.and bin %614, %930 : i1
    %932 = comb.xor %931, %true : i1
    %933 = comb.or %621, %932 : i1
    %934 = comb.mux bin %933, %tag_3_8, %197 : i22
    %935 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %685 : i1
    %936 = comb.and bin %614, %935 : i1
    %937 = comb.xor %936, %true : i1
    %938 = comb.or %621, %937 : i1
    %939 = comb.mux bin %938, %tag_3_9, %197 : i22
    %940 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %691 : i1
    %941 = comb.and bin %614, %940 : i1
    %942 = comb.xor %941, %true : i1
    %943 = comb.or %621, %942 : i1
    %944 = comb.mux bin %943, %tag_3_10, %197 : i22
    %945 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %697 : i1
    %946 = comb.and bin %614, %945 : i1
    %947 = comb.xor %946, %true : i1
    %948 = comb.or %621, %947 : i1
    %949 = comb.mux bin %948, %tag_3_11, %197 : i22
    %950 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %703 : i1
    %951 = comb.and bin %614, %950 : i1
    %952 = comb.xor %951, %true : i1
    %953 = comb.or %621, %952 : i1
    %954 = comb.mux bin %953, %tag_3_12, %197 : i22
    %955 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %709 : i1
    %956 = comb.and bin %614, %955 : i1
    %957 = comb.xor %956, %true : i1
    %958 = comb.or %621, %957 : i1
    %959 = comb.mux bin %958, %tag_3_13, %197 : i22
    %960 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %715 : i1
    %961 = comb.and bin %614, %960 : i1
    %962 = comb.xor %961, %true : i1
    %963 = comb.or %621, %962 : i1
    %964 = comb.mux bin %963, %tag_3_14, %197 : i22
    %965 = comb.and bin %615, %io_dataAxi_rd_bits_last, %889, %721 : i1
    %966 = comb.and bin %614, %965 : i1
    %967 = comb.xor %966, %true : i1
    %968 = comb.or %621, %967 : i1
    %969 = comb.mux bin %968, %tag_3_15, %197 : i22
    %970 = comb.or %632, %valid_0_0 : i1
    %971 = comb.or %638, %valid_0_1 : i1
    %972 = comb.or %644, %valid_0_2 : i1
    %973 = comb.or %650, %valid_0_3 : i1
    %974 = comb.or %656, %valid_0_4 : i1
    %975 = comb.or %662, %valid_0_5 : i1
    %976 = comb.or %668, %valid_0_6 : i1
    %977 = comb.or %674, %valid_0_7 : i1
    %978 = comb.or %680, %valid_0_8 : i1
    %979 = comb.or %686, %valid_0_9 : i1
    %980 = comb.or %692, %valid_0_10 : i1
    %981 = comb.or %698, %valid_0_11 : i1
    %982 = comb.or %704, %valid_0_12 : i1
    %983 = comb.or %710, %valid_0_13 : i1
    %984 = comb.or %716, %valid_0_14 : i1
    %985 = comb.or %722, %valid_0_15 : i1
    %986 = comb.or %728, %valid_1_0 : i1
    %987 = comb.or %733, %valid_1_1 : i1
    %988 = comb.or %738, %valid_1_2 : i1
    %989 = comb.or %743, %valid_1_3 : i1
    %990 = comb.or %748, %valid_1_4 : i1
    %991 = comb.or %753, %valid_1_5 : i1
    %992 = comb.or %758, %valid_1_6 : i1
    %993 = comb.or %763, %valid_1_7 : i1
    %994 = comb.or %768, %valid_1_8 : i1
    %995 = comb.or %773, %valid_1_9 : i1
    %996 = comb.or %778, %valid_1_10 : i1
    %997 = comb.or %783, %valid_1_11 : i1
    %998 = comb.or %788, %valid_1_12 : i1
    %999 = comb.or %793, %valid_1_13 : i1
    %1000 = comb.or %798, %valid_1_14 : i1
    %1001 = comb.or %803, %valid_1_15 : i1
    %1002 = comb.or %809, %valid_2_0 : i1
    %1003 = comb.or %814, %valid_2_1 : i1
    %1004 = comb.or %819, %valid_2_2 : i1
    %1005 = comb.or %824, %valid_2_3 : i1
    %1006 = comb.or %829, %valid_2_4 : i1
    %1007 = comb.or %834, %valid_2_5 : i1
    %1008 = comb.or %839, %valid_2_6 : i1
    %1009 = comb.or %844, %valid_2_7 : i1
    %1010 = comb.or %849, %valid_2_8 : i1
    %1011 = comb.or %854, %valid_2_9 : i1
    %1012 = comb.or %859, %valid_2_10 : i1
    %1013 = comb.or %864, %valid_2_11 : i1
    %1014 = comb.or %869, %valid_2_12 : i1
    %1015 = comb.or %874, %valid_2_13 : i1
    %1016 = comb.or %879, %valid_2_14 : i1
    %1017 = comb.or %884, %valid_2_15 : i1
    %1018 = comb.or %890, %valid_3_0 : i1
    %1019 = comb.or %895, %valid_3_1 : i1
    %1020 = comb.or %900, %valid_3_2 : i1
    %1021 = comb.or %905, %valid_3_3 : i1
    %1022 = comb.or %910, %valid_3_4 : i1
    %1023 = comb.or %915, %valid_3_5 : i1
    %1024 = comb.or %920, %valid_3_6 : i1
    %1025 = comb.or %925, %valid_3_7 : i1
    %1026 = comb.or %930, %valid_3_8 : i1
    %1027 = comb.or %935, %valid_3_9 : i1
    %1028 = comb.or %940, %valid_3_10 : i1
    %1029 = comb.or %945, %valid_3_11 : i1
    %1030 = comb.or %950, %valid_3_12 : i1
    %1031 = comb.or %955, %valid_3_13 : i1
    %1032 = comb.or %960, %valid_3_14 : i1
    %1033 = comb.or %965, %valid_3_15 : i1
    %1034 = comb.mux bin %624, %c0_i3, %state : i3
    %1035 = comb.icmp bin eq %state, %c3_i3 : i3
    %1036 = comb.and bin %axiWaddrEn, %io_dataAxi_wa_ready : i1
    %1037 = comb.mux bin %1036, %c-4_i3, %state : i3
    %1038 = comb.xor %1036, %true : i1
    %1039 = comb.and %1038, %axiWaddrEn : i1
    %1040 = comb.or %1036, %axiWdataEn : i1
    %1041 = comb.icmp bin eq %state, %c-4_i3 : i3
    %1042 = comb.and bin %axiWdataEn, %io_dataAxi_wd_ready : i1
    %1043 = comb.add %offset, %c1_i3 {sv.namehint = "_offset_T_2"} : i3
    %1044 = comb.and bin %1041, %1042 : i1
    %1045 = comb.mux bin %1044, %1043, %offset : i3
    %1046 = comb.mux bin %1035, %c0_i3, %1045 : i3
    %1047 = comb.mux bin %614, %617, %1046 : i3
    %1048 = comb.mux bin %606, %c0_i3, %1047 : i3
    %1049 = comb.mux bin %322, %offset, %1048 : i3
    %1050 = comb.and bin %1042, %542 : i1
    %1051 = comb.mux bin %1050, %c0_i3, %state : i3
    %1052 = comb.xor bin %1042, %true : i1
    %1053 = comb.mux bin %1041, %1052, %axiWdataEn : i1
    %1054 = comb.mux bin %1035, %1040, %1053 : i1
    %1055 = comb.or bin %606, %614 : i1
    %1056 = comb.or bin %322, %1055 : i1
    %1057 = comb.mux bin %1056, %axiWdataEn, %1054 : i1
    %1058 = comb.icmp bin eq %blockIdx_r, %c0_i4 : i4
    %1059 = comb.and bin %1042, %542, %630, %1058 : i1
    %1060 = comb.xor %1059, %true : i1
    %1061 = comb.and %1060, %valid_0_0 : i1
    %1062 = comb.icmp bin eq %blockIdx_r, %c1_i4 : i4
    %1063 = comb.and bin %1042, %542, %630, %1062 : i1
    %1064 = comb.xor %1063, %true : i1
    %1065 = comb.and %1064, %valid_0_1 : i1
    %1066 = comb.icmp bin eq %blockIdx_r, %c2_i4 : i4
    %1067 = comb.and bin %1042, %542, %630, %1066 : i1
    %1068 = comb.xor %1067, %true : i1
    %1069 = comb.and %1068, %valid_0_2 : i1
    %1070 = comb.icmp bin eq %blockIdx_r, %c3_i4 : i4
    %1071 = comb.and bin %1042, %542, %630, %1070 : i1
    %1072 = comb.xor %1071, %true : i1
    %1073 = comb.and %1072, %valid_0_3 : i1
    %1074 = comb.icmp bin eq %blockIdx_r, %c4_i4 : i4
    %1075 = comb.and bin %1042, %542, %630, %1074 : i1
    %1076 = comb.xor %1075, %true : i1
    %1077 = comb.and %1076, %valid_0_4 : i1
    %1078 = comb.icmp bin eq %blockIdx_r, %c5_i4 : i4
    %1079 = comb.and bin %1042, %542, %630, %1078 : i1
    %1080 = comb.xor %1079, %true : i1
    %1081 = comb.and %1080, %valid_0_5 : i1
    %1082 = comb.icmp bin eq %blockIdx_r, %c6_i4 : i4
    %1083 = comb.and bin %1042, %542, %630, %1082 : i1
    %1084 = comb.xor %1083, %true : i1
    %1085 = comb.and %1084, %valid_0_6 : i1
    %1086 = comb.icmp bin eq %blockIdx_r, %c7_i4 : i4
    %1087 = comb.and bin %1042, %542, %630, %1086 : i1
    %1088 = comb.xor %1087, %true : i1
    %1089 = comb.and %1088, %valid_0_7 : i1
    %1090 = comb.icmp bin eq %blockIdx_r, %c-8_i4 : i4
    %1091 = comb.and bin %1042, %542, %630, %1090 : i1
    %1092 = comb.xor %1091, %true : i1
    %1093 = comb.and %1092, %valid_0_8 : i1
    %1094 = comb.icmp bin eq %blockIdx_r, %c-7_i4 : i4
    %1095 = comb.and bin %1042, %542, %630, %1094 : i1
    %1096 = comb.xor %1095, %true : i1
    %1097 = comb.and %1096, %valid_0_9 : i1
    %1098 = comb.icmp bin eq %blockIdx_r, %c-6_i4 : i4
    %1099 = comb.and bin %1042, %542, %630, %1098 : i1
    %1100 = comb.xor %1099, %true : i1
    %1101 = comb.and %1100, %valid_0_10 : i1
    %1102 = comb.icmp bin eq %blockIdx_r, %c-5_i4 : i4
    %1103 = comb.and bin %1042, %542, %630, %1102 : i1
    %1104 = comb.xor %1103, %true : i1
    %1105 = comb.and %1104, %valid_0_11 : i1
    %1106 = comb.icmp bin eq %blockIdx_r, %c-4_i4 : i4
    %1107 = comb.and bin %1042, %542, %630, %1106 : i1
    %1108 = comb.xor %1107, %true : i1
    %1109 = comb.and %1108, %valid_0_12 : i1
    %1110 = comb.icmp bin eq %blockIdx_r, %c-3_i4 : i4
    %1111 = comb.and bin %1042, %542, %630, %1110 : i1
    %1112 = comb.xor %1111, %true : i1
    %1113 = comb.and %1112, %valid_0_13 : i1
    %1114 = comb.icmp bin eq %blockIdx_r, %c-2_i4 : i4
    %1115 = comb.and bin %1042, %542, %630, %1114 : i1
    %1116 = comb.xor %1115, %true : i1
    %1117 = comb.and %1116, %valid_0_14 : i1
    %1118 = comb.icmp bin eq %blockIdx_r, %c-1_i4 : i4
    %1119 = comb.and bin %1042, %542, %630, %1118 : i1
    %1120 = comb.xor %1119, %true : i1
    %1121 = comb.and %1120, %valid_0_15 : i1
    %1122 = comb.and bin %1042, %542, %727, %1058 : i1
    %1123 = comb.xor %1122, %true : i1
    %1124 = comb.and %1123, %valid_1_0 : i1
    %1125 = comb.and bin %1042, %542, %727, %1062 : i1
    %1126 = comb.xor %1125, %true : i1
    %1127 = comb.and %1126, %valid_1_1 : i1
    %1128 = comb.and bin %1042, %542, %727, %1066 : i1
    %1129 = comb.xor %1128, %true : i1
    %1130 = comb.and %1129, %valid_1_2 : i1
    %1131 = comb.and bin %1042, %542, %727, %1070 : i1
    %1132 = comb.xor %1131, %true : i1
    %1133 = comb.and %1132, %valid_1_3 : i1
    %1134 = comb.and bin %1042, %542, %727, %1074 : i1
    %1135 = comb.xor %1134, %true : i1
    %1136 = comb.and %1135, %valid_1_4 : i1
    %1137 = comb.and bin %1042, %542, %727, %1078 : i1
    %1138 = comb.xor %1137, %true : i1
    %1139 = comb.and %1138, %valid_1_5 : i1
    %1140 = comb.and bin %1042, %542, %727, %1082 : i1
    %1141 = comb.xor %1140, %true : i1
    %1142 = comb.and %1141, %valid_1_6 : i1
    %1143 = comb.and bin %1042, %542, %727, %1086 : i1
    %1144 = comb.xor %1143, %true : i1
    %1145 = comb.and %1144, %valid_1_7 : i1
    %1146 = comb.and bin %1042, %542, %727, %1090 : i1
    %1147 = comb.xor %1146, %true : i1
    %1148 = comb.and %1147, %valid_1_8 : i1
    %1149 = comb.and bin %1042, %542, %727, %1094 : i1
    %1150 = comb.xor %1149, %true : i1
    %1151 = comb.and %1150, %valid_1_9 : i1
    %1152 = comb.and bin %1042, %542, %727, %1098 : i1
    %1153 = comb.xor %1152, %true : i1
    %1154 = comb.and %1153, %valid_1_10 : i1
    %1155 = comb.and bin %1042, %542, %727, %1102 : i1
    %1156 = comb.xor %1155, %true : i1
    %1157 = comb.and %1156, %valid_1_11 : i1
    %1158 = comb.and bin %1042, %542, %727, %1106 : i1
    %1159 = comb.xor %1158, %true : i1
    %1160 = comb.and %1159, %valid_1_12 : i1
    %1161 = comb.and bin %1042, %542, %727, %1110 : i1
    %1162 = comb.xor %1161, %true : i1
    %1163 = comb.and %1162, %valid_1_13 : i1
    %1164 = comb.and bin %1042, %542, %727, %1114 : i1
    %1165 = comb.xor %1164, %true : i1
    %1166 = comb.and %1165, %valid_1_14 : i1
    %1167 = comb.and bin %1042, %542, %727, %1118 : i1
    %1168 = comb.xor %1167, %true : i1
    %1169 = comb.and %1168, %valid_1_15 : i1
    %1170 = comb.and bin %1042, %542, %808, %1058 : i1
    %1171 = comb.xor %1170, %true : i1
    %1172 = comb.and %1171, %valid_2_0 : i1
    %1173 = comb.and bin %1042, %542, %808, %1062 : i1
    %1174 = comb.xor %1173, %true : i1
    %1175 = comb.and %1174, %valid_2_1 : i1
    %1176 = comb.and bin %1042, %542, %808, %1066 : i1
    %1177 = comb.xor %1176, %true : i1
    %1178 = comb.and %1177, %valid_2_2 : i1
    %1179 = comb.and bin %1042, %542, %808, %1070 : i1
    %1180 = comb.xor %1179, %true : i1
    %1181 = comb.and %1180, %valid_2_3 : i1
    %1182 = comb.and bin %1042, %542, %808, %1074 : i1
    %1183 = comb.xor %1182, %true : i1
    %1184 = comb.and %1183, %valid_2_4 : i1
    %1185 = comb.and bin %1042, %542, %808, %1078 : i1
    %1186 = comb.xor %1185, %true : i1
    %1187 = comb.and %1186, %valid_2_5 : i1
    %1188 = comb.and bin %1042, %542, %808, %1082 : i1
    %1189 = comb.xor %1188, %true : i1
    %1190 = comb.and %1189, %valid_2_6 : i1
    %1191 = comb.and bin %1042, %542, %808, %1086 : i1
    %1192 = comb.xor %1191, %true : i1
    %1193 = comb.and %1192, %valid_2_7 : i1
    %1194 = comb.and bin %1042, %542, %808, %1090 : i1
    %1195 = comb.xor %1194, %true : i1
    %1196 = comb.and %1195, %valid_2_8 : i1
    %1197 = comb.and bin %1042, %542, %808, %1094 : i1
    %1198 = comb.xor %1197, %true : i1
    %1199 = comb.and %1198, %valid_2_9 : i1
    %1200 = comb.and bin %1042, %542, %808, %1098 : i1
    %1201 = comb.xor %1200, %true : i1
    %1202 = comb.and %1201, %valid_2_10 : i1
    %1203 = comb.and bin %1042, %542, %808, %1102 : i1
    %1204 = comb.xor %1203, %true : i1
    %1205 = comb.and %1204, %valid_2_11 : i1
    %1206 = comb.and bin %1042, %542, %808, %1106 : i1
    %1207 = comb.xor %1206, %true : i1
    %1208 = comb.and %1207, %valid_2_12 : i1
    %1209 = comb.and bin %1042, %542, %808, %1110 : i1
    %1210 = comb.xor %1209, %true : i1
    %1211 = comb.and %1210, %valid_2_13 : i1
    %1212 = comb.and bin %1042, %542, %808, %1114 : i1
    %1213 = comb.xor %1212, %true : i1
    %1214 = comb.and %1213, %valid_2_14 : i1
    %1215 = comb.and bin %1042, %542, %808, %1118 : i1
    %1216 = comb.xor %1215, %true : i1
    %1217 = comb.and %1216, %valid_2_15 : i1
    %1218 = comb.and bin %1042, %542, %889, %1058 : i1
    %1219 = comb.xor %1218, %true : i1
    %1220 = comb.and %1219, %valid_3_0 : i1
    %1221 = comb.and bin %1042, %542, %889, %1062 : i1
    %1222 = comb.xor %1221, %true : i1
    %1223 = comb.and %1222, %valid_3_1 : i1
    %1224 = comb.and bin %1042, %542, %889, %1066 : i1
    %1225 = comb.xor %1224, %true : i1
    %1226 = comb.and %1225, %valid_3_2 : i1
    %1227 = comb.and bin %1042, %542, %889, %1070 : i1
    %1228 = comb.xor %1227, %true : i1
    %1229 = comb.and %1228, %valid_3_3 : i1
    %1230 = comb.and bin %1042, %542, %889, %1074 : i1
    %1231 = comb.xor %1230, %true : i1
    %1232 = comb.and %1231, %valid_3_4 : i1
    %1233 = comb.and bin %1042, %542, %889, %1078 : i1
    %1234 = comb.xor %1233, %true : i1
    %1235 = comb.and %1234, %valid_3_5 : i1
    %1236 = comb.and bin %1042, %542, %889, %1082 : i1
    %1237 = comb.xor %1236, %true : i1
    %1238 = comb.and %1237, %valid_3_6 : i1
    %1239 = comb.and bin %1042, %542, %889, %1086 : i1
    %1240 = comb.xor %1239, %true : i1
    %1241 = comb.and %1240, %valid_3_7 : i1
    %1242 = comb.and bin %1042, %542, %889, %1090 : i1
    %1243 = comb.xor %1242, %true : i1
    %1244 = comb.and %1243, %valid_3_8 : i1
    %1245 = comb.and bin %1042, %542, %889, %1094 : i1
    %1246 = comb.xor %1245, %true : i1
    %1247 = comb.and %1246, %valid_3_9 : i1
    %1248 = comb.and bin %1042, %542, %889, %1098 : i1
    %1249 = comb.xor %1248, %true : i1
    %1250 = comb.and %1249, %valid_3_10 : i1
    %1251 = comb.and bin %1042, %542, %889, %1102 : i1
    %1252 = comb.xor %1251, %true : i1
    %1253 = comb.and %1252, %valid_3_11 : i1
    %1254 = comb.and bin %1042, %542, %889, %1106 : i1
    %1255 = comb.xor %1254, %true : i1
    %1256 = comb.and %1255, %valid_3_12 : i1
    %1257 = comb.and bin %1042, %542, %889, %1110 : i1
    %1258 = comb.xor %1257, %true : i1
    %1259 = comb.and %1258, %valid_3_13 : i1
    %1260 = comb.and bin %1042, %542, %889, %1114 : i1
    %1261 = comb.xor %1260, %true : i1
    %1262 = comb.and %1261, %valid_3_14 : i1
    %1263 = comb.and bin %1042, %542, %889, %1118 : i1
    %1264 = comb.xor %1263, %true : i1
    %1265 = comb.and %1264, %valid_3_15 : i1
    %1266 = comb.and bin %1041, %1059 : i1
    %1267 = comb.xor %1266, %true : i1
    %1268 = comb.or bin %322, %606, %614, %1035 : i1
    %1269 = comb.or %1268, %1267 : i1
    %1270 = comb.and %1269, %360 : i1
    %1271 = comb.and bin %1041, %1063 : i1
    %1272 = comb.xor %1271, %true : i1
    %1273 = comb.or %1268, %1272 : i1
    %1274 = comb.and %1273, %363 : i1
    %1275 = comb.and bin %1041, %1067 : i1
    %1276 = comb.xor %1275, %true : i1
    %1277 = comb.or %1268, %1276 : i1
    %1278 = comb.and %1277, %366 : i1
    %1279 = comb.and bin %1041, %1071 : i1
    %1280 = comb.xor %1279, %true : i1
    %1281 = comb.or %1268, %1280 : i1
    %1282 = comb.and %1281, %369 : i1
    %1283 = comb.and bin %1041, %1075 : i1
    %1284 = comb.xor %1283, %true : i1
    %1285 = comb.or %1268, %1284 : i1
    %1286 = comb.and %1285, %372 : i1
    %1287 = comb.and bin %1041, %1079 : i1
    %1288 = comb.xor %1287, %true : i1
    %1289 = comb.or %1268, %1288 : i1
    %1290 = comb.and %1289, %375 : i1
    %1291 = comb.and bin %1041, %1083 : i1
    %1292 = comb.xor %1291, %true : i1
    %1293 = comb.or %1268, %1292 : i1
    %1294 = comb.and %1293, %378 : i1
    %1295 = comb.and bin %1041, %1087 : i1
    %1296 = comb.xor %1295, %true : i1
    %1297 = comb.or %1268, %1296 : i1
    %1298 = comb.and %1297, %381 : i1
    %1299 = comb.and bin %1041, %1091 : i1
    %1300 = comb.xor %1299, %true : i1
    %1301 = comb.or %1268, %1300 : i1
    %1302 = comb.and %1301, %384 : i1
    %1303 = comb.and bin %1041, %1095 : i1
    %1304 = comb.xor %1303, %true : i1
    %1305 = comb.or %1268, %1304 : i1
    %1306 = comb.and %1305, %387 : i1
    %1307 = comb.and bin %1041, %1099 : i1
    %1308 = comb.xor %1307, %true : i1
    %1309 = comb.or %1268, %1308 : i1
    %1310 = comb.and %1309, %390 : i1
    %1311 = comb.and bin %1041, %1103 : i1
    %1312 = comb.xor %1311, %true : i1
    %1313 = comb.or %1268, %1312 : i1
    %1314 = comb.and %1313, %393 : i1
    %1315 = comb.and bin %1041, %1107 : i1
    %1316 = comb.xor %1315, %true : i1
    %1317 = comb.or %1268, %1316 : i1
    %1318 = comb.and %1317, %396 : i1
    %1319 = comb.and bin %1041, %1111 : i1
    %1320 = comb.xor %1319, %true : i1
    %1321 = comb.or %1268, %1320 : i1
    %1322 = comb.and %1321, %399 : i1
    %1323 = comb.and bin %1041, %1115 : i1
    %1324 = comb.xor %1323, %true : i1
    %1325 = comb.or %1268, %1324 : i1
    %1326 = comb.and %1325, %402 : i1
    %1327 = comb.and bin %1041, %1119 : i1
    %1328 = comb.xor %1327, %true : i1
    %1329 = comb.or %1268, %1328 : i1
    %1330 = comb.and %1329, %405 : i1
    %1331 = comb.and bin %1041, %1122 : i1
    %1332 = comb.xor %1331, %true : i1
    %1333 = comb.or %1268, %1332 : i1
    %1334 = comb.and %1333, %407 : i1
    %1335 = comb.and bin %1041, %1125 : i1
    %1336 = comb.xor %1335, %true : i1
    %1337 = comb.or %1268, %1336 : i1
    %1338 = comb.and %1337, %409 : i1
    %1339 = comb.and bin %1041, %1128 : i1
    %1340 = comb.xor %1339, %true : i1
    %1341 = comb.or %1268, %1340 : i1
    %1342 = comb.and %1341, %411 : i1
    %1343 = comb.and bin %1041, %1131 : i1
    %1344 = comb.xor %1343, %true : i1
    %1345 = comb.or %1268, %1344 : i1
    %1346 = comb.and %1345, %413 : i1
    %1347 = comb.and bin %1041, %1134 : i1
    %1348 = comb.xor %1347, %true : i1
    %1349 = comb.or %1268, %1348 : i1
    %1350 = comb.and %1349, %415 : i1
    %1351 = comb.and bin %1041, %1137 : i1
    %1352 = comb.xor %1351, %true : i1
    %1353 = comb.or %1268, %1352 : i1
    %1354 = comb.and %1353, %417 : i1
    %1355 = comb.and bin %1041, %1140 : i1
    %1356 = comb.xor %1355, %true : i1
    %1357 = comb.or %1268, %1356 : i1
    %1358 = comb.and %1357, %419 : i1
    %1359 = comb.and bin %1041, %1143 : i1
    %1360 = comb.xor %1359, %true : i1
    %1361 = comb.or %1268, %1360 : i1
    %1362 = comb.and %1361, %421 : i1
    %1363 = comb.and bin %1041, %1146 : i1
    %1364 = comb.xor %1363, %true : i1
    %1365 = comb.or %1268, %1364 : i1
    %1366 = comb.and %1365, %423 : i1
    %1367 = comb.and bin %1041, %1149 : i1
    %1368 = comb.xor %1367, %true : i1
    %1369 = comb.or %1268, %1368 : i1
    %1370 = comb.and %1369, %425 : i1
    %1371 = comb.and bin %1041, %1152 : i1
    %1372 = comb.xor %1371, %true : i1
    %1373 = comb.or %1268, %1372 : i1
    %1374 = comb.and %1373, %427 : i1
    %1375 = comb.and bin %1041, %1155 : i1
    %1376 = comb.xor %1375, %true : i1
    %1377 = comb.or %1268, %1376 : i1
    %1378 = comb.and %1377, %429 : i1
    %1379 = comb.and bin %1041, %1158 : i1
    %1380 = comb.xor %1379, %true : i1
    %1381 = comb.or %1268, %1380 : i1
    %1382 = comb.and %1381, %431 : i1
    %1383 = comb.and bin %1041, %1161 : i1
    %1384 = comb.xor %1383, %true : i1
    %1385 = comb.or %1268, %1384 : i1
    %1386 = comb.and %1385, %433 : i1
    %1387 = comb.and bin %1041, %1164 : i1
    %1388 = comb.xor %1387, %true : i1
    %1389 = comb.or %1268, %1388 : i1
    %1390 = comb.and %1389, %435 : i1
    %1391 = comb.and bin %1041, %1167 : i1
    %1392 = comb.xor %1391, %true : i1
    %1393 = comb.or %1268, %1392 : i1
    %1394 = comb.and %1393, %437 : i1
    %1395 = comb.and bin %1041, %1170 : i1
    %1396 = comb.xor %1395, %true : i1
    %1397 = comb.or %1268, %1396 : i1
    %1398 = comb.and %1397, %439 : i1
    %1399 = comb.and bin %1041, %1173 : i1
    %1400 = comb.xor %1399, %true : i1
    %1401 = comb.or %1268, %1400 : i1
    %1402 = comb.and %1401, %441 : i1
    %1403 = comb.and bin %1041, %1176 : i1
    %1404 = comb.xor %1403, %true : i1
    %1405 = comb.or %1268, %1404 : i1
    %1406 = comb.and %1405, %443 : i1
    %1407 = comb.and bin %1041, %1179 : i1
    %1408 = comb.xor %1407, %true : i1
    %1409 = comb.or %1268, %1408 : i1
    %1410 = comb.and %1409, %445 : i1
    %1411 = comb.and bin %1041, %1182 : i1
    %1412 = comb.xor %1411, %true : i1
    %1413 = comb.or %1268, %1412 : i1
    %1414 = comb.and %1413, %447 : i1
    %1415 = comb.and bin %1041, %1185 : i1
    %1416 = comb.xor %1415, %true : i1
    %1417 = comb.or %1268, %1416 : i1
    %1418 = comb.and %1417, %449 : i1
    %1419 = comb.and bin %1041, %1188 : i1
    %1420 = comb.xor %1419, %true : i1
    %1421 = comb.or %1268, %1420 : i1
    %1422 = comb.and %1421, %451 : i1
    %1423 = comb.and bin %1041, %1191 : i1
    %1424 = comb.xor %1423, %true : i1
    %1425 = comb.or %1268, %1424 : i1
    %1426 = comb.and %1425, %453 : i1
    %1427 = comb.and bin %1041, %1194 : i1
    %1428 = comb.xor %1427, %true : i1
    %1429 = comb.or %1268, %1428 : i1
    %1430 = comb.and %1429, %455 : i1
    %1431 = comb.and bin %1041, %1197 : i1
    %1432 = comb.xor %1431, %true : i1
    %1433 = comb.or %1268, %1432 : i1
    %1434 = comb.and %1433, %457 : i1
    %1435 = comb.and bin %1041, %1200 : i1
    %1436 = comb.xor %1435, %true : i1
    %1437 = comb.or %1268, %1436 : i1
    %1438 = comb.and %1437, %459 : i1
    %1439 = comb.and bin %1041, %1203 : i1
    %1440 = comb.xor %1439, %true : i1
    %1441 = comb.or %1268, %1440 : i1
    %1442 = comb.and %1441, %461 : i1
    %1443 = comb.and bin %1041, %1206 : i1
    %1444 = comb.xor %1443, %true : i1
    %1445 = comb.or %1268, %1444 : i1
    %1446 = comb.and %1445, %463 : i1
    %1447 = comb.and bin %1041, %1209 : i1
    %1448 = comb.xor %1447, %true : i1
    %1449 = comb.or %1268, %1448 : i1
    %1450 = comb.and %1449, %465 : i1
    %1451 = comb.and bin %1041, %1212 : i1
    %1452 = comb.xor %1451, %true : i1
    %1453 = comb.or %1268, %1452 : i1
    %1454 = comb.and %1453, %467 : i1
    %1455 = comb.and bin %1041, %1215 : i1
    %1456 = comb.xor %1455, %true : i1
    %1457 = comb.or %1268, %1456 : i1
    %1458 = comb.and %1457, %469 : i1
    %1459 = comb.and bin %1041, %1218 : i1
    %1460 = comb.xor %1459, %true : i1
    %1461 = comb.or %1268, %1460 : i1
    %1462 = comb.and %1461, %471 : i1
    %1463 = comb.and bin %1041, %1221 : i1
    %1464 = comb.xor %1463, %true : i1
    %1465 = comb.or %1268, %1464 : i1
    %1466 = comb.and %1465, %473 : i1
    %1467 = comb.and bin %1041, %1224 : i1
    %1468 = comb.xor %1467, %true : i1
    %1469 = comb.or %1268, %1468 : i1
    %1470 = comb.and %1469, %475 : i1
    %1471 = comb.and bin %1041, %1227 : i1
    %1472 = comb.xor %1471, %true : i1
    %1473 = comb.or %1268, %1472 : i1
    %1474 = comb.and %1473, %477 : i1
    %1475 = comb.and bin %1041, %1230 : i1
    %1476 = comb.xor %1475, %true : i1
    %1477 = comb.or %1268, %1476 : i1
    %1478 = comb.and %1477, %479 : i1
    %1479 = comb.and bin %1041, %1233 : i1
    %1480 = comb.xor %1479, %true : i1
    %1481 = comb.or %1268, %1480 : i1
    %1482 = comb.and %1481, %481 : i1
    %1483 = comb.and bin %1041, %1236 : i1
    %1484 = comb.xor %1483, %true : i1
    %1485 = comb.or %1268, %1484 : i1
    %1486 = comb.and %1485, %483 : i1
    %1487 = comb.and bin %1041, %1239 : i1
    %1488 = comb.xor %1487, %true : i1
    %1489 = comb.or %1268, %1488 : i1
    %1490 = comb.and %1489, %485 : i1
    %1491 = comb.and bin %1041, %1242 : i1
    %1492 = comb.xor %1491, %true : i1
    %1493 = comb.or %1268, %1492 : i1
    %1494 = comb.and %1493, %487 : i1
    %1495 = comb.and bin %1041, %1245 : i1
    %1496 = comb.xor %1495, %true : i1
    %1497 = comb.or %1268, %1496 : i1
    %1498 = comb.and %1497, %489 : i1
    %1499 = comb.and bin %1041, %1248 : i1
    %1500 = comb.xor %1499, %true : i1
    %1501 = comb.or %1268, %1500 : i1
    %1502 = comb.and %1501, %491 : i1
    %1503 = comb.and bin %1041, %1251 : i1
    %1504 = comb.xor %1503, %true : i1
    %1505 = comb.or %1268, %1504 : i1
    %1506 = comb.and %1505, %493 : i1
    %1507 = comb.and bin %1041, %1254 : i1
    %1508 = comb.xor %1507, %true : i1
    %1509 = comb.or %1268, %1508 : i1
    %1510 = comb.and %1509, %495 : i1
    %1511 = comb.and bin %1041, %1257 : i1
    %1512 = comb.xor %1511, %true : i1
    %1513 = comb.or %1268, %1512 : i1
    %1514 = comb.and %1513, %497 : i1
    %1515 = comb.and bin %1041, %1260 : i1
    %1516 = comb.xor %1515, %true : i1
    %1517 = comb.or %1268, %1516 : i1
    %1518 = comb.and %1517, %499 : i1
    %1519 = comb.and bin %1041, %1263 : i1
    %1520 = comb.xor %1519, %true : i1
    %1521 = comb.or %1268, %1520 : i1
    %1522 = comb.and %1521, %501 : i1
    %1523 = comb.or bin %1035, %1041 : i1
    %1524 = comb.xor %1523, %true : i1
    %1525 = comb.and %1524, %323 : i1
    %1526 = comb.mux bin %614, %618, %1525 : i1
    %1527 = comb.xor %606, %true : i1
    %1528 = comb.and %1527, %1526 : i1
    %1529 = comb.mux bin %322, %551, %1528 {sv.namehint = "wen"} : i1
    %1530 = comb.or bin %606, %614, %1523 : i1
    %1531 = comb.xor %323, %true : i1
    %1532 = comb.or %1530, %1531 : i1
    %1533 = comb.mux bin %1532, %c-1_i128, %552 : i128
    %1534 = hw.array_create %1533, %1533, %1533, %c-1_i128, %c-1_i128, %c-1_i128, %c-1_i128, %555 : i128
    %1535 = hw.array_get %1534[%state] {sv.namehint = "mask"} : !hw.array<8xi128>, i3
    %1536 = comb.xor %323, %true : i1
    %1537 = comb.or %1530, %1536 : i1
    %1538 = comb.and %1537, %wait_r : i1
    %1539 = comb.mux bin %322, %605, %1538 : i1
    %1540 = comb.icmp bin eq %state, %c-2_i3 : i3
    %1541 = comb.and bin %1540, %186 : i1
    %1542 = comb.xor %1541, %true : i1
    %1543 = comb.or bin %1041, %323 : i1
    %1544 = comb.or bin %322, %606, %614, %1035, %1543 : i1
    %1545 = comb.or %1544, %1542 : i1
    %1546 = comb.and %1545, %49 : i1
    %1547 = comb.xor %1541, %true : i1
    %1548 = comb.or %323, %1547 : i1
    %1549 = comb.and %1548, %valid_0_0 : i1
    %1550 = comb.mux bin %1041, %1061, %1549 : i1
    %1551 = comb.mux bin %1035, %valid_0_0, %1550 : i1
    %1552 = comb.mux bin %614, %970, %1551 : i1
    %1553 = comb.mux bin %621, %valid_0_0, %1552 : i1
    %1554 = comb.xor %1541, %true : i1
    %1555 = comb.or %323, %1554 : i1
    %1556 = comb.and %1555, %valid_0_1 : i1
    %1557 = comb.mux bin %1041, %1065, %1556 : i1
    %1558 = comb.mux bin %1035, %valid_0_1, %1557 : i1
    %1559 = comb.mux bin %614, %971, %1558 : i1
    %1560 = comb.mux bin %621, %valid_0_1, %1559 : i1
    %1561 = comb.xor %1541, %true : i1
    %1562 = comb.or %323, %1561 : i1
    %1563 = comb.and %1562, %valid_0_2 : i1
    %1564 = comb.mux bin %1041, %1069, %1563 : i1
    %1565 = comb.mux bin %1035, %valid_0_2, %1564 : i1
    %1566 = comb.mux bin %614, %972, %1565 : i1
    %1567 = comb.mux bin %621, %valid_0_2, %1566 : i1
    %1568 = comb.xor %1541, %true : i1
    %1569 = comb.or %323, %1568 : i1
    %1570 = comb.and %1569, %valid_0_3 : i1
    %1571 = comb.mux bin %1041, %1073, %1570 : i1
    %1572 = comb.mux bin %1035, %valid_0_3, %1571 : i1
    %1573 = comb.mux bin %614, %973, %1572 : i1
    %1574 = comb.mux bin %621, %valid_0_3, %1573 : i1
    %1575 = comb.xor %1541, %true : i1
    %1576 = comb.or %323, %1575 : i1
    %1577 = comb.and %1576, %valid_0_4 : i1
    %1578 = comb.mux bin %1041, %1077, %1577 : i1
    %1579 = comb.mux bin %1035, %valid_0_4, %1578 : i1
    %1580 = comb.mux bin %614, %974, %1579 : i1
    %1581 = comb.mux bin %621, %valid_0_4, %1580 : i1
    %1582 = comb.xor %1541, %true : i1
    %1583 = comb.or %323, %1582 : i1
    %1584 = comb.and %1583, %valid_0_5 : i1
    %1585 = comb.mux bin %1041, %1081, %1584 : i1
    %1586 = comb.mux bin %1035, %valid_0_5, %1585 : i1
    %1587 = comb.mux bin %614, %975, %1586 : i1
    %1588 = comb.mux bin %621, %valid_0_5, %1587 : i1
    %1589 = comb.xor %1541, %true : i1
    %1590 = comb.or %323, %1589 : i1
    %1591 = comb.and %1590, %valid_0_6 : i1
    %1592 = comb.mux bin %1041, %1085, %1591 : i1
    %1593 = comb.mux bin %1035, %valid_0_6, %1592 : i1
    %1594 = comb.mux bin %614, %976, %1593 : i1
    %1595 = comb.mux bin %621, %valid_0_6, %1594 : i1
    %1596 = comb.xor %1541, %true : i1
    %1597 = comb.or %323, %1596 : i1
    %1598 = comb.and %1597, %valid_0_7 : i1
    %1599 = comb.mux bin %1041, %1089, %1598 : i1
    %1600 = comb.mux bin %1035, %valid_0_7, %1599 : i1
    %1601 = comb.mux bin %614, %977, %1600 : i1
    %1602 = comb.mux bin %621, %valid_0_7, %1601 : i1
    %1603 = comb.xor %1541, %true : i1
    %1604 = comb.or %323, %1603 : i1
    %1605 = comb.and %1604, %valid_0_8 : i1
    %1606 = comb.mux bin %1041, %1093, %1605 : i1
    %1607 = comb.mux bin %1035, %valid_0_8, %1606 : i1
    %1608 = comb.mux bin %614, %978, %1607 : i1
    %1609 = comb.mux bin %621, %valid_0_8, %1608 : i1
    %1610 = comb.xor %1541, %true : i1
    %1611 = comb.or %323, %1610 : i1
    %1612 = comb.and %1611, %valid_0_9 : i1
    %1613 = comb.mux bin %1041, %1097, %1612 : i1
    %1614 = comb.mux bin %1035, %valid_0_9, %1613 : i1
    %1615 = comb.mux bin %614, %979, %1614 : i1
    %1616 = comb.mux bin %621, %valid_0_9, %1615 : i1
    %1617 = comb.xor %1541, %true : i1
    %1618 = comb.or %323, %1617 : i1
    %1619 = comb.and %1618, %valid_0_10 : i1
    %1620 = comb.mux bin %1041, %1101, %1619 : i1
    %1621 = comb.mux bin %1035, %valid_0_10, %1620 : i1
    %1622 = comb.mux bin %614, %980, %1621 : i1
    %1623 = comb.mux bin %621, %valid_0_10, %1622 : i1
    %1624 = comb.xor %1541, %true : i1
    %1625 = comb.or %323, %1624 : i1
    %1626 = comb.and %1625, %valid_0_11 : i1
    %1627 = comb.mux bin %1041, %1105, %1626 : i1
    %1628 = comb.mux bin %1035, %valid_0_11, %1627 : i1
    %1629 = comb.mux bin %614, %981, %1628 : i1
    %1630 = comb.mux bin %621, %valid_0_11, %1629 : i1
    %1631 = comb.xor %1541, %true : i1
    %1632 = comb.or %323, %1631 : i1
    %1633 = comb.and %1632, %valid_0_12 : i1
    %1634 = comb.mux bin %1041, %1109, %1633 : i1
    %1635 = comb.mux bin %1035, %valid_0_12, %1634 : i1
    %1636 = comb.mux bin %614, %982, %1635 : i1
    %1637 = comb.mux bin %621, %valid_0_12, %1636 : i1
    %1638 = comb.xor %1541, %true : i1
    %1639 = comb.or %323, %1638 : i1
    %1640 = comb.and %1639, %valid_0_13 : i1
    %1641 = comb.mux bin %1041, %1113, %1640 : i1
    %1642 = comb.mux bin %1035, %valid_0_13, %1641 : i1
    %1643 = comb.mux bin %614, %983, %1642 : i1
    %1644 = comb.mux bin %621, %valid_0_13, %1643 : i1
    %1645 = comb.xor %1541, %true : i1
    %1646 = comb.or %323, %1645 : i1
    %1647 = comb.and %1646, %valid_0_14 : i1
    %1648 = comb.mux bin %1041, %1117, %1647 : i1
    %1649 = comb.mux bin %1035, %valid_0_14, %1648 : i1
    %1650 = comb.mux bin %614, %984, %1649 : i1
    %1651 = comb.mux bin %621, %valid_0_14, %1650 : i1
    %1652 = comb.xor %1541, %true : i1
    %1653 = comb.or %323, %1652 : i1
    %1654 = comb.and %1653, %valid_0_15 : i1
    %1655 = comb.mux bin %1041, %1121, %1654 : i1
    %1656 = comb.mux bin %1035, %valid_0_15, %1655 : i1
    %1657 = comb.mux bin %614, %985, %1656 : i1
    %1658 = comb.mux bin %621, %valid_0_15, %1657 : i1
    %1659 = comb.xor %1541, %true : i1
    %1660 = comb.or %323, %1659 : i1
    %1661 = comb.and %1660, %valid_1_0 : i1
    %1662 = comb.mux bin %1041, %1124, %1661 : i1
    %1663 = comb.mux bin %1035, %valid_1_0, %1662 : i1
    %1664 = comb.mux bin %614, %986, %1663 : i1
    %1665 = comb.mux bin %621, %valid_1_0, %1664 : i1
    %1666 = comb.xor %1541, %true : i1
    %1667 = comb.or %323, %1666 : i1
    %1668 = comb.and %1667, %valid_1_1 : i1
    %1669 = comb.mux bin %1041, %1127, %1668 : i1
    %1670 = comb.mux bin %1035, %valid_1_1, %1669 : i1
    %1671 = comb.mux bin %614, %987, %1670 : i1
    %1672 = comb.mux bin %621, %valid_1_1, %1671 : i1
    %1673 = comb.xor %1541, %true : i1
    %1674 = comb.or %323, %1673 : i1
    %1675 = comb.and %1674, %valid_1_2 : i1
    %1676 = comb.mux bin %1041, %1130, %1675 : i1
    %1677 = comb.mux bin %1035, %valid_1_2, %1676 : i1
    %1678 = comb.mux bin %614, %988, %1677 : i1
    %1679 = comb.mux bin %621, %valid_1_2, %1678 : i1
    %1680 = comb.xor %1541, %true : i1
    %1681 = comb.or %323, %1680 : i1
    %1682 = comb.and %1681, %valid_1_3 : i1
    %1683 = comb.mux bin %1041, %1133, %1682 : i1
    %1684 = comb.mux bin %1035, %valid_1_3, %1683 : i1
    %1685 = comb.mux bin %614, %989, %1684 : i1
    %1686 = comb.mux bin %621, %valid_1_3, %1685 : i1
    %1687 = comb.xor %1541, %true : i1
    %1688 = comb.or %323, %1687 : i1
    %1689 = comb.and %1688, %valid_1_4 : i1
    %1690 = comb.mux bin %1041, %1136, %1689 : i1
    %1691 = comb.mux bin %1035, %valid_1_4, %1690 : i1
    %1692 = comb.mux bin %614, %990, %1691 : i1
    %1693 = comb.mux bin %621, %valid_1_4, %1692 : i1
    %1694 = comb.xor %1541, %true : i1
    %1695 = comb.or %323, %1694 : i1
    %1696 = comb.and %1695, %valid_1_5 : i1
    %1697 = comb.mux bin %1041, %1139, %1696 : i1
    %1698 = comb.mux bin %1035, %valid_1_5, %1697 : i1
    %1699 = comb.mux bin %614, %991, %1698 : i1
    %1700 = comb.mux bin %621, %valid_1_5, %1699 : i1
    %1701 = comb.xor %1541, %true : i1
    %1702 = comb.or %323, %1701 : i1
    %1703 = comb.and %1702, %valid_1_6 : i1
    %1704 = comb.mux bin %1041, %1142, %1703 : i1
    %1705 = comb.mux bin %1035, %valid_1_6, %1704 : i1
    %1706 = comb.mux bin %614, %992, %1705 : i1
    %1707 = comb.mux bin %621, %valid_1_6, %1706 : i1
    %1708 = comb.xor %1541, %true : i1
    %1709 = comb.or %323, %1708 : i1
    %1710 = comb.and %1709, %valid_1_7 : i1
    %1711 = comb.mux bin %1041, %1145, %1710 : i1
    %1712 = comb.mux bin %1035, %valid_1_7, %1711 : i1
    %1713 = comb.mux bin %614, %993, %1712 : i1
    %1714 = comb.mux bin %621, %valid_1_7, %1713 : i1
    %1715 = comb.xor %1541, %true : i1
    %1716 = comb.or %323, %1715 : i1
    %1717 = comb.and %1716, %valid_1_8 : i1
    %1718 = comb.mux bin %1041, %1148, %1717 : i1
    %1719 = comb.mux bin %1035, %valid_1_8, %1718 : i1
    %1720 = comb.mux bin %614, %994, %1719 : i1
    %1721 = comb.mux bin %621, %valid_1_8, %1720 : i1
    %1722 = comb.xor %1541, %true : i1
    %1723 = comb.or %323, %1722 : i1
    %1724 = comb.and %1723, %valid_1_9 : i1
    %1725 = comb.mux bin %1041, %1151, %1724 : i1
    %1726 = comb.mux bin %1035, %valid_1_9, %1725 : i1
    %1727 = comb.mux bin %614, %995, %1726 : i1
    %1728 = comb.mux bin %621, %valid_1_9, %1727 : i1
    %1729 = comb.xor %1541, %true : i1
    %1730 = comb.or %323, %1729 : i1
    %1731 = comb.and %1730, %valid_1_10 : i1
    %1732 = comb.mux bin %1041, %1154, %1731 : i1
    %1733 = comb.mux bin %1035, %valid_1_10, %1732 : i1
    %1734 = comb.mux bin %614, %996, %1733 : i1
    %1735 = comb.mux bin %621, %valid_1_10, %1734 : i1
    %1736 = comb.xor %1541, %true : i1
    %1737 = comb.or %323, %1736 : i1
    %1738 = comb.and %1737, %valid_1_11 : i1
    %1739 = comb.mux bin %1041, %1157, %1738 : i1
    %1740 = comb.mux bin %1035, %valid_1_11, %1739 : i1
    %1741 = comb.mux bin %614, %997, %1740 : i1
    %1742 = comb.mux bin %621, %valid_1_11, %1741 : i1
    %1743 = comb.xor %1541, %true : i1
    %1744 = comb.or %323, %1743 : i1
    %1745 = comb.and %1744, %valid_1_12 : i1
    %1746 = comb.mux bin %1041, %1160, %1745 : i1
    %1747 = comb.mux bin %1035, %valid_1_12, %1746 : i1
    %1748 = comb.mux bin %614, %998, %1747 : i1
    %1749 = comb.mux bin %621, %valid_1_12, %1748 : i1
    %1750 = comb.xor %1541, %true : i1
    %1751 = comb.or %323, %1750 : i1
    %1752 = comb.and %1751, %valid_1_13 : i1
    %1753 = comb.mux bin %1041, %1163, %1752 : i1
    %1754 = comb.mux bin %1035, %valid_1_13, %1753 : i1
    %1755 = comb.mux bin %614, %999, %1754 : i1
    %1756 = comb.mux bin %621, %valid_1_13, %1755 : i1
    %1757 = comb.xor %1541, %true : i1
    %1758 = comb.or %323, %1757 : i1
    %1759 = comb.and %1758, %valid_1_14 : i1
    %1760 = comb.mux bin %1041, %1166, %1759 : i1
    %1761 = comb.mux bin %1035, %valid_1_14, %1760 : i1
    %1762 = comb.mux bin %614, %1000, %1761 : i1
    %1763 = comb.mux bin %621, %valid_1_14, %1762 : i1
    %1764 = comb.xor %1541, %true : i1
    %1765 = comb.or %323, %1764 : i1
    %1766 = comb.and %1765, %valid_1_15 : i1
    %1767 = comb.mux bin %1041, %1169, %1766 : i1
    %1768 = comb.mux bin %1035, %valid_1_15, %1767 : i1
    %1769 = comb.mux bin %614, %1001, %1768 : i1
    %1770 = comb.mux bin %621, %valid_1_15, %1769 : i1
    %1771 = comb.xor %1541, %true : i1
    %1772 = comb.or %323, %1771 : i1
    %1773 = comb.and %1772, %valid_2_0 : i1
    %1774 = comb.mux bin %1041, %1172, %1773 : i1
    %1775 = comb.mux bin %1035, %valid_2_0, %1774 : i1
    %1776 = comb.mux bin %614, %1002, %1775 : i1
    %1777 = comb.mux bin %621, %valid_2_0, %1776 : i1
    %1778 = comb.xor %1541, %true : i1
    %1779 = comb.or %323, %1778 : i1
    %1780 = comb.and %1779, %valid_2_1 : i1
    %1781 = comb.mux bin %1041, %1175, %1780 : i1
    %1782 = comb.mux bin %1035, %valid_2_1, %1781 : i1
    %1783 = comb.mux bin %614, %1003, %1782 : i1
    %1784 = comb.mux bin %621, %valid_2_1, %1783 : i1
    %1785 = comb.xor %1541, %true : i1
    %1786 = comb.or %323, %1785 : i1
    %1787 = comb.and %1786, %valid_2_2 : i1
    %1788 = comb.mux bin %1041, %1178, %1787 : i1
    %1789 = comb.mux bin %1035, %valid_2_2, %1788 : i1
    %1790 = comb.mux bin %614, %1004, %1789 : i1
    %1791 = comb.mux bin %621, %valid_2_2, %1790 : i1
    %1792 = comb.xor %1541, %true : i1
    %1793 = comb.or %323, %1792 : i1
    %1794 = comb.and %1793, %valid_2_3 : i1
    %1795 = comb.mux bin %1041, %1181, %1794 : i1
    %1796 = comb.mux bin %1035, %valid_2_3, %1795 : i1
    %1797 = comb.mux bin %614, %1005, %1796 : i1
    %1798 = comb.mux bin %621, %valid_2_3, %1797 : i1
    %1799 = comb.xor %1541, %true : i1
    %1800 = comb.or %323, %1799 : i1
    %1801 = comb.and %1800, %valid_2_4 : i1
    %1802 = comb.mux bin %1041, %1184, %1801 : i1
    %1803 = comb.mux bin %1035, %valid_2_4, %1802 : i1
    %1804 = comb.mux bin %614, %1006, %1803 : i1
    %1805 = comb.mux bin %621, %valid_2_4, %1804 : i1
    %1806 = comb.xor %1541, %true : i1
    %1807 = comb.or %323, %1806 : i1
    %1808 = comb.and %1807, %valid_2_5 : i1
    %1809 = comb.mux bin %1041, %1187, %1808 : i1
    %1810 = comb.mux bin %1035, %valid_2_5, %1809 : i1
    %1811 = comb.mux bin %614, %1007, %1810 : i1
    %1812 = comb.mux bin %621, %valid_2_5, %1811 : i1
    %1813 = comb.xor %1541, %true : i1
    %1814 = comb.or %323, %1813 : i1
    %1815 = comb.and %1814, %valid_2_6 : i1
    %1816 = comb.mux bin %1041, %1190, %1815 : i1
    %1817 = comb.mux bin %1035, %valid_2_6, %1816 : i1
    %1818 = comb.mux bin %614, %1008, %1817 : i1
    %1819 = comb.mux bin %621, %valid_2_6, %1818 : i1
    %1820 = comb.xor %1541, %true : i1
    %1821 = comb.or %323, %1820 : i1
    %1822 = comb.and %1821, %valid_2_7 : i1
    %1823 = comb.mux bin %1041, %1193, %1822 : i1
    %1824 = comb.mux bin %1035, %valid_2_7, %1823 : i1
    %1825 = comb.mux bin %614, %1009, %1824 : i1
    %1826 = comb.mux bin %621, %valid_2_7, %1825 : i1
    %1827 = comb.xor %1541, %true : i1
    %1828 = comb.or %323, %1827 : i1
    %1829 = comb.and %1828, %valid_2_8 : i1
    %1830 = comb.mux bin %1041, %1196, %1829 : i1
    %1831 = comb.mux bin %1035, %valid_2_8, %1830 : i1
    %1832 = comb.mux bin %614, %1010, %1831 : i1
    %1833 = comb.mux bin %621, %valid_2_8, %1832 : i1
    %1834 = comb.xor %1541, %true : i1
    %1835 = comb.or %323, %1834 : i1
    %1836 = comb.and %1835, %valid_2_9 : i1
    %1837 = comb.mux bin %1041, %1199, %1836 : i1
    %1838 = comb.mux bin %1035, %valid_2_9, %1837 : i1
    %1839 = comb.mux bin %614, %1011, %1838 : i1
    %1840 = comb.mux bin %621, %valid_2_9, %1839 : i1
    %1841 = comb.xor %1541, %true : i1
    %1842 = comb.or %323, %1841 : i1
    %1843 = comb.and %1842, %valid_2_10 : i1
    %1844 = comb.mux bin %1041, %1202, %1843 : i1
    %1845 = comb.mux bin %1035, %valid_2_10, %1844 : i1
    %1846 = comb.mux bin %614, %1012, %1845 : i1
    %1847 = comb.mux bin %621, %valid_2_10, %1846 : i1
    %1848 = comb.xor %1541, %true : i1
    %1849 = comb.or %323, %1848 : i1
    %1850 = comb.and %1849, %valid_2_11 : i1
    %1851 = comb.mux bin %1041, %1205, %1850 : i1
    %1852 = comb.mux bin %1035, %valid_2_11, %1851 : i1
    %1853 = comb.mux bin %614, %1013, %1852 : i1
    %1854 = comb.mux bin %621, %valid_2_11, %1853 : i1
    %1855 = comb.xor %1541, %true : i1
    %1856 = comb.or %323, %1855 : i1
    %1857 = comb.and %1856, %valid_2_12 : i1
    %1858 = comb.mux bin %1041, %1208, %1857 : i1
    %1859 = comb.mux bin %1035, %valid_2_12, %1858 : i1
    %1860 = comb.mux bin %614, %1014, %1859 : i1
    %1861 = comb.mux bin %621, %valid_2_12, %1860 : i1
    %1862 = comb.xor %1541, %true : i1
    %1863 = comb.or %323, %1862 : i1
    %1864 = comb.and %1863, %valid_2_13 : i1
    %1865 = comb.mux bin %1041, %1211, %1864 : i1
    %1866 = comb.mux bin %1035, %valid_2_13, %1865 : i1
    %1867 = comb.mux bin %614, %1015, %1866 : i1
    %1868 = comb.mux bin %621, %valid_2_13, %1867 : i1
    %1869 = comb.xor %1541, %true : i1
    %1870 = comb.or %323, %1869 : i1
    %1871 = comb.and %1870, %valid_2_14 : i1
    %1872 = comb.mux bin %1041, %1214, %1871 : i1
    %1873 = comb.mux bin %1035, %valid_2_14, %1872 : i1
    %1874 = comb.mux bin %614, %1016, %1873 : i1
    %1875 = comb.mux bin %621, %valid_2_14, %1874 : i1
    %1876 = comb.xor %1541, %true : i1
    %1877 = comb.or %323, %1876 : i1
    %1878 = comb.and %1877, %valid_2_15 : i1
    %1879 = comb.mux bin %1041, %1217, %1878 : i1
    %1880 = comb.mux bin %1035, %valid_2_15, %1879 : i1
    %1881 = comb.mux bin %614, %1017, %1880 : i1
    %1882 = comb.mux bin %621, %valid_2_15, %1881 : i1
    %1883 = comb.xor %1541, %true : i1
    %1884 = comb.or %323, %1883 : i1
    %1885 = comb.and %1884, %valid_3_0 : i1
    %1886 = comb.mux bin %1041, %1220, %1885 : i1
    %1887 = comb.mux bin %1035, %valid_3_0, %1886 : i1
    %1888 = comb.mux bin %614, %1018, %1887 : i1
    %1889 = comb.mux bin %621, %valid_3_0, %1888 : i1
    %1890 = comb.xor %1541, %true : i1
    %1891 = comb.or %323, %1890 : i1
    %1892 = comb.and %1891, %valid_3_1 : i1
    %1893 = comb.mux bin %1041, %1223, %1892 : i1
    %1894 = comb.mux bin %1035, %valid_3_1, %1893 : i1
    %1895 = comb.mux bin %614, %1019, %1894 : i1
    %1896 = comb.mux bin %621, %valid_3_1, %1895 : i1
    %1897 = comb.xor %1541, %true : i1
    %1898 = comb.or %323, %1897 : i1
    %1899 = comb.and %1898, %valid_3_2 : i1
    %1900 = comb.mux bin %1041, %1226, %1899 : i1
    %1901 = comb.mux bin %1035, %valid_3_2, %1900 : i1
    %1902 = comb.mux bin %614, %1020, %1901 : i1
    %1903 = comb.mux bin %621, %valid_3_2, %1902 : i1
    %1904 = comb.xor %1541, %true : i1
    %1905 = comb.or %323, %1904 : i1
    %1906 = comb.and %1905, %valid_3_3 : i1
    %1907 = comb.mux bin %1041, %1229, %1906 : i1
    %1908 = comb.mux bin %1035, %valid_3_3, %1907 : i1
    %1909 = comb.mux bin %614, %1021, %1908 : i1
    %1910 = comb.mux bin %621, %valid_3_3, %1909 : i1
    %1911 = comb.xor %1541, %true : i1
    %1912 = comb.or %323, %1911 : i1
    %1913 = comb.and %1912, %valid_3_4 : i1
    %1914 = comb.mux bin %1041, %1232, %1913 : i1
    %1915 = comb.mux bin %1035, %valid_3_4, %1914 : i1
    %1916 = comb.mux bin %614, %1022, %1915 : i1
    %1917 = comb.mux bin %621, %valid_3_4, %1916 : i1
    %1918 = comb.xor %1541, %true : i1
    %1919 = comb.or %323, %1918 : i1
    %1920 = comb.and %1919, %valid_3_5 : i1
    %1921 = comb.mux bin %1041, %1235, %1920 : i1
    %1922 = comb.mux bin %1035, %valid_3_5, %1921 : i1
    %1923 = comb.mux bin %614, %1023, %1922 : i1
    %1924 = comb.mux bin %621, %valid_3_5, %1923 : i1
    %1925 = comb.xor %1541, %true : i1
    %1926 = comb.or %323, %1925 : i1
    %1927 = comb.and %1926, %valid_3_6 : i1
    %1928 = comb.mux bin %1041, %1238, %1927 : i1
    %1929 = comb.mux bin %1035, %valid_3_6, %1928 : i1
    %1930 = comb.mux bin %614, %1024, %1929 : i1
    %1931 = comb.mux bin %621, %valid_3_6, %1930 : i1
    %1932 = comb.xor %1541, %true : i1
    %1933 = comb.or %323, %1932 : i1
    %1934 = comb.and %1933, %valid_3_7 : i1
    %1935 = comb.mux bin %1041, %1241, %1934 : i1
    %1936 = comb.mux bin %1035, %valid_3_7, %1935 : i1
    %1937 = comb.mux bin %614, %1025, %1936 : i1
    %1938 = comb.mux bin %621, %valid_3_7, %1937 : i1
    %1939 = comb.xor %1541, %true : i1
    %1940 = comb.or %323, %1939 : i1
    %1941 = comb.and %1940, %valid_3_8 : i1
    %1942 = comb.mux bin %1041, %1244, %1941 : i1
    %1943 = comb.mux bin %1035, %valid_3_8, %1942 : i1
    %1944 = comb.mux bin %614, %1026, %1943 : i1
    %1945 = comb.mux bin %621, %valid_3_8, %1944 : i1
    %1946 = comb.xor %1541, %true : i1
    %1947 = comb.or %323, %1946 : i1
    %1948 = comb.and %1947, %valid_3_9 : i1
    %1949 = comb.mux bin %1041, %1247, %1948 : i1
    %1950 = comb.mux bin %1035, %valid_3_9, %1949 : i1
    %1951 = comb.mux bin %614, %1027, %1950 : i1
    %1952 = comb.mux bin %621, %valid_3_9, %1951 : i1
    %1953 = comb.xor %1541, %true : i1
    %1954 = comb.or %323, %1953 : i1
    %1955 = comb.and %1954, %valid_3_10 : i1
    %1956 = comb.mux bin %1041, %1250, %1955 : i1
    %1957 = comb.mux bin %1035, %valid_3_10, %1956 : i1
    %1958 = comb.mux bin %614, %1028, %1957 : i1
    %1959 = comb.mux bin %621, %valid_3_10, %1958 : i1
    %1960 = comb.xor %1541, %true : i1
    %1961 = comb.or %323, %1960 : i1
    %1962 = comb.and %1961, %valid_3_11 : i1
    %1963 = comb.mux bin %1041, %1253, %1962 : i1
    %1964 = comb.mux bin %1035, %valid_3_11, %1963 : i1
    %1965 = comb.mux bin %614, %1029, %1964 : i1
    %1966 = comb.mux bin %621, %valid_3_11, %1965 : i1
    %1967 = comb.xor %1541, %true : i1
    %1968 = comb.or %323, %1967 : i1
    %1969 = comb.and %1968, %valid_3_12 : i1
    %1970 = comb.mux bin %1041, %1256, %1969 : i1
    %1971 = comb.mux bin %1035, %valid_3_12, %1970 : i1
    %1972 = comb.mux bin %614, %1030, %1971 : i1
    %1973 = comb.mux bin %621, %valid_3_12, %1972 : i1
    %1974 = comb.xor %1541, %true : i1
    %1975 = comb.or %323, %1974 : i1
    %1976 = comb.and %1975, %valid_3_13 : i1
    %1977 = comb.mux bin %1041, %1259, %1976 : i1
    %1978 = comb.mux bin %1035, %valid_3_13, %1977 : i1
    %1979 = comb.mux bin %614, %1031, %1978 : i1
    %1980 = comb.mux bin %621, %valid_3_13, %1979 : i1
    %1981 = comb.xor %1541, %true : i1
    %1982 = comb.or %323, %1981 : i1
    %1983 = comb.and %1982, %valid_3_14 : i1
    %1984 = comb.mux bin %1041, %1262, %1983 : i1
    %1985 = comb.mux bin %1035, %valid_3_14, %1984 : i1
    %1986 = comb.mux bin %614, %1032, %1985 : i1
    %1987 = comb.mux bin %621, %valid_3_14, %1986 : i1
    %1988 = comb.xor %1541, %true : i1
    %1989 = comb.or %323, %1988 : i1
    %1990 = comb.and %1989, %valid_3_15 : i1
    %1991 = comb.mux bin %1041, %1265, %1990 : i1
    %1992 = comb.mux bin %1035, %valid_3_15, %1991 : i1
    %1993 = comb.mux bin %614, %1033, %1992 : i1
    %1994 = comb.mux bin %621, %valid_3_15, %1993 : i1
    %1995 = comb.mux bin %186, %c0_i3, %c3_i3 : i3
    %1996 = hw.array_create %state, %1995, %c0_i3, %1051, %1037, %1034, %608, %597 : i3
    %1997 = hw.array_get %1996[%state] : !hw.array<8xi3>, i3
    %1998 = comb.xor %186, %true : i1
    %1999 = comb.xor %1543, %true : i1
    %2000 = comb.and %1999, %1540, %1998 : i1
    %2001 = comb.or %2000, %axiWaddrEn : i1
    %2002 = comb.mux bin %1035, %1039, %2001 : i1
    %2003 = comb.mux bin %1055, %axiWaddrEn, %2002 : i1
    %2004 = comb.mux bin %322, %593, %2003 : i1
    %2005 = comb.xor %1540, %true : i1
    %2006 = comb.or %1544, %2005, %186 : i1
    %2007 = comb.mux bin %2006, %43, %182 : i2
    %2008 = comb.xor %1540, %true : i1
    %2009 = comb.or %1544, %2008, %186 : i1
    %2010 = comb.mux bin %2009, %48, %183 : i4
    hw.output %axiWaddrEn, %537, %axiWdataEn, %541, %542, %axiRaddrEn, %502, %239, %valid_r, %4, %flush_r : i1, i32, i1, i64, i1, i1, i32, i64, i1, i1, i1
  }
  hw.module private @ToAXI(in %clock : !seq.clock, in %reset : i1, in %io_dataIO_addr : i32, out io_dataIO_rdata : i64, out io_dataIO_rvalid : i1, in %io_dataIO_wdata : i64, in %io_dataIO_dc_mode : i5, out io_dataIO_ready : i1, in %io_outAxi_wa_ready : i1, out io_outAxi_wa_valid : i1, out io_outAxi_wa_bits_addr : i32, in %io_outAxi_wd_ready : i1, out io_outAxi_wd_valid : i1, out io_outAxi_wd_bits_data : i64, out io_outAxi_wd_bits_strb : i8, in %io_outAxi_ra_ready : i1, out io_outAxi_ra_valid : i1, out io_outAxi_ra_bits_addr : i32, out io_outAxi_rd_ready : i1, in %io_outAxi_rd_valid : i1, in %io_outAxi_rd_bits_data : i64) {
    %c0_i58 = hw.constant 0 : i58
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
    %false = hw.constant false
    %c0_i32 = hw.constant 0 : i32
    %c0_i3 = hw.constant 0 : i3
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
    %true = hw.constant true
    %c0_i8 = hw.constant 0 : i8
    %c0_i64 = hw.constant 0 : i64
    %waddrEn = seq.firreg %43 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64, sv.namehint = "waddrEn"} : i1
    %waddr = seq.firreg %4 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1 : ui64, sv.namehint = "waddr"} : i32
    %wdataEn = seq.firreg %52 clock %clock reset sync %reset, %false {firrtl.random_init_start = 44 : ui64, sv.namehint = "wdataEn"} : i1
    %wdata = seq.firreg %24 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 45 : ui64, sv.namehint = "wdata"} : i64
    %wstrb = seq.firreg %19 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 109 : ui64, sv.namehint = "wstrb"} : i8
    %raddrEn = seq.firreg %59 clock %clock reset sync %reset, %false {firrtl.random_init_start = 120 : ui64, sv.namehint = "raddrEn"} : i1
    %raddr = seq.firreg %31 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 121 : ui64, sv.namehint = "raddr"} : i32
    %rdataEn = seq.firreg %119 clock %clock reset sync %reset, %false {firrtl.random_init_start = 153 : ui64, sv.namehint = "rdataEn"} : i1
    %rdata = seq.firreg %115 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 154 : ui64} : i64
    %pre_addr = seq.firreg %37 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 218 : ui64} : i32
    %mode = seq.firreg %1 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 250 : ui64} : i5
    %state = seq.firreg %122 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 255 : ui64} : i3
    %0 = comb.icmp bin eq %state, %c0_i3 {sv.namehint = "io_dataIO_ready"} : i3
    %1 = comb.mux bin %0, %io_dataIO_dc_mode, %mode : i5
    %2 = comb.extract %io_dataIO_dc_mode from 3 : (i5) -> i1
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
    %25 = comb.extract %io_dataIO_dc_mode from 2 : (i5) -> i1
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
    %38 = comb.icmp bin eq %state, %c1_i3 : i3
    %39 = comb.and bin %waddrEn, %io_outAxi_wa_ready : i1
    %40 = comb.and bin %38, %39 : i1
    %41 = comb.xor %40, %true : i1
    %42 = comb.and %41, %waddrEn : i1
    %43 = comb.mux bin %0, %5, %42 : i1
    %44 = comb.mux bin %39, %c2_i3, %state : i3
    %45 = comb.icmp bin eq %state, %c2_i3 : i3
    %46 = comb.mux bin %io_outAxi_wd_ready, %c3_i3, %state : i3
    %47 = comb.icmp bin eq %state, %c3_i3 : i3
    %48 = comb.xor %47, %true : i1
    %49 = comb.and %48, %wdataEn : i1
    %50 = comb.or %45, %49 : i1
    %51 = comb.or bin %0, %38 : i1
    %52 = comb.mux bin %51, %wdataEn, %50 : i1
    %53 = comb.icmp bin eq %state, %c-4_i3 : i3
    %54 = comb.and bin %raddrEn, %io_outAxi_ra_ready : i1
    %55 = comb.and bin %53, %54 : i1
    %56 = comb.xor %55, %true : i1
    %57 = comb.or %38, %45, %47, %56 : i1
    %58 = comb.and %57, %raddrEn : i1
    %59 = comb.mux bin %0, %34, %58 : i1
    %60 = comb.mux bin %54, %c-3_i3, %state : i3
    %61 = comb.icmp bin eq %state, %c-3_i3 : i3
    %62 = comb.and bin %rdataEn, %io_outAxi_rd_valid : i1
    %63 = comb.extract %pre_addr from 0 {sv.namehint = "strb_offset"} : (i32) -> i3
    %64 = comb.icmp bin eq %mode, %c4_i5 : i5
    %65 = comb.concat %c0_i58, %63, %c0_i3 : i58, i3, i3
    %66 = comb.shru bin %io_outAxi_rd_bits_data, %65 {sv.namehint = "_tem_rdata_T_1"} : i64
    %67 = comb.extract %66 from 0 {sv.namehint = "_tem_rdata_T_2"} : (i64) -> i8
    %68 = comb.extract %66 from 7 : (i64) -> i1
    %69 = comb.replicate %68 : (i1) -> i56
    %70 = comb.concat %69, %67 : i56, i8
    %71 = comb.icmp bin eq %mode, %c5_i5 : i5
    %72 = comb.concat %c0_i58, %63, %c0_i3 : i58, i3, i3
    %73 = comb.shru bin %io_outAxi_rd_bits_data, %72 {sv.namehint = "_tem_rdata_T_5"} : i64
    %74 = comb.extract %73 from 0 {sv.namehint = "_tem_rdata_T_6"} : (i64) -> i16
    %75 = comb.extract %73 from 15 : (i64) -> i1
    %76 = comb.replicate %75 : (i1) -> i48
    %77 = comb.concat %76, %74 : i48, i16
    %78 = comb.icmp bin eq %mode, %c6_i5 : i5
    %79 = comb.concat %c0_i58, %63, %c0_i3 : i58, i3, i3
    %80 = comb.shru bin %io_outAxi_rd_bits_data, %79 {sv.namehint = "_tem_rdata_T_9"} : i64
    %81 = comb.extract %80 from 0 {sv.namehint = "_tem_rdata_T_10"} : (i64) -> i32
    %82 = comb.extract %80 from 31 : (i64) -> i1
    %83 = comb.replicate %82 : (i1) -> i32
    %84 = comb.concat %83, %81 : i32, i32
    %85 = comb.mux bin %78, %84, %c0_i64 : i64
    %86 = comb.mux bin %71, %77, %85 : i64
    %87 = comb.mux bin %64, %70, %86 {sv.namehint = "tem_rdata"} : i64
    %88 = comb.icmp bin eq %mode, %c7_i5 : i5
    %89 = comb.icmp bin eq %mode, %c-12_i5 : i5
    %90 = comb.concat %c0_i58, %63, %c0_i3 : i58, i3, i3
    %91 = comb.shru bin %io_outAxi_rd_bits_data, %90 {sv.namehint = "_rdata_T_4"} : i64
    %92 = comb.extract %91 from 0 {sv.namehint = "_rdata_T_5"} : (i64) -> i8
    %93 = comb.concat %c0_i56, %92 : i56, i8
    %94 = comb.icmp bin eq %mode, %c-11_i5 : i5
    %95 = comb.concat %c0_i58, %63, %c0_i3 : i58, i3, i3
    %96 = comb.shru bin %io_outAxi_rd_bits_data, %95 {sv.namehint = "_rdata_T_7"} : i64
    %97 = comb.extract %96 from 0 {sv.namehint = "_rdata_T_8"} : (i64) -> i16
    %98 = comb.concat %c0_i48, %97 : i48, i16
    %99 = comb.icmp bin eq %mode, %c-10_i5 : i5
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
    %out_rdata = seq.firreg %rdata clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 258 : ui64, sv.namehint = "out_rdata"} : i64
    %out_valid = seq.firreg %125 clock %clock reset sync %reset, %false {firrtl.random_init_start = 322 : ui64, sv.namehint = "out_valid"} : i1
    %123 = comb.icmp bin eq %state, %c-2_i3 {sv.namehint = "_out_valid_T"} : i3
    %124 = comb.icmp bin eq %state, %c3_i3 {sv.namehint = "_out_valid_T_1"} : i3
    %125 = comb.or bin %123, %124 {sv.namehint = "_out_valid_T_2"} : i1
    hw.output %out_rdata, %out_valid, %0, %waddrEn, %waddr, %wdataEn, %wdata, %wstrb, %raddrEn, %raddr, %rdataEn : i64, i1, i1, i1, i32, i1, i64, i8, i1, i32, i1
  }
  hw.module private @CrossBar(in %clock : !seq.clock, in %reset : i1, out io_icAxi_ra_ready : i1, in %io_icAxi_ra_valid : i1, in %io_icAxi_ra_bits_addr : i32, out io_icAxi_rd_valid : i1, out io_icAxi_rd_bits_data : i64, out io_icAxi_rd_bits_last : i1, out io_flashAxi_wa_ready : i1, in %io_flashAxi_wa_valid : i1, in %io_flashAxi_wa_bits_addr : i32, out io_flashAxi_wd_ready : i1, in %io_flashAxi_wd_valid : i1, in %io_flashAxi_wd_bits_data : i64, in %io_flashAxi_wd_bits_strb : i8, out io_flashAxi_ra_ready : i1, in %io_flashAxi_ra_valid : i1, in %io_flashAxi_ra_bits_addr : i32, in %io_flashAxi_rd_ready : i1, out io_flashAxi_rd_valid : i1, out io_flashAxi_rd_bits_data : i64, out io_memAxi_wa_ready : i1, in %io_memAxi_wa_valid : i1, in %io_memAxi_wa_bits_addr : i32, out io_memAxi_wd_ready : i1, in %io_memAxi_wd_valid : i1, in %io_memAxi_wd_bits_data : i64, in %io_memAxi_wd_bits_last : i1, out io_memAxi_ra_ready : i1, in %io_memAxi_ra_valid : i1, in %io_memAxi_ra_bits_addr : i32, out io_memAxi_rd_valid : i1, out io_memAxi_rd_bits_data : i64, out io_memAxi_rd_bits_last : i1, out io_mmioAxi_wa_ready : i1, in %io_mmioAxi_wa_valid : i1, in %io_mmioAxi_wa_bits_addr : i32, out io_mmioAxi_wd_ready : i1, in %io_mmioAxi_wd_valid : i1, in %io_mmioAxi_wd_bits_data : i64, in %io_mmioAxi_wd_bits_strb : i8, out io_mmioAxi_ra_ready : i1, in %io_mmioAxi_ra_valid : i1, in %io_mmioAxi_ra_bits_addr : i32, in %io_mmioAxi_rd_ready : i1, out io_mmioAxi_rd_valid : i1, out io_mmioAxi_rd_bits_data : i64, in %io_outAxi_wa_ready : i1, out io_outAxi_wa_valid : i1, out io_outAxi_wa_bits_addr : i32, out io_outAxi_wa_bits_len : i8, in %io_outAxi_wd_ready : i1, out io_outAxi_wd_valid : i1, out io_outAxi_wd_bits_data : i64, out io_outAxi_wd_bits_strb : i8, out io_outAxi_wd_bits_last : i1, in %io_outAxi_ra_ready : i1, out io_outAxi_ra_valid : i1, out io_outAxi_ra_bits_addr : i32, out io_outAxi_ra_bits_len : i8, out io_outAxi_rd_ready : i1, in %io_outAxi_rd_valid : i1, in %io_outAxi_rd_bits_data : i64, in %io_outAxi_rd_bits_last : i1, in %io_selectMem : i1) {
    %c1_i4 = hw.constant 1 : i4
    %c7_i4 = hw.constant 7 : i4
    %c5_i4 = hw.constant 5 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c4_i4 = hw.constant 4 : i4
    %c6_i4 = hw.constant 6 : i4
    %c-8_i4 = hw.constant -8 : i4
    %c-1_i8 = hw.constant -1 : i8
    %c7_i8 = hw.constant 7 : i8
    %true = hw.constant true
    %c0_i64 = hw.constant 0 : i64
    %c0_i8 = hw.constant 0 : i8
    %c0_i32 = hw.constant 0 : i32
    %c0_i4 = hw.constant 0 : i4
    %false = hw.constant false
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
    %9 = comb.and bin %112, %io_flashAxi_rd_ready, %107, %104, %io_outAxi_rd_bits_last {sv.namehint = "flashDone"} : i1
    %10 = comb.and bin %io_mmioAxi_ra_valid, %154 {sv.namehint = "_mmioTrans_T"} : i1
    %11 = comb.and bin %io_mmioAxi_wa_valid, %202 {sv.namehint = "_mmioTrans_T_1"} : i1
    %12 = comb.or bin %10, %11 {sv.namehint = "mmioTrans"} : i1
    %13 = comb.and bin %130, %io_mmioAxi_rd_ready, %125, %123, %io_outAxi_rd_bits_last {sv.namehint = "_mmioDone_T_1"} : i1
    %14 = comb.and bin %io_mmioAxi_wd_valid, %183 {sv.namehint = "_mmioDone_T_2"} : i1
    %15 = comb.or bin %13, %14 {sv.namehint = "mmioDone"} : i1
    %16 = comb.icmp bin eq %state, %c0_i4 : i4
    %17 = comb.or %io_selectMem, %selectMem_r : i1
    %18 = comb.or bin %io_mmioAxi_ra_valid, %io_mmioAxi_wa_valid : i1
    %19 = comb.mux bin %io_icAxi_ra_valid, %c2_i4, %state : i4
    %20 = comb.mux bin %io_flashAxi_ra_valid, %c5_i4, %19 : i4
    %21 = comb.mux bin %18, %c7_i4, %20 : i4
    %22 = comb.or bin %io_selectMem, %io_memAxi_ra_valid, %io_memAxi_wa_valid : i1
    %23 = comb.mux bin %22, %c1_i4, %21 : i4
    %24 = comb.icmp bin eq %state, %c1_i4 : i4
    %25 = comb.xor bin %io_selectMem, %true : i1
    %26 = comb.and bin %selectMem_r, %25 : i1
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
    %56 = comb.icmp bin eq %state, %c3_i4 : i4
    %57 = comb.and %56, %io_outAxi_rd_bits_last : i1
    %58 = comb.mux bin %24, %30, %57 : i1
    %59 = comb.xor %16, %true : i1
    %60 = comb.and %59, %58 {sv.namehint = "io_memAxi_rd_bits_last"} : i1
    %61 = comb.mux bin %56, %io_outAxi_rd_bits_data, %c0_i64 : i64
    %62 = comb.mux bin %24, %31, %61 : i64
    %63 = comb.mux bin %16, %c0_i64, %62 {sv.namehint = "io_memAxi_rd_bits_data"} : i64
    %64 = comb.and %56, %io_outAxi_rd_valid : i1
    %65 = comb.mux bin %24, %33, %64 : i1
    %66 = comb.xor %16, %true : i1
    %67 = comb.and %66, %65 {sv.namehint = "io_memAxi_rd_valid"} : i1
    %68 = comb.and %56, %io_outAxi_ra_ready : i1
    %69 = comb.mux bin %24, %40, %68 : i1
    %70 = comb.xor %16, %true : i1
    %71 = comb.and %70, %69 {sv.namehint = "io_memAxi_ra_ready"} : i1
    %72 = comb.and %56, %io_outAxi_wd_ready : i1
    %73 = comb.mux bin %24, %48, %72 : i1
    %74 = comb.xor %16, %true : i1
    %75 = comb.and %74, %73 {sv.namehint = "io_memAxi_wd_ready"} : i1
    %76 = comb.and %56, %io_outAxi_wa_ready : i1
    %77 = comb.mux bin %24, %53, %76 : i1
    %78 = comb.xor %16, %true : i1
    %79 = comb.and %78, %77 {sv.namehint = "io_memAxi_wa_ready"} : i1
    %80 = comb.mux bin %5, %c0_i4, %state : i4
    %81 = comb.and bin %56, %5 : i1
    %82 = comb.xor %81, %true : i1
    %83 = comb.and %82, %selectMem_r : i1
    %84 = comb.mux bin %24, %28, %83 : i1
    %85 = comb.mux bin %16, %17, %84 : i1
    %86 = comb.icmp bin eq %state, %c2_i4 : i4
    %87 = comb.mux bin %6, %c4_i4, %state : i4
    %88 = comb.icmp bin eq %state, %c4_i4 : i4
    %89 = comb.or bin %86, %88 : i1
    %90 = comb.or bin %16, %24, %56 : i1
    %91 = comb.xor %90, %true : i1
    %92 = comb.and %91, %89, %io_outAxi_rd_bits_last {sv.namehint = "io_icAxi_rd_bits_last"} : i1
    %93 = comb.xor %89, %true : i1
    %94 = comb.or %90, %93 : i1
    %95 = comb.mux bin %94, %c0_i64, %io_outAxi_rd_bits_data {sv.namehint = "io_icAxi_rd_bits_data"} : i64
    %96 = comb.xor %90, %true : i1
    %97 = comb.and %96, %89, %io_outAxi_rd_valid {sv.namehint = "io_icAxi_rd_valid"} : i1
    %98 = comb.xor %90, %true : i1
    %99 = comb.and %98, %89, %io_outAxi_ra_ready {sv.namehint = "io_icAxi_ra_ready"} : i1
    %100 = comb.mux bin %7, %c0_i4, %state : i4
    %101 = comb.icmp bin eq %state, %c5_i4 : i4
    %102 = comb.mux bin %8, %c6_i4, %state : i4
    %103 = comb.icmp bin eq %state, %c6_i4 : i4
    %104 = comb.or bin %101, %103 : i1
    %105 = comb.or bin %56, %89 : i1
    %106 = comb.or bin %16, %24, %105 : i1
    %107 = comb.xor %106, %true : i1
    %108 = comb.xor %104, %true : i1
    %109 = comb.or %106, %108 : i1
    %110 = comb.mux bin %109, %c0_i64, %io_outAxi_rd_bits_data {sv.namehint = "io_flashAxi_rd_bits_data"} : i64
    %111 = comb.xor %106, %true : i1
    %112 = comb.and %111, %104, %io_outAxi_rd_valid {sv.namehint = "io_flashAxi_rd_valid"} : i1
    %113 = comb.xor %106, %true : i1
    %114 = comb.and %113, %104, %io_outAxi_ra_ready {sv.namehint = "io_flashAxi_ra_ready"} : i1
    %115 = comb.xor %106, %true : i1
    %116 = comb.and %115, %104, %io_outAxi_wd_ready {sv.namehint = "io_flashAxi_wd_ready"} : i1
    %117 = comb.xor %106, %true : i1
    %118 = comb.and %117, %104, %io_outAxi_wa_ready {sv.namehint = "io_flashAxi_wa_ready"} : i1
    %119 = comb.mux bin %9, %c0_i4, %state : i4
    %120 = comb.icmp bin eq %state, %c7_i4 : i4
    %121 = comb.mux bin %12, %c-8_i4, %state : i4
    %122 = comb.icmp bin eq %state, %c-8_i4 : i4
    %123 = comb.or bin %120, %122 : i1
    %124 = comb.or bin %16, %24, %56, %86, %88, %104 : i1
    %125 = comb.xor %124, %true : i1
    %126 = comb.xor %123, %true : i1
    %127 = comb.or %124, %126 : i1
    %128 = comb.mux bin %127, %c0_i64, %io_outAxi_rd_bits_data {sv.namehint = "io_mmioAxi_rd_bits_data"} : i64
    %129 = comb.xor %124, %true : i1
    %130 = comb.and %129, %123, %io_outAxi_rd_valid {sv.namehint = "io_mmioAxi_rd_valid"} : i1
    %131 = comb.and %123, %io_mmioAxi_rd_ready : i1
    %132 = comb.mux bin %104, %io_flashAxi_rd_ready, %131 : i1
    %133 = comb.or %105, %132 : i1
    %134 = comb.mux bin %24, %34, %133 : i1
    %135 = comb.xor %16, %true : i1
    %136 = comb.and %135, %134 {sv.namehint = "io_outAxi_rd_ready"} : i1
    %137 = comb.mux bin %105, %c7_i8, %c0_i8 : i8
    %138 = comb.mux bin %24, %35, %137 : i8
    %139 = comb.mux bin %16, %c0_i8, %138 {sv.namehint = "io_outAxi_ra_bits_len"} : i8
    %140 = comb.mux bin %123, %io_mmioAxi_ra_bits_addr, %c0_i32 : i32
    %141 = comb.mux bin %104, %io_flashAxi_ra_bits_addr, %140 : i32
    %142 = comb.mux bin %89, %io_icAxi_ra_bits_addr, %141 : i32
    %143 = comb.mux bin %56, %io_memAxi_ra_bits_addr, %142 : i32
    %144 = comb.mux bin %24, %36, %143 : i32
    %145 = comb.mux bin %16, %c0_i32, %144 {sv.namehint = "io_outAxi_ra_bits_addr"} : i32
    %146 = comb.and %123, %io_mmioAxi_ra_valid : i1
    %147 = comb.mux bin %104, %io_flashAxi_ra_valid, %146 : i1
    %148 = comb.mux bin %89, %io_icAxi_ra_valid, %147 : i1
    %149 = comb.mux bin %56, %io_memAxi_ra_valid, %148 : i1
    %150 = comb.mux bin %24, %38, %149 : i1
    %151 = comb.xor %16, %true : i1
    %152 = comb.and %151, %150 {sv.namehint = "io_outAxi_ra_valid"} : i1
    %153 = comb.xor %124, %true : i1
    %154 = comb.and %153, %123, %io_outAxi_ra_ready {sv.namehint = "io_mmioAxi_ra_ready"} : i1
    %155 = comb.or %104, %123 : i1
    %156 = comb.xor %89, %true : i1
    %157 = comb.and %156, %155 : i1
    %158 = comb.mux bin %56, %io_memAxi_wd_bits_last, %157 : i1
    %159 = comb.mux bin %24, %42, %158 : i1
    %160 = comb.xor %16, %true : i1
    %161 = comb.and %160, %159 {sv.namehint = "io_outAxi_wd_bits_last"} : i1
    %162 = comb.mux bin %123, %io_mmioAxi_wd_bits_strb, %c0_i8 : i8
    %163 = comb.mux bin %104, %io_flashAxi_wd_bits_strb, %162 : i8
    %164 = comb.mux bin %89, %c0_i8, %163 : i8
    %165 = comb.mux bin %56, %c-1_i8, %164 : i8
    %166 = comb.mux bin %24, %43, %165 : i8
    %167 = comb.mux bin %16, %c0_i8, %166 {sv.namehint = "io_outAxi_wd_bits_strb"} : i8
    %168 = comb.mux bin %123, %io_mmioAxi_wd_bits_data, %c0_i64 : i64
    %169 = comb.mux bin %104, %io_flashAxi_wd_bits_data, %168 : i64
    %170 = comb.mux bin %89, %c0_i64, %169 : i64
    %171 = comb.mux bin %56, %io_memAxi_wd_bits_data, %170 : i64
    %172 = comb.mux bin %24, %44, %171 : i64
    %173 = comb.mux bin %16, %c0_i64, %172 {sv.namehint = "io_outAxi_wd_bits_data"} : i64
    %174 = comb.and %123, %io_mmioAxi_wd_valid : i1
    %175 = comb.mux bin %104, %io_flashAxi_wd_valid, %174 : i1
    %176 = comb.xor %89, %true : i1
    %177 = comb.and %176, %175 : i1
    %178 = comb.mux bin %56, %io_memAxi_wd_valid, %177 : i1
    %179 = comb.mux bin %24, %46, %178 : i1
    %180 = comb.xor %16, %true : i1
    %181 = comb.and %180, %179 {sv.namehint = "io_outAxi_wd_valid"} : i1
    %182 = comb.xor %124, %true : i1
    %183 = comb.and %182, %123, %io_outAxi_wd_ready {sv.namehint = "io_mmioAxi_wd_ready"} : i1
    %184 = comb.mux bin %56, %c7_i8, %c0_i8 : i8
    %185 = comb.mux bin %24, %35, %184 : i8
    %186 = comb.mux bin %16, %c0_i8, %185 {sv.namehint = "io_outAxi_wa_bits_len"} : i8
    %187 = comb.mux bin %123, %io_mmioAxi_wa_bits_addr, %c0_i32 : i32
    %188 = comb.mux bin %104, %io_flashAxi_wa_bits_addr, %187 : i32
    %189 = comb.mux bin %89, %c0_i32, %188 : i32
    %190 = comb.mux bin %56, %io_memAxi_wa_bits_addr, %189 : i32
    %191 = comb.mux bin %24, %49, %190 : i32
    %192 = comb.mux bin %16, %c0_i32, %191 {sv.namehint = "io_outAxi_wa_bits_addr"} : i32
    %193 = comb.and %123, %io_mmioAxi_wa_valid : i1
    %194 = comb.mux bin %104, %io_flashAxi_wa_valid, %193 : i1
    %195 = comb.xor %89, %true : i1
    %196 = comb.and %195, %194 : i1
    %197 = comb.mux bin %56, %io_memAxi_wa_valid, %196 : i1
    %198 = comb.mux bin %24, %51, %197 : i1
    %199 = comb.xor %16, %true : i1
    %200 = comb.and %199, %198 {sv.namehint = "io_outAxi_wa_valid"} : i1
    %201 = comb.xor %124, %true : i1
    %202 = comb.and %201, %123, %io_outAxi_wa_ready {sv.namehint = "io_mmioAxi_wa_ready"} : i1
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
  hw.module private @FetchCrossBar(in %clock : !seq.clock, in %reset : i1, in %io_instIO_addr : i32, out io_instIO_inst : i64, in %io_instIO_arvalid : i1, out io_instIO_rvalid : i1, out io_icRead_addr : i32, in %io_icRead_inst : i64, out io_icRead_arvalid : i1, in %io_icRead_rvalid : i1, out io_flashRead_addr : i32, in %io_flashRead_rdata : i64, in %io_flashRead_rvalid : i1, out io_flashRead_dc_mode : i5) {
    %true = hw.constant true
    %false = hw.constant false
    %c7_i5 = hw.constant 7 : i5
    %c0_i5 = hw.constant 0 : i5
    %pre_mem = seq.firreg %1 clock %clock reset sync %reset, %false {firrtl.random_init_start = 0 : ui64} : i1
    %0 = comb.extract %io_instIO_addr from 31 {sv.namehint = "inp_mem"} : (i32) -> i1
    %1 = comb.mux bin %io_instIO_arvalid, %0, %pre_mem : i1
    %2 = comb.and %io_instIO_arvalid, %0 {sv.namehint = "io_icRead_arvalid"} : i1
    %3 = comb.xor %io_instIO_arvalid, %true : i1
    %4 = comb.or %3, %0 : i1
    %5 = comb.mux bin %4, %c0_i5, %c7_i5 {sv.namehint = "io_flashRead_dc_mode"} : i5
    %6 = comb.mux bin %pre_mem, %io_icRead_inst, %io_flashRead_rdata {sv.namehint = "io_instIO_inst"} : i64
    %7 = comb.mux bin %pre_mem, %io_icRead_rvalid, %io_flashRead_rvalid {sv.namehint = "io_instIO_rvalid"} : i1
    hw.output %6, %7, %io_instIO_addr, %2, %io_instIO_addr, %5 : i64, i1, i32, i1, i32, i5
  }
  hw.module private @Splite64to32(in %clock : !seq.clock, in %reset : i1, in %io_data_in_addr : i32, out io_data_in_rdata : i64, out io_data_in_rvalid : i1, in %io_data_in_dc_mode : i5, out io_data_out_addr : i32, in %io_data_out_rdata : i64, in %io_data_out_rvalid : i1, out io_data_out_dc_mode : i5, in %io_data_out_ready : i1) {
    %c4_i32 = hw.constant 4 : i32
    %c0_i32 = hw.constant 0 : i32
    %false = hw.constant false
    %true = hw.constant true
    %c0_i3 = hw.constant 0 : i3
    %c-10_i5 = hw.constant -10 : i5
    %c0_i5 = hw.constant 0 : i5
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
    %7 = comb.mux bin %is_64, %6, %io_data_out_rdata {sv.namehint = "io_data_in_rdata"} : i64
    %8 = comb.xor bin %state, %true : i1
    %9 = comb.icmp bin ne %io_data_in_dc_mode, %c0_i5 : i5
    %10 = comb.extract %io_data_in_addr from 3 {sv.namehint = "addr_r_hi"} : (i32) -> i29
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
    %27 = comb.and %8, %busy, %io_data_out_rvalid {sv.namehint = "io_data_in_rvalid"} : i1
    %28 = comb.extract %io_data_out_rdata from 0 : (i64) -> i32
    %29 = comb.and %state, %io_data_out_rvalid : i1
    %30 = comb.mux bin %29, %28, %data_buf : i32
    %31 = comb.add %addr_r, %c4_i32 {sv.namehint = "_io_data_out_addr_T_1"} : i32
    %32 = comb.mux bin %state, %31, %12 {sv.namehint = "io_data_out_addr"} : i32
    %33 = comb.or %state, %9 : i1
    %34 = comb.mux bin %33, %c-10_i5, %c0_i5 {sv.namehint = "io_data_out_dc_mode"} : i5
    %35 = comb.and bin %state, %4 : i1
    %36 = comb.xor %35, %true : i1
    %37 = comb.and %36, %state : i1
    %38 = comb.mux bin %state, %37, %14 : i1
    hw.output %7, %27, %32, %34 : i64, i1, i32, i5
  }
  hw.module private @MemCrossBar(in %clock : !seq.clock, in %reset : i1, in %io_dataRW_addr : i32, out io_dataRW_rdata : i64, out io_dataRW_rvalid : i1, in %io_dataRW_wdata : i64, in %io_dataRW_dc_mode : i5, in %io_dataRW_amo : i5, out io_dataRW_ready : i1, out io_mmio_addr : i32, in %io_mmio_rdata : i64, in %io_mmio_rvalid : i1, out io_mmio_wdata : i64, out io_mmio_dc_mode : i5, in %io_mmio_ready : i1, out io_dcRW_addr : i32, in %io_dcRW_rdata : i64, in %io_dcRW_rvalid : i1, out io_dcRW_wdata : i64, out io_dcRW_dc_mode : i5, out io_dcRW_amo : i5, in %io_dcRW_ready : i1, out io_clintIO_addr : i32, in %io_clintIO_rdata : i64, out io_clintIO_wdata : i64, out io_clintIO_wvalid : i1, out io_plicIO_addr : i32, in %io_plicIO_rdata : i64, out io_plicIO_wdata : i64, out io_plicIO_wvalid : i1, out io_plicIO_arvalid : i1) {
    %true = hw.constant true
    %c268435456_i32 = hw.constant 268435456 : i32
    %c201326591_i32 = hw.constant 201326591 : i32
    %c0_i2 = hw.constant 0 : i2
    %c0_i64 = hw.constant 0 : i64
    %false = hw.constant false
    %c33603576_i32 = hw.constant 33603576 : i32
    %c33570816_i32 = hw.constant 33570816 : i32
    %c33554432_i32 = hw.constant 33554432 : i32
    %c-1879048192_i32 = hw.constant -1879048192 : i32
    %c0_i5 = hw.constant 0 : i5
    %c-2_i2 = hw.constant -2 : i2
    %c-1_i2 = hw.constant -1 : i2
    %c1_i2 = hw.constant 1 : i2
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
    %10 = comb.icmp bin ne %io_dataRW_dc_mode, %c0_i5 : i5
    %11 = comb.extract %io_dataRW_dc_mode from 3 {sv.namehint = "_io_clintIO_wvalid_T"} : (i5) -> i1
    %12 = comb.and %10, %3, %11 {sv.namehint = "io_clintIO_wvalid"} : i1
    %13 = comb.extract %io_dataRW_dc_mode from 2 {sv.namehint = "_io_plicIO_arvalid_T"} : (i5) -> i1
    %14 = comb.xor %3, %true : i1
    %15 = comb.and %10, %14, %6, %13 {sv.namehint = "io_plicIO_arvalid"} : i1
    %16 = comb.extract %io_dataRW_dc_mode from 3 {sv.namehint = "_io_plicIO_wvalid_T"} : (i5) -> i1
    %17 = comb.xor %3, %true : i1
    %18 = comb.and %10, %17, %6, %16 {sv.namehint = "io_plicIO_wvalid"} : i1
    %19 = comb.mux bin %6, %io_plicIO_rdata, %data_r : i64
    %20 = comb.mux bin %3, %io_clintIO_rdata, %19 : i64
    %21 = comb.mux bin %10, %20, %data_r : i64
    %22 = comb.or bin %3, %6 : i1
    %23 = comb.and bin %10, %22 : i1
    %24 = comb.or %23, %data_valid : i1
    %25 = comb.xor %9, %true : i1
    %26 = comb.xor %10, %true : i1
    %27 = comb.or %26, %22, %25 : i1
    %28 = comb.mux bin %27, %c0_i5, %io_dataRW_dc_mode {sv.namehint = "io_dcRW_dc_mode"} : i5
    %29 = comb.concat %false, %9 : i1, i1
    %30 = comb.mux bin %6, %c-1_i2, %29 : i2
    %31 = comb.mux bin %3, %c-2_i2, %30 : i2
    %32 = comb.mux bin %10, %31, %pre_type : i2
    %33 = comb.xor %10, %true : i1
    %34 = comb.or %33, %3, %6, %9 : i1
    %35 = comb.mux bin %34, %c0_i5, %io_dataRW_dc_mode {sv.namehint = "io_mmio_dc_mode"} : i5
    %36 = comb.mux bin %9, %io_dcRW_ready, %io_mmio_ready : i1
    %37 = comb.xor %22, %true : i1
    %38 = comb.and %10, %37, %36 {sv.namehint = "io_dataRW_ready"} : i1
    %39 = comb.icmp bin eq %pre_type, %c-2_i2 : i2
    %40 = comb.icmp bin eq %pre_type, %c-1_i2 : i2
    %41 = comb.or bin %39, %40 : i1
    %42 = comb.and bin %41, %data_valid : i1
    %43 = comb.xor %42, %true : i1
    %44 = comb.and %43, %24 : i1
    %45 = comb.icmp bin eq %pre_type, %c1_i2 : i2
    %46 = comb.icmp bin eq %pre_type, %c0_i2 : i2
    %47 = comb.mux bin %46, %io_mmio_rdata, %c0_i64 : i64
    %48 = comb.mux bin %45, %io_dcRW_rdata, %47 : i64
    %49 = comb.mux bin %42, %data_r, %48 {sv.namehint = "io_dataRW_rdata"} : i64
    %50 = comb.and %46, %io_mmio_rvalid : i1
    %51 = comb.mux bin %45, %io_dcRW_rvalid, %50 : i1
    %52 = comb.or %42, %51 {sv.namehint = "io_dataRW_rvalid"} : i1
    hw.output %49, %52, %38, %io_dataRW_addr, %io_dataRW_wdata, %35, %io_dataRW_addr, %io_dataRW_wdata, %28, %io_dataRW_amo, %io_dataRW_addr, %io_dataRW_wdata, %12, %io_dataRW_addr, %io_dataRW_wdata, %18, %15 : i64, i1, i1, i32, i64, i5, i32, i64, i5, i5, i32, i64, i1, i32, i64, i1, i1
  }
  hw.module private @MaxPeriodFibonacciLFSR_2(in %clock : !seq.clock, in %reset : i1, out io_out_0 : i1, out io_out_1 : i1, out io_out_2 : i1, out io_out_3 : i1) {
    %true = hw.constant true
    %false = hw.constant false
    %state_0 = seq.firreg %0 clock %clock reset sync %reset, %true {firrtl.random_init_start = 0 : ui64, sv.namehint = "state_0"} : i1
    %state_1 = seq.firreg %state_0 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1 : ui64, sv.namehint = "state_1"} : i1
    %state_2 = seq.firreg %state_1 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2 : ui64, sv.namehint = "state_2"} : i1
    %state_3 = seq.firreg %state_2 clock %clock reset sync %reset, %false {firrtl.random_init_start = 3 : ui64, sv.namehint = "state_3"} : i1
    %0 = comb.xor bin %state_3, %state_2 : i1
    hw.output %state_0, %state_1, %state_2, %state_3 : i1, i1, i1, i1
  }
  hw.module private @TLB(in %clock : !seq.clock, in %reset : i1, in %io_va2pa_vaddr : i64, in %io_va2pa_vvalid : i1, out io_va2pa_paddr : i32, out io_va2pa_pvalid : i1, out io_va2pa_tlb_excep_cause : i64, out io_va2pa_tlb_excep_tval : i64, out io_va2pa_tlb_excep_en : i1, in %io_mmuState_priv : i2, in %io_mmuState_mstatus : i64, in %io_mmuState_satp : i64, in %io_flush : i1, out io_dcacheRW_addr : i32, in %io_dcacheRW_rdata : i64, in %io_dcacheRW_rvalid : i1, out io_dcacheRW_wdata : i64, out io_dcacheRW_dc_mode : i5, in %io_dcacheRW_ready : i1) {
    %c-262144_i20 = hw.constant -262144 : i20
    %c-512_i20 = hw.constant -512 : i20
    %c-9_i8 = hw.constant -9 : i8
    %c-1_i12 = hw.constant -1 : i12
    %c-1_i20 = hw.constant -1 : i20
    %c-64_i7 = hw.constant -64 : i7
    %c15_i64 = hw.constant 15 : i64
    %c13_i64 = hw.constant 13 : i64
    %c0_i18 = hw.constant 0 : i18
    %c0_i9 = hw.constant 0 : i9
    %c0_i56 = hw.constant 0 : i56
    %c-1_i2 = hw.constant -1 : i2
    %c0_i4 = hw.constant 0 : i4
    %c-8_i4 = hw.constant -8 : i4
    %c-2_i2 = hw.constant -2 : i2
    %c-7_i4 = hw.constant -7 : i4
    %c-6_i4 = hw.constant -6 : i4
    %c-5_i4 = hw.constant -5 : i4
    %c-4_i4 = hw.constant -4 : i4
    %c-3_i4 = hw.constant -3 : i4
    %c-2_i4 = hw.constant -2 : i4
    %c-1_i4 = hw.constant -1 : i4
    %c0_i8 = hw.constant 0 : i8
    %c0_i12 = hw.constant 0 : i12
    %c0_i34 = hw.constant 0 : i34
    %c0_i3 = hw.constant 0 : i3
    %c7_i5 = hw.constant 7 : i5
    %c11_i5 = hw.constant 11 : i5
    %c1_i4 = hw.constant 1 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c4_i4 = hw.constant 4 : i4
    %c5_i4 = hw.constant 5 : i4
    %c6_i4 = hw.constant 6 : i4
    %c7_i4 = hw.constant 7 : i4
    %c0_i52 = hw.constant 0 : i52
    %c0_i20 = hw.constant 0 : i20
    %c0_i10 = hw.constant 0 : i10
    %c0_i32 = hw.constant 0 : i32
    %c0_i2 = hw.constant 0 : i2
    %c0_i64 = hw.constant 0 : i64
    %c0_i5 = hw.constant 0 : i5
    %false = hw.constant false
    %c-512_i52 = hw.constant -512 : i52
    %c-262144_i52 = hw.constant -262144 : i52
    %c30_i8 = hw.constant 30 : i8
    %true = hw.constant true
    %c12_i64 = hw.constant 12 : i64
    %c1_i2 = hw.constant 1 : i2
    %tag_0 = seq.firreg %578 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 0 : ui64} : i52
    %tag_1 = seq.firreg %584 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 52 : ui64} : i52
    %tag_2 = seq.firreg %590 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 104 : ui64} : i52
    %tag_3 = seq.firreg %596 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 156 : ui64} : i52
    %tag_4 = seq.firreg %602 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 208 : ui64} : i52
    %tag_5 = seq.firreg %608 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 260 : ui64} : i52
    %tag_6 = seq.firreg %614 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 312 : ui64} : i52
    %tag_7 = seq.firreg %620 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 364 : ui64} : i52
    %tag_8 = seq.firreg %626 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 416 : ui64} : i52
    %tag_9 = seq.firreg %632 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 468 : ui64} : i52
    %tag_10 = seq.firreg %638 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 520 : ui64} : i52
    %tag_11 = seq.firreg %644 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 572 : ui64} : i52
    %tag_12 = seq.firreg %650 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 624 : ui64} : i52
    %tag_13 = seq.firreg %656 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 676 : ui64} : i52
    %tag_14 = seq.firreg %662 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 728 : ui64} : i52
    %tag_15 = seq.firreg %668 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 780 : ui64} : i52
    %paddr_0 = seq.firreg %740 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 832 : ui64} : i20
    %paddr_1 = seq.firreg %745 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 852 : ui64} : i20
    %paddr_2 = seq.firreg %750 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 872 : ui64} : i20
    %paddr_3 = seq.firreg %755 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 892 : ui64} : i20
    %paddr_4 = seq.firreg %760 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 912 : ui64} : i20
    %paddr_5 = seq.firreg %765 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 932 : ui64} : i20
    %paddr_6 = seq.firreg %770 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 952 : ui64} : i20
    %paddr_7 = seq.firreg %775 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 972 : ui64} : i20
    %paddr_8 = seq.firreg %780 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 992 : ui64} : i20
    %paddr_9 = seq.firreg %785 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1012 : ui64} : i20
    %paddr_10 = seq.firreg %790 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1032 : ui64} : i20
    %paddr_11 = seq.firreg %795 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1052 : ui64} : i20
    %paddr_12 = seq.firreg %800 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1072 : ui64} : i20
    %paddr_13 = seq.firreg %805 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1092 : ui64} : i20
    %paddr_14 = seq.firreg %810 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1112 : ui64} : i20
    %paddr_15 = seq.firreg %815 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1132 : ui64} : i20
    %info_0 = seq.firreg %982 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1152 : ui64} : i10
    %info_1 = seq.firreg %988 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1162 : ui64} : i10
    %info_2 = seq.firreg %994 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1172 : ui64} : i10
    %info_3 = seq.firreg %1000 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1182 : ui64} : i10
    %info_4 = seq.firreg %1006 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1192 : ui64} : i10
    %info_5 = seq.firreg %1012 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1202 : ui64} : i10
    %info_6 = seq.firreg %1018 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1212 : ui64} : i10
    %info_7 = seq.firreg %1024 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1222 : ui64} : i10
    %info_8 = seq.firreg %1030 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1232 : ui64} : i10
    %info_9 = seq.firreg %1036 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1242 : ui64} : i10
    %info_10 = seq.firreg %1042 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1252 : ui64} : i10
    %info_11 = seq.firreg %1048 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1262 : ui64} : i10
    %info_12 = seq.firreg %1054 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1272 : ui64} : i10
    %info_13 = seq.firreg %1060 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1282 : ui64} : i10
    %info_14 = seq.firreg %1066 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1292 : ui64} : i10
    %info_15 = seq.firreg %1072 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1302 : ui64} : i10
    %pte_addr_0 = seq.firreg %820 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1312 : ui64} : i32
    %pte_addr_1 = seq.firreg %825 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1344 : ui64} : i32
    %pte_addr_2 = seq.firreg %830 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1376 : ui64} : i32
    %pte_addr_3 = seq.firreg %835 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1408 : ui64} : i32
    %pte_addr_4 = seq.firreg %840 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1440 : ui64} : i32
    %pte_addr_5 = seq.firreg %845 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1472 : ui64} : i32
    %pte_addr_6 = seq.firreg %850 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1504 : ui64} : i32
    %pte_addr_7 = seq.firreg %855 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1536 : ui64} : i32
    %pte_addr_8 = seq.firreg %860 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1568 : ui64} : i32
    %pte_addr_9 = seq.firreg %865 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1600 : ui64} : i32
    %pte_addr_10 = seq.firreg %870 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1632 : ui64} : i32
    %pte_addr_11 = seq.firreg %875 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1664 : ui64} : i32
    %pte_addr_12 = seq.firreg %880 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1696 : ui64} : i32
    %pte_addr_13 = seq.firreg %885 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1728 : ui64} : i32
    %pte_addr_14 = seq.firreg %890 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1760 : ui64} : i32
    %pte_addr_15 = seq.firreg %895 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1792 : ui64} : i32
    %pte_level_0 = seq.firreg %900 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1824 : ui64} : i2
    %pte_level_1 = seq.firreg %905 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1826 : ui64} : i2
    %pte_level_2 = seq.firreg %910 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1828 : ui64} : i2
    %pte_level_3 = seq.firreg %915 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1830 : ui64} : i2
    %pte_level_4 = seq.firreg %920 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1832 : ui64} : i2
    %pte_level_5 = seq.firreg %925 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1834 : ui64} : i2
    %pte_level_6 = seq.firreg %930 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1836 : ui64} : i2
    %pte_level_7 = seq.firreg %935 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1838 : ui64} : i2
    %pte_level_8 = seq.firreg %940 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1840 : ui64} : i2
    %pte_level_9 = seq.firreg %945 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1842 : ui64} : i2
    %pte_level_10 = seq.firreg %950 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1844 : ui64} : i2
    %pte_level_11 = seq.firreg %955 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1846 : ui64} : i2
    %pte_level_12 = seq.firreg %960 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1848 : ui64} : i2
    %pte_level_13 = seq.firreg %965 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1850 : ui64} : i2
    %pte_level_14 = seq.firreg %970 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1852 : ui64} : i2
    %pte_level_15 = seq.firreg %975 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1854 : ui64} : i2
    %valid_0 = seq.firreg %672 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1856 : ui64} : i1
    %valid_1 = seq.firreg %676 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1857 : ui64} : i1
    %valid_2 = seq.firreg %680 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1858 : ui64} : i1
    %valid_3 = seq.firreg %684 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1859 : ui64} : i1
    %valid_4 = seq.firreg %688 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1860 : ui64} : i1
    %valid_5 = seq.firreg %692 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1861 : ui64} : i1
    %valid_6 = seq.firreg %696 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1862 : ui64} : i1
    %valid_7 = seq.firreg %700 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1863 : ui64} : i1
    %valid_8 = seq.firreg %704 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1864 : ui64} : i1
    %valid_9 = seq.firreg %708 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1865 : ui64} : i1
    %valid_10 = seq.firreg %712 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1866 : ui64} : i1
    %valid_11 = seq.firreg %716 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1867 : ui64} : i1
    %valid_12 = seq.firreg %720 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1868 : ui64} : i1
    %valid_13 = seq.firreg %724 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1869 : ui64} : i1
    %valid_14 = seq.firreg %728 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1870 : ui64} : i1
    %valid_15 = seq.firreg %732 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1871 : ui64} : i1
    %pre_addr = seq.firreg %273 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1872 : ui64} : i64
    %pte_addr_r = seq.firreg %507 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1936 : ui64, sv.namehint = "pte_addr_r"} : i32
    %wpte_data_r = seq.firreg %343 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1968 : ui64, sv.namehint = "wpte_data_r"} : i64
    %dc_mode_r = seq.firreg %514 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 2032 : ui64, sv.namehint = "dc_mode_r"} : i5
    %out_valid_r = seq.firreg %1073 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2038 : ui64, sv.namehint = "out_valid_r"} : i1
    %out_paddr_r = seq.firreg %1074 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 2039 : ui64, sv.namehint = "out_paddr_r"} : i32
    %out_excep_r_cause = seq.firreg %435 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 2071 : ui64, sv.namehint = "out_excep_r_cause"} : i64
    %out_excep_r_tval = seq.firreg %439 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 2135 : ui64, sv.namehint = "out_excep_r_tval"} : i64
    %out_excep_r_en = seq.firreg %557 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2199 : ui64, sv.namehint = "out_excep_r_en"} : i1
    %0 = comb.and bin %io_va2pa_vvalid, %270, %271, %272 {sv.namehint = "handshake"} : i1
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
    %12 = comb.and bin %1, %11 : i52
    %13 = comb.icmp bin eq %12, %tag_0 : i52
    %14 = comb.and bin %13, %valid_0 : i1
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
    %25 = comb.and bin %1, %24 : i52
    %26 = comb.icmp bin eq %25, %tag_1 : i52
    %27 = comb.and bin %26, %valid_1 : i1
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
    %39 = comb.and bin %1, %38 : i52
    %40 = comb.icmp bin eq %39, %tag_2 : i52
    %41 = comb.and bin %40, %valid_2 : i1
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
    %53 = comb.and bin %1, %52 : i52
    %54 = comb.icmp bin eq %53, %tag_3 : i52
    %55 = comb.and bin %54, %valid_3 : i1
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
    %67 = comb.and bin %1, %66 : i52
    %68 = comb.icmp bin eq %67, %tag_4 : i52
    %69 = comb.and bin %68, %valid_4 : i1
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
    %81 = comb.and bin %1, %80 : i52
    %82 = comb.icmp bin eq %81, %tag_5 : i52
    %83 = comb.and bin %82, %valid_5 : i1
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
    %95 = comb.and bin %1, %94 : i52
    %96 = comb.icmp bin eq %95, %tag_6 : i52
    %97 = comb.and bin %96, %valid_6 : i1
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
    %109 = comb.and bin %1, %108 : i52
    %110 = comb.icmp bin eq %109, %tag_7 : i52
    %111 = comb.and bin %110, %valid_7 : i1
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
    %123 = comb.and bin %1, %122 : i52
    %124 = comb.icmp bin eq %123, %tag_8 : i52
    %125 = comb.and bin %124, %valid_8 : i1
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
    %137 = comb.and bin %1, %136 : i52
    %138 = comb.icmp bin eq %137, %tag_9 : i52
    %139 = comb.and bin %138, %valid_9 : i1
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
    %151 = comb.and bin %1, %150 : i52
    %152 = comb.icmp bin eq %151, %tag_10 : i52
    %153 = comb.and bin %152, %valid_10 : i1
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
    %165 = comb.and bin %1, %164 : i52
    %166 = comb.icmp bin eq %165, %tag_11 : i52
    %167 = comb.and bin %166, %valid_11 : i1
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
    %179 = comb.and bin %1, %178 : i52
    %180 = comb.icmp bin eq %179, %tag_12 : i52
    %181 = comb.and bin %180, %valid_12 : i1
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
    %193 = comb.and bin %1, %192 : i52
    %194 = comb.icmp bin eq %193, %tag_13 : i52
    %195 = comb.and bin %194, %valid_13 : i1
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
    %207 = comb.and bin %1, %206 : i52
    %208 = comb.icmp bin eq %207, %tag_14 : i52
    %209 = comb.and bin %208, %valid_14 : i1
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
    %221 = comb.and bin %1, %220 : i52
    %222 = comb.icmp bin eq %221, %tag_15 : i52
    %223 = comb.and bin %222, %valid_15 : i1
    %224 = comb.or %223, %209, %195, %181, %167, %153, %139, %125, %111, %97, %83, %69, %55, %41, %27, %14 {sv.namehint = "tlbMsg_tlbHit"} : i1
    %225 = comb.mux bin %223, %paddr_15, %210 {sv.namehint = "tlbMsg_tlbPa"} : i20
    %226 = comb.mux bin %223, %info_15, %211 {sv.namehint = "tlbMsg_tlbInfo"} : i10
    %227 = comb.mux bin %223, %pte_addr_15, %212 {sv.namehint = "tlbMsg_tlbPteAddr"} : i32
    %228 = comb.mux bin %223, %c-1_i4, %213 {sv.namehint = "tlbMsg_tlbIdx"} : i4
    %229 = comb.mux bin %223, %pte_level_15, %214 {sv.namehint = "tlbMsg_tlbLevel"} : i2
    %state = seq.firreg %564 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 2200 : ui64} : i2
    %flush_r = seq.firreg %266 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2202 : ui64} : i1
    %230 = comb.or bin %io_flush, %flush_r : i1
    %231 = comb.icmp bin ne %state, %c0_i2 : i2
    %232 = comb.xor bin %231, %true : i1
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
    %270 = comb.xor bin %231, %true {sv.namehint = "_io_va2pa_ready_T"} : i1
    %271 = comb.xor bin %io_flush, %true {sv.namehint = "_io_va2pa_ready_T_2"} : i1
    %272 = comb.xor bin %flush_r, %true {sv.namehint = "_io_va2pa_ready_T_4"} : i1
    %273 = comb.mux bin %0, %io_va2pa_vaddr, %pre_addr : i64
    %274 = comb.or bin %out_valid_r, %out_excep_r_en : i1
    %275 = comb.xor %274, %true : i1
    %276 = comb.and %275, %out_valid_r : i1
    %277 = comb.xor %274, %true : i1
    %278 = comb.and %277, %out_excep_r_en : i1
    %279 = comb.icmp bin ne %dc_mode_r, %c0_i5 {sv.namehint = "_dc_hand_T"} : i5
    %280 = comb.and bin %io_dcacheRW_ready, %279 {sv.namehint = "dc_hand"} : i1
    %281 = comb.extract %io_va2pa_vaddr from 38 {sv.namehint = "_tlb_high_legal_T_1"} : (i64) -> i1
    %282 = comb.replicate %281 {sv.namehint = "_tlb_high_legal_T_2"} : (i1) -> i25
    %283 = comb.extract %io_va2pa_vaddr from 39 {sv.namehint = "_tlb_high_legal_T_3"} : (i64) -> i25
    %284 = comb.icmp bin eq %267, %c1_i2 {sv.namehint = "_tlb_access_illegal_T"} : i2
    %285 = comb.extract %226 from 3 {sv.namehint = "_tlb_access_illegal_T_7"} : (i10) -> i1
    %286 = comb.xor bin %285, %true {sv.namehint = "_tlb_access_illegal_T_2"} : i1
    %287 = comb.and bin %284, %286 {sv.namehint = "_tlb_access_illegal_T_3"} : i1
    %288 = comb.icmp bin eq %267, %c-2_i2 {sv.namehint = "_tlb_access_illegal_T_4"} : i2
    %289 = comb.extract %226 from 1 {sv.namehint = "_tlb_access_illegal_T_5"} : (i10) -> i1
    %290 = comb.extract %io_mmuState_mstatus from 19 {sv.namehint = "_tlb_access_illegal_T_6"} : (i64) -> i1
    %291 = comb.and bin %290, %285 {sv.namehint = "_tlb_access_illegal_T_8"} : i1
    %292 = comb.or bin %289, %291 {sv.namehint = "_tlb_access_illegal_T_9"} : i1
    %293 = comb.xor bin %292, %true {sv.namehint = "_tlb_access_illegal_T_10"} : i1
    %294 = comb.and bin %288, %293 {sv.namehint = "_tlb_access_illegal_T_11"} : i1
    %295 = comb.extract %226 from 2 {sv.namehint = "_tlb_access_illegal_T_14"} : (i10) -> i1
    %296 = comb.xor bin %295, %true {sv.namehint = "_tlb_access_illegal_T_15"} : i1
    %297 = comb.and bin %268, %296 {sv.namehint = "_tlb_access_illegal_T_16"} : i1
    %298 = comb.or bin %287, %294, %297 {sv.namehint = "tlb_access_illegal"} : i1
    %select_prng.io_out_0, %select_prng.io_out_1, %select_prng.io_out_2, %select_prng.io_out_3 = hw.instance "select_prng" @MaxPeriodFibonacciLFSR_2(clock: %clock: !seq.clock, reset: %reset: i1) -> (io_out_0: i1, io_out_1: i1, io_out_2: i1, io_out_3: i1) {sv.namehint = "select_prng.io_out_3"}
    %299 = comb.concat %select_prng.io_out_3, %select_prng.io_out_2, %select_prng.io_out_1, %select_prng.io_out_0 {sv.namehint = "select"} : i1, i1, i1, i1
    %select_r = seq.firreg %428 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 2205 : ui64} : i4
    %offset = seq.firreg %482 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 2209 : ui64} : i8
    %level = seq.firreg %488 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 2217 : ui64} : i2
    %wpte_hs_r = seq.firreg %473 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2263 : ui64} : i1
    %300 = comb.concat %5, %state : i1, i2
    %301 = comb.icmp bin ne %300, %c0_i3 : i3
    %302 = comb.xor bin %0, %true : i1
    %303 = comb.icmp bin ne %282, %283 : i25
    %304 = comb.and bin %224, %298 : i1
    %305 = comb.or bin %303, %304 : i1
    %306 = comb.or bin %302, %305 : i1
    %307 = comb.xor %306, %true : i1
    %308 = comb.xor %231, %true : i1
    %309 = comb.and %308, %307, %224 : i1
    %310 = comb.or %309, %276 : i1
    %311 = comb.icmp bin eq %229, %c0_i2 {sv.namehint = "_paddr_mask_T_3"} : i2
    %312 = comb.icmp bin eq %229, %c1_i2 {sv.namehint = "_paddr_mask_T_5"} : i2
    %313 = comb.replicate %311 : (i1) -> i20
    %314 = comb.mux %312, %c-512_i20, %313 {sv.namehint = "_paddr_mask_T_6"} : i20
    %315 = comb.icmp bin eq %229, %c-2_i2 {sv.namehint = "_paddr_mask_T_7"} : i2
    %316 = comb.mux %315, %c-262144_i20, %314 {sv.namehint = "paddr_mask_hi"} : i20
    %317 = comb.concat %225, %c0_i12 {sv.namehint = "_out_paddr_r_T"} : i20, i12
    %318 = comb.xor %316, %c-1_i20 : i20
    %319 = comb.concat %316, %c0_i12 : i20, i12
    %320 = comb.and bin %319, %317 : i32
    %321 = comb.extract %io_va2pa_vaddr from 0 : (i64) -> i32
    %322 = comb.concat %318, %c-1_i12 : i20, i12
    %323 = comb.and bin %321, %322 : i32
    %324 = comb.or bin %323, %320 : i32
    %325 = comb.xor %224, %true : i1
    %326 = comb.or %231, %306, %325 : i1
    %327 = comb.mux bin %326, %out_paddr_r, %324 : i32
    %328 = comb.and bin %269, %226 : i10
    %329 = comb.icmp bin ne %328, %269 : i10
    %330 = comb.and bin %329, %5 : i1
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
    %424 = comb.xor bin %224, %true : i1
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
    %440 = comb.replicate %281 : (i1) -> i25
    %441 = comb.icmp bin eq %283, %440 : i25
    %442 = comb.xor %441, %true : i1
    %443 = comb.xor %224, %true : i1
    %444 = comb.xor %224, %true : i1
    %445 = comb.and %444, %443, %442 : i1
    %446 = comb.or %305, %445 : i1
    %447 = comb.and %0, %446 : i1
    %448 = comb.or %447, %278 : i1
    %449 = comb.extract %io_va2pa_vaddr from 30 {sv.namehint = "pte_addr_r_hi_lo"} : (i64) -> i9
    %450 = comb.extract %io_mmuState_satp from 0 : (i64) -> i20
    %451 = comb.concat %450, %449, %c0_i3 : i20, i9, i3
    %452 = comb.and bin %424, %441 : i1
    %453 = comb.mux bin %452, %451, %pte_addr_r : i32
    %454 = comb.mux bin %224, %336, %453 : i32
    %455 = comb.mux bin %306, %pte_addr_r, %454 : i32
    %456 = comb.xor %452, %true : i1
    %457 = comb.or %425, %456 : i1
    %458 = comb.mux bin %457, %c0_i5, %c7_i5 : i5
    %459 = comb.xor %452, %true : i1
    %460 = comb.or %425, %459 : i1
    %461 = comb.mux bin %460, %offset, %c30_i8 : i8
    %462 = comb.xor %452, %true : i1
    %463 = comb.or %425, %462 : i1
    %464 = comb.mux bin %463, %level, %c-1_i2 : i2
    %465 = comb.mux bin %224, %331, %c1_i2 : i2
    %466 = comb.mux bin %306, %state, %465 : i2
    %467 = comb.icmp bin eq %state, %c-1_i2 : i2
    %468 = comb.or bin %io_dcacheRW_ready, %wpte_hs_r : i1
    %469 = comb.mux bin %468, %c0_i5, %c11_i5 : i5
    %470 = comb.and bin %467, %io_dcacheRW_ready : i1
    %471 = comb.or %470, %wpte_hs_r : i1
    %472 = comb.mux bin %231, %471, %335 : i1
    %473 = comb.mux bin %301, %472, %wpte_hs_r : i1
    %474 = comb.icmp bin eq %state, %c1_i2 : i2
    %475 = comb.mux bin %280, %c0_i5, %dc_mode_r : i5
    %476 = comb.add %offset, %c-9_i8 {sv.namehint = "_offset_T"} : i8
    %477 = comb.and bin %474, %280 : i1
    %478 = comb.xor %477, %true : i1
    %479 = comb.or %467, %478 : i1
    %480 = comb.mux bin %479, %offset, %476 : i8
    %481 = comb.mux bin %231, %480, %461 : i8
    %482 = comb.mux bin %301, %481, %offset : i8
    %483 = comb.add %level, %c-1_i2 {sv.namehint = "_level_T"} : i2
    %484 = comb.xor %477, %true : i1
    %485 = comb.or %467, %484 : i1
    %486 = comb.mux bin %485, %level, %483 : i2
    %487 = comb.mux bin %231, %486, %464 : i2
    %488 = comb.mux bin %301, %487, %level : i2
    %489 = comb.extract %io_dcacheRW_rdata from 0 : (i64) -> i4
    %490 = comb.icmp bin eq %489, %c1_i4 : i4
    %491 = comb.extract %io_dcacheRW_rdata from 6 : (i64) -> i2
    %492 = comb.extract %io_dcacheRW_rdata from 4 : (i64) -> i1
    %493 = comb.concat %491, %492 : i2, i1
    %494 = comb.icmp bin ne %493, %c0_i3 : i3
    %495 = comb.or %494, %278 : i1
    %496 = comb.concat %c0_i56, %offset : i56, i8
    %497 = comb.shru bin %pre_addr, %496 {sv.namehint = "_pte_addr_r_T_2"} : i64
    %498 = comb.extract %497 from 0 {sv.namehint = "pte_addr_r_hi_lo_1"} : (i64) -> i9
    %499 = comb.extract %io_dcacheRW_rdata from 10 : (i64) -> i20
    %500 = comb.concat %499, %498, %c0_i3 : i20, i9, i3
    %501 = comb.and bin %io_dcacheRW_rvalid, %490 : i1
    %502 = comb.and bin %474, %501 : i1
    %503 = comb.xor %502, %true : i1
    %504 = comb.or %467, %503, %494 : i1
    %505 = comb.mux bin %504, %pte_addr_r, %500 : i32
    %506 = comb.mux bin %231, %505, %455 : i32
    %507 = comb.mux bin %301, %506, %pte_addr_r : i32
    %508 = comb.xor %501, %true : i1
    %509 = comb.or %508, %494 : i1
    %510 = comb.mux bin %509, %475, %c7_i5 : i5
    %511 = comb.mux bin %474, %510, %dc_mode_r : i5
    %512 = comb.mux bin %467, %469, %511 : i5
    %513 = comb.mux bin %231, %512, %458 : i5
    %514 = comb.mux bin %301, %513, %dc_mode_r : i5
    %515 = comb.extract %io_dcacheRW_rdata from 4 : (i64) -> i1
    %516 = comb.icmp bin eq %io_mmuState_priv, %c1_i2 : i2
    %517 = comb.extract %io_mmuState_mstatus from 18 : (i64) -> i1
    %518 = comb.xor bin %517, %true : i1
    %519 = comb.icmp bin eq %out_excep_r_cause, %c12_i64 : i64
    %520 = comb.or bin %518, %519 : i1
    %521 = comb.and bin %516, %520 : i1
    %522 = comb.icmp bin eq %io_mmuState_priv, %c0_i2 : i2
    %523 = comb.mux bin %515, %521, %522 : i1
    %524 = comb.extract %io_dcacheRW_rdata from 0 : (i64) -> i1
    %525 = comb.xor bin %524, %true : i1
    %526 = comb.extract %io_dcacheRW_rdata from 1 : (i64) -> i1
    %527 = comb.xor bin %526, %true : i1
    %528 = comb.extract %io_dcacheRW_rdata from 2 : (i64) -> i1
    %529 = comb.and bin %527, %528 : i1
    %530 = comb.extract %io_dcacheRW_rdata from 3 : (i64) -> i1
    %531 = comb.xor bin %530, %true : i1
    %532 = comb.and bin %519, %531 : i1
    %533 = comb.icmp bin eq %out_excep_r_cause, %c13_i64 : i64
    %534 = comb.and bin %290, %530 : i1
    %535 = comb.or bin %526, %534 : i1
    %536 = comb.xor bin %535, %true : i1
    %537 = comb.and bin %533, %536 : i1
    %538 = comb.icmp bin eq %out_excep_r_cause, %c15_i64 : i64
    %539 = comb.xor bin %528, %true : i1
    %540 = comb.and bin %538, %539 : i1
    %541 = comb.icmp bin eq %level, %c1_i2 {sv.namehint = "_ppn_mask_T_5"} : i2
    %542 = comb.extract %io_dcacheRW_rdata from 10 : (i64) -> i9
    %543 = comb.icmp bin ne %542, %c0_i9 : i9
    %544 = comb.and bin %541, %543 : i1
    %545 = comb.icmp bin eq %level, %c-2_i2 {sv.namehint = "_ppn_mask_T_7"} : i2
    %546 = comb.extract %io_dcacheRW_rdata from 10 : (i64) -> i18
    %547 = comb.icmp bin ne %546, %c0_i18 : i18
    %548 = comb.and bin %545, %547 : i1
    %549 = comb.or bin %523, %525, %529, %532, %537, %540, %544, %548 : i1
    %550 = comb.or %549, %278 : i1
    %551 = comb.mux bin %490, %495, %550 : i1
    %552 = comb.and bin %474, %io_dcacheRW_rvalid : i1
    %553 = comb.xor %552, %true : i1
    %554 = comb.or %467, %553 : i1
    %555 = comb.mux bin %554, %278, %551 : i1
    %556 = comb.mux bin %231, %555, %448 : i1
    %557 = comb.mux bin %301, %556, %278 : i1
    %558 = comb.xor %490, %true : i1
    %559 = comb.or %558, %494 : i1
    %560 = comb.and %552, %559 : i1
    %561 = comb.mux %467, %io_dcacheRW_rvalid, %560 : i1
    %562 = comb.mux bin %561, %c0_i2, %state : i2
    %563 = comb.mux bin %231, %562, %466 : i2
    %564 = comb.mux bin %301, %563, %state : i2
    %565 = comb.icmp bin eq %level, %c0_i2 {sv.namehint = "_ppn_mask_T_3"} : i2
    %566 = comb.replicate %565 {sv.namehint = "_ppn_mask_T_4"} : (i1) -> i52
    %567 = comb.mux bin %541, %c-512_i52, %566 {sv.namehint = "_ppn_mask_T_6"} : i52
    %568 = comb.mux bin %545, %c-262144_i52, %567 {sv.namehint = "ppn_mask"} : i52
    %569 = comb.extract %pre_addr from 12 {sv.namehint = "_tag_T"} : (i64) -> i52
    %570 = comb.and bin %569, %568 {sv.namehint = "_tag_T_1"} : i52
    %571 = comb.icmp bin eq %select_r, %c0_i4 : i4
    %572 = comb.or bin %490, %549 : i1
    %573 = comb.xor %571, %true : i1
    %574 = comb.xor %552, %true : i1
    %575 = comb.or bin %270, %467 : i1
    %576 = comb.xor %301, %true : i1
    %577 = comb.or %576, %575, %574, %572, %573 : i1
    %578 = comb.mux bin %577, %tag_0, %570 : i52
    %579 = comb.icmp bin eq %select_r, %c1_i4 : i4
    %580 = comb.xor %579, %true : i1
    %581 = comb.xor %552, %true : i1
    %582 = comb.xor %301, %true : i1
    %583 = comb.or %582, %575, %581, %572, %580 : i1
    %584 = comb.mux bin %583, %tag_1, %570 : i52
    %585 = comb.icmp bin eq %select_r, %c2_i4 : i4
    %586 = comb.xor %585, %true : i1
    %587 = comb.xor %552, %true : i1
    %588 = comb.xor %301, %true : i1
    %589 = comb.or %588, %575, %587, %572, %586 : i1
    %590 = comb.mux bin %589, %tag_2, %570 : i52
    %591 = comb.icmp bin eq %select_r, %c3_i4 : i4
    %592 = comb.xor %591, %true : i1
    %593 = comb.xor %552, %true : i1
    %594 = comb.xor %301, %true : i1
    %595 = comb.or %594, %575, %593, %572, %592 : i1
    %596 = comb.mux bin %595, %tag_3, %570 : i52
    %597 = comb.icmp bin eq %select_r, %c4_i4 : i4
    %598 = comb.xor %597, %true : i1
    %599 = comb.xor %552, %true : i1
    %600 = comb.xor %301, %true : i1
    %601 = comb.or %600, %575, %599, %572, %598 : i1
    %602 = comb.mux bin %601, %tag_4, %570 : i52
    %603 = comb.icmp bin eq %select_r, %c5_i4 : i4
    %604 = comb.xor %603, %true : i1
    %605 = comb.xor %552, %true : i1
    %606 = comb.xor %301, %true : i1
    %607 = comb.or %606, %575, %605, %572, %604 : i1
    %608 = comb.mux bin %607, %tag_5, %570 : i52
    %609 = comb.icmp bin eq %select_r, %c6_i4 : i4
    %610 = comb.xor %609, %true : i1
    %611 = comb.xor %552, %true : i1
    %612 = comb.xor %301, %true : i1
    %613 = comb.or %612, %575, %611, %572, %610 : i1
    %614 = comb.mux bin %613, %tag_6, %570 : i52
    %615 = comb.icmp bin eq %select_r, %c7_i4 : i4
    %616 = comb.xor %615, %true : i1
    %617 = comb.xor %552, %true : i1
    %618 = comb.xor %301, %true : i1
    %619 = comb.or %618, %575, %617, %572, %616 : i1
    %620 = comb.mux bin %619, %tag_7, %570 : i52
    %621 = comb.icmp bin eq %select_r, %c-8_i4 : i4
    %622 = comb.xor %621, %true : i1
    %623 = comb.xor %552, %true : i1
    %624 = comb.xor %301, %true : i1
    %625 = comb.or %624, %575, %623, %572, %622 : i1
    %626 = comb.mux bin %625, %tag_8, %570 : i52
    %627 = comb.icmp bin eq %select_r, %c-7_i4 : i4
    %628 = comb.xor %627, %true : i1
    %629 = comb.xor %552, %true : i1
    %630 = comb.xor %301, %true : i1
    %631 = comb.or %630, %575, %629, %572, %628 : i1
    %632 = comb.mux bin %631, %tag_9, %570 : i52
    %633 = comb.icmp bin eq %select_r, %c-6_i4 : i4
    %634 = comb.xor %633, %true : i1
    %635 = comb.xor %552, %true : i1
    %636 = comb.xor %301, %true : i1
    %637 = comb.or %636, %575, %635, %572, %634 : i1
    %638 = comb.mux bin %637, %tag_10, %570 : i52
    %639 = comb.icmp bin eq %select_r, %c-5_i4 : i4
    %640 = comb.xor %639, %true : i1
    %641 = comb.xor %552, %true : i1
    %642 = comb.xor %301, %true : i1
    %643 = comb.or %642, %575, %641, %572, %640 : i1
    %644 = comb.mux bin %643, %tag_11, %570 : i52
    %645 = comb.icmp bin eq %select_r, %c-4_i4 : i4
    %646 = comb.xor %645, %true : i1
    %647 = comb.xor %552, %true : i1
    %648 = comb.xor %301, %true : i1
    %649 = comb.or %648, %575, %647, %572, %646 : i1
    %650 = comb.mux bin %649, %tag_12, %570 : i52
    %651 = comb.icmp bin eq %select_r, %c-3_i4 : i4
    %652 = comb.xor %651, %true : i1
    %653 = comb.xor %552, %true : i1
    %654 = comb.xor %301, %true : i1
    %655 = comb.or %654, %575, %653, %572, %652 : i1
    %656 = comb.mux bin %655, %tag_13, %570 : i52
    %657 = comb.icmp bin eq %select_r, %c-2_i4 : i4
    %658 = comb.xor %657, %true : i1
    %659 = comb.xor %552, %true : i1
    %660 = comb.xor %301, %true : i1
    %661 = comb.or %660, %575, %659, %572, %658 : i1
    %662 = comb.mux bin %661, %tag_14, %570 : i52
    %663 = comb.icmp bin eq %select_r, %c-1_i4 : i4
    %664 = comb.xor %663, %true : i1
    %665 = comb.xor %552, %true : i1
    %666 = comb.xor %301, %true : i1
    %667 = comb.or %666, %575, %665, %572, %664 : i1
    %668 = comb.mux bin %667, %tag_15, %570 : i52
    %669 = comb.xor %572, %true : i1
    %670 = comb.xor %575, %true : i1
    %671 = comb.and %301, %670, %552, %669, %571 : i1
    %672 = comb.or %671, %235 : i1
    %673 = comb.xor %572, %true : i1
    %674 = comb.xor %575, %true : i1
    %675 = comb.and %301, %674, %552, %673, %579 : i1
    %676 = comb.or %675, %237 : i1
    %677 = comb.xor %572, %true : i1
    %678 = comb.xor %575, %true : i1
    %679 = comb.and %301, %678, %552, %677, %585 : i1
    %680 = comb.or %679, %239 : i1
    %681 = comb.xor %572, %true : i1
    %682 = comb.xor %575, %true : i1
    %683 = comb.and %301, %682, %552, %681, %591 : i1
    %684 = comb.or %683, %241 : i1
    %685 = comb.xor %572, %true : i1
    %686 = comb.xor %575, %true : i1
    %687 = comb.and %301, %686, %552, %685, %597 : i1
    %688 = comb.or %687, %243 : i1
    %689 = comb.xor %572, %true : i1
    %690 = comb.xor %575, %true : i1
    %691 = comb.and %301, %690, %552, %689, %603 : i1
    %692 = comb.or %691, %245 : i1
    %693 = comb.xor %572, %true : i1
    %694 = comb.xor %575, %true : i1
    %695 = comb.and %301, %694, %552, %693, %609 : i1
    %696 = comb.or %695, %247 : i1
    %697 = comb.xor %572, %true : i1
    %698 = comb.xor %575, %true : i1
    %699 = comb.and %301, %698, %552, %697, %615 : i1
    %700 = comb.or %699, %249 : i1
    %701 = comb.xor %572, %true : i1
    %702 = comb.xor %575, %true : i1
    %703 = comb.and %301, %702, %552, %701, %621 : i1
    %704 = comb.or %703, %251 : i1
    %705 = comb.xor %572, %true : i1
    %706 = comb.xor %575, %true : i1
    %707 = comb.and %301, %706, %552, %705, %627 : i1
    %708 = comb.or %707, %253 : i1
    %709 = comb.xor %572, %true : i1
    %710 = comb.xor %575, %true : i1
    %711 = comb.and %301, %710, %552, %709, %633 : i1
    %712 = comb.or %711, %255 : i1
    %713 = comb.xor %572, %true : i1
    %714 = comb.xor %575, %true : i1
    %715 = comb.and %301, %714, %552, %713, %639 : i1
    %716 = comb.or %715, %257 : i1
    %717 = comb.xor %572, %true : i1
    %718 = comb.xor %575, %true : i1
    %719 = comb.and %301, %718, %552, %717, %645 : i1
    %720 = comb.or %719, %259 : i1
    %721 = comb.xor %572, %true : i1
    %722 = comb.xor %575, %true : i1
    %723 = comb.and %301, %722, %552, %721, %651 : i1
    %724 = comb.or %723, %261 : i1
    %725 = comb.xor %572, %true : i1
    %726 = comb.xor %575, %true : i1
    %727 = comb.and %301, %726, %552, %725, %657 : i1
    %728 = comb.or %727, %263 : i1
    %729 = comb.xor %572, %true : i1
    %730 = comb.xor %575, %true : i1
    %731 = comb.and %301, %730, %552, %729, %663 : i1
    %732 = comb.or %731, %265 : i1
    %733 = comb.extract %io_dcacheRW_rdata from 10 {sv.namehint = "_update_pa_T"} : (i64) -> i20
    %734 = comb.extract %568 from 0 : (i52) -> i20
    %735 = comb.and bin %734, %733 : i20
    %736 = comb.xor %571, %true : i1
    %737 = comb.xor %552, %true : i1
    %738 = comb.xor %301, %true : i1
    %739 = comb.or %738, %575, %737, %572, %736 : i1
    %740 = comb.mux bin %739, %paddr_0, %735 : i20
    %741 = comb.xor %579, %true : i1
    %742 = comb.xor %552, %true : i1
    %743 = comb.xor %301, %true : i1
    %744 = comb.or %743, %575, %742, %572, %741 : i1
    %745 = comb.mux bin %744, %paddr_1, %735 : i20
    %746 = comb.xor %585, %true : i1
    %747 = comb.xor %552, %true : i1
    %748 = comb.xor %301, %true : i1
    %749 = comb.or %748, %575, %747, %572, %746 : i1
    %750 = comb.mux bin %749, %paddr_2, %735 : i20
    %751 = comb.xor %591, %true : i1
    %752 = comb.xor %552, %true : i1
    %753 = comb.xor %301, %true : i1
    %754 = comb.or %753, %575, %752, %572, %751 : i1
    %755 = comb.mux bin %754, %paddr_3, %735 : i20
    %756 = comb.xor %597, %true : i1
    %757 = comb.xor %552, %true : i1
    %758 = comb.xor %301, %true : i1
    %759 = comb.or %758, %575, %757, %572, %756 : i1
    %760 = comb.mux bin %759, %paddr_4, %735 : i20
    %761 = comb.xor %603, %true : i1
    %762 = comb.xor %552, %true : i1
    %763 = comb.xor %301, %true : i1
    %764 = comb.or %763, %575, %762, %572, %761 : i1
    %765 = comb.mux bin %764, %paddr_5, %735 : i20
    %766 = comb.xor %609, %true : i1
    %767 = comb.xor %552, %true : i1
    %768 = comb.xor %301, %true : i1
    %769 = comb.or %768, %575, %767, %572, %766 : i1
    %770 = comb.mux bin %769, %paddr_6, %735 : i20
    %771 = comb.xor %615, %true : i1
    %772 = comb.xor %552, %true : i1
    %773 = comb.xor %301, %true : i1
    %774 = comb.or %773, %575, %772, %572, %771 : i1
    %775 = comb.mux bin %774, %paddr_7, %735 : i20
    %776 = comb.xor %621, %true : i1
    %777 = comb.xor %552, %true : i1
    %778 = comb.xor %301, %true : i1
    %779 = comb.or %778, %575, %777, %572, %776 : i1
    %780 = comb.mux bin %779, %paddr_8, %735 : i20
    %781 = comb.xor %627, %true : i1
    %782 = comb.xor %552, %true : i1
    %783 = comb.xor %301, %true : i1
    %784 = comb.or %783, %575, %782, %572, %781 : i1
    %785 = comb.mux bin %784, %paddr_9, %735 : i20
    %786 = comb.xor %633, %true : i1
    %787 = comb.xor %552, %true : i1
    %788 = comb.xor %301, %true : i1
    %789 = comb.or %788, %575, %787, %572, %786 : i1
    %790 = comb.mux bin %789, %paddr_10, %735 : i20
    %791 = comb.xor %639, %true : i1
    %792 = comb.xor %552, %true : i1
    %793 = comb.xor %301, %true : i1
    %794 = comb.or %793, %575, %792, %572, %791 : i1
    %795 = comb.mux bin %794, %paddr_11, %735 : i20
    %796 = comb.xor %645, %true : i1
    %797 = comb.xor %552, %true : i1
    %798 = comb.xor %301, %true : i1
    %799 = comb.or %798, %575, %797, %572, %796 : i1
    %800 = comb.mux bin %799, %paddr_12, %735 : i20
    %801 = comb.xor %651, %true : i1
    %802 = comb.xor %552, %true : i1
    %803 = comb.xor %301, %true : i1
    %804 = comb.or %803, %575, %802, %572, %801 : i1
    %805 = comb.mux bin %804, %paddr_13, %735 : i20
    %806 = comb.xor %657, %true : i1
    %807 = comb.xor %552, %true : i1
    %808 = comb.xor %301, %true : i1
    %809 = comb.or %808, %575, %807, %572, %806 : i1
    %810 = comb.mux bin %809, %paddr_14, %735 : i20
    %811 = comb.xor %663, %true : i1
    %812 = comb.xor %552, %true : i1
    %813 = comb.xor %301, %true : i1
    %814 = comb.or %813, %575, %812, %572, %811 : i1
    %815 = comb.mux bin %814, %paddr_15, %735 : i20
    %816 = comb.xor %571, %true : i1
    %817 = comb.xor %552, %true : i1
    %818 = comb.xor %301, %true : i1
    %819 = comb.or %818, %575, %817, %572, %816 : i1
    %820 = comb.mux bin %819, %pte_addr_0, %pte_addr_r : i32
    %821 = comb.xor %579, %true : i1
    %822 = comb.xor %552, %true : i1
    %823 = comb.xor %301, %true : i1
    %824 = comb.or %823, %575, %822, %572, %821 : i1
    %825 = comb.mux bin %824, %pte_addr_1, %pte_addr_r : i32
    %826 = comb.xor %585, %true : i1
    %827 = comb.xor %552, %true : i1
    %828 = comb.xor %301, %true : i1
    %829 = comb.or %828, %575, %827, %572, %826 : i1
    %830 = comb.mux bin %829, %pte_addr_2, %pte_addr_r : i32
    %831 = comb.xor %591, %true : i1
    %832 = comb.xor %552, %true : i1
    %833 = comb.xor %301, %true : i1
    %834 = comb.or %833, %575, %832, %572, %831 : i1
    %835 = comb.mux bin %834, %pte_addr_3, %pte_addr_r : i32
    %836 = comb.xor %597, %true : i1
    %837 = comb.xor %552, %true : i1
    %838 = comb.xor %301, %true : i1
    %839 = comb.or %838, %575, %837, %572, %836 : i1
    %840 = comb.mux bin %839, %pte_addr_4, %pte_addr_r : i32
    %841 = comb.xor %603, %true : i1
    %842 = comb.xor %552, %true : i1
    %843 = comb.xor %301, %true : i1
    %844 = comb.or %843, %575, %842, %572, %841 : i1
    %845 = comb.mux bin %844, %pte_addr_5, %pte_addr_r : i32
    %846 = comb.xor %609, %true : i1
    %847 = comb.xor %552, %true : i1
    %848 = comb.xor %301, %true : i1
    %849 = comb.or %848, %575, %847, %572, %846 : i1
    %850 = comb.mux bin %849, %pte_addr_6, %pte_addr_r : i32
    %851 = comb.xor %615, %true : i1
    %852 = comb.xor %552, %true : i1
    %853 = comb.xor %301, %true : i1
    %854 = comb.or %853, %575, %852, %572, %851 : i1
    %855 = comb.mux bin %854, %pte_addr_7, %pte_addr_r : i32
    %856 = comb.xor %621, %true : i1
    %857 = comb.xor %552, %true : i1
    %858 = comb.xor %301, %true : i1
    %859 = comb.or %858, %575, %857, %572, %856 : i1
    %860 = comb.mux bin %859, %pte_addr_8, %pte_addr_r : i32
    %861 = comb.xor %627, %true : i1
    %862 = comb.xor %552, %true : i1
    %863 = comb.xor %301, %true : i1
    %864 = comb.or %863, %575, %862, %572, %861 : i1
    %865 = comb.mux bin %864, %pte_addr_9, %pte_addr_r : i32
    %866 = comb.xor %633, %true : i1
    %867 = comb.xor %552, %true : i1
    %868 = comb.xor %301, %true : i1
    %869 = comb.or %868, %575, %867, %572, %866 : i1
    %870 = comb.mux bin %869, %pte_addr_10, %pte_addr_r : i32
    %871 = comb.xor %639, %true : i1
    %872 = comb.xor %552, %true : i1
    %873 = comb.xor %301, %true : i1
    %874 = comb.or %873, %575, %872, %572, %871 : i1
    %875 = comb.mux bin %874, %pte_addr_11, %pte_addr_r : i32
    %876 = comb.xor %645, %true : i1
    %877 = comb.xor %552, %true : i1
    %878 = comb.xor %301, %true : i1
    %879 = comb.or %878, %575, %877, %572, %876 : i1
    %880 = comb.mux bin %879, %pte_addr_12, %pte_addr_r : i32
    %881 = comb.xor %651, %true : i1
    %882 = comb.xor %552, %true : i1
    %883 = comb.xor %301, %true : i1
    %884 = comb.or %883, %575, %882, %572, %881 : i1
    %885 = comb.mux bin %884, %pte_addr_13, %pte_addr_r : i32
    %886 = comb.xor %657, %true : i1
    %887 = comb.xor %552, %true : i1
    %888 = comb.xor %301, %true : i1
    %889 = comb.or %888, %575, %887, %572, %886 : i1
    %890 = comb.mux bin %889, %pte_addr_14, %pte_addr_r : i32
    %891 = comb.xor %663, %true : i1
    %892 = comb.xor %552, %true : i1
    %893 = comb.xor %301, %true : i1
    %894 = comb.or %893, %575, %892, %572, %891 : i1
    %895 = comb.mux bin %894, %pte_addr_15, %pte_addr_r : i32
    %896 = comb.xor %571, %true : i1
    %897 = comb.xor %552, %true : i1
    %898 = comb.xor %301, %true : i1
    %899 = comb.or %898, %575, %897, %572, %896 : i1
    %900 = comb.mux bin %899, %pte_level_0, %level : i2
    %901 = comb.xor %579, %true : i1
    %902 = comb.xor %552, %true : i1
    %903 = comb.xor %301, %true : i1
    %904 = comb.or %903, %575, %902, %572, %901 : i1
    %905 = comb.mux bin %904, %pte_level_1, %level : i2
    %906 = comb.xor %585, %true : i1
    %907 = comb.xor %552, %true : i1
    %908 = comb.xor %301, %true : i1
    %909 = comb.or %908, %575, %907, %572, %906 : i1
    %910 = comb.mux bin %909, %pte_level_2, %level : i2
    %911 = comb.xor %591, %true : i1
    %912 = comb.xor %552, %true : i1
    %913 = comb.xor %301, %true : i1
    %914 = comb.or %913, %575, %912, %572, %911 : i1
    %915 = comb.mux bin %914, %pte_level_3, %level : i2
    %916 = comb.xor %597, %true : i1
    %917 = comb.xor %552, %true : i1
    %918 = comb.xor %301, %true : i1
    %919 = comb.or %918, %575, %917, %572, %916 : i1
    %920 = comb.mux bin %919, %pte_level_4, %level : i2
    %921 = comb.xor %603, %true : i1
    %922 = comb.xor %552, %true : i1
    %923 = comb.xor %301, %true : i1
    %924 = comb.or %923, %575, %922, %572, %921 : i1
    %925 = comb.mux bin %924, %pte_level_5, %level : i2
    %926 = comb.xor %609, %true : i1
    %927 = comb.xor %552, %true : i1
    %928 = comb.xor %301, %true : i1
    %929 = comb.or %928, %575, %927, %572, %926 : i1
    %930 = comb.mux bin %929, %pte_level_6, %level : i2
    %931 = comb.xor %615, %true : i1
    %932 = comb.xor %552, %true : i1
    %933 = comb.xor %301, %true : i1
    %934 = comb.or %933, %575, %932, %572, %931 : i1
    %935 = comb.mux bin %934, %pte_level_7, %level : i2
    %936 = comb.xor %621, %true : i1
    %937 = comb.xor %552, %true : i1
    %938 = comb.xor %301, %true : i1
    %939 = comb.or %938, %575, %937, %572, %936 : i1
    %940 = comb.mux bin %939, %pte_level_8, %level : i2
    %941 = comb.xor %627, %true : i1
    %942 = comb.xor %552, %true : i1
    %943 = comb.xor %301, %true : i1
    %944 = comb.or %943, %575, %942, %572, %941 : i1
    %945 = comb.mux bin %944, %pte_level_9, %level : i2
    %946 = comb.xor %633, %true : i1
    %947 = comb.xor %552, %true : i1
    %948 = comb.xor %301, %true : i1
    %949 = comb.or %948, %575, %947, %572, %946 : i1
    %950 = comb.mux bin %949, %pte_level_10, %level : i2
    %951 = comb.xor %639, %true : i1
    %952 = comb.xor %552, %true : i1
    %953 = comb.xor %301, %true : i1
    %954 = comb.or %953, %575, %952, %572, %951 : i1
    %955 = comb.mux bin %954, %pte_level_11, %level : i2
    %956 = comb.xor %645, %true : i1
    %957 = comb.xor %552, %true : i1
    %958 = comb.xor %301, %true : i1
    %959 = comb.or %958, %575, %957, %572, %956 : i1
    %960 = comb.mux bin %959, %pte_level_12, %level : i2
    %961 = comb.xor %651, %true : i1
    %962 = comb.xor %552, %true : i1
    %963 = comb.xor %301, %true : i1
    %964 = comb.or %963, %575, %962, %572, %961 : i1
    %965 = comb.mux bin %964, %pte_level_13, %level : i2
    %966 = comb.xor %657, %true : i1
    %967 = comb.xor %552, %true : i1
    %968 = comb.xor %301, %true : i1
    %969 = comb.or %968, %575, %967, %572, %966 : i1
    %970 = comb.mux bin %969, %pte_level_14, %level : i2
    %971 = comb.xor %663, %true : i1
    %972 = comb.xor %552, %true : i1
    %973 = comb.xor %301, %true : i1
    %974 = comb.or %973, %575, %972, %572, %971 : i1
    %975 = comb.mux bin %974, %pte_level_15, %level : i2
    %976 = comb.extract %io_dcacheRW_rdata from 0 {sv.namehint = "_info_T_1"} : (i64) -> i10
    %977 = comb.xor %571, %true : i1
    %978 = comb.xor %552, %true : i1
    %979 = comb.or %467, %978, %572, %977 : i1
    %980 = comb.mux bin %979, %info_0, %976 : i10
    %981 = comb.mux bin %231, %980, %348 : i10
    %982 = comb.mux bin %301, %981, %info_0 : i10
    %983 = comb.xor %579, %true : i1
    %984 = comb.xor %552, %true : i1
    %985 = comb.or %467, %984, %572, %983 : i1
    %986 = comb.mux bin %985, %info_1, %976 : i10
    %987 = comb.mux bin %231, %986, %353 : i10
    %988 = comb.mux bin %301, %987, %info_1 : i10
    %989 = comb.xor %585, %true : i1
    %990 = comb.xor %552, %true : i1
    %991 = comb.or %467, %990, %572, %989 : i1
    %992 = comb.mux bin %991, %info_2, %976 : i10
    %993 = comb.mux bin %231, %992, %358 : i10
    %994 = comb.mux bin %301, %993, %info_2 : i10
    %995 = comb.xor %591, %true : i1
    %996 = comb.xor %552, %true : i1
    %997 = comb.or %467, %996, %572, %995 : i1
    %998 = comb.mux bin %997, %info_3, %976 : i10
    %999 = comb.mux bin %231, %998, %363 : i10
    %1000 = comb.mux bin %301, %999, %info_3 : i10
    %1001 = comb.xor %597, %true : i1
    %1002 = comb.xor %552, %true : i1
    %1003 = comb.or %467, %1002, %572, %1001 : i1
    %1004 = comb.mux bin %1003, %info_4, %976 : i10
    %1005 = comb.mux bin %231, %1004, %368 : i10
    %1006 = comb.mux bin %301, %1005, %info_4 : i10
    %1007 = comb.xor %603, %true : i1
    %1008 = comb.xor %552, %true : i1
    %1009 = comb.or %467, %1008, %572, %1007 : i1
    %1010 = comb.mux bin %1009, %info_5, %976 : i10
    %1011 = comb.mux bin %231, %1010, %373 : i10
    %1012 = comb.mux bin %301, %1011, %info_5 : i10
    %1013 = comb.xor %609, %true : i1
    %1014 = comb.xor %552, %true : i1
    %1015 = comb.or %467, %1014, %572, %1013 : i1
    %1016 = comb.mux bin %1015, %info_6, %976 : i10
    %1017 = comb.mux bin %231, %1016, %378 : i10
    %1018 = comb.mux bin %301, %1017, %info_6 : i10
    %1019 = comb.xor %615, %true : i1
    %1020 = comb.xor %552, %true : i1
    %1021 = comb.or %467, %1020, %572, %1019 : i1
    %1022 = comb.mux bin %1021, %info_7, %976 : i10
    %1023 = comb.mux bin %231, %1022, %383 : i10
    %1024 = comb.mux bin %301, %1023, %info_7 : i10
    %1025 = comb.xor %621, %true : i1
    %1026 = comb.xor %552, %true : i1
    %1027 = comb.or %467, %1026, %572, %1025 : i1
    %1028 = comb.mux bin %1027, %info_8, %976 : i10
    %1029 = comb.mux bin %231, %1028, %388 : i10
    %1030 = comb.mux bin %301, %1029, %info_8 : i10
    %1031 = comb.xor %627, %true : i1
    %1032 = comb.xor %552, %true : i1
    %1033 = comb.or %467, %1032, %572, %1031 : i1
    %1034 = comb.mux bin %1033, %info_9, %976 : i10
    %1035 = comb.mux bin %231, %1034, %393 : i10
    %1036 = comb.mux bin %301, %1035, %info_9 : i10
    %1037 = comb.xor %633, %true : i1
    %1038 = comb.xor %552, %true : i1
    %1039 = comb.or %467, %1038, %572, %1037 : i1
    %1040 = comb.mux bin %1039, %info_10, %976 : i10
    %1041 = comb.mux bin %231, %1040, %398 : i10
    %1042 = comb.mux bin %301, %1041, %info_10 : i10
    %1043 = comb.xor %639, %true : i1
    %1044 = comb.xor %552, %true : i1
    %1045 = comb.or %467, %1044, %572, %1043 : i1
    %1046 = comb.mux bin %1045, %info_11, %976 : i10
    %1047 = comb.mux bin %231, %1046, %403 : i10
    %1048 = comb.mux bin %301, %1047, %info_11 : i10
    %1049 = comb.xor %645, %true : i1
    %1050 = comb.xor %552, %true : i1
    %1051 = comb.or %467, %1050, %572, %1049 : i1
    %1052 = comb.mux bin %1051, %info_12, %976 : i10
    %1053 = comb.mux bin %231, %1052, %408 : i10
    %1054 = comb.mux bin %301, %1053, %info_12 : i10
    %1055 = comb.xor %651, %true : i1
    %1056 = comb.xor %552, %true : i1
    %1057 = comb.or %467, %1056, %572, %1055 : i1
    %1058 = comb.mux bin %1057, %info_13, %976 : i10
    %1059 = comb.mux bin %231, %1058, %413 : i10
    %1060 = comb.mux bin %301, %1059, %info_13 : i10
    %1061 = comb.xor %657, %true : i1
    %1062 = comb.xor %552, %true : i1
    %1063 = comb.or %467, %1062, %572, %1061 : i1
    %1064 = comb.mux bin %1063, %info_14, %976 : i10
    %1065 = comb.mux bin %231, %1064, %418 : i10
    %1066 = comb.mux bin %301, %1065, %info_14 : i10
    %1067 = comb.xor %663, %true : i1
    %1068 = comb.xor %552, %true : i1
    %1069 = comb.or %467, %1068, %572, %1067 : i1
    %1070 = comb.mux bin %1069, %info_15, %976 : i10
    %1071 = comb.mux bin %231, %1070, %423 : i10
    %1072 = comb.mux bin %301, %1071, %info_15 : i10
    %1073 = comb.mux bin %301, %310, %io_va2pa_vvalid : i1
    %1074 = comb.mux bin %301, %327, %321 : i32
    hw.output %out_paddr_r, %out_valid_r, %out_excep_r_cause, %out_excep_r_tval, %out_excep_r_en, %pte_addr_r, %wpte_data_r, %dc_mode_r : i32, i1, i64, i64, i1, i32, i64, i5
  }
  hw.module private @TLB_1(in %clock : !seq.clock, in %reset : i1, in %io_va2pa_vaddr : i64, in %io_va2pa_vvalid : i1, in %io_va2pa_m_type : i2, out io_va2pa_paddr : i32, out io_va2pa_pvalid : i1, out io_va2pa_tlb_excep_cause : i64, out io_va2pa_tlb_excep_tval : i64, out io_va2pa_tlb_excep_en : i1, in %io_mmuState_priv : i2, in %io_mmuState_mstatus : i64, in %io_mmuState_satp : i64, in %io_flush : i1, out io_dcacheRW_addr : i32, in %io_dcacheRW_rdata : i64, in %io_dcacheRW_rvalid : i1, out io_dcacheRW_wdata : i64, out io_dcacheRW_dc_mode : i5, in %io_dcacheRW_ready : i1) {
    %c-262144_i20 = hw.constant -262144 : i20
    %c-512_i20 = hw.constant -512 : i20
    %c-9_i8 = hw.constant -9 : i8
    %c-1_i12 = hw.constant -1 : i12
    %c-1_i20 = hw.constant -1 : i20
    %0 = hw.aggregate_constant [15, 13, 12, 0] : !hw.array<4xi64>
    %c-64_i7 = hw.constant -64 : i7
    %c0_i18 = hw.constant 0 : i18
    %c0_i9 = hw.constant 0 : i9
    %c0_i56 = hw.constant 0 : i56
    %c1_i2 = hw.constant 1 : i2
    %c-1_i2 = hw.constant -1 : i2
    %c0_i4 = hw.constant 0 : i4
    %c-8_i4 = hw.constant -8 : i4
    %c-2_i2 = hw.constant -2 : i2
    %c-7_i4 = hw.constant -7 : i4
    %c-6_i4 = hw.constant -6 : i4
    %c-5_i4 = hw.constant -5 : i4
    %c-4_i4 = hw.constant -4 : i4
    %c-3_i4 = hw.constant -3 : i4
    %c-2_i4 = hw.constant -2 : i4
    %c-1_i4 = hw.constant -1 : i4
    %c0_i8 = hw.constant 0 : i8
    %c0_i12 = hw.constant 0 : i12
    %c0_i34 = hw.constant 0 : i34
    %c0_i3 = hw.constant 0 : i3
    %c7_i5 = hw.constant 7 : i5
    %c11_i5 = hw.constant 11 : i5
    %c1_i4 = hw.constant 1 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c4_i4 = hw.constant 4 : i4
    %c5_i4 = hw.constant 5 : i4
    %c6_i4 = hw.constant 6 : i4
    %c7_i4 = hw.constant 7 : i4
    %c0_i52 = hw.constant 0 : i52
    %c0_i20 = hw.constant 0 : i20
    %c0_i10 = hw.constant 0 : i10
    %c0_i32 = hw.constant 0 : i32
    %c0_i2 = hw.constant 0 : i2
    %c0_i64 = hw.constant 0 : i64
    %c0_i5 = hw.constant 0 : i5
    %false = hw.constant false
    %true = hw.constant true
    %c-512_i52 = hw.constant -512 : i52
    %c-262144_i52 = hw.constant -262144 : i52
    %c12_i64 = hw.constant 12 : i64
    %c13_i64 = hw.constant 13 : i64
    %c15_i64 = hw.constant 15 : i64
    %c30_i8 = hw.constant 30 : i8
    %tag_0 = seq.firreg %587 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 0 : ui64} : i52
    %tag_1 = seq.firreg %593 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 52 : ui64} : i52
    %tag_2 = seq.firreg %599 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 104 : ui64} : i52
    %tag_3 = seq.firreg %605 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 156 : ui64} : i52
    %tag_4 = seq.firreg %611 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 208 : ui64} : i52
    %tag_5 = seq.firreg %617 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 260 : ui64} : i52
    %tag_6 = seq.firreg %623 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 312 : ui64} : i52
    %tag_7 = seq.firreg %629 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 364 : ui64} : i52
    %tag_8 = seq.firreg %635 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 416 : ui64} : i52
    %tag_9 = seq.firreg %641 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 468 : ui64} : i52
    %tag_10 = seq.firreg %647 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 520 : ui64} : i52
    %tag_11 = seq.firreg %653 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 572 : ui64} : i52
    %tag_12 = seq.firreg %659 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 624 : ui64} : i52
    %tag_13 = seq.firreg %665 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 676 : ui64} : i52
    %tag_14 = seq.firreg %671 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 728 : ui64} : i52
    %tag_15 = seq.firreg %677 clock %clock reset sync %reset, %c0_i52 {firrtl.random_init_start = 780 : ui64} : i52
    %paddr_0 = seq.firreg %749 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 832 : ui64} : i20
    %paddr_1 = seq.firreg %754 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 852 : ui64} : i20
    %paddr_2 = seq.firreg %759 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 872 : ui64} : i20
    %paddr_3 = seq.firreg %764 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 892 : ui64} : i20
    %paddr_4 = seq.firreg %769 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 912 : ui64} : i20
    %paddr_5 = seq.firreg %774 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 932 : ui64} : i20
    %paddr_6 = seq.firreg %779 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 952 : ui64} : i20
    %paddr_7 = seq.firreg %784 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 972 : ui64} : i20
    %paddr_8 = seq.firreg %789 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 992 : ui64} : i20
    %paddr_9 = seq.firreg %794 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1012 : ui64} : i20
    %paddr_10 = seq.firreg %799 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1032 : ui64} : i20
    %paddr_11 = seq.firreg %804 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1052 : ui64} : i20
    %paddr_12 = seq.firreg %809 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1072 : ui64} : i20
    %paddr_13 = seq.firreg %814 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1092 : ui64} : i20
    %paddr_14 = seq.firreg %819 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1112 : ui64} : i20
    %paddr_15 = seq.firreg %824 clock %clock reset sync %reset, %c0_i20 {firrtl.random_init_start = 1132 : ui64} : i20
    %info_0 = seq.firreg %991 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1152 : ui64} : i10
    %info_1 = seq.firreg %997 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1162 : ui64} : i10
    %info_2 = seq.firreg %1003 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1172 : ui64} : i10
    %info_3 = seq.firreg %1009 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1182 : ui64} : i10
    %info_4 = seq.firreg %1015 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1192 : ui64} : i10
    %info_5 = seq.firreg %1021 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1202 : ui64} : i10
    %info_6 = seq.firreg %1027 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1212 : ui64} : i10
    %info_7 = seq.firreg %1033 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1222 : ui64} : i10
    %info_8 = seq.firreg %1039 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1232 : ui64} : i10
    %info_9 = seq.firreg %1045 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1242 : ui64} : i10
    %info_10 = seq.firreg %1051 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1252 : ui64} : i10
    %info_11 = seq.firreg %1057 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1262 : ui64} : i10
    %info_12 = seq.firreg %1063 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1272 : ui64} : i10
    %info_13 = seq.firreg %1069 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1282 : ui64} : i10
    %info_14 = seq.firreg %1075 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1292 : ui64} : i10
    %info_15 = seq.firreg %1081 clock %clock reset sync %reset, %c0_i10 {firrtl.random_init_start = 1302 : ui64} : i10
    %pte_addr_0 = seq.firreg %829 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1312 : ui64} : i32
    %pte_addr_1 = seq.firreg %834 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1344 : ui64} : i32
    %pte_addr_2 = seq.firreg %839 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1376 : ui64} : i32
    %pte_addr_3 = seq.firreg %844 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1408 : ui64} : i32
    %pte_addr_4 = seq.firreg %849 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1440 : ui64} : i32
    %pte_addr_5 = seq.firreg %854 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1472 : ui64} : i32
    %pte_addr_6 = seq.firreg %859 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1504 : ui64} : i32
    %pte_addr_7 = seq.firreg %864 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1536 : ui64} : i32
    %pte_addr_8 = seq.firreg %869 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1568 : ui64} : i32
    %pte_addr_9 = seq.firreg %874 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1600 : ui64} : i32
    %pte_addr_10 = seq.firreg %879 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1632 : ui64} : i32
    %pte_addr_11 = seq.firreg %884 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1664 : ui64} : i32
    %pte_addr_12 = seq.firreg %889 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1696 : ui64} : i32
    %pte_addr_13 = seq.firreg %894 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1728 : ui64} : i32
    %pte_addr_14 = seq.firreg %899 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1760 : ui64} : i32
    %pte_addr_15 = seq.firreg %904 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1792 : ui64} : i32
    %pte_level_0 = seq.firreg %909 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1824 : ui64} : i2
    %pte_level_1 = seq.firreg %914 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1826 : ui64} : i2
    %pte_level_2 = seq.firreg %919 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1828 : ui64} : i2
    %pte_level_3 = seq.firreg %924 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1830 : ui64} : i2
    %pte_level_4 = seq.firreg %929 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1832 : ui64} : i2
    %pte_level_5 = seq.firreg %934 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1834 : ui64} : i2
    %pte_level_6 = seq.firreg %939 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1836 : ui64} : i2
    %pte_level_7 = seq.firreg %944 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1838 : ui64} : i2
    %pte_level_8 = seq.firreg %949 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1840 : ui64} : i2
    %pte_level_9 = seq.firreg %954 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1842 : ui64} : i2
    %pte_level_10 = seq.firreg %959 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1844 : ui64} : i2
    %pte_level_11 = seq.firreg %964 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1846 : ui64} : i2
    %pte_level_12 = seq.firreg %969 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1848 : ui64} : i2
    %pte_level_13 = seq.firreg %974 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1850 : ui64} : i2
    %pte_level_14 = seq.firreg %979 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1852 : ui64} : i2
    %pte_level_15 = seq.firreg %984 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 1854 : ui64} : i2
    %valid_0 = seq.firreg %681 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1856 : ui64} : i1
    %valid_1 = seq.firreg %685 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1857 : ui64} : i1
    %valid_2 = seq.firreg %689 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1858 : ui64} : i1
    %valid_3 = seq.firreg %693 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1859 : ui64} : i1
    %valid_4 = seq.firreg %697 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1860 : ui64} : i1
    %valid_5 = seq.firreg %701 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1861 : ui64} : i1
    %valid_6 = seq.firreg %705 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1862 : ui64} : i1
    %valid_7 = seq.firreg %709 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1863 : ui64} : i1
    %valid_8 = seq.firreg %713 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1864 : ui64} : i1
    %valid_9 = seq.firreg %717 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1865 : ui64} : i1
    %valid_10 = seq.firreg %721 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1866 : ui64} : i1
    %valid_11 = seq.firreg %725 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1867 : ui64} : i1
    %valid_12 = seq.firreg %729 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1868 : ui64} : i1
    %valid_13 = seq.firreg %733 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1869 : ui64} : i1
    %valid_14 = seq.firreg %737 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1870 : ui64} : i1
    %valid_15 = seq.firreg %741 clock %clock reset sync %reset, %false {firrtl.random_init_start = 1871 : ui64} : i1
    %pre_addr = seq.firreg %280 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1872 : ui64} : i64
    %pte_addr_r = seq.firreg %516 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 1936 : ui64, sv.namehint = "pte_addr_r"} : i32
    %wpte_data_r = seq.firreg %351 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 1968 : ui64, sv.namehint = "wpte_data_r"} : i64
    %dc_mode_r = seq.firreg %523 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 2032 : ui64, sv.namehint = "dc_mode_r"} : i5
    %out_valid_r = seq.firreg %1082 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2038 : ui64, sv.namehint = "out_valid_r"} : i1
    %out_paddr_r = seq.firreg %1083 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 2039 : ui64, sv.namehint = "out_paddr_r"} : i32
    %out_excep_r_cause = seq.firreg %444 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 2071 : ui64, sv.namehint = "out_excep_r_cause"} : i64
    %out_excep_r_tval = seq.firreg %448 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 2135 : ui64, sv.namehint = "out_excep_r_tval"} : i64
    %out_excep_r_en = seq.firreg %566 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2199 : ui64, sv.namehint = "out_excep_r_en"} : i1
    %1 = comb.and bin %io_va2pa_vvalid, %277, %278, %279 {sv.namehint = "handshake"} : i1
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
    %19 = comb.and bin %2, %18 : i52
    %20 = comb.icmp bin eq %19, %tag_0 : i52
    %21 = comb.and bin %20, %valid_0 : i1
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
    %32 = comb.and bin %2, %31 : i52
    %33 = comb.icmp bin eq %32, %tag_1 : i52
    %34 = comb.and bin %33, %valid_1 : i1
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
    %46 = comb.and bin %2, %45 : i52
    %47 = comb.icmp bin eq %46, %tag_2 : i52
    %48 = comb.and bin %47, %valid_2 : i1
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
    %60 = comb.and bin %2, %59 : i52
    %61 = comb.icmp bin eq %60, %tag_3 : i52
    %62 = comb.and bin %61, %valid_3 : i1
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
    %74 = comb.and bin %2, %73 : i52
    %75 = comb.icmp bin eq %74, %tag_4 : i52
    %76 = comb.and bin %75, %valid_4 : i1
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
    %88 = comb.and bin %2, %87 : i52
    %89 = comb.icmp bin eq %88, %tag_5 : i52
    %90 = comb.and bin %89, %valid_5 : i1
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
    %102 = comb.and bin %2, %101 : i52
    %103 = comb.icmp bin eq %102, %tag_6 : i52
    %104 = comb.and bin %103, %valid_6 : i1
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
    %116 = comb.and bin %2, %115 : i52
    %117 = comb.icmp bin eq %116, %tag_7 : i52
    %118 = comb.and bin %117, %valid_7 : i1
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
    %130 = comb.and bin %2, %129 : i52
    %131 = comb.icmp bin eq %130, %tag_8 : i52
    %132 = comb.and bin %131, %valid_8 : i1
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
    %144 = comb.and bin %2, %143 : i52
    %145 = comb.icmp bin eq %144, %tag_9 : i52
    %146 = comb.and bin %145, %valid_9 : i1
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
    %158 = comb.and bin %2, %157 : i52
    %159 = comb.icmp bin eq %158, %tag_10 : i52
    %160 = comb.and bin %159, %valid_10 : i1
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
    %172 = comb.and bin %2, %171 : i52
    %173 = comb.icmp bin eq %172, %tag_11 : i52
    %174 = comb.and bin %173, %valid_11 : i1
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
    %186 = comb.and bin %2, %185 : i52
    %187 = comb.icmp bin eq %186, %tag_12 : i52
    %188 = comb.and bin %187, %valid_12 : i1
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
    %200 = comb.and bin %2, %199 : i52
    %201 = comb.icmp bin eq %200, %tag_13 : i52
    %202 = comb.and bin %201, %valid_13 : i1
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
    %214 = comb.and bin %2, %213 : i52
    %215 = comb.icmp bin eq %214, %tag_14 : i52
    %216 = comb.and bin %215, %valid_14 : i1
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
    %228 = comb.and bin %2, %227 : i52
    %229 = comb.icmp bin eq %228, %tag_15 : i52
    %230 = comb.and bin %229, %valid_15 : i1
    %231 = comb.or %230, %216, %202, %188, %174, %160, %146, %132, %118, %104, %90, %76, %62, %48, %34, %21 {sv.namehint = "tlbMsg_tlbHit"} : i1
    %232 = comb.mux bin %230, %paddr_15, %217 {sv.namehint = "tlbMsg_tlbPa"} : i20
    %233 = comb.mux bin %230, %info_15, %218 {sv.namehint = "tlbMsg_tlbInfo"} : i10
    %234 = comb.mux bin %230, %pte_addr_15, %219 {sv.namehint = "tlbMsg_tlbPteAddr"} : i32
    %235 = comb.mux bin %230, %c-1_i4, %220 {sv.namehint = "tlbMsg_tlbIdx"} : i4
    %236 = comb.mux bin %230, %pte_level_15, %221 {sv.namehint = "tlbMsg_tlbLevel"} : i2
    %state = seq.firreg %573 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 2200 : ui64} : i2
    %flush_r = seq.firreg %273 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2202 : ui64} : i1
    %237 = comb.or bin %io_flush, %flush_r : i1
    %238 = comb.icmp bin ne %state, %c0_i2 : i2
    %239 = comb.xor bin %238, %true : i1
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
    %277 = comb.xor bin %238, %true {sv.namehint = "_io_va2pa_ready_T"} : i1
    %278 = comb.xor bin %io_flush, %true {sv.namehint = "_io_va2pa_ready_T_2"} : i1
    %279 = comb.xor bin %flush_r, %true {sv.namehint = "_io_va2pa_ready_T_4"} : i1
    %280 = comb.mux bin %1, %io_va2pa_vaddr, %pre_addr : i64
    %281 = comb.or bin %out_valid_r, %out_excep_r_en : i1
    %282 = comb.xor %281, %true : i1
    %283 = comb.and %282, %out_valid_r : i1
    %284 = comb.xor %281, %true : i1
    %285 = comb.and %284, %out_excep_r_en : i1
    %286 = comb.icmp bin ne %dc_mode_r, %c0_i5 {sv.namehint = "_dc_hand_T"} : i5
    %287 = comb.and bin %io_dcacheRW_ready, %286 {sv.namehint = "dc_hand"} : i1
    %288 = comb.extract %io_va2pa_vaddr from 38 {sv.namehint = "_tlb_high_legal_T_1"} : (i64) -> i1
    %289 = comb.replicate %288 {sv.namehint = "_tlb_high_legal_T_2"} : (i1) -> i25
    %290 = comb.extract %io_va2pa_vaddr from 39 {sv.namehint = "_tlb_high_legal_T_3"} : (i64) -> i25
    %291 = comb.icmp bin eq %274, %c1_i2 {sv.namehint = "_tlb_access_illegal_T"} : i2
    %292 = comb.extract %233 from 3 {sv.namehint = "_tlb_access_illegal_T_7"} : (i10) -> i1
    %293 = comb.xor bin %292, %true {sv.namehint = "_tlb_access_illegal_T_2"} : i1
    %294 = comb.and bin %291, %293 {sv.namehint = "_tlb_access_illegal_T_3"} : i1
    %295 = comb.icmp bin eq %274, %c-2_i2 {sv.namehint = "_tlb_access_illegal_T_4"} : i2
    %296 = comb.extract %233 from 1 {sv.namehint = "_tlb_access_illegal_T_5"} : (i10) -> i1
    %297 = comb.extract %io_mmuState_mstatus from 19 {sv.namehint = "_tlb_access_illegal_T_6"} : (i64) -> i1
    %298 = comb.and bin %297, %292 {sv.namehint = "_tlb_access_illegal_T_8"} : i1
    %299 = comb.or bin %296, %298 {sv.namehint = "_tlb_access_illegal_T_9"} : i1
    %300 = comb.xor bin %299, %true {sv.namehint = "_tlb_access_illegal_T_10"} : i1
    %301 = comb.and bin %295, %300 {sv.namehint = "_tlb_access_illegal_T_11"} : i1
    %302 = comb.extract %233 from 2 {sv.namehint = "_tlb_access_illegal_T_14"} : (i10) -> i1
    %303 = comb.xor bin %302, %true {sv.namehint = "_tlb_access_illegal_T_15"} : i1
    %304 = comb.and bin %275, %303 {sv.namehint = "_tlb_access_illegal_T_16"} : i1
    %305 = comb.or bin %294, %301, %304 {sv.namehint = "tlb_access_illegal"} : i1
    %select_prng.io_out_0, %select_prng.io_out_1, %select_prng.io_out_2, %select_prng.io_out_3 = hw.instance "select_prng" @MaxPeriodFibonacciLFSR_2(clock: %clock: !seq.clock, reset: %reset: i1) -> (io_out_0: i1, io_out_1: i1, io_out_2: i1, io_out_3: i1) {sv.namehint = "select_prng.io_out_3"}
    %306 = comb.concat %select_prng.io_out_3, %select_prng.io_out_2, %select_prng.io_out_1, %select_prng.io_out_0 {sv.namehint = "select"} : i1, i1, i1, i1
    %select_r = seq.firreg %436 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 2205 : ui64} : i4
    %offset = seq.firreg %491 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 2209 : ui64} : i8
    %level = seq.firreg %497 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 2217 : ui64} : i2
    %wpte_hs_r = seq.firreg %482 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2263 : ui64} : i1
    %307 = comb.concat %12, %state : i1, i2
    %308 = comb.icmp bin ne %307, %c0_i3 : i3
    %309 = comb.xor bin %1, %true : i1
    %310 = comb.icmp bin ne %289, %290 : i25
    %311 = comb.and bin %231, %305 : i1
    %312 = comb.or bin %310, %311 : i1
    %313 = hw.array_get %0[%io_va2pa_m_type] {sv.namehint = "_out_excep_r_cause_T_5"} : !hw.array<4xi64>, i2
    %314 = comb.or bin %309, %312 : i1
    %315 = comb.xor %314, %true : i1
    %316 = comb.xor %238, %true : i1
    %317 = comb.and %316, %315, %231 : i1
    %318 = comb.or %317, %283 : i1
    %319 = comb.icmp bin eq %236, %c0_i2 {sv.namehint = "_paddr_mask_T_3"} : i2
    %320 = comb.icmp bin eq %236, %c1_i2 {sv.namehint = "_paddr_mask_T_5"} : i2
    %321 = comb.replicate %319 : (i1) -> i20
    %322 = comb.mux %320, %c-512_i20, %321 {sv.namehint = "_paddr_mask_T_6"} : i20
    %323 = comb.icmp bin eq %236, %c-2_i2 {sv.namehint = "_paddr_mask_T_7"} : i2
    %324 = comb.mux %323, %c-262144_i20, %322 {sv.namehint = "paddr_mask_hi"} : i20
    %325 = comb.concat %232, %c0_i12 {sv.namehint = "_out_paddr_r_T"} : i20, i12
    %326 = comb.xor %324, %c-1_i20 : i20
    %327 = comb.concat %324, %c0_i12 : i20, i12
    %328 = comb.and bin %327, %325 : i32
    %329 = comb.extract %io_va2pa_vaddr from 0 : (i64) -> i32
    %330 = comb.concat %326, %c-1_i12 : i20, i12
    %331 = comb.and bin %329, %330 : i32
    %332 = comb.or bin %331, %328 : i32
    %333 = comb.xor %231, %true : i1
    %334 = comb.or %238, %314, %333 : i1
    %335 = comb.mux bin %334, %out_paddr_r, %332 : i32
    %336 = comb.and bin %276, %233 : i10
    %337 = comb.icmp bin ne %336, %276 : i10
    %338 = comb.and bin %337, %12 : i1
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
    %432 = comb.xor bin %231, %true : i1
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
    %449 = comb.replicate %288 : (i1) -> i25
    %450 = comb.icmp bin eq %290, %449 : i25
    %451 = comb.xor %450, %true : i1
    %452 = comb.xor %231, %true : i1
    %453 = comb.xor %231, %true : i1
    %454 = comb.and %453, %452, %451 : i1
    %455 = comb.or %312, %454 : i1
    %456 = comb.and %1, %455 : i1
    %457 = comb.or %456, %285 : i1
    %458 = comb.extract %io_va2pa_vaddr from 30 {sv.namehint = "pte_addr_r_hi_lo"} : (i64) -> i9
    %459 = comb.extract %io_mmuState_satp from 0 : (i64) -> i20
    %460 = comb.concat %459, %458, %c0_i3 : i20, i9, i3
    %461 = comb.and bin %432, %450 : i1
    %462 = comb.mux bin %461, %460, %pte_addr_r : i32
    %463 = comb.mux bin %231, %344, %462 : i32
    %464 = comb.mux bin %314, %pte_addr_r, %463 : i32
    %465 = comb.xor %461, %true : i1
    %466 = comb.or %433, %465 : i1
    %467 = comb.mux bin %466, %c0_i5, %c7_i5 : i5
    %468 = comb.xor %461, %true : i1
    %469 = comb.or %433, %468 : i1
    %470 = comb.mux bin %469, %offset, %c30_i8 : i8
    %471 = comb.xor %461, %true : i1
    %472 = comb.or %433, %471 : i1
    %473 = comb.mux bin %472, %level, %c-1_i2 : i2
    %474 = comb.mux bin %231, %339, %c1_i2 : i2
    %475 = comb.mux bin %314, %state, %474 : i2
    %476 = comb.icmp bin eq %state, %c-1_i2 : i2
    %477 = comb.or bin %io_dcacheRW_ready, %wpte_hs_r : i1
    %478 = comb.mux bin %477, %c0_i5, %c11_i5 : i5
    %479 = comb.and bin %476, %io_dcacheRW_ready : i1
    %480 = comb.or %479, %wpte_hs_r : i1
    %481 = comb.mux bin %238, %480, %343 : i1
    %482 = comb.mux bin %308, %481, %wpte_hs_r : i1
    %483 = comb.icmp bin eq %state, %c1_i2 : i2
    %484 = comb.mux bin %287, %c0_i5, %dc_mode_r : i5
    %485 = comb.add %offset, %c-9_i8 {sv.namehint = "_offset_T"} : i8
    %486 = comb.and bin %483, %287 : i1
    %487 = comb.xor %486, %true : i1
    %488 = comb.or %476, %487 : i1
    %489 = comb.mux bin %488, %offset, %485 : i8
    %490 = comb.mux bin %238, %489, %470 : i8
    %491 = comb.mux bin %308, %490, %offset : i8
    %492 = comb.add %level, %c-1_i2 {sv.namehint = "_level_T"} : i2
    %493 = comb.xor %486, %true : i1
    %494 = comb.or %476, %493 : i1
    %495 = comb.mux bin %494, %level, %492 : i2
    %496 = comb.mux bin %238, %495, %473 : i2
    %497 = comb.mux bin %308, %496, %level : i2
    %498 = comb.extract %io_dcacheRW_rdata from 0 : (i64) -> i4
    %499 = comb.icmp bin eq %498, %c1_i4 : i4
    %500 = comb.extract %io_dcacheRW_rdata from 6 : (i64) -> i2
    %501 = comb.extract %io_dcacheRW_rdata from 4 : (i64) -> i1
    %502 = comb.concat %500, %501 : i2, i1
    %503 = comb.icmp bin ne %502, %c0_i3 : i3
    %504 = comb.or %503, %285 : i1
    %505 = comb.concat %c0_i56, %offset : i56, i8
    %506 = comb.shru bin %pre_addr, %505 {sv.namehint = "_pte_addr_r_T_2"} : i64
    %507 = comb.extract %506 from 0 {sv.namehint = "pte_addr_r_hi_lo_1"} : (i64) -> i9
    %508 = comb.extract %io_dcacheRW_rdata from 10 : (i64) -> i20
    %509 = comb.concat %508, %507, %c0_i3 : i20, i9, i3
    %510 = comb.and bin %io_dcacheRW_rvalid, %499 : i1
    %511 = comb.and bin %483, %510 : i1
    %512 = comb.xor %511, %true : i1
    %513 = comb.or %476, %512, %503 : i1
    %514 = comb.mux bin %513, %pte_addr_r, %509 : i32
    %515 = comb.mux bin %238, %514, %464 : i32
    %516 = comb.mux bin %308, %515, %pte_addr_r : i32
    %517 = comb.xor %510, %true : i1
    %518 = comb.or %517, %503 : i1
    %519 = comb.mux bin %518, %484, %c7_i5 : i5
    %520 = comb.mux bin %483, %519, %dc_mode_r : i5
    %521 = comb.mux bin %476, %478, %520 : i5
    %522 = comb.mux bin %238, %521, %467 : i5
    %523 = comb.mux bin %308, %522, %dc_mode_r : i5
    %524 = comb.extract %io_dcacheRW_rdata from 4 : (i64) -> i1
    %525 = comb.icmp bin eq %io_mmuState_priv, %c1_i2 : i2
    %526 = comb.extract %io_mmuState_mstatus from 18 : (i64) -> i1
    %527 = comb.xor bin %526, %true : i1
    %528 = comb.icmp bin eq %out_excep_r_cause, %c12_i64 : i64
    %529 = comb.or bin %527, %528 : i1
    %530 = comb.and bin %525, %529 : i1
    %531 = comb.icmp bin eq %io_mmuState_priv, %c0_i2 : i2
    %532 = comb.mux bin %524, %530, %531 : i1
    %533 = comb.extract %io_dcacheRW_rdata from 0 : (i64) -> i1
    %534 = comb.xor bin %533, %true : i1
    %535 = comb.extract %io_dcacheRW_rdata from 1 : (i64) -> i1
    %536 = comb.xor bin %535, %true : i1
    %537 = comb.extract %io_dcacheRW_rdata from 2 : (i64) -> i1
    %538 = comb.and bin %536, %537 : i1
    %539 = comb.extract %io_dcacheRW_rdata from 3 : (i64) -> i1
    %540 = comb.xor bin %539, %true : i1
    %541 = comb.and bin %528, %540 : i1
    %542 = comb.icmp bin eq %out_excep_r_cause, %c13_i64 : i64
    %543 = comb.and bin %297, %539 : i1
    %544 = comb.or bin %535, %543 : i1
    %545 = comb.xor bin %544, %true : i1
    %546 = comb.and bin %542, %545 : i1
    %547 = comb.icmp bin eq %out_excep_r_cause, %c15_i64 : i64
    %548 = comb.xor bin %537, %true : i1
    %549 = comb.and bin %547, %548 : i1
    %550 = comb.icmp bin eq %level, %c1_i2 {sv.namehint = "_ppn_mask_T_5"} : i2
    %551 = comb.extract %io_dcacheRW_rdata from 10 : (i64) -> i9
    %552 = comb.icmp bin ne %551, %c0_i9 : i9
    %553 = comb.and bin %550, %552 : i1
    %554 = comb.icmp bin eq %level, %c-2_i2 {sv.namehint = "_ppn_mask_T_7"} : i2
    %555 = comb.extract %io_dcacheRW_rdata from 10 : (i64) -> i18
    %556 = comb.icmp bin ne %555, %c0_i18 : i18
    %557 = comb.and bin %554, %556 : i1
    %558 = comb.or bin %532, %534, %538, %541, %546, %549, %553, %557 : i1
    %559 = comb.or %558, %285 : i1
    %560 = comb.mux bin %499, %504, %559 : i1
    %561 = comb.and bin %483, %io_dcacheRW_rvalid : i1
    %562 = comb.xor %561, %true : i1
    %563 = comb.or %476, %562 : i1
    %564 = comb.mux bin %563, %285, %560 : i1
    %565 = comb.mux bin %238, %564, %457 : i1
    %566 = comb.mux bin %308, %565, %285 : i1
    %567 = comb.xor %499, %true : i1
    %568 = comb.or %567, %503 : i1
    %569 = comb.and %561, %568 : i1
    %570 = comb.mux %476, %io_dcacheRW_rvalid, %569 : i1
    %571 = comb.mux bin %570, %c0_i2, %state : i2
    %572 = comb.mux bin %238, %571, %475 : i2
    %573 = comb.mux bin %308, %572, %state : i2
    %574 = comb.icmp bin eq %level, %c0_i2 {sv.namehint = "_ppn_mask_T_3"} : i2
    %575 = comb.replicate %574 {sv.namehint = "_ppn_mask_T_4"} : (i1) -> i52
    %576 = comb.mux bin %550, %c-512_i52, %575 {sv.namehint = "_ppn_mask_T_6"} : i52
    %577 = comb.mux bin %554, %c-262144_i52, %576 {sv.namehint = "ppn_mask"} : i52
    %578 = comb.extract %pre_addr from 12 {sv.namehint = "_tag_T"} : (i64) -> i52
    %579 = comb.and bin %578, %577 {sv.namehint = "_tag_T_1"} : i52
    %580 = comb.icmp bin eq %select_r, %c0_i4 : i4
    %581 = comb.or bin %499, %558 : i1
    %582 = comb.xor %580, %true : i1
    %583 = comb.xor %561, %true : i1
    %584 = comb.or bin %277, %476 : i1
    %585 = comb.xor %308, %true : i1
    %586 = comb.or %585, %584, %583, %581, %582 : i1
    %587 = comb.mux bin %586, %tag_0, %579 : i52
    %588 = comb.icmp bin eq %select_r, %c1_i4 : i4
    %589 = comb.xor %588, %true : i1
    %590 = comb.xor %561, %true : i1
    %591 = comb.xor %308, %true : i1
    %592 = comb.or %591, %584, %590, %581, %589 : i1
    %593 = comb.mux bin %592, %tag_1, %579 : i52
    %594 = comb.icmp bin eq %select_r, %c2_i4 : i4
    %595 = comb.xor %594, %true : i1
    %596 = comb.xor %561, %true : i1
    %597 = comb.xor %308, %true : i1
    %598 = comb.or %597, %584, %596, %581, %595 : i1
    %599 = comb.mux bin %598, %tag_2, %579 : i52
    %600 = comb.icmp bin eq %select_r, %c3_i4 : i4
    %601 = comb.xor %600, %true : i1
    %602 = comb.xor %561, %true : i1
    %603 = comb.xor %308, %true : i1
    %604 = comb.or %603, %584, %602, %581, %601 : i1
    %605 = comb.mux bin %604, %tag_3, %579 : i52
    %606 = comb.icmp bin eq %select_r, %c4_i4 : i4
    %607 = comb.xor %606, %true : i1
    %608 = comb.xor %561, %true : i1
    %609 = comb.xor %308, %true : i1
    %610 = comb.or %609, %584, %608, %581, %607 : i1
    %611 = comb.mux bin %610, %tag_4, %579 : i52
    %612 = comb.icmp bin eq %select_r, %c5_i4 : i4
    %613 = comb.xor %612, %true : i1
    %614 = comb.xor %561, %true : i1
    %615 = comb.xor %308, %true : i1
    %616 = comb.or %615, %584, %614, %581, %613 : i1
    %617 = comb.mux bin %616, %tag_5, %579 : i52
    %618 = comb.icmp bin eq %select_r, %c6_i4 : i4
    %619 = comb.xor %618, %true : i1
    %620 = comb.xor %561, %true : i1
    %621 = comb.xor %308, %true : i1
    %622 = comb.or %621, %584, %620, %581, %619 : i1
    %623 = comb.mux bin %622, %tag_6, %579 : i52
    %624 = comb.icmp bin eq %select_r, %c7_i4 : i4
    %625 = comb.xor %624, %true : i1
    %626 = comb.xor %561, %true : i1
    %627 = comb.xor %308, %true : i1
    %628 = comb.or %627, %584, %626, %581, %625 : i1
    %629 = comb.mux bin %628, %tag_7, %579 : i52
    %630 = comb.icmp bin eq %select_r, %c-8_i4 : i4
    %631 = comb.xor %630, %true : i1
    %632 = comb.xor %561, %true : i1
    %633 = comb.xor %308, %true : i1
    %634 = comb.or %633, %584, %632, %581, %631 : i1
    %635 = comb.mux bin %634, %tag_8, %579 : i52
    %636 = comb.icmp bin eq %select_r, %c-7_i4 : i4
    %637 = comb.xor %636, %true : i1
    %638 = comb.xor %561, %true : i1
    %639 = comb.xor %308, %true : i1
    %640 = comb.or %639, %584, %638, %581, %637 : i1
    %641 = comb.mux bin %640, %tag_9, %579 : i52
    %642 = comb.icmp bin eq %select_r, %c-6_i4 : i4
    %643 = comb.xor %642, %true : i1
    %644 = comb.xor %561, %true : i1
    %645 = comb.xor %308, %true : i1
    %646 = comb.or %645, %584, %644, %581, %643 : i1
    %647 = comb.mux bin %646, %tag_10, %579 : i52
    %648 = comb.icmp bin eq %select_r, %c-5_i4 : i4
    %649 = comb.xor %648, %true : i1
    %650 = comb.xor %561, %true : i1
    %651 = comb.xor %308, %true : i1
    %652 = comb.or %651, %584, %650, %581, %649 : i1
    %653 = comb.mux bin %652, %tag_11, %579 : i52
    %654 = comb.icmp bin eq %select_r, %c-4_i4 : i4
    %655 = comb.xor %654, %true : i1
    %656 = comb.xor %561, %true : i1
    %657 = comb.xor %308, %true : i1
    %658 = comb.or %657, %584, %656, %581, %655 : i1
    %659 = comb.mux bin %658, %tag_12, %579 : i52
    %660 = comb.icmp bin eq %select_r, %c-3_i4 : i4
    %661 = comb.xor %660, %true : i1
    %662 = comb.xor %561, %true : i1
    %663 = comb.xor %308, %true : i1
    %664 = comb.or %663, %584, %662, %581, %661 : i1
    %665 = comb.mux bin %664, %tag_13, %579 : i52
    %666 = comb.icmp bin eq %select_r, %c-2_i4 : i4
    %667 = comb.xor %666, %true : i1
    %668 = comb.xor %561, %true : i1
    %669 = comb.xor %308, %true : i1
    %670 = comb.or %669, %584, %668, %581, %667 : i1
    %671 = comb.mux bin %670, %tag_14, %579 : i52
    %672 = comb.icmp bin eq %select_r, %c-1_i4 : i4
    %673 = comb.xor %672, %true : i1
    %674 = comb.xor %561, %true : i1
    %675 = comb.xor %308, %true : i1
    %676 = comb.or %675, %584, %674, %581, %673 : i1
    %677 = comb.mux bin %676, %tag_15, %579 : i52
    %678 = comb.xor %581, %true : i1
    %679 = comb.xor %584, %true : i1
    %680 = comb.and %308, %679, %561, %678, %580 : i1
    %681 = comb.or %680, %242 : i1
    %682 = comb.xor %581, %true : i1
    %683 = comb.xor %584, %true : i1
    %684 = comb.and %308, %683, %561, %682, %588 : i1
    %685 = comb.or %684, %244 : i1
    %686 = comb.xor %581, %true : i1
    %687 = comb.xor %584, %true : i1
    %688 = comb.and %308, %687, %561, %686, %594 : i1
    %689 = comb.or %688, %246 : i1
    %690 = comb.xor %581, %true : i1
    %691 = comb.xor %584, %true : i1
    %692 = comb.and %308, %691, %561, %690, %600 : i1
    %693 = comb.or %692, %248 : i1
    %694 = comb.xor %581, %true : i1
    %695 = comb.xor %584, %true : i1
    %696 = comb.and %308, %695, %561, %694, %606 : i1
    %697 = comb.or %696, %250 : i1
    %698 = comb.xor %581, %true : i1
    %699 = comb.xor %584, %true : i1
    %700 = comb.and %308, %699, %561, %698, %612 : i1
    %701 = comb.or %700, %252 : i1
    %702 = comb.xor %581, %true : i1
    %703 = comb.xor %584, %true : i1
    %704 = comb.and %308, %703, %561, %702, %618 : i1
    %705 = comb.or %704, %254 : i1
    %706 = comb.xor %581, %true : i1
    %707 = comb.xor %584, %true : i1
    %708 = comb.and %308, %707, %561, %706, %624 : i1
    %709 = comb.or %708, %256 : i1
    %710 = comb.xor %581, %true : i1
    %711 = comb.xor %584, %true : i1
    %712 = comb.and %308, %711, %561, %710, %630 : i1
    %713 = comb.or %712, %258 : i1
    %714 = comb.xor %581, %true : i1
    %715 = comb.xor %584, %true : i1
    %716 = comb.and %308, %715, %561, %714, %636 : i1
    %717 = comb.or %716, %260 : i1
    %718 = comb.xor %581, %true : i1
    %719 = comb.xor %584, %true : i1
    %720 = comb.and %308, %719, %561, %718, %642 : i1
    %721 = comb.or %720, %262 : i1
    %722 = comb.xor %581, %true : i1
    %723 = comb.xor %584, %true : i1
    %724 = comb.and %308, %723, %561, %722, %648 : i1
    %725 = comb.or %724, %264 : i1
    %726 = comb.xor %581, %true : i1
    %727 = comb.xor %584, %true : i1
    %728 = comb.and %308, %727, %561, %726, %654 : i1
    %729 = comb.or %728, %266 : i1
    %730 = comb.xor %581, %true : i1
    %731 = comb.xor %584, %true : i1
    %732 = comb.and %308, %731, %561, %730, %660 : i1
    %733 = comb.or %732, %268 : i1
    %734 = comb.xor %581, %true : i1
    %735 = comb.xor %584, %true : i1
    %736 = comb.and %308, %735, %561, %734, %666 : i1
    %737 = comb.or %736, %270 : i1
    %738 = comb.xor %581, %true : i1
    %739 = comb.xor %584, %true : i1
    %740 = comb.and %308, %739, %561, %738, %672 : i1
    %741 = comb.or %740, %272 : i1
    %742 = comb.extract %io_dcacheRW_rdata from 10 {sv.namehint = "_update_pa_T"} : (i64) -> i20
    %743 = comb.extract %577 from 0 : (i52) -> i20
    %744 = comb.and bin %743, %742 : i20
    %745 = comb.xor %580, %true : i1
    %746 = comb.xor %561, %true : i1
    %747 = comb.xor %308, %true : i1
    %748 = comb.or %747, %584, %746, %581, %745 : i1
    %749 = comb.mux bin %748, %paddr_0, %744 : i20
    %750 = comb.xor %588, %true : i1
    %751 = comb.xor %561, %true : i1
    %752 = comb.xor %308, %true : i1
    %753 = comb.or %752, %584, %751, %581, %750 : i1
    %754 = comb.mux bin %753, %paddr_1, %744 : i20
    %755 = comb.xor %594, %true : i1
    %756 = comb.xor %561, %true : i1
    %757 = comb.xor %308, %true : i1
    %758 = comb.or %757, %584, %756, %581, %755 : i1
    %759 = comb.mux bin %758, %paddr_2, %744 : i20
    %760 = comb.xor %600, %true : i1
    %761 = comb.xor %561, %true : i1
    %762 = comb.xor %308, %true : i1
    %763 = comb.or %762, %584, %761, %581, %760 : i1
    %764 = comb.mux bin %763, %paddr_3, %744 : i20
    %765 = comb.xor %606, %true : i1
    %766 = comb.xor %561, %true : i1
    %767 = comb.xor %308, %true : i1
    %768 = comb.or %767, %584, %766, %581, %765 : i1
    %769 = comb.mux bin %768, %paddr_4, %744 : i20
    %770 = comb.xor %612, %true : i1
    %771 = comb.xor %561, %true : i1
    %772 = comb.xor %308, %true : i1
    %773 = comb.or %772, %584, %771, %581, %770 : i1
    %774 = comb.mux bin %773, %paddr_5, %744 : i20
    %775 = comb.xor %618, %true : i1
    %776 = comb.xor %561, %true : i1
    %777 = comb.xor %308, %true : i1
    %778 = comb.or %777, %584, %776, %581, %775 : i1
    %779 = comb.mux bin %778, %paddr_6, %744 : i20
    %780 = comb.xor %624, %true : i1
    %781 = comb.xor %561, %true : i1
    %782 = comb.xor %308, %true : i1
    %783 = comb.or %782, %584, %781, %581, %780 : i1
    %784 = comb.mux bin %783, %paddr_7, %744 : i20
    %785 = comb.xor %630, %true : i1
    %786 = comb.xor %561, %true : i1
    %787 = comb.xor %308, %true : i1
    %788 = comb.or %787, %584, %786, %581, %785 : i1
    %789 = comb.mux bin %788, %paddr_8, %744 : i20
    %790 = comb.xor %636, %true : i1
    %791 = comb.xor %561, %true : i1
    %792 = comb.xor %308, %true : i1
    %793 = comb.or %792, %584, %791, %581, %790 : i1
    %794 = comb.mux bin %793, %paddr_9, %744 : i20
    %795 = comb.xor %642, %true : i1
    %796 = comb.xor %561, %true : i1
    %797 = comb.xor %308, %true : i1
    %798 = comb.or %797, %584, %796, %581, %795 : i1
    %799 = comb.mux bin %798, %paddr_10, %744 : i20
    %800 = comb.xor %648, %true : i1
    %801 = comb.xor %561, %true : i1
    %802 = comb.xor %308, %true : i1
    %803 = comb.or %802, %584, %801, %581, %800 : i1
    %804 = comb.mux bin %803, %paddr_11, %744 : i20
    %805 = comb.xor %654, %true : i1
    %806 = comb.xor %561, %true : i1
    %807 = comb.xor %308, %true : i1
    %808 = comb.or %807, %584, %806, %581, %805 : i1
    %809 = comb.mux bin %808, %paddr_12, %744 : i20
    %810 = comb.xor %660, %true : i1
    %811 = comb.xor %561, %true : i1
    %812 = comb.xor %308, %true : i1
    %813 = comb.or %812, %584, %811, %581, %810 : i1
    %814 = comb.mux bin %813, %paddr_13, %744 : i20
    %815 = comb.xor %666, %true : i1
    %816 = comb.xor %561, %true : i1
    %817 = comb.xor %308, %true : i1
    %818 = comb.or %817, %584, %816, %581, %815 : i1
    %819 = comb.mux bin %818, %paddr_14, %744 : i20
    %820 = comb.xor %672, %true : i1
    %821 = comb.xor %561, %true : i1
    %822 = comb.xor %308, %true : i1
    %823 = comb.or %822, %584, %821, %581, %820 : i1
    %824 = comb.mux bin %823, %paddr_15, %744 : i20
    %825 = comb.xor %580, %true : i1
    %826 = comb.xor %561, %true : i1
    %827 = comb.xor %308, %true : i1
    %828 = comb.or %827, %584, %826, %581, %825 : i1
    %829 = comb.mux bin %828, %pte_addr_0, %pte_addr_r : i32
    %830 = comb.xor %588, %true : i1
    %831 = comb.xor %561, %true : i1
    %832 = comb.xor %308, %true : i1
    %833 = comb.or %832, %584, %831, %581, %830 : i1
    %834 = comb.mux bin %833, %pte_addr_1, %pte_addr_r : i32
    %835 = comb.xor %594, %true : i1
    %836 = comb.xor %561, %true : i1
    %837 = comb.xor %308, %true : i1
    %838 = comb.or %837, %584, %836, %581, %835 : i1
    %839 = comb.mux bin %838, %pte_addr_2, %pte_addr_r : i32
    %840 = comb.xor %600, %true : i1
    %841 = comb.xor %561, %true : i1
    %842 = comb.xor %308, %true : i1
    %843 = comb.or %842, %584, %841, %581, %840 : i1
    %844 = comb.mux bin %843, %pte_addr_3, %pte_addr_r : i32
    %845 = comb.xor %606, %true : i1
    %846 = comb.xor %561, %true : i1
    %847 = comb.xor %308, %true : i1
    %848 = comb.or %847, %584, %846, %581, %845 : i1
    %849 = comb.mux bin %848, %pte_addr_4, %pte_addr_r : i32
    %850 = comb.xor %612, %true : i1
    %851 = comb.xor %561, %true : i1
    %852 = comb.xor %308, %true : i1
    %853 = comb.or %852, %584, %851, %581, %850 : i1
    %854 = comb.mux bin %853, %pte_addr_5, %pte_addr_r : i32
    %855 = comb.xor %618, %true : i1
    %856 = comb.xor %561, %true : i1
    %857 = comb.xor %308, %true : i1
    %858 = comb.or %857, %584, %856, %581, %855 : i1
    %859 = comb.mux bin %858, %pte_addr_6, %pte_addr_r : i32
    %860 = comb.xor %624, %true : i1
    %861 = comb.xor %561, %true : i1
    %862 = comb.xor %308, %true : i1
    %863 = comb.or %862, %584, %861, %581, %860 : i1
    %864 = comb.mux bin %863, %pte_addr_7, %pte_addr_r : i32
    %865 = comb.xor %630, %true : i1
    %866 = comb.xor %561, %true : i1
    %867 = comb.xor %308, %true : i1
    %868 = comb.or %867, %584, %866, %581, %865 : i1
    %869 = comb.mux bin %868, %pte_addr_8, %pte_addr_r : i32
    %870 = comb.xor %636, %true : i1
    %871 = comb.xor %561, %true : i1
    %872 = comb.xor %308, %true : i1
    %873 = comb.or %872, %584, %871, %581, %870 : i1
    %874 = comb.mux bin %873, %pte_addr_9, %pte_addr_r : i32
    %875 = comb.xor %642, %true : i1
    %876 = comb.xor %561, %true : i1
    %877 = comb.xor %308, %true : i1
    %878 = comb.or %877, %584, %876, %581, %875 : i1
    %879 = comb.mux bin %878, %pte_addr_10, %pte_addr_r : i32
    %880 = comb.xor %648, %true : i1
    %881 = comb.xor %561, %true : i1
    %882 = comb.xor %308, %true : i1
    %883 = comb.or %882, %584, %881, %581, %880 : i1
    %884 = comb.mux bin %883, %pte_addr_11, %pte_addr_r : i32
    %885 = comb.xor %654, %true : i1
    %886 = comb.xor %561, %true : i1
    %887 = comb.xor %308, %true : i1
    %888 = comb.or %887, %584, %886, %581, %885 : i1
    %889 = comb.mux bin %888, %pte_addr_12, %pte_addr_r : i32
    %890 = comb.xor %660, %true : i1
    %891 = comb.xor %561, %true : i1
    %892 = comb.xor %308, %true : i1
    %893 = comb.or %892, %584, %891, %581, %890 : i1
    %894 = comb.mux bin %893, %pte_addr_13, %pte_addr_r : i32
    %895 = comb.xor %666, %true : i1
    %896 = comb.xor %561, %true : i1
    %897 = comb.xor %308, %true : i1
    %898 = comb.or %897, %584, %896, %581, %895 : i1
    %899 = comb.mux bin %898, %pte_addr_14, %pte_addr_r : i32
    %900 = comb.xor %672, %true : i1
    %901 = comb.xor %561, %true : i1
    %902 = comb.xor %308, %true : i1
    %903 = comb.or %902, %584, %901, %581, %900 : i1
    %904 = comb.mux bin %903, %pte_addr_15, %pte_addr_r : i32
    %905 = comb.xor %580, %true : i1
    %906 = comb.xor %561, %true : i1
    %907 = comb.xor %308, %true : i1
    %908 = comb.or %907, %584, %906, %581, %905 : i1
    %909 = comb.mux bin %908, %pte_level_0, %level : i2
    %910 = comb.xor %588, %true : i1
    %911 = comb.xor %561, %true : i1
    %912 = comb.xor %308, %true : i1
    %913 = comb.or %912, %584, %911, %581, %910 : i1
    %914 = comb.mux bin %913, %pte_level_1, %level : i2
    %915 = comb.xor %594, %true : i1
    %916 = comb.xor %561, %true : i1
    %917 = comb.xor %308, %true : i1
    %918 = comb.or %917, %584, %916, %581, %915 : i1
    %919 = comb.mux bin %918, %pte_level_2, %level : i2
    %920 = comb.xor %600, %true : i1
    %921 = comb.xor %561, %true : i1
    %922 = comb.xor %308, %true : i1
    %923 = comb.or %922, %584, %921, %581, %920 : i1
    %924 = comb.mux bin %923, %pte_level_3, %level : i2
    %925 = comb.xor %606, %true : i1
    %926 = comb.xor %561, %true : i1
    %927 = comb.xor %308, %true : i1
    %928 = comb.or %927, %584, %926, %581, %925 : i1
    %929 = comb.mux bin %928, %pte_level_4, %level : i2
    %930 = comb.xor %612, %true : i1
    %931 = comb.xor %561, %true : i1
    %932 = comb.xor %308, %true : i1
    %933 = comb.or %932, %584, %931, %581, %930 : i1
    %934 = comb.mux bin %933, %pte_level_5, %level : i2
    %935 = comb.xor %618, %true : i1
    %936 = comb.xor %561, %true : i1
    %937 = comb.xor %308, %true : i1
    %938 = comb.or %937, %584, %936, %581, %935 : i1
    %939 = comb.mux bin %938, %pte_level_6, %level : i2
    %940 = comb.xor %624, %true : i1
    %941 = comb.xor %561, %true : i1
    %942 = comb.xor %308, %true : i1
    %943 = comb.or %942, %584, %941, %581, %940 : i1
    %944 = comb.mux bin %943, %pte_level_7, %level : i2
    %945 = comb.xor %630, %true : i1
    %946 = comb.xor %561, %true : i1
    %947 = comb.xor %308, %true : i1
    %948 = comb.or %947, %584, %946, %581, %945 : i1
    %949 = comb.mux bin %948, %pte_level_8, %level : i2
    %950 = comb.xor %636, %true : i1
    %951 = comb.xor %561, %true : i1
    %952 = comb.xor %308, %true : i1
    %953 = comb.or %952, %584, %951, %581, %950 : i1
    %954 = comb.mux bin %953, %pte_level_9, %level : i2
    %955 = comb.xor %642, %true : i1
    %956 = comb.xor %561, %true : i1
    %957 = comb.xor %308, %true : i1
    %958 = comb.or %957, %584, %956, %581, %955 : i1
    %959 = comb.mux bin %958, %pte_level_10, %level : i2
    %960 = comb.xor %648, %true : i1
    %961 = comb.xor %561, %true : i1
    %962 = comb.xor %308, %true : i1
    %963 = comb.or %962, %584, %961, %581, %960 : i1
    %964 = comb.mux bin %963, %pte_level_11, %level : i2
    %965 = comb.xor %654, %true : i1
    %966 = comb.xor %561, %true : i1
    %967 = comb.xor %308, %true : i1
    %968 = comb.or %967, %584, %966, %581, %965 : i1
    %969 = comb.mux bin %968, %pte_level_12, %level : i2
    %970 = comb.xor %660, %true : i1
    %971 = comb.xor %561, %true : i1
    %972 = comb.xor %308, %true : i1
    %973 = comb.or %972, %584, %971, %581, %970 : i1
    %974 = comb.mux bin %973, %pte_level_13, %level : i2
    %975 = comb.xor %666, %true : i1
    %976 = comb.xor %561, %true : i1
    %977 = comb.xor %308, %true : i1
    %978 = comb.or %977, %584, %976, %581, %975 : i1
    %979 = comb.mux bin %978, %pte_level_14, %level : i2
    %980 = comb.xor %672, %true : i1
    %981 = comb.xor %561, %true : i1
    %982 = comb.xor %308, %true : i1
    %983 = comb.or %982, %584, %981, %581, %980 : i1
    %984 = comb.mux bin %983, %pte_level_15, %level : i2
    %985 = comb.extract %io_dcacheRW_rdata from 0 {sv.namehint = "_info_T_1"} : (i64) -> i10
    %986 = comb.xor %580, %true : i1
    %987 = comb.xor %561, %true : i1
    %988 = comb.or %476, %987, %581, %986 : i1
    %989 = comb.mux bin %988, %info_0, %985 : i10
    %990 = comb.mux bin %238, %989, %356 : i10
    %991 = comb.mux bin %308, %990, %info_0 : i10
    %992 = comb.xor %588, %true : i1
    %993 = comb.xor %561, %true : i1
    %994 = comb.or %476, %993, %581, %992 : i1
    %995 = comb.mux bin %994, %info_1, %985 : i10
    %996 = comb.mux bin %238, %995, %361 : i10
    %997 = comb.mux bin %308, %996, %info_1 : i10
    %998 = comb.xor %594, %true : i1
    %999 = comb.xor %561, %true : i1
    %1000 = comb.or %476, %999, %581, %998 : i1
    %1001 = comb.mux bin %1000, %info_2, %985 : i10
    %1002 = comb.mux bin %238, %1001, %366 : i10
    %1003 = comb.mux bin %308, %1002, %info_2 : i10
    %1004 = comb.xor %600, %true : i1
    %1005 = comb.xor %561, %true : i1
    %1006 = comb.or %476, %1005, %581, %1004 : i1
    %1007 = comb.mux bin %1006, %info_3, %985 : i10
    %1008 = comb.mux bin %238, %1007, %371 : i10
    %1009 = comb.mux bin %308, %1008, %info_3 : i10
    %1010 = comb.xor %606, %true : i1
    %1011 = comb.xor %561, %true : i1
    %1012 = comb.or %476, %1011, %581, %1010 : i1
    %1013 = comb.mux bin %1012, %info_4, %985 : i10
    %1014 = comb.mux bin %238, %1013, %376 : i10
    %1015 = comb.mux bin %308, %1014, %info_4 : i10
    %1016 = comb.xor %612, %true : i1
    %1017 = comb.xor %561, %true : i1
    %1018 = comb.or %476, %1017, %581, %1016 : i1
    %1019 = comb.mux bin %1018, %info_5, %985 : i10
    %1020 = comb.mux bin %238, %1019, %381 : i10
    %1021 = comb.mux bin %308, %1020, %info_5 : i10
    %1022 = comb.xor %618, %true : i1
    %1023 = comb.xor %561, %true : i1
    %1024 = comb.or %476, %1023, %581, %1022 : i1
    %1025 = comb.mux bin %1024, %info_6, %985 : i10
    %1026 = comb.mux bin %238, %1025, %386 : i10
    %1027 = comb.mux bin %308, %1026, %info_6 : i10
    %1028 = comb.xor %624, %true : i1
    %1029 = comb.xor %561, %true : i1
    %1030 = comb.or %476, %1029, %581, %1028 : i1
    %1031 = comb.mux bin %1030, %info_7, %985 : i10
    %1032 = comb.mux bin %238, %1031, %391 : i10
    %1033 = comb.mux bin %308, %1032, %info_7 : i10
    %1034 = comb.xor %630, %true : i1
    %1035 = comb.xor %561, %true : i1
    %1036 = comb.or %476, %1035, %581, %1034 : i1
    %1037 = comb.mux bin %1036, %info_8, %985 : i10
    %1038 = comb.mux bin %238, %1037, %396 : i10
    %1039 = comb.mux bin %308, %1038, %info_8 : i10
    %1040 = comb.xor %636, %true : i1
    %1041 = comb.xor %561, %true : i1
    %1042 = comb.or %476, %1041, %581, %1040 : i1
    %1043 = comb.mux bin %1042, %info_9, %985 : i10
    %1044 = comb.mux bin %238, %1043, %401 : i10
    %1045 = comb.mux bin %308, %1044, %info_9 : i10
    %1046 = comb.xor %642, %true : i1
    %1047 = comb.xor %561, %true : i1
    %1048 = comb.or %476, %1047, %581, %1046 : i1
    %1049 = comb.mux bin %1048, %info_10, %985 : i10
    %1050 = comb.mux bin %238, %1049, %406 : i10
    %1051 = comb.mux bin %308, %1050, %info_10 : i10
    %1052 = comb.xor %648, %true : i1
    %1053 = comb.xor %561, %true : i1
    %1054 = comb.or %476, %1053, %581, %1052 : i1
    %1055 = comb.mux bin %1054, %info_11, %985 : i10
    %1056 = comb.mux bin %238, %1055, %411 : i10
    %1057 = comb.mux bin %308, %1056, %info_11 : i10
    %1058 = comb.xor %654, %true : i1
    %1059 = comb.xor %561, %true : i1
    %1060 = comb.or %476, %1059, %581, %1058 : i1
    %1061 = comb.mux bin %1060, %info_12, %985 : i10
    %1062 = comb.mux bin %238, %1061, %416 : i10
    %1063 = comb.mux bin %308, %1062, %info_12 : i10
    %1064 = comb.xor %660, %true : i1
    %1065 = comb.xor %561, %true : i1
    %1066 = comb.or %476, %1065, %581, %1064 : i1
    %1067 = comb.mux bin %1066, %info_13, %985 : i10
    %1068 = comb.mux bin %238, %1067, %421 : i10
    %1069 = comb.mux bin %308, %1068, %info_13 : i10
    %1070 = comb.xor %666, %true : i1
    %1071 = comb.xor %561, %true : i1
    %1072 = comb.or %476, %1071, %581, %1070 : i1
    %1073 = comb.mux bin %1072, %info_14, %985 : i10
    %1074 = comb.mux bin %238, %1073, %426 : i10
    %1075 = comb.mux bin %308, %1074, %info_14 : i10
    %1076 = comb.xor %672, %true : i1
    %1077 = comb.xor %561, %true : i1
    %1078 = comb.or %476, %1077, %581, %1076 : i1
    %1079 = comb.mux bin %1078, %info_15, %985 : i10
    %1080 = comb.mux bin %238, %1079, %431 : i10
    %1081 = comb.mux bin %308, %1080, %info_15 : i10
    %1082 = comb.mux bin %308, %318, %io_va2pa_vvalid : i1
    %1083 = comb.mux bin %308, %335, %329 : i32
    hw.output %out_paddr_r, %out_valid_r, %out_excep_r_cause, %out_excep_r_tval, %out_excep_r_en, %pte_addr_r, %wpte_data_r, %dc_mode_r : i32, i1, i64, i64, i1, i32, i64, i5
  }
  hw.module private @DcacheSelector(in %clock : !seq.clock, in %reset : i1, in %io_tlb_if2dc_addr : i32, out io_tlb_if2dc_rdata : i64, out io_tlb_if2dc_rvalid : i1, in %io_tlb_if2dc_wdata : i64, in %io_tlb_if2dc_dc_mode : i5, out io_tlb_if2dc_ready : i1, in %io_tlb_mem2dc_addr : i32, out io_tlb_mem2dc_rdata : i64, out io_tlb_mem2dc_rvalid : i1, in %io_tlb_mem2dc_wdata : i64, in %io_tlb_mem2dc_dc_mode : i5, out io_tlb_mem2dc_ready : i1, in %io_mem2dc_addr : i32, out io_mem2dc_rdata : i64, out io_mem2dc_rvalid : i1, in %io_mem2dc_wdata : i64, in %io_mem2dc_dc_mode : i5, in %io_mem2dc_amo : i5, out io_mem2dc_ready : i1, in %io_dma2dc_addr : i32, out io_dma2dc_rdata : i64, out io_dma2dc_rvalid : i1, in %io_dma2dc_wdata : i64, in %io_dma2dc_dc_mode : i5, out io_dma2dc_ready : i1, out io_select_addr : i32, in %io_select_rdata : i64, in %io_select_rvalid : i1, out io_select_wdata : i64, out io_select_dc_mode : i5, out io_select_amo : i5, in %io_select_ready : i1) {
    %c0_i16 = hw.constant 0 : i16
    %c0_i20 = hw.constant 0 : i20
    %c0_i11 = hw.constant 0 : i11
    %c0_i6 = hw.constant 0 : i6
    %false = hw.constant false
    %c0_i2 = hw.constant 0 : i2
    %true = hw.constant true
    %c-2_i2 = hw.constant -2 : i2
    %c-1_i2 = hw.constant -1 : i2
    %c0_i32 = hw.constant 0 : i32
    %c0_i64 = hw.constant 0 : i64
    %c1_i2 = hw.constant 1 : i2
    %c0_i5 = hw.constant 0 : i5
    %pre_idx = seq.firreg %20 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 0 : ui64} : i2
    %busy = seq.firreg %24 clock %clock reset sync %reset, %false {firrtl.random_init_start = 2 : ui64} : i1
    %0 = comb.xor %io_select_rvalid, %true : i1
    %1 = comb.and %0, %busy : i1
    %2 = comb.xor bin %io_select_rvalid, %true : i1
    %3 = comb.and bin %busy, %2 : i1
    %4 = comb.icmp bin ne %io_mem2dc_dc_mode, %c0_i5 : i5
    %5 = comb.xor %3, %true : i1
    %6 = comb.and %5, %4, %io_select_ready {sv.namehint = "io_mem2dc_ready"} : i1
    %7 = comb.icmp bin ne %io_tlb_mem2dc_dc_mode, %c0_i5 : i5
    %8 = comb.concat %3, %io_mem2dc_dc_mode : i1, i5
    %9 = comb.icmp bin eq %8, %c0_i6 : i6
    %10 = comb.and %9, %7, %io_select_ready {sv.namehint = "io_tlb_mem2dc_ready"} : i1
    %11 = comb.icmp bin ne %io_tlb_if2dc_dc_mode, %c0_i5 : i5
    %12 = comb.concat %3, %io_mem2dc_dc_mode, %io_tlb_mem2dc_dc_mode : i1, i5, i5
    %13 = comb.icmp bin eq %12, %c0_i11 : i11
    %14 = comb.and %13, %11, %io_select_ready {sv.namehint = "io_tlb_if2dc_ready"} : i1
    %15 = comb.icmp bin ne %io_dma2dc_dc_mode, %c0_i5 : i5
    %16 = comb.mux bin %15, %c-1_i2, %pre_idx : i2
    %17 = comb.mux bin %11, %c-2_i2, %16 : i2
    %18 = comb.mux bin %7, %c1_i2, %17 : i2
    %19 = comb.mux bin %4, %c0_i2, %18 : i2
    %20 = comb.mux bin %3, %pre_idx, %19 : i2
    %21 = comb.concat %io_mem2dc_dc_mode, %io_tlb_mem2dc_dc_mode, %io_tlb_if2dc_dc_mode, %io_dma2dc_dc_mode : i5, i5, i5, i5
    %22 = comb.icmp bin eq %21, %c0_i20 : i20
    %23 = comb.or %3, %22 : i1
    %24 = comb.mux bin %23, %1, %io_select_ready : i1
    %25 = comb.mux bin %15, %io_dma2dc_addr, %c0_i32 : i32
    %26 = comb.mux bin %11, %io_tlb_if2dc_addr, %25 : i32
    %27 = comb.mux bin %7, %io_tlb_mem2dc_addr, %26 : i32
    %28 = comb.mux bin %4, %io_mem2dc_addr, %27 : i32
    %29 = comb.mux bin %3, %c0_i32, %28 {sv.namehint = "io_select_addr"} : i32
    %30 = comb.mux bin %15, %io_dma2dc_wdata, %c0_i64 : i64
    %31 = comb.mux bin %11, %io_tlb_if2dc_wdata, %30 : i64
    %32 = comb.mux bin %7, %io_tlb_mem2dc_wdata, %31 : i64
    %33 = comb.mux bin %4, %io_mem2dc_wdata, %32 : i64
    %34 = comb.mux bin %3, %c0_i64, %33 {sv.namehint = "io_select_wdata"} : i64
    %35 = comb.mux bin %15, %io_dma2dc_dc_mode, %c0_i5 : i5
    %36 = comb.mux bin %11, %io_tlb_if2dc_dc_mode, %35 : i5
    %37 = comb.mux bin %7, %io_tlb_mem2dc_dc_mode, %36 : i5
    %38 = comb.mux bin %4, %io_mem2dc_dc_mode, %37 : i5
    %39 = comb.mux bin %3, %c0_i5, %38 {sv.namehint = "io_select_dc_mode"} : i5
    %40 = comb.xor %4, %true : i1
    %41 = comb.or %3, %40 : i1
    %42 = comb.mux bin %41, %c0_i5, %io_mem2dc_amo {sv.namehint = "io_select_amo"} : i5
    %43 = comb.concat %3, %io_mem2dc_dc_mode, %io_tlb_mem2dc_dc_mode, %io_tlb_if2dc_dc_mode : i1, i5, i5, i5
    %44 = comb.icmp bin eq %43, %c0_i16 : i16
    %45 = comb.and %44, %15, %io_select_ready {sv.namehint = "io_dma2dc_ready"} : i1
    %46 = comb.icmp bin eq %pre_idx, %c0_i2 {sv.namehint = "_io_mem2dc_rvalid_T"} : i2
    %47 = comb.and bin %io_select_rvalid, %46 {sv.namehint = "io_mem2dc_rvalid"} : i1
    %48 = comb.icmp bin eq %pre_idx, %c1_i2 {sv.namehint = "_io_tlb_mem2dc_rvalid_T"} : i2
    %49 = comb.and bin %io_select_rvalid, %48 {sv.namehint = "io_tlb_mem2dc_rvalid"} : i1
    %50 = comb.icmp bin eq %pre_idx, %c-2_i2 {sv.namehint = "_io_tlb_if2dc_rvalid_T"} : i2
    %51 = comb.and bin %io_select_rvalid, %50 {sv.namehint = "io_tlb_if2dc_rvalid"} : i1
    %52 = comb.icmp bin eq %pre_idx, %c-1_i2 {sv.namehint = "_io_dma2dc_rvalid_T"} : i2
    %53 = comb.and bin %io_select_rvalid, %52 {sv.namehint = "io_dma2dc_rvalid"} : i1
    hw.output %io_select_rdata, %51, %14, %io_select_rdata, %49, %10, %io_select_rdata, %47, %6, %io_select_rdata, %53, %45, %29, %34, %39, %42 : i64, i1, i1, i64, i1, i1, i64, i1, i1, i64, i1, i1, i32, i64, i5, i5
  }
  hw.module private @CLINT(in %clock : !seq.clock, in %reset : i1, in %io_rw_addr : i32, out io_rw_rdata : i64, in %io_rw_wdata : i64, in %io_rw_wvalid : i1, out io_intr_raise : i1, out io_intr_clear : i1, out io_intr_msip_raise : i1, out io_intr_msip_clear : i1) {
    %c1_i64 = hw.constant 1 : i64
    %c1_i2 = hw.constant 1 : i2
    %c0_i64 = hw.constant 0 : i64
    %c0_i2 = hw.constant 0 : i2
    %c33603576_i32 = hw.constant 33603576 : i32
    %c33570816_i32 = hw.constant 33570816 : i32
    %c33554432_i32 = hw.constant 33554432 : i32
    %false = hw.constant false
    %true = hw.constant true
    %mtime = seq.firreg %8 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 0 : ui64} : i64
    %mtimecmp = seq.firreg %12 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 64 : ui64} : i64
    %ipi = seq.firreg %17 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 128 : ui64} : i64
    %count = seq.firreg %0 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 192 : ui64} : i2
    %clear_r = seq.firreg %13 clock %clock reset sync %reset, %false {firrtl.random_init_start = 194 : ui64, sv.namehint = "clear_r"} : i1
    %0 = comb.add %count, %c1_i2 {sv.namehint = "_count_T"} : i2
    %1 = comb.icmp bin eq %count, %c0_i2 : i2
    %2 = comb.add %mtime, %c1_i64 {sv.namehint = "_mtime_T"} : i64
    %3 = comb.mux bin %1, %2, %mtime : i64
    %4 = comb.icmp bin ugt %mtime, %mtimecmp {sv.namehint = "io_intr_raise"} : i64
    %5 = comb.icmp bin eq %io_rw_addr, %c33603576_i32 : i32
    %6 = comb.mux bin %5, %mtime, %c0_i64 : i64
    %7 = comb.and bin %5, %io_rw_wvalid : i1
    %8 = comb.mux bin %7, %io_rw_wdata, %3 : i64
    %9 = comb.icmp bin eq %io_rw_addr, %c33570816_i32 : i32
    %10 = comb.mux bin %9, %mtimecmp, %6 : i64
    %11 = comb.and bin %9, %io_rw_wvalid : i1
    %12 = comb.mux bin %11, %io_rw_wdata, %mtimecmp : i64
    %13 = comb.and %9, %io_rw_wvalid : i1
    %14 = comb.icmp bin eq %io_rw_addr, %c33554432_i32 : i32
    %15 = comb.mux bin %14, %ipi, %10 {sv.namehint = "io_rw_rdata"} : i64
    %16 = comb.and bin %14, %io_rw_wvalid : i1
    %17 = comb.mux bin %16, %io_rw_wdata, %ipi : i64
    %18 = comb.extract %io_rw_wdata from 0 {sv.namehint = "_io_intr_msip_clear_T"} : (i64) -> i1
    %19 = comb.and %16, %18 {sv.namehint = "io_intr_msip_raise"} : i1
    %20 = comb.xor bin %18, %true {sv.namehint = "_io_intr_msip_clear_T_1"} : i1
    %21 = comb.and %16, %20 {sv.namehint = "io_intr_msip_clear"} : i1
    hw.output %15, %4, %clear_r, %19, %21 : i64, i1, i1, i1, i1
  }
  hw.module private @Plic(in %clock : !seq.clock, in %reset : i1, out io_intr_out_m_raise : i1, out io_intr_out_m_clear : i1, out io_intr_out_s_raise : i1, out io_intr_out_s_clear : i1, in %io_rw_addr : i32, out io_rw_rdata : i64, in %io_rw_wdata : i64, in %io_rw_wvalid : i1, in %io_rw_arvalid : i1) {
    %c-1_i32 = hw.constant -1 : i32
    %c1_i64 = hw.constant 1 : i64
    %c0_i58 = hw.constant 0 : i58
    %c0_i32 = hw.constant 0 : i32
    %c201326596_i32 = hw.constant 201326596 : i32
    %c201334784_i32 = hw.constant 201334784 : i32
    %c201335040_i32 = hw.constant 201335040 : i32
    %c203423748_i32 = hw.constant 203423748 : i32
    %c203427844_i32 = hw.constant 203427844 : i32
    %c203423744_i32 = hw.constant 203423744 : i32
    %c203427840_i32 = hw.constant 203427840 : i32
    %c0_i64 = hw.constant 0 : i64
    %c1_i32 = hw.constant 1 : i32
    %false = hw.constant false
    %priority = seq.firreg %12 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 0 : ui64} : i32
    %pending = seq.firreg %56 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 32 : ui64} : i32
    %intr_enable1 = seq.firreg %17 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 64 : ui64} : i32
    %intr_enable2 = seq.firreg %22 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 96 : ui64} : i32
    %threshold1 = seq.firreg %63 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 128 : ui64} : i32
    %threshold2 = seq.firreg %68 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 160 : ui64} : i32
    %claim1 = seq.firreg %40 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 192 : ui64} : i32
    %claim2 = seq.firreg %58 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 224 : ui64} : i32
    %clear_r = seq.firreg %57 clock %clock reset sync %reset, %false {firrtl.random_init_start = 256 : ui64, sv.namehint = "clear_r"} : i1
    %0 = comb.extract %pending from 1 {sv.namehint = "_io_intr_out_m_raise_T"} : (i32) -> i1
    %1 = comb.icmp bin uge %priority, %threshold2 {sv.namehint = "_io_intr_out_s_raise_T_1"} : i32
    %2 = comb.and bin %0, %1 {sv.namehint = "io_intr_out_s_raise"} : i1
    %3 = comb.icmp bin uge %priority, %threshold1 {sv.namehint = "_io_intr_out_m_raise_T_1"} : i32
    %4 = comb.and bin %0, %3 {sv.namehint = "io_intr_out_m_raise"} : i1
    %5 = comb.mux bin %4, %c1_i32, %claim1 : i32
    %6 = comb.mux bin %2, %c1_i32, %claim2 : i32
    %7 = comb.icmp bin eq %io_rw_addr, %c201326596_i32 : i32
    %8 = comb.concat %c0_i32, %priority : i32, i32
    %9 = comb.mux bin %7, %8, %c0_i64 : i64
    %10 = comb.extract %io_rw_wdata from 0 : (i64) -> i32
    %11 = comb.and bin %7, %io_rw_wvalid : i1
    %12 = comb.mux bin %11, %10, %priority : i32
    %13 = comb.icmp bin eq %io_rw_addr, %c201334784_i32 : i32
    %14 = comb.concat %c0_i32, %intr_enable1 : i32, i32
    %15 = comb.mux bin %13, %14, %9 : i64
    %16 = comb.and bin %13, %io_rw_wvalid : i1
    %17 = comb.mux bin %16, %10, %intr_enable1 : i32
    %18 = comb.icmp bin eq %io_rw_addr, %c201335040_i32 : i32
    %19 = comb.concat %c0_i32, %intr_enable2 : i32, i32
    %20 = comb.mux bin %18, %19, %15 : i64
    %21 = comb.and bin %18, %io_rw_wvalid : i1
    %22 = comb.mux bin %21, %10, %intr_enable2 : i32
    %23 = comb.icmp bin eq %io_rw_addr, %c203423748_i32 : i32
    %24 = comb.concat %c0_i32, %claim1 : i32, i32
    %25 = comb.mux bin %23, %24, %20 : i64
    %26 = comb.extract %claim1 from 0 {sv.namehint = "pending_bit_idx"} : (i32) -> i6
    %27 = comb.concat %c0_i58, %26 : i58, i6
    %28 = comb.shl bin %c1_i64, %27 {sv.namehint = "pending_mask_1"} : i64
    %29 = comb.extract %28 from 0 : (i64) -> i32
    %30 = comb.xor %29, %c-1_i32 {sv.namehint = "_pending_T_5"} : i32
    %31 = comb.and bin %30, %pending : i32
    %32 = comb.shl bin %c0_i64, %27 {sv.namehint = "_pending_T_7"} : i64
    %33 = comb.extract %32 from 0 : (i64) -> i32
    %34 = comb.extract %28 from 0 : (i64) -> i32
    %35 = comb.and %33, %34 {sv.namehint = "_pending_T_8"} : i32
    %36 = comb.or %31, %35 {sv.namehint = "_pending_T_9"} : i32
    %37 = comb.and bin %23, %io_rw_arvalid : i1
    %38 = comb.mux bin %37, %36, %pending : i32
    %39 = comb.and %23, %io_rw_arvalid : i1
    %40 = comb.mux bin %37, %c0_i32, %5 : i32
    %41 = comb.icmp bin eq %io_rw_addr, %c203427844_i32 : i32
    %42 = comb.concat %c0_i32, %claim2 : i32, i32
    %43 = comb.mux bin %41, %42, %25 : i64
    %44 = comb.extract %claim2 from 0 {sv.namehint = "pending_bit_idx_1"} : (i32) -> i6
    %45 = comb.concat %c0_i58, %44 : i58, i6
    %46 = comb.shl bin %c1_i64, %45 {sv.namehint = "pending_mask_2"} : i64
    %47 = comb.extract %46 from 0 : (i64) -> i32
    %48 = comb.xor %47, %c-1_i32 {sv.namehint = "_pending_T_10"} : i32
    %49 = comb.and bin %48, %pending : i32
    %50 = comb.shl bin %c0_i64, %45 {sv.namehint = "_pending_T_12"} : i64
    %51 = comb.extract %50 from 0 : (i64) -> i32
    %52 = comb.extract %46 from 0 : (i64) -> i32
    %53 = comb.and %51, %52 {sv.namehint = "_pending_T_13"} : i32
    %54 = comb.or %49, %53 {sv.namehint = "_pending_T_14"} : i32
    %55 = comb.and bin %41, %io_rw_arvalid : i1
    %56 = comb.mux bin %55, %54, %38 : i32
    %57 = comb.or %55, %39 : i1
    %58 = comb.mux bin %55, %c0_i32, %6 : i32
    %59 = comb.icmp bin eq %io_rw_addr, %c203423744_i32 : i32
    %60 = comb.concat %c0_i32, %threshold1 : i32, i32
    %61 = comb.mux bin %59, %60, %43 : i64
    %62 = comb.and bin %59, %io_rw_wvalid : i1
    %63 = comb.mux bin %62, %10, %threshold1 : i32
    %64 = comb.icmp bin eq %io_rw_addr, %c203427840_i32 : i32
    %65 = comb.concat %c0_i32, %threshold2 : i32, i32
    %66 = comb.mux bin %64, %65, %61 {sv.namehint = "io_rw_rdata"} : i64
    %67 = comb.and bin %64, %io_rw_wvalid : i1
    %68 = comb.mux bin %67, %10, %threshold2 : i32
    hw.output %4, %clear_r, %2, %clear_r, %66 : i1, i1, i1, i1, i64
  }
  hw.module private @DmaBridge(in %clock : !seq.clock, in %reset : i1, out io_dmaAxi_awready : i1, in %io_dmaAxi_awvalid : i1, out io_dmaAxi_wready : i1, in %io_dmaAxi_wvalid : i1, in %io_dmaAxi_wdata : i64, in %io_dmaAxi_wstrb : i8, in %io_dmaAxi_bready : i1, out io_dmaAxi_bvalid : i1, out io_dmaAxi_arready : i1, in %io_dmaAxi_arvalid : i1, in %io_dmaAxi_rready : i1, out io_dmaAxi_rvalid : i1, out io_dmaAxi_rdata : i64, out io_dmaAxi_rlast : i1, out io_dcRW_addr : i32, in %io_dcRW_rdata : i64, in %io_dcRW_rvalid : i1, out io_dcRW_wdata : i64, out io_dcRW_dc_mode : i5, in %io_dcRW_ready : i1) {
    %c1_i32 = hw.constant 1 : i32
    %c-2_i2 = hw.constant -2 : i2
    %c0_i24 = hw.constant 0 : i24
    %c-1_i8 = hw.constant -1 : i8
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %c0_i64 = hw.constant 0 : i64
    %c1_i3 = hw.constant 1 : i3
    %true = hw.constant true
    %c3_i3 = hw.constant 3 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c7_i5 = hw.constant 7 : i5
    %c2_i3 = hw.constant 2 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-1_i3 = hw.constant -1 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c8_i5 = hw.constant 8 : i5
    %c0_i5 = hw.constant 0 : i5
    %c-8_i32 = hw.constant -8 : i32
    %c1_i8 = hw.constant 1 : i8
    %c0_i8 = hw.constant 0 : i8
    %c0_i32 = hw.constant 0 : i32
    %state = seq.firreg %152 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 0 : ui64} : i3
    %awready_r = seq.firreg %54 clock %clock reset sync %reset, %false {firrtl.random_init_start = 3 : ui64, sv.namehint = "awready_r"} : i1
    %wready_r = seq.firreg %93 clock %clock reset sync %reset, %false {firrtl.random_init_start = 4 : ui64, sv.namehint = "wready_r"} : i1
    %bvalid_r = seq.firreg %85 clock %clock reset sync %reset, %false {firrtl.random_init_start = 5 : ui64, sv.namehint = "bvalid_r"} : i1
    %arready_r = seq.firreg %8 clock %clock reset sync %reset, %false {firrtl.random_init_start = 12 : ui64, sv.namehint = "arready_r"} : i1
    %rvalid_r = seq.firreg %29 clock %clock reset sync %reset, %false {firrtl.random_init_start = 13 : ui64, sv.namehint = "rvalid_r"} : i1
    %rdata_r = seq.firreg %19 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 16 : ui64, sv.namehint = "rdata_r"} : i64
    %rlast_r = seq.firreg %24 clock %clock reset sync %reset, %false {firrtl.random_init_start = 80 : ui64, sv.namehint = "rlast_r"} : i1
    %dc_addr_r = seq.firreg %147 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 85 : ui64, sv.namehint = "dc_addr_r"} : i32
    %dc_wdata_r = seq.firreg %106 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 117 : ui64, sv.namehint = "dc_wdata_r"} : i64
    %dc_mode_r = seq.firreg %118 clock %clock reset sync %reset, %c0_i5 {firrtl.random_init_start = 181 : ui64, sv.namehint = "dc_mode_r"} : i5
    %data_buf_r = seq.firreg %139 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 186 : ui64} : i64
    %data_strb_r = seq.firreg %128 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 250 : ui64} : i8
    %addr_r = seq.firreg %78 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 261 : ui64} : i32
    %len_r = seq.firreg %100 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 297 : ui64} : i8
    %size_r = seq.firreg %61 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 305 : ui64} : i8
    %0 = comb.icmp bin eq %state, %c0_i3 : i3
    %1 = comb.mux bin %io_dmaAxi_arvalid, %c1_i3, %state : i3
    %2 = comb.or %io_dmaAxi_arvalid, %arready_r : i1
    %3 = comb.mux bin %io_dmaAxi_awvalid, %c3_i3, %1 : i3
    %4 = comb.or %io_dmaAxi_awvalid, %awready_r : i1
    %5 = comb.icmp bin eq %state, %c1_i3 : i3
    %6 = comb.xor %5, %true : i1
    %7 = comb.and %6, %arready_r : i1
    %8 = comb.mux bin %0, %2, %7 : i1
    %9 = comb.icmp bin eq %state, %c-2_i3 : i3
    %10 = comb.icmp bin ne %dc_mode_r, %c0_i5 : i5
    %11 = comb.and bin %io_dcRW_ready, %10 : i1
    %12 = comb.mux bin %11, %c0_i5, %dc_mode_r : i5
    %13 = comb.mux bin %io_dcRW_rvalid, %io_dcRW_rdata, %data_buf_r : i64
    %14 = comb.mux bin %io_dcRW_rvalid, %c2_i3, %state : i3
    %15 = comb.icmp bin eq %state, %c2_i3 : i3
    %16 = comb.or bin %0, %5, %9 : i1
    %17 = comb.xor %15, %true : i1
    %18 = comb.or %16, %17 : i1
    %19 = comb.mux bin %18, %rdata_r, %data_buf_r : i64
    %20 = comb.icmp bin ne %len_r, %c0_i8 : i8
    %21 = comb.xor bin %20, %true {sv.namehint = "_rlast_r_T"} : i1
    %22 = comb.xor %15, %true : i1
    %23 = comb.or %16, %22 : i1
    %24 = comb.mux bin %23, %rlast_r, %21 : i1
    %25 = comb.and bin %io_dmaAxi_rready, %rvalid_r : i1
    %26 = comb.xor bin %25, %true : i1
    %27 = comb.xor %15, %true : i1
    %28 = comb.or %16, %27 : i1
    %29 = comb.mux bin %28, %rvalid_r, %26 : i1
    %30 = comb.add %len_r, %c-1_i8 {sv.namehint = "_len_r_T"} : i8
    %31 = comb.xor %25, %true : i1
    %32 = comb.or %31, %rlast_r : i1
    %33 = comb.mux bin %32, %len_r, %30 : i8
    %34 = comb.concat %c0_i24, %size_r : i24, i8
    %35 = comb.add %addr_r, %34 {sv.namehint = "_addr_r_T"} : i32
    %36 = comb.and bin %35, %c-8_i32 {sv.namehint = "_dc_addr_r_T_5"} : i32
    %37 = comb.xor %25, %true : i1
    %38 = comb.or %37, %rlast_r : i1
    %39 = comb.mux bin %38, %dc_addr_r, %36 : i32
    %40 = comb.xor %25, %true : i1
    %41 = comb.or %40, %rlast_r : i1
    %42 = comb.mux bin %41, %addr_r, %35 : i32
    %43 = comb.xor %25, %true : i1
    %44 = comb.or %43, %rlast_r : i1
    %45 = comb.mux bin %44, %dc_mode_r, %c7_i5 : i5
    %46 = comb.mux bin %rlast_r, %c0_i3, %c-2_i3 : i3
    %47 = comb.mux bin %25, %46, %state : i3
    %48 = comb.icmp bin eq %state, %c3_i3 : i3
    %49 = comb.xor %48, %true : i1
    %50 = comb.or bin %9, %15 : i1
    %51 = comb.or bin %5, %50 : i1
    %52 = comb.or %51, %49 : i1
    %53 = comb.and %52, %awready_r : i1
    %54 = comb.mux bin %0, %4, %53 : i1
    %55 = comb.xor %48, %true : i1
    %56 = comb.or %50, %55 : i1
    %57 = comb.xor %56, %true : i1
    %58 = comb.or %5, %57 : i1
    %59 = comb.xor %58, %true : i1
    %60 = comb.or %0, %59 : i1
    %61 = comb.mux bin %60, %size_r, %c1_i8 : i8
    %62 = comb.icmp bin eq %state, %c-4_i3 : i3
    %63 = comb.and bin %io_dmaAxi_wvalid, %wready_r : i1
    %64 = comb.xor %63, %true : i1
    %65 = comb.and %64, %wready_r : i1
    %66 = comb.mux bin %63, %io_dmaAxi_wdata, %data_buf_r : i64
    %67 = comb.mux bin %63, %io_dmaAxi_wstrb, %data_strb_r : i8
    %68 = comb.mux bin %63, %c-1_i3, %state : i3
    %69 = comb.icmp bin eq %state, %c-1_i3 : i3
    %70 = comb.icmp bin eq %data_strb_r, %c0_i8 : i8
    %71 = comb.concat %c0_i24, %size_r : i24, i8
    %72 = comb.add %addr_r, %71 {sv.namehint = "_dc_addr_r_T_8"} : i32
    %73 = comb.and bin %69, %70 : i1
    %74 = comb.xor %73, %true : i1
    %75 = comb.or %62, %74 : i1
    %76 = comb.mux bin %75, %addr_r, %72 : i32
    %77 = hw.array_create %76, %addr_r, %76, %addr_r, %c0_i32, %42, %c0_i32, %addr_r : i32
    %78 = hw.array_get %77[%state] : !hw.array<8xi32>, i3
    %79 = comb.and bin %72, %c-8_i32 {sv.namehint = "_dc_addr_r_T_11"} : i32
    %80 = comb.xor bin %20, %true : i1
    %81 = comb.or bin %48, %62 : i1
    %82 = comb.or bin %0, %5, %9, %15, %81 : i1
    %83 = comb.xor %82, %true : i1
    %84 = comb.and %83, %69, %70, %80 : i1
    %85 = comb.or %84, %bvalid_r : i1
    %86 = comb.concat %c-2_i2, %80 : i2, i1
    %87 = comb.mux bin %70, %86, %state : i3
    %88 = comb.and %73, %20 : i1
    %89 = comb.or %88, %wready_r : i1
    %90 = comb.mux bin %62, %65, %89 : i1
    %91 = comb.or %48, %90 : i1
    %92 = comb.or bin %0, %51 : i1
    %93 = comb.mux bin %92, %wready_r, %91 : i1
    %94 = comb.add %len_r, %c-1_i8 {sv.namehint = "_len_r_T_2"} : i8
    %95 = comb.and %73, %20 : i1
    %96 = comb.xor %95, %true : i1
    %97 = comb.or %62, %96 : i1
    %98 = comb.mux bin %97, %len_r, %94 : i8
    %99 = hw.array_create %98, %len_r, %98, %len_r, %c0_i8, %33, %c0_i8, %len_r : i8
    %100 = hw.array_get %99[%state] : !hw.array<8xi8>, i3
    %101 = comb.extract %data_strb_r from 0 : (i8) -> i1
    %102 = comb.mux bin %101, %c8_i5, %dc_mode_r : i5
    %103 = comb.xor %101, %true : i1
    %104 = comb.xor %69, %true : i1
    %105 = comb.or %82, %104, %70, %103 : i1
    %106 = comb.mux bin %105, %dc_wdata_r, %data_buf_r : i64
    %107 = comb.extract %data_strb_r from 1 : (i8) -> i7
    %108 = comb.concat %false, %107 : i1, i7
    %109 = comb.extract %data_buf_r from 8 : (i64) -> i56
    %110 = comb.concat %c0_i8, %109 : i8, i56
    %111 = comb.add %dc_addr_r, %c1_i32 {sv.namehint = "_dc_addr_r_T_12"} : i32
    %112 = comb.mux bin %101, %dc_addr_r, %111 : i32
    %113 = comb.mux bin %11, %c0_i5, %102 : i5
    %114 = comb.xor %69, %true : i1
    %115 = comb.or %81, %114, %70 : i1
    %116 = comb.mux bin %115, %dc_mode_r, %113 : i5
    %117 = hw.array_create %116, %12, %116, %dc_mode_r, %dc_mode_r, %45, %c7_i5, %dc_mode_r : i5
    %118 = hw.array_get %117[%state] : !hw.array<8xi5>, i3
    %119 = comb.xor %101, %true : i1
    %120 = comb.or %11, %119 : i1
    %121 = comb.xor %120, %true : i1
    %122 = comb.xor %69, %true : i1
    %123 = comb.or %122, %70, %121 : i1
    %124 = comb.mux bin %123, %data_strb_r, %108 : i8
    %125 = comb.mux bin %62, %67, %124 : i8
    %126 = comb.or bin %15, %48 : i1
    %127 = comb.or bin %0, %5, %9, %126 : i1
    %128 = comb.mux bin %127, %data_strb_r, %125 : i8
    %129 = comb.xor %101, %true : i1
    %130 = comb.or %11, %129 : i1
    %131 = comb.xor %130, %true : i1
    %132 = comb.xor %69, %true : i1
    %133 = comb.or %132, %70, %131 : i1
    %134 = comb.mux bin %133, %data_buf_r, %110 : i64
    %135 = comb.mux bin %62, %66, %134 : i64
    %136 = comb.mux bin %126, %data_buf_r, %135 : i64
    %137 = comb.mux bin %9, %13, %136 : i64
    %138 = comb.or bin %0, %5 : i1
    %139 = comb.mux bin %138, %data_buf_r, %137 : i64
    %140 = comb.add %dc_addr_r, %c1_i32 {sv.namehint = "_dc_addr_r_T_14"} : i32
    %141 = comb.mux bin %11, %140, %112 : i32
    %142 = comb.mux bin %70, %79, %141 : i32
    %143 = comb.xor %69, %true : i1
    %144 = comb.or %62, %143 : i1
    %145 = comb.mux bin %144, %dc_addr_r, %142 : i32
    %146 = hw.array_create %145, %dc_addr_r, %145, %dc_addr_r, %c0_i32, %39, %c0_i32, %dc_addr_r : i32
    %147 = hw.array_get %146[%state] : !hw.array<8xi32>, i3
    %148 = comb.icmp bin eq %state, %c-3_i3 : i3
    %149 = comb.and bin %148, %io_dmaAxi_bready, %bvalid_r : i1
    %150 = comb.mux bin %149, %c0_i3, %state : i3
    %151 = hw.array_create %87, %14, %150, %68, %c-4_i3, %47, %c-2_i3, %3 : i3
    %152 = hw.array_get %151[%state] : !hw.array<8xi3>, i3
    hw.output %awready_r, %wready_r, %bvalid_r, %arready_r, %rvalid_r, %rdata_r, %rlast_r, %dc_addr_r, %dc_wdata_r, %dc_mode_r : i1, i1, i1, i1, i1, i64, i1, i32, i64, i5
  }
  hw.module private @CPU(in %clock : !seq.clock, in %reset : i1, in %io_master_awready : i1, out io_master_awvalid : i1, out io_master_awaddr : i32, out io_master_awlen : i8, in %io_master_wready : i1, out io_master_wvalid : i1, out io_master_wdata : i64, out io_master_wstrb : i8, out io_master_wlast : i1, in %io_master_arready : i1, out io_master_arvalid : i1, out io_master_araddr : i32, out io_master_arlen : i8, out io_master_rready : i1, in %io_master_rvalid : i1, in %io_master_rdata : i64, in %io_master_rlast : i1, out io_slave_awready : i1, in %io_slave_awvalid : i1, out io_slave_wready : i1, in %io_slave_wvalid : i1, in %io_slave_wdata : i64, in %io_slave_wstrb : i8, in %io_slave_bready : i1, out io_slave_bvalid : i1, out io_slave_arready : i1, in %io_slave_arvalid : i1, in %io_slave_rready : i1, out io_slave_rvalid : i1, out io_slave_rdata : i64, out io_slave_rlast : i1) {
    %c0_i64 = hw.constant 0 : i64
    %fetch.io_instRead_addr, %fetch.io_instRead_arvalid, %fetch.io_va2pa_vaddr, %fetch.io_va2pa_vvalid, %fetch.io_if2id_inst, %fetch.io_if2id_pc, %fetch.io_if2id_excep_cause, %fetch.io_if2id_excep_tval, %fetch.io_if2id_excep_en, %fetch.io_if2id_excep_pc, %fetch.io_if2id_excep_etype, %fetch.io_if2id_recov, %fetch.io_if2id_valid = hw.instance "fetch" @Fetch(clock: %clock: !seq.clock, reset: %reset: i1, io_instRead_inst: %fetchCrossbar.io_instIO_inst: i64, io_instRead_rvalid: %fetchCrossbar.io_instIO_rvalid: i1, io_va2pa_paddr: %tlb_if.io_va2pa_paddr: i32, io_va2pa_pvalid: %tlb_if.io_va2pa_pvalid: i1, io_va2pa_tlb_excep_cause: %tlb_if.io_va2pa_tlb_excep_cause: i64, io_va2pa_tlb_excep_tval: %tlb_if.io_va2pa_tlb_excep_tval: i64, io_va2pa_tlb_excep_en: %tlb_if.io_va2pa_tlb_excep_en: i1, io_reg2if_seq_pc: %csrs.io_reg2if_seq_pc: i64, io_reg2if_valid: %csrs.io_reg2if_valid: i1, io_wb2if_seq_pc: %writeback.io_wb2if_seq_pc: i64, io_wb2if_valid: %writeback.io_wb2if_valid: i1, io_recov: %writeback.io_recov: i1, io_intr_in_en: %csrs.io_intr_out_en: i1, io_intr_in_cause: %csrs.io_intr_out_cause: i64, io_branchFail_seq_pc: %execute.io_ex2if_seq_pc: i64, io_branchFail_valid: %execute.io_ex2if_valid: i1, io_if2id_drop: %decode.io_if2id_drop: i1, io_if2id_stall: %decode.io_if2id_stall: i1, io_if2id_ready: %decode.io_if2id_ready: i1) -> (io_instRead_addr: i32, io_instRead_arvalid: i1, io_va2pa_vaddr: i64, io_va2pa_vvalid: i1, io_if2id_inst: i32, io_if2id_pc: i64, io_if2id_excep_cause: i64, io_if2id_excep_tval: i64, io_if2id_excep_en: i1, io_if2id_excep_pc: i64, io_if2id_excep_etype: i2, io_if2id_recov: i1, io_if2id_valid: i1) {sv.namehint = "fetch.io_if2id_pc"}
    %decode.io_if2id_drop, %decode.io_if2id_stall, %decode.io_if2id_ready, %decode.io_id2df_inst, %decode.io_id2df_pc, %decode.io_id2df_excep_cause, %decode.io_id2df_excep_tval, %decode.io_id2df_excep_en, %decode.io_id2df_excep_pc, %decode.io_id2df_excep_etype, %decode.io_id2df_ctrl_aluOp, %decode.io_id2df_ctrl_aluWidth, %decode.io_id2df_ctrl_dcMode, %decode.io_id2df_ctrl_writeRegEn, %decode.io_id2df_ctrl_writeCSREn, %decode.io_id2df_ctrl_brType, %decode.io_id2df_rs1, %decode.io_id2df_rrs1, %decode.io_id2df_rs1_d, %decode.io_id2df_rs2, %decode.io_id2df_rrs2, %decode.io_id2df_rs2_d, %decode.io_id2df_dst, %decode.io_id2df_dst_d, %decode.io_id2df_jmp_type, %decode.io_id2df_special, %decode.io_id2df_swap, %decode.io_id2df_indi, %decode.io_id2df_recov, %decode.io_id2df_valid = hw.instance "decode" @Decode(clock: %clock: !seq.clock, reset: %reset: i1, io_if2id_inst: %fetch.io_if2id_inst: i32, io_if2id_pc: %fetch.io_if2id_pc: i64, io_if2id_excep_cause: %fetch.io_if2id_excep_cause: i64, io_if2id_excep_tval: %fetch.io_if2id_excep_tval: i64, io_if2id_excep_en: %fetch.io_if2id_excep_en: i1, io_if2id_excep_pc: %fetch.io_if2id_excep_pc: i64, io_if2id_excep_etype: %fetch.io_if2id_excep_etype: i2, io_if2id_recov: %fetch.io_if2id_recov: i1, io_if2id_valid: %fetch.io_if2id_valid: i1, io_id2df_drop: %forwading.io_id2df_drop: i1, io_id2df_stall: %forwading.io_id2df_stall: i1, io_id2df_ready: %forwading.io_id2df_ready: i1, io_idState_priv: %csrs.io_idState_priv: i2) -> (io_if2id_drop: i1, io_if2id_stall: i1, io_if2id_ready: i1, io_id2df_inst: i32, io_id2df_pc: i64, io_id2df_excep_cause: i64, io_id2df_excep_tval: i64, io_id2df_excep_en: i1, io_id2df_excep_pc: i64, io_id2df_excep_etype: i2, io_id2df_ctrl_aluOp: i5, io_id2df_ctrl_aluWidth: i1, io_id2df_ctrl_dcMode: i5, io_id2df_ctrl_writeRegEn: i1, io_id2df_ctrl_writeCSREn: i1, io_id2df_ctrl_brType: i3, io_id2df_rs1: i5, io_id2df_rrs1: i1, io_id2df_rs1_d: i64, io_id2df_rs2: i12, io_id2df_rrs2: i1, io_id2df_rs2_d: i64, io_id2df_dst: i5, io_id2df_dst_d: i64, io_id2df_jmp_type: i2, io_id2df_special: i2, io_id2df_swap: i6, io_id2df_indi: i2, io_id2df_recov: i1, io_id2df_valid: i1) {sv.namehint = "decode.io_id2df_pc"}
    %forwading.io_id2df_drop, %forwading.io_id2df_stall, %forwading.io_id2df_ready, %forwading.io_df2rr_inst, %forwading.io_df2rr_pc, %forwading.io_df2rr_excep_cause, %forwading.io_df2rr_excep_tval, %forwading.io_df2rr_excep_en, %forwading.io_df2rr_excep_pc, %forwading.io_df2rr_excep_etype, %forwading.io_df2rr_ctrl_aluOp, %forwading.io_df2rr_ctrl_aluWidth, %forwading.io_df2rr_ctrl_dcMode, %forwading.io_df2rr_ctrl_writeRegEn, %forwading.io_df2rr_ctrl_writeCSREn, %forwading.io_df2rr_ctrl_brType, %forwading.io_df2rr_rs1, %forwading.io_df2rr_rrs1, %forwading.io_df2rr_rs1_d, %forwading.io_df2rr_rs2, %forwading.io_df2rr_rrs2, %forwading.io_df2rr_rs2_d, %forwading.io_df2rr_dst, %forwading.io_df2rr_dst_d, %forwading.io_df2rr_jmp_type, %forwading.io_df2rr_special, %forwading.io_df2rr_swap, %forwading.io_df2rr_indi, %forwading.io_df2rr_recov, %forwading.io_df2rr_valid = hw.instance "forwading" @Forwarding(clock: %clock: !seq.clock, reset: %reset: i1, io_id2df_inst: %decode.io_id2df_inst: i32, io_id2df_pc: %decode.io_id2df_pc: i64, io_id2df_excep_cause: %decode.io_id2df_excep_cause: i64, io_id2df_excep_tval: %decode.io_id2df_excep_tval: i64, io_id2df_excep_en: %decode.io_id2df_excep_en: i1, io_id2df_excep_pc: %decode.io_id2df_excep_pc: i64, io_id2df_excep_etype: %decode.io_id2df_excep_etype: i2, io_id2df_ctrl_aluOp: %decode.io_id2df_ctrl_aluOp: i5, io_id2df_ctrl_aluWidth: %decode.io_id2df_ctrl_aluWidth: i1, io_id2df_ctrl_dcMode: %decode.io_id2df_ctrl_dcMode: i5, io_id2df_ctrl_writeRegEn: %decode.io_id2df_ctrl_writeRegEn: i1, io_id2df_ctrl_writeCSREn: %decode.io_id2df_ctrl_writeCSREn: i1, io_id2df_ctrl_brType: %decode.io_id2df_ctrl_brType: i3, io_id2df_rs1: %decode.io_id2df_rs1: i5, io_id2df_rrs1: %decode.io_id2df_rrs1: i1, io_id2df_rs1_d: %decode.io_id2df_rs1_d: i64, io_id2df_rs2: %decode.io_id2df_rs2: i12, io_id2df_rrs2: %decode.io_id2df_rrs2: i1, io_id2df_rs2_d: %decode.io_id2df_rs2_d: i64, io_id2df_dst: %decode.io_id2df_dst: i5, io_id2df_dst_d: %decode.io_id2df_dst_d: i64, io_id2df_jmp_type: %decode.io_id2df_jmp_type: i2, io_id2df_special: %decode.io_id2df_special: i2, io_id2df_swap: %decode.io_id2df_swap: i6, io_id2df_indi: %decode.io_id2df_indi: i2, io_id2df_recov: %decode.io_id2df_recov: i1, io_id2df_valid: %decode.io_id2df_valid: i1, io_df2rr_drop: %readregs.io_df2rr_drop: i1, io_df2rr_stall: %readregs.io_df2rr_stall: i1, io_df2rr_ready: %readregs.io_df2rr_ready: i1, io_d_rr_id: %readregs.io_d_rr_id: i5, io_d_rr_data: %readregs.io_d_rr_data: i64, io_d_rr_state: %readregs.io_d_rr_state: i2, io_d_ex_id: %execute.io_d_ex_id: i5, io_d_ex_data: %execute.io_d_ex_data: i64, io_d_ex_state: %execute.io_d_ex_state: i2, io_d_mem1_id: %memory.io_d_mem1_id: i5, io_d_mem1_data: %memory.io_d_mem1_data: i64, io_d_mem1_state: %memory.io_d_mem1_state: i2, io_d_mem2_id: %memory.io_d_mem2_id: i5, io_d_mem2_data: %memory.io_d_mem2_data: i64, io_d_mem2_state: %memory.io_d_mem2_state: i2, io_d_mem3_id: %memory.io_d_mem3_id: i5, io_d_mem3_data: %memory.io_d_mem3_data: i64, io_d_mem3_state: %memory.io_d_mem3_state: i2) -> (io_id2df_drop: i1, io_id2df_stall: i1, io_id2df_ready: i1, io_df2rr_inst: i32, io_df2rr_pc: i64, io_df2rr_excep_cause: i64, io_df2rr_excep_tval: i64, io_df2rr_excep_en: i1, io_df2rr_excep_pc: i64, io_df2rr_excep_etype: i2, io_df2rr_ctrl_aluOp: i5, io_df2rr_ctrl_aluWidth: i1, io_df2rr_ctrl_dcMode: i5, io_df2rr_ctrl_writeRegEn: i1, io_df2rr_ctrl_writeCSREn: i1, io_df2rr_ctrl_brType: i3, io_df2rr_rs1: i5, io_df2rr_rrs1: i1, io_df2rr_rs1_d: i64, io_df2rr_rs2: i12, io_df2rr_rrs2: i1, io_df2rr_rs2_d: i64, io_df2rr_dst: i5, io_df2rr_dst_d: i64, io_df2rr_jmp_type: i2, io_df2rr_special: i2, io_df2rr_swap: i6, io_df2rr_indi: i2, io_df2rr_recov: i1, io_df2rr_valid: i1) {sv.namehint = "readregs.io_df2rr_pc"}
    %readregs.io_df2rr_drop, %readregs.io_df2rr_stall, %readregs.io_df2rr_ready, %readregs.io_rr2ex_inst, %readregs.io_rr2ex_pc, %readregs.io_rr2ex_excep_cause, %readregs.io_rr2ex_excep_tval, %readregs.io_rr2ex_excep_en, %readregs.io_rr2ex_excep_pc, %readregs.io_rr2ex_excep_etype, %readregs.io_rr2ex_ctrl_aluOp, %readregs.io_rr2ex_ctrl_aluWidth, %readregs.io_rr2ex_ctrl_dcMode, %readregs.io_rr2ex_ctrl_writeRegEn, %readregs.io_rr2ex_ctrl_writeCSREn, %readregs.io_rr2ex_ctrl_brType, %readregs.io_rr2ex_rs1_d, %readregs.io_rr2ex_rs2, %readregs.io_rr2ex_rs2_d, %readregs.io_rr2ex_dst, %readregs.io_rr2ex_dst_d, %readregs.io_rr2ex_jmp_type, %readregs.io_rr2ex_special, %readregs.io_rr2ex_indi, %readregs.io_rr2ex_recov, %readregs.io_rr2ex_valid, %readregs.io_rs1Read_id, %readregs.io_rs2Read_id, %readregs.io_csrRead_id, %readregs.io_d_rr_id, %readregs.io_d_rr_data, %readregs.io_d_rr_state = hw.instance "readregs" @ReadRegs(clock: %clock: !seq.clock, reset: %reset: i1, io_df2rr_inst: %forwading.io_df2rr_inst: i32, io_df2rr_pc: %forwading.io_df2rr_pc: i64, io_df2rr_excep_cause: %forwading.io_df2rr_excep_cause: i64, io_df2rr_excep_tval: %forwading.io_df2rr_excep_tval: i64, io_df2rr_excep_en: %forwading.io_df2rr_excep_en: i1, io_df2rr_excep_pc: %forwading.io_df2rr_excep_pc: i64, io_df2rr_excep_etype: %forwading.io_df2rr_excep_etype: i2, io_df2rr_ctrl_aluOp: %forwading.io_df2rr_ctrl_aluOp: i5, io_df2rr_ctrl_aluWidth: %forwading.io_df2rr_ctrl_aluWidth: i1, io_df2rr_ctrl_dcMode: %forwading.io_df2rr_ctrl_dcMode: i5, io_df2rr_ctrl_writeRegEn: %forwading.io_df2rr_ctrl_writeRegEn: i1, io_df2rr_ctrl_writeCSREn: %forwading.io_df2rr_ctrl_writeCSREn: i1, io_df2rr_ctrl_brType: %forwading.io_df2rr_ctrl_brType: i3, io_df2rr_rs1: %forwading.io_df2rr_rs1: i5, io_df2rr_rrs1: %forwading.io_df2rr_rrs1: i1, io_df2rr_rs1_d: %forwading.io_df2rr_rs1_d: i64, io_df2rr_rs2: %forwading.io_df2rr_rs2: i12, io_df2rr_rrs2: %forwading.io_df2rr_rrs2: i1, io_df2rr_rs2_d: %forwading.io_df2rr_rs2_d: i64, io_df2rr_dst: %forwading.io_df2rr_dst: i5, io_df2rr_dst_d: %forwading.io_df2rr_dst_d: i64, io_df2rr_jmp_type: %forwading.io_df2rr_jmp_type: i2, io_df2rr_special: %forwading.io_df2rr_special: i2, io_df2rr_swap: %forwading.io_df2rr_swap: i6, io_df2rr_indi: %forwading.io_df2rr_indi: i2, io_df2rr_recov: %forwading.io_df2rr_recov: i1, io_df2rr_valid: %forwading.io_df2rr_valid: i1, io_rr2ex_drop: %execute.io_rr2ex_drop: i1, io_rr2ex_stall: %execute.io_rr2ex_stall: i1, io_rr2ex_ready: %execute.io_rr2ex_ready: i1, io_rs1Read_data: %regs.io_rs1_data: i64, io_rs2Read_data: %regs.io_rs2_data: i64, io_csrRead_data: %csrs.io_rs_data: i64, io_csrRead_is_err: %csrs.io_rs_is_err: i1) -> (io_df2rr_drop: i1, io_df2rr_stall: i1, io_df2rr_ready: i1, io_rr2ex_inst: i32, io_rr2ex_pc: i64, io_rr2ex_excep_cause: i64, io_rr2ex_excep_tval: i64, io_rr2ex_excep_en: i1, io_rr2ex_excep_pc: i64, io_rr2ex_excep_etype: i2, io_rr2ex_ctrl_aluOp: i5, io_rr2ex_ctrl_aluWidth: i1, io_rr2ex_ctrl_dcMode: i5, io_rr2ex_ctrl_writeRegEn: i1, io_rr2ex_ctrl_writeCSREn: i1, io_rr2ex_ctrl_brType: i3, io_rr2ex_rs1_d: i64, io_rr2ex_rs2: i12, io_rr2ex_rs2_d: i64, io_rr2ex_dst: i5, io_rr2ex_dst_d: i64, io_rr2ex_jmp_type: i2, io_rr2ex_special: i2, io_rr2ex_indi: i2, io_rr2ex_recov: i1, io_rr2ex_valid: i1, io_rs1Read_id: i5, io_rs2Read_id: i5, io_csrRead_id: i12, io_d_rr_id: i5, io_d_rr_data: i64, io_d_rr_state: i2) {sv.namehint = "csrs.io_rs_id"}
    %execute.io_rr2ex_drop, %execute.io_rr2ex_stall, %execute.io_rr2ex_ready, %execute.io_ex2mem_inst, %execute.io_ex2mem_pc, %execute.io_ex2mem_excep_cause, %execute.io_ex2mem_excep_tval, %execute.io_ex2mem_excep_en, %execute.io_ex2mem_excep_pc, %execute.io_ex2mem_excep_etype, %execute.io_ex2mem_ctrl_dcMode, %execute.io_ex2mem_ctrl_writeRegEn, %execute.io_ex2mem_ctrl_writeCSREn, %execute.io_ex2mem_mem_addr, %execute.io_ex2mem_mem_data, %execute.io_ex2mem_csr_id, %execute.io_ex2mem_csr_d, %execute.io_ex2mem_dst, %execute.io_ex2mem_dst_d, %execute.io_ex2mem_special, %execute.io_ex2mem_indi, %execute.io_ex2mem_recov, %execute.io_ex2mem_valid, %execute.io_d_ex_id, %execute.io_d_ex_data, %execute.io_d_ex_state, %execute.io_ex2if_seq_pc, %execute.io_ex2if_valid = hw.instance "execute" @Execute(clock: %clock: !seq.clock, reset: %reset: i1, io_rr2ex_inst: %readregs.io_rr2ex_inst: i32, io_rr2ex_pc: %readregs.io_rr2ex_pc: i64, io_rr2ex_excep_cause: %readregs.io_rr2ex_excep_cause: i64, io_rr2ex_excep_tval: %readregs.io_rr2ex_excep_tval: i64, io_rr2ex_excep_en: %readregs.io_rr2ex_excep_en: i1, io_rr2ex_excep_pc: %readregs.io_rr2ex_excep_pc: i64, io_rr2ex_excep_etype: %readregs.io_rr2ex_excep_etype: i2, io_rr2ex_ctrl_aluOp: %readregs.io_rr2ex_ctrl_aluOp: i5, io_rr2ex_ctrl_aluWidth: %readregs.io_rr2ex_ctrl_aluWidth: i1, io_rr2ex_ctrl_dcMode: %readregs.io_rr2ex_ctrl_dcMode: i5, io_rr2ex_ctrl_writeRegEn: %readregs.io_rr2ex_ctrl_writeRegEn: i1, io_rr2ex_ctrl_writeCSREn: %readregs.io_rr2ex_ctrl_writeCSREn: i1, io_rr2ex_ctrl_brType: %readregs.io_rr2ex_ctrl_brType: i3, io_rr2ex_rs1_d: %readregs.io_rr2ex_rs1_d: i64, io_rr2ex_rs2: %readregs.io_rr2ex_rs2: i12, io_rr2ex_rs2_d: %readregs.io_rr2ex_rs2_d: i64, io_rr2ex_dst: %readregs.io_rr2ex_dst: i5, io_rr2ex_dst_d: %readregs.io_rr2ex_dst_d: i64, io_rr2ex_jmp_type: %readregs.io_rr2ex_jmp_type: i2, io_rr2ex_special: %readregs.io_rr2ex_special: i2, io_rr2ex_indi: %readregs.io_rr2ex_indi: i2, io_rr2ex_recov: %readregs.io_rr2ex_recov: i1, io_rr2ex_valid: %readregs.io_rr2ex_valid: i1, io_ex2mem_drop: %memory.io_ex2mem_drop: i1, io_ex2mem_stall: %memory.io_ex2mem_stall: i1, io_ex2mem_ready: %memory.io_ex2mem_ready: i1, io_updateNextPc_seq_pc: %csrs.io_updateNextPc_seq_pc: i64, io_updateNextPc_valid: %csrs.io_updateNextPc_valid: i1) -> (io_rr2ex_drop: i1, io_rr2ex_stall: i1, io_rr2ex_ready: i1, io_ex2mem_inst: i32, io_ex2mem_pc: i64, io_ex2mem_excep_cause: i64, io_ex2mem_excep_tval: i64, io_ex2mem_excep_en: i1, io_ex2mem_excep_pc: i64, io_ex2mem_excep_etype: i2, io_ex2mem_ctrl_dcMode: i5, io_ex2mem_ctrl_writeRegEn: i1, io_ex2mem_ctrl_writeCSREn: i1, io_ex2mem_mem_addr: i64, io_ex2mem_mem_data: i64, io_ex2mem_csr_id: i12, io_ex2mem_csr_d: i64, io_ex2mem_dst: i5, io_ex2mem_dst_d: i64, io_ex2mem_special: i2, io_ex2mem_indi: i2, io_ex2mem_recov: i1, io_ex2mem_valid: i1, io_d_ex_id: i5, io_d_ex_data: i64, io_d_ex_state: i2, io_ex2if_seq_pc: i64, io_ex2if_valid: i1) {sv.namehint = "memory.io_ex2mem_pc"}
    %memory.io_ex2mem_drop, %memory.io_ex2mem_stall, %memory.io_ex2mem_ready, %memory.io_mem2rb_pc, %memory.io_mem2rb_excep_cause, %memory.io_mem2rb_excep_tval, %memory.io_mem2rb_excep_en, %memory.io_mem2rb_excep_pc, %memory.io_mem2rb_excep_etype, %memory.io_mem2rb_csr_id, %memory.io_mem2rb_csr_d, %memory.io_mem2rb_csr_en, %memory.io_mem2rb_dst, %memory.io_mem2rb_dst_d, %memory.io_mem2rb_dst_en, %memory.io_mem2rb_special, %memory.io_mem2rb_recov, %memory.io_mem2rb_valid, %memory.io_dataRW_addr, %memory.io_dataRW_wdata, %memory.io_dataRW_dc_mode, %memory.io_dataRW_amo, %memory.io_va2pa_vaddr, %memory.io_va2pa_vvalid, %memory.io_va2pa_m_type, %memory.io_d_mem1_id, %memory.io_d_mem1_data, %memory.io_d_mem1_state, %memory.io_d_mem2_id, %memory.io_d_mem2_data, %memory.io_d_mem2_state, %memory.io_d_mem3_id, %memory.io_d_mem3_data, %memory.io_d_mem3_state = hw.instance "memory" @Memory(clock: %clock: !seq.clock, reset: %reset: i1, io_ex2mem_inst: %execute.io_ex2mem_inst: i32, io_ex2mem_pc: %execute.io_ex2mem_pc: i64, io_ex2mem_excep_cause: %execute.io_ex2mem_excep_cause: i64, io_ex2mem_excep_tval: %execute.io_ex2mem_excep_tval: i64, io_ex2mem_excep_en: %execute.io_ex2mem_excep_en: i1, io_ex2mem_excep_pc: %execute.io_ex2mem_excep_pc: i64, io_ex2mem_excep_etype: %execute.io_ex2mem_excep_etype: i2, io_ex2mem_ctrl_dcMode: %execute.io_ex2mem_ctrl_dcMode: i5, io_ex2mem_ctrl_writeRegEn: %execute.io_ex2mem_ctrl_writeRegEn: i1, io_ex2mem_ctrl_writeCSREn: %execute.io_ex2mem_ctrl_writeCSREn: i1, io_ex2mem_mem_addr: %execute.io_ex2mem_mem_addr: i64, io_ex2mem_mem_data: %execute.io_ex2mem_mem_data: i64, io_ex2mem_csr_id: %execute.io_ex2mem_csr_id: i12, io_ex2mem_csr_d: %execute.io_ex2mem_csr_d: i64, io_ex2mem_dst: %execute.io_ex2mem_dst: i5, io_ex2mem_dst_d: %execute.io_ex2mem_dst_d: i64, io_ex2mem_special: %execute.io_ex2mem_special: i2, io_ex2mem_indi: %execute.io_ex2mem_indi: i2, io_ex2mem_recov: %execute.io_ex2mem_recov: i1, io_ex2mem_valid: %execute.io_ex2mem_valid: i1, io_mem2rb_ready: %writeback.io_mem2rb_ready: i1, io_dataRW_rdata: %memCrossbar.io_dataRW_rdata: i64, io_dataRW_rvalid: %memCrossbar.io_dataRW_rvalid: i1, io_dataRW_ready: %memCrossbar.io_dataRW_ready: i1, io_va2pa_paddr: %tlb_mem.io_va2pa_paddr: i32, io_va2pa_pvalid: %tlb_mem.io_va2pa_pvalid: i1, io_va2pa_tlb_excep_cause: %tlb_mem.io_va2pa_tlb_excep_cause: i64, io_va2pa_tlb_excep_tval: %tlb_mem.io_va2pa_tlb_excep_tval: i64, io_va2pa_tlb_excep_en: %tlb_mem.io_va2pa_tlb_excep_en: i1) -> (io_ex2mem_drop: i1, io_ex2mem_stall: i1, io_ex2mem_ready: i1, io_mem2rb_pc: i64, io_mem2rb_excep_cause: i64, io_mem2rb_excep_tval: i64, io_mem2rb_excep_en: i1, io_mem2rb_excep_pc: i64, io_mem2rb_excep_etype: i2, io_mem2rb_csr_id: i12, io_mem2rb_csr_d: i64, io_mem2rb_csr_en: i1, io_mem2rb_dst: i5, io_mem2rb_dst_d: i64, io_mem2rb_dst_en: i1, io_mem2rb_special: i2, io_mem2rb_recov: i1, io_mem2rb_valid: i1, io_dataRW_addr: i32, io_dataRW_wdata: i64, io_dataRW_dc_mode: i5, io_dataRW_amo: i5, io_va2pa_vaddr: i64, io_va2pa_vvalid: i1, io_va2pa_m_type: i2, io_d_mem1_id: i5, io_d_mem1_data: i64, io_d_mem1_state: i2, io_d_mem2_id: i5, io_d_mem2_data: i64, io_d_mem2_state: i2, io_d_mem3_id: i5, io_d_mem3_data: i64, io_d_mem3_state: i2) {sv.namehint = "memory.io_mem2rb_pc"}
    %writeback.io_mem2rb_ready, %writeback.io_wReg_id, %writeback.io_wReg_data, %writeback.io_wReg_en, %writeback.io_wCsr_id, %writeback.io_wCsr_data, %writeback.io_wCsr_en, %writeback.io_excep_cause, %writeback.io_excep_tval, %writeback.io_excep_en, %writeback.io_excep_pc, %writeback.io_excep_etype, %writeback.io_wb2if_seq_pc, %writeback.io_wb2if_valid, %writeback.io_recov, %writeback.io_flush_tlb, %writeback.io_flush_cache = hw.instance "writeback" @Writeback(clock: %clock: !seq.clock, reset: %reset: i1, io_mem2rb_pc: %memory.io_mem2rb_pc: i64, io_mem2rb_excep_cause: %memory.io_mem2rb_excep_cause: i64, io_mem2rb_excep_tval: %memory.io_mem2rb_excep_tval: i64, io_mem2rb_excep_en: %memory.io_mem2rb_excep_en: i1, io_mem2rb_excep_pc: %memory.io_mem2rb_excep_pc: i64, io_mem2rb_excep_etype: %memory.io_mem2rb_excep_etype: i2, io_mem2rb_csr_id: %memory.io_mem2rb_csr_id: i12, io_mem2rb_csr_d: %memory.io_mem2rb_csr_d: i64, io_mem2rb_csr_en: %memory.io_mem2rb_csr_en: i1, io_mem2rb_dst: %memory.io_mem2rb_dst: i5, io_mem2rb_dst_d: %memory.io_mem2rb_dst_d: i64, io_mem2rb_dst_en: %memory.io_mem2rb_dst_en: i1, io_mem2rb_special: %memory.io_mem2rb_special: i2, io_mem2rb_recov: %memory.io_mem2rb_recov: i1, io_mem2rb_valid: %memory.io_mem2rb_valid: i1) -> (io_mem2rb_ready: i1, io_wReg_id: i5, io_wReg_data: i64, io_wReg_en: i1, io_wCsr_id: i12, io_wCsr_data: i64, io_wCsr_en: i1, io_excep_cause: i64, io_excep_tval: i64, io_excep_en: i1, io_excep_pc: i64, io_excep_etype: i2, io_wb2if_seq_pc: i64, io_wb2if_valid: i1, io_recov: i1, io_flush_tlb: i1, io_flush_cache: i1) {sv.namehint = "dcache.io_flush"}
    %regs.io_rs1_data, %regs.io_rs2_data = hw.instance "regs" @Regs(clock: %clock: !seq.clock, reset: %reset: i1, io_rs1_id: %readregs.io_rs1Read_id: i5, io_rs2_id: %readregs.io_rs2Read_id: i5, io_dst_id: %writeback.io_wReg_id: i5, io_dst_data: %writeback.io_wReg_data: i64, io_dst_en: %writeback.io_wReg_en: i1) -> (io_rs1_data: i64, io_rs2_data: i64) {sv.namehint = "regs.io_rs2_data"}
    %csrs.io_rs_data, %csrs.io_rs_is_err, %csrs.io_mmuState_priv, %csrs.io_mmuState_mstatus, %csrs.io_mmuState_satp, %csrs.io_idState_priv, %csrs.io_reg2if_seq_pc, %csrs.io_reg2if_valid, %csrs.io_intr_out_en, %csrs.io_intr_out_cause, %csrs.io_updateNextPc_seq_pc, %csrs.io_updateNextPc_valid = hw.instance "csrs" @Csrs(clock: %clock: !seq.clock, reset: %reset: i1, io_rs_id: %readregs.io_csrRead_id: i12, io_rd_id: %writeback.io_wCsr_id: i12, io_rd_data: %writeback.io_wCsr_data: i64, io_rd_en: %writeback.io_wCsr_en: i1, io_excep_cause: %writeback.io_excep_cause: i64, io_excep_tval: %writeback.io_excep_tval: i64, io_excep_en: %writeback.io_excep_en: i1, io_excep_pc: %writeback.io_excep_pc: i64, io_excep_etype: %writeback.io_excep_etype: i2, io_clint_raise: %clint.io_intr_raise: i1, io_clint_clear: %clint.io_intr_clear: i1, io_plic_m_raise: %plic.io_intr_out_m_raise: i1, io_plic_m_clear: %plic.io_intr_out_m_clear: i1, io_plic_s_raise: %plic.io_intr_out_s_raise: i1, io_plic_s_clear: %plic.io_intr_out_s_clear: i1, io_intr_msip_raise: %clint.io_intr_msip_raise: i1, io_intr_msip_clear: %clint.io_intr_msip_clear: i1) -> (io_rs_data: i64, io_rs_is_err: i1, io_mmuState_priv: i2, io_mmuState_mstatus: i64, io_mmuState_satp: i64, io_idState_priv: i2, io_reg2if_seq_pc: i64, io_reg2if_valid: i1, io_intr_out_en: i1, io_intr_out_cause: i64, io_updateNextPc_seq_pc: i64, io_updateNextPc_valid: i1) {sv.namehint = "csrs.io_rs_data"}
    %icache.io_instAxi_ra_valid, %icache.io_instAxi_ra_bits_addr, %icache.io_icRead_inst, %icache.io_icRead_rvalid = hw.instance "icache" @InstCache(clock: %clock: !seq.clock, reset: %reset: i1, io_instAxi_ra_ready: %crossBar.io_icAxi_ra_ready: i1, io_instAxi_rd_valid: %crossBar.io_icAxi_rd_valid: i1, io_instAxi_rd_bits_data: %crossBar.io_icAxi_rd_bits_data: i64, io_instAxi_rd_bits_last: %crossBar.io_icAxi_rd_bits_last: i1, io_icRead_addr: %fetchCrossbar.io_icRead_addr: i32, io_icRead_arvalid: %fetchCrossbar.io_icRead_arvalid: i1, io_flush: %writeback.io_flush_cache: i1) -> (io_instAxi_ra_valid: i1, io_instAxi_ra_bits_addr: i32, io_icRead_inst: i64, io_icRead_rvalid: i1) {sv.namehint = "icache.io_icRead_inst"}
    %dcache.io_dataAxi_wa_valid, %dcache.io_dataAxi_wa_bits_addr, %dcache.io_dataAxi_wd_valid, %dcache.io_dataAxi_wd_bits_data, %dcache.io_dataAxi_wd_bits_last, %dcache.io_dataAxi_ra_valid, %dcache.io_dataAxi_ra_bits_addr, %dcache.io_dcRW_rdata, %dcache.io_dcRW_rvalid, %dcache.io_dcRW_ready, %dcache.io_flush_out = hw.instance "dcache" @DataCache(clock: %clock: !seq.clock, reset: %reset: i1, io_dataAxi_wa_ready: %crossBar.io_memAxi_wa_ready: i1, io_dataAxi_wd_ready: %crossBar.io_memAxi_wd_ready: i1, io_dataAxi_ra_ready: %crossBar.io_memAxi_ra_ready: i1, io_dataAxi_rd_valid: %crossBar.io_memAxi_rd_valid: i1, io_dataAxi_rd_bits_data: %crossBar.io_memAxi_rd_bits_data: i64, io_dataAxi_rd_bits_last: %crossBar.io_memAxi_rd_bits_last: i1, io_dcRW_addr: %dcSelector.io_select_addr: i32, io_dcRW_wdata: %dcSelector.io_select_wdata: i64, io_dcRW_dc_mode: %dcSelector.io_select_dc_mode: i5, io_dcRW_amo: %dcSelector.io_select_amo: i5, io_flush: %writeback.io_flush_cache: i1) -> (io_dataAxi_wa_valid: i1, io_dataAxi_wa_bits_addr: i32, io_dataAxi_wd_valid: i1, io_dataAxi_wd_bits_data: i64, io_dataAxi_wd_bits_last: i1, io_dataAxi_ra_valid: i1, io_dataAxi_ra_bits_addr: i32, io_dcRW_rdata: i64, io_dcRW_rvalid: i1, io_dcRW_ready: i1, io_flush_out: i1) {sv.namehint = "crossBar.io_selectMem"}
    %mem2Axi.io_dataIO_rdata, %mem2Axi.io_dataIO_rvalid, %mem2Axi.io_dataIO_ready, %mem2Axi.io_outAxi_wa_valid, %mem2Axi.io_outAxi_wa_bits_addr, %mem2Axi.io_outAxi_wd_valid, %mem2Axi.io_outAxi_wd_bits_data, %mem2Axi.io_outAxi_wd_bits_strb, %mem2Axi.io_outAxi_ra_valid, %mem2Axi.io_outAxi_ra_bits_addr, %mem2Axi.io_outAxi_rd_ready = hw.instance "mem2Axi" @ToAXI(clock: %clock: !seq.clock, reset: %reset: i1, io_dataIO_addr: %memCrossbar.io_mmio_addr: i32, io_dataIO_wdata: %memCrossbar.io_mmio_wdata: i64, io_dataIO_dc_mode: %memCrossbar.io_mmio_dc_mode: i5, io_outAxi_wa_ready: %crossBar.io_mmioAxi_wa_ready: i1, io_outAxi_wd_ready: %crossBar.io_mmioAxi_wd_ready: i1, io_outAxi_ra_ready: %crossBar.io_mmioAxi_ra_ready: i1, io_outAxi_rd_valid: %crossBar.io_mmioAxi_rd_valid: i1, io_outAxi_rd_bits_data: %crossBar.io_mmioAxi_rd_bits_data: i64) -> (io_dataIO_rdata: i64, io_dataIO_rvalid: i1, io_dataIO_ready: i1, io_outAxi_wa_valid: i1, io_outAxi_wa_bits_addr: i32, io_outAxi_wd_valid: i1, io_outAxi_wd_bits_data: i64, io_outAxi_wd_bits_strb: i8, io_outAxi_ra_valid: i1, io_outAxi_ra_bits_addr: i32, io_outAxi_rd_ready: i1) {sv.namehint = "mem2Axi.io_dataIO_ready"}
    %flash2Axi.io_dataIO_rdata, %flash2Axi.io_dataIO_rvalid, %flash2Axi.io_dataIO_ready, %flash2Axi.io_outAxi_wa_valid, %flash2Axi.io_outAxi_wa_bits_addr, %flash2Axi.io_outAxi_wd_valid, %flash2Axi.io_outAxi_wd_bits_data, %flash2Axi.io_outAxi_wd_bits_strb, %flash2Axi.io_outAxi_ra_valid, %flash2Axi.io_outAxi_ra_bits_addr, %flash2Axi.io_outAxi_rd_ready = hw.instance "flash2Axi" @ToAXI(clock: %clock: !seq.clock, reset: %reset: i1, io_dataIO_addr: %split64to32.io_data_out_addr: i32, io_dataIO_wdata: %c0_i64: i64, io_dataIO_dc_mode: %split64to32.io_data_out_dc_mode: i5, io_outAxi_wa_ready: %crossBar.io_flashAxi_wa_ready: i1, io_outAxi_wd_ready: %crossBar.io_flashAxi_wd_ready: i1, io_outAxi_ra_ready: %crossBar.io_flashAxi_ra_ready: i1, io_outAxi_rd_valid: %crossBar.io_flashAxi_rd_valid: i1, io_outAxi_rd_bits_data: %crossBar.io_flashAxi_rd_bits_data: i64) -> (io_dataIO_rdata: i64, io_dataIO_rvalid: i1, io_dataIO_ready: i1, io_outAxi_wa_valid: i1, io_outAxi_wa_bits_addr: i32, io_outAxi_wd_valid: i1, io_outAxi_wd_bits_data: i64, io_outAxi_wd_bits_strb: i8, io_outAxi_ra_valid: i1, io_outAxi_ra_bits_addr: i32, io_outAxi_rd_ready: i1) {sv.namehint = "flash2Axi.io_dataIO_ready"}
    %crossBar.io_icAxi_ra_ready, %crossBar.io_icAxi_rd_valid, %crossBar.io_icAxi_rd_bits_data, %crossBar.io_icAxi_rd_bits_last, %crossBar.io_flashAxi_wa_ready, %crossBar.io_flashAxi_wd_ready, %crossBar.io_flashAxi_ra_ready, %crossBar.io_flashAxi_rd_valid, %crossBar.io_flashAxi_rd_bits_data, %crossBar.io_memAxi_wa_ready, %crossBar.io_memAxi_wd_ready, %crossBar.io_memAxi_ra_ready, %crossBar.io_memAxi_rd_valid, %crossBar.io_memAxi_rd_bits_data, %crossBar.io_memAxi_rd_bits_last, %crossBar.io_mmioAxi_wa_ready, %crossBar.io_mmioAxi_wd_ready, %crossBar.io_mmioAxi_ra_ready, %crossBar.io_mmioAxi_rd_valid, %crossBar.io_mmioAxi_rd_bits_data, %crossBar.io_outAxi_wa_valid, %crossBar.io_outAxi_wa_bits_addr, %crossBar.io_outAxi_wa_bits_len, %crossBar.io_outAxi_wd_valid, %crossBar.io_outAxi_wd_bits_data, %crossBar.io_outAxi_wd_bits_strb, %crossBar.io_outAxi_wd_bits_last, %crossBar.io_outAxi_ra_valid, %crossBar.io_outAxi_ra_bits_addr, %crossBar.io_outAxi_ra_bits_len, %crossBar.io_outAxi_rd_ready = hw.instance "crossBar" @CrossBar(clock: %clock: !seq.clock, reset: %reset: i1, io_icAxi_ra_valid: %icache.io_instAxi_ra_valid: i1, io_icAxi_ra_bits_addr: %icache.io_instAxi_ra_bits_addr: i32, io_flashAxi_wa_valid: %flash2Axi.io_outAxi_wa_valid: i1, io_flashAxi_wa_bits_addr: %flash2Axi.io_outAxi_wa_bits_addr: i32, io_flashAxi_wd_valid: %flash2Axi.io_outAxi_wd_valid: i1, io_flashAxi_wd_bits_data: %flash2Axi.io_outAxi_wd_bits_data: i64, io_flashAxi_wd_bits_strb: %flash2Axi.io_outAxi_wd_bits_strb: i8, io_flashAxi_ra_valid: %flash2Axi.io_outAxi_ra_valid: i1, io_flashAxi_ra_bits_addr: %flash2Axi.io_outAxi_ra_bits_addr: i32, io_flashAxi_rd_ready: %flash2Axi.io_outAxi_rd_ready: i1, io_memAxi_wa_valid: %dcache.io_dataAxi_wa_valid: i1, io_memAxi_wa_bits_addr: %dcache.io_dataAxi_wa_bits_addr: i32, io_memAxi_wd_valid: %dcache.io_dataAxi_wd_valid: i1, io_memAxi_wd_bits_data: %dcache.io_dataAxi_wd_bits_data: i64, io_memAxi_wd_bits_last: %dcache.io_dataAxi_wd_bits_last: i1, io_memAxi_ra_valid: %dcache.io_dataAxi_ra_valid: i1, io_memAxi_ra_bits_addr: %dcache.io_dataAxi_ra_bits_addr: i32, io_mmioAxi_wa_valid: %mem2Axi.io_outAxi_wa_valid: i1, io_mmioAxi_wa_bits_addr: %mem2Axi.io_outAxi_wa_bits_addr: i32, io_mmioAxi_wd_valid: %mem2Axi.io_outAxi_wd_valid: i1, io_mmioAxi_wd_bits_data: %mem2Axi.io_outAxi_wd_bits_data: i64, io_mmioAxi_wd_bits_strb: %mem2Axi.io_outAxi_wd_bits_strb: i8, io_mmioAxi_ra_valid: %mem2Axi.io_outAxi_ra_valid: i1, io_mmioAxi_ra_bits_addr: %mem2Axi.io_outAxi_ra_bits_addr: i32, io_mmioAxi_rd_ready: %mem2Axi.io_outAxi_rd_ready: i1, io_outAxi_wa_ready: %io_master_awready: i1, io_outAxi_wd_ready: %io_master_wready: i1, io_outAxi_ra_ready: %io_master_arready: i1, io_outAxi_rd_valid: %io_master_rvalid: i1, io_outAxi_rd_bits_data: %io_master_rdata: i64, io_outAxi_rd_bits_last: %io_master_rlast: i1, io_selectMem: %dcache.io_flush_out: i1) -> (io_icAxi_ra_ready: i1, io_icAxi_rd_valid: i1, io_icAxi_rd_bits_data: i64, io_icAxi_rd_bits_last: i1, io_flashAxi_wa_ready: i1, io_flashAxi_wd_ready: i1, io_flashAxi_ra_ready: i1, io_flashAxi_rd_valid: i1, io_flashAxi_rd_bits_data: i64, io_memAxi_wa_ready: i1, io_memAxi_wd_ready: i1, io_memAxi_ra_ready: i1, io_memAxi_rd_valid: i1, io_memAxi_rd_bits_data: i64, io_memAxi_rd_bits_last: i1, io_mmioAxi_wa_ready: i1, io_mmioAxi_wd_ready: i1, io_mmioAxi_ra_ready: i1, io_mmioAxi_rd_valid: i1, io_mmioAxi_rd_bits_data: i64, io_outAxi_wa_valid: i1, io_outAxi_wa_bits_addr: i32, io_outAxi_wa_bits_len: i8, io_outAxi_wd_valid: i1, io_outAxi_wd_bits_data: i64, io_outAxi_wd_bits_strb: i8, io_outAxi_wd_bits_last: i1, io_outAxi_ra_valid: i1, io_outAxi_ra_bits_addr: i32, io_outAxi_ra_bits_len: i8, io_outAxi_rd_ready: i1) {sv.namehint = "crossBar.io_icAxi_rd_valid"}
    %fetchCrossbar.io_instIO_inst, %fetchCrossbar.io_instIO_rvalid, %fetchCrossbar.io_icRead_addr, %fetchCrossbar.io_icRead_arvalid, %fetchCrossbar.io_flashRead_addr, %fetchCrossbar.io_flashRead_dc_mode = hw.instance "fetchCrossbar" @FetchCrossBar(clock: %clock: !seq.clock, reset: %reset: i1, io_instIO_addr: %fetch.io_instRead_addr: i32, io_instIO_arvalid: %fetch.io_instRead_arvalid: i1, io_icRead_inst: %icache.io_icRead_inst: i64, io_icRead_rvalid: %icache.io_icRead_rvalid: i1, io_flashRead_rdata: %split64to32.io_data_in_rdata: i64, io_flashRead_rvalid: %split64to32.io_data_in_rvalid: i1) -> (io_instIO_inst: i64, io_instIO_rvalid: i1, io_icRead_addr: i32, io_icRead_arvalid: i1, io_flashRead_addr: i32, io_flashRead_dc_mode: i5) {sv.namehint = "fetchCrossbar.io_icRead_addr"}
    %split64to32.io_data_in_rdata, %split64to32.io_data_in_rvalid, %split64to32.io_data_out_addr, %split64to32.io_data_out_dc_mode = hw.instance "split64to32" @Splite64to32(clock: %clock: !seq.clock, reset: %reset: i1, io_data_in_addr: %fetchCrossbar.io_flashRead_addr: i32, io_data_in_dc_mode: %fetchCrossbar.io_flashRead_dc_mode: i5, io_data_out_rdata: %flash2Axi.io_dataIO_rdata: i64, io_data_out_rvalid: %flash2Axi.io_dataIO_rvalid: i1, io_data_out_ready: %flash2Axi.io_dataIO_ready: i1) -> (io_data_in_rdata: i64, io_data_in_rvalid: i1, io_data_out_addr: i32, io_data_out_dc_mode: i5) {sv.namehint = "split64to32.io_data_out_addr"}
    %memCrossbar.io_dataRW_rdata, %memCrossbar.io_dataRW_rvalid, %memCrossbar.io_dataRW_ready, %memCrossbar.io_mmio_addr, %memCrossbar.io_mmio_wdata, %memCrossbar.io_mmio_dc_mode, %memCrossbar.io_dcRW_addr, %memCrossbar.io_dcRW_wdata, %memCrossbar.io_dcRW_dc_mode, %memCrossbar.io_dcRW_amo, %memCrossbar.io_clintIO_addr, %memCrossbar.io_clintIO_wdata, %memCrossbar.io_clintIO_wvalid, %memCrossbar.io_plicIO_addr, %memCrossbar.io_plicIO_wdata, %memCrossbar.io_plicIO_wvalid, %memCrossbar.io_plicIO_arvalid = hw.instance "memCrossbar" @MemCrossBar(clock: %clock: !seq.clock, reset: %reset: i1, io_dataRW_addr: %memory.io_dataRW_addr: i32, io_dataRW_wdata: %memory.io_dataRW_wdata: i64, io_dataRW_dc_mode: %memory.io_dataRW_dc_mode: i5, io_dataRW_amo: %memory.io_dataRW_amo: i5, io_mmio_rdata: %mem2Axi.io_dataIO_rdata: i64, io_mmio_rvalid: %mem2Axi.io_dataIO_rvalid: i1, io_mmio_ready: %mem2Axi.io_dataIO_ready: i1, io_dcRW_rdata: %dcSelector.io_mem2dc_rdata: i64, io_dcRW_rvalid: %dcSelector.io_mem2dc_rvalid: i1, io_dcRW_ready: %dcSelector.io_mem2dc_ready: i1, io_clintIO_rdata: %clint.io_rw_rdata: i64, io_plicIO_rdata: %plic.io_rw_rdata: i64) -> (io_dataRW_rdata: i64, io_dataRW_rvalid: i1, io_dataRW_ready: i1, io_mmio_addr: i32, io_mmio_wdata: i64, io_mmio_dc_mode: i5, io_dcRW_addr: i32, io_dcRW_wdata: i64, io_dcRW_dc_mode: i5, io_dcRW_amo: i5, io_clintIO_addr: i32, io_clintIO_wdata: i64, io_clintIO_wvalid: i1, io_plicIO_addr: i32, io_plicIO_wdata: i64, io_plicIO_wvalid: i1, io_plicIO_arvalid: i1) {sv.namehint = "plic.io_rw_addr"}
    %tlb_if.io_va2pa_paddr, %tlb_if.io_va2pa_pvalid, %tlb_if.io_va2pa_tlb_excep_cause, %tlb_if.io_va2pa_tlb_excep_tval, %tlb_if.io_va2pa_tlb_excep_en, %tlb_if.io_dcacheRW_addr, %tlb_if.io_dcacheRW_wdata, %tlb_if.io_dcacheRW_dc_mode = hw.instance "tlb_if" @TLB(clock: %clock: !seq.clock, reset: %reset: i1, io_va2pa_vaddr: %fetch.io_va2pa_vaddr: i64, io_va2pa_vvalid: %fetch.io_va2pa_vvalid: i1, io_mmuState_priv: %csrs.io_mmuState_priv: i2, io_mmuState_mstatus: %csrs.io_mmuState_mstatus: i64, io_mmuState_satp: %csrs.io_mmuState_satp: i64, io_flush: %writeback.io_flush_tlb: i1, io_dcacheRW_rdata: %dcSelector.io_tlb_if2dc_rdata: i64, io_dcacheRW_rvalid: %dcSelector.io_tlb_if2dc_rvalid: i1, io_dcacheRW_ready: %dcSelector.io_tlb_if2dc_ready: i1) -> (io_va2pa_paddr: i32, io_va2pa_pvalid: i1, io_va2pa_tlb_excep_cause: i64, io_va2pa_tlb_excep_tval: i64, io_va2pa_tlb_excep_en: i1, io_dcacheRW_addr: i32, io_dcacheRW_wdata: i64, io_dcacheRW_dc_mode: i5) {sv.namehint = "tlb_if.io_va2pa_paddr"}
    %tlb_mem.io_va2pa_paddr, %tlb_mem.io_va2pa_pvalid, %tlb_mem.io_va2pa_tlb_excep_cause, %tlb_mem.io_va2pa_tlb_excep_tval, %tlb_mem.io_va2pa_tlb_excep_en, %tlb_mem.io_dcacheRW_addr, %tlb_mem.io_dcacheRW_wdata, %tlb_mem.io_dcacheRW_dc_mode = hw.instance "tlb_mem" @TLB_1(clock: %clock: !seq.clock, reset: %reset: i1, io_va2pa_vaddr: %memory.io_va2pa_vaddr: i64, io_va2pa_vvalid: %memory.io_va2pa_vvalid: i1, io_va2pa_m_type: %memory.io_va2pa_m_type: i2, io_mmuState_priv: %csrs.io_mmuState_priv: i2, io_mmuState_mstatus: %csrs.io_mmuState_mstatus: i64, io_mmuState_satp: %csrs.io_mmuState_satp: i64, io_flush: %writeback.io_flush_tlb: i1, io_dcacheRW_rdata: %dcSelector.io_tlb_mem2dc_rdata: i64, io_dcacheRW_rvalid: %dcSelector.io_tlb_mem2dc_rvalid: i1, io_dcacheRW_ready: %dcSelector.io_tlb_mem2dc_ready: i1) -> (io_va2pa_paddr: i32, io_va2pa_pvalid: i1, io_va2pa_tlb_excep_cause: i64, io_va2pa_tlb_excep_tval: i64, io_va2pa_tlb_excep_en: i1, io_dcacheRW_addr: i32, io_dcacheRW_wdata: i64, io_dcacheRW_dc_mode: i5) {sv.namehint = "tlb_mem.io_va2pa_paddr"}
    %dcSelector.io_tlb_if2dc_rdata, %dcSelector.io_tlb_if2dc_rvalid, %dcSelector.io_tlb_if2dc_ready, %dcSelector.io_tlb_mem2dc_rdata, %dcSelector.io_tlb_mem2dc_rvalid, %dcSelector.io_tlb_mem2dc_ready, %dcSelector.io_mem2dc_rdata, %dcSelector.io_mem2dc_rvalid, %dcSelector.io_mem2dc_ready, %dcSelector.io_dma2dc_rdata, %dcSelector.io_dma2dc_rvalid, %dcSelector.io_dma2dc_ready, %dcSelector.io_select_addr, %dcSelector.io_select_wdata, %dcSelector.io_select_dc_mode, %dcSelector.io_select_amo = hw.instance "dcSelector" @DcacheSelector(clock: %clock: !seq.clock, reset: %reset: i1, io_tlb_if2dc_addr: %tlb_if.io_dcacheRW_addr: i32, io_tlb_if2dc_wdata: %tlb_if.io_dcacheRW_wdata: i64, io_tlb_if2dc_dc_mode: %tlb_if.io_dcacheRW_dc_mode: i5, io_tlb_mem2dc_addr: %tlb_mem.io_dcacheRW_addr: i32, io_tlb_mem2dc_wdata: %tlb_mem.io_dcacheRW_wdata: i64, io_tlb_mem2dc_dc_mode: %tlb_mem.io_dcacheRW_dc_mode: i5, io_mem2dc_addr: %memCrossbar.io_dcRW_addr: i32, io_mem2dc_wdata: %memCrossbar.io_dcRW_wdata: i64, io_mem2dc_dc_mode: %memCrossbar.io_dcRW_dc_mode: i5, io_mem2dc_amo: %memCrossbar.io_dcRW_amo: i5, io_dma2dc_addr: %dmaBridge.io_dcRW_addr: i32, io_dma2dc_wdata: %dmaBridge.io_dcRW_wdata: i64, io_dma2dc_dc_mode: %dmaBridge.io_dcRW_dc_mode: i5, io_select_rdata: %dcache.io_dcRW_rdata: i64, io_select_rvalid: %dcache.io_dcRW_rvalid: i1, io_select_ready: %dcache.io_dcRW_ready: i1) -> (io_tlb_if2dc_rdata: i64, io_tlb_if2dc_rvalid: i1, io_tlb_if2dc_ready: i1, io_tlb_mem2dc_rdata: i64, io_tlb_mem2dc_rvalid: i1, io_tlb_mem2dc_ready: i1, io_mem2dc_rdata: i64, io_mem2dc_rvalid: i1, io_mem2dc_ready: i1, io_dma2dc_rdata: i64, io_dma2dc_rvalid: i1, io_dma2dc_ready: i1, io_select_addr: i32, io_select_wdata: i64, io_select_dc_mode: i5, io_select_amo: i5) {sv.namehint = "dmaBridge.io_dcRW_ready"}
    %clint.io_rw_rdata, %clint.io_intr_raise, %clint.io_intr_clear, %clint.io_intr_msip_raise, %clint.io_intr_msip_clear = hw.instance "clint" @CLINT(clock: %clock: !seq.clock, reset: %reset: i1, io_rw_addr: %memCrossbar.io_clintIO_addr: i32, io_rw_wdata: %memCrossbar.io_clintIO_wdata: i64, io_rw_wvalid: %memCrossbar.io_clintIO_wvalid: i1) -> (io_rw_rdata: i64, io_intr_raise: i1, io_intr_clear: i1, io_intr_msip_raise: i1, io_intr_msip_clear: i1) {sv.namehint = "clint.io_rw_rdata"}
    %plic.io_intr_out_m_raise, %plic.io_intr_out_m_clear, %plic.io_intr_out_s_raise, %plic.io_intr_out_s_clear, %plic.io_rw_rdata = hw.instance "plic" @Plic(clock: %clock: !seq.clock, reset: %reset: i1, io_rw_addr: %memCrossbar.io_plicIO_addr: i32, io_rw_wdata: %memCrossbar.io_plicIO_wdata: i64, io_rw_wvalid: %memCrossbar.io_plicIO_wvalid: i1, io_rw_arvalid: %memCrossbar.io_plicIO_arvalid: i1) -> (io_intr_out_m_raise: i1, io_intr_out_m_clear: i1, io_intr_out_s_raise: i1, io_intr_out_s_clear: i1, io_rw_rdata: i64) {sv.namehint = "plic.io_rw_rdata"}
    %dmaBridge.io_dmaAxi_awready, %dmaBridge.io_dmaAxi_wready, %dmaBridge.io_dmaAxi_bvalid, %dmaBridge.io_dmaAxi_arready, %dmaBridge.io_dmaAxi_rvalid, %dmaBridge.io_dmaAxi_rdata, %dmaBridge.io_dmaAxi_rlast, %dmaBridge.io_dcRW_addr, %dmaBridge.io_dcRW_wdata, %dmaBridge.io_dcRW_dc_mode = hw.instance "dmaBridge" @DmaBridge(clock: %clock: !seq.clock, reset: %reset: i1, io_dmaAxi_awvalid: %io_slave_awvalid: i1, io_dmaAxi_wvalid: %io_slave_wvalid: i1, io_dmaAxi_wdata: %io_slave_wdata: i64, io_dmaAxi_wstrb: %io_slave_wstrb: i8, io_dmaAxi_bready: %io_slave_bready: i1, io_dmaAxi_arvalid: %io_slave_arvalid: i1, io_dmaAxi_rready: %io_slave_rready: i1, io_dcRW_rdata: %dcSelector.io_dma2dc_rdata: i64, io_dcRW_rvalid: %dcSelector.io_dma2dc_rvalid: i1, io_dcRW_ready: %dcSelector.io_dma2dc_ready: i1) -> (io_dmaAxi_awready: i1, io_dmaAxi_wready: i1, io_dmaAxi_bvalid: i1, io_dmaAxi_arready: i1, io_dmaAxi_rvalid: i1, io_dmaAxi_rdata: i64, io_dmaAxi_rlast: i1, io_dcRW_addr: i32, io_dcRW_wdata: i64, io_dcRW_dc_mode: i5) {sv.namehint = "dmaBridge.io_dcRW_addr"}
    hw.output %crossBar.io_outAxi_wa_valid, %crossBar.io_outAxi_wa_bits_addr, %crossBar.io_outAxi_wa_bits_len, %crossBar.io_outAxi_wd_valid, %crossBar.io_outAxi_wd_bits_data, %crossBar.io_outAxi_wd_bits_strb, %crossBar.io_outAxi_wd_bits_last, %crossBar.io_outAxi_ra_valid, %crossBar.io_outAxi_ra_bits_addr, %crossBar.io_outAxi_ra_bits_len, %crossBar.io_outAxi_rd_ready, %dmaBridge.io_dmaAxi_awready, %dmaBridge.io_dmaAxi_wready, %dmaBridge.io_dmaAxi_bvalid, %dmaBridge.io_dmaAxi_arready, %dmaBridge.io_dmaAxi_rvalid, %dmaBridge.io_dmaAxi_rdata, %dmaBridge.io_dmaAxi_rlast : i1, i32, i8, i1, i64, i8, i1, i1, i32, i8, i1, i1, i1, i1, i1, i1, i64, i1
  }
  hw.module private @SimMEM(in %clock : !seq.clock, in %reset : i1, out io_memAxi_wa_ready : i1, in %io_memAxi_wa_valid : i1, in %io_memAxi_wa_bits_addr : i32, in %io_memAxi_wa_bits_len : i8, out io_memAxi_wd_ready : i1, in %io_memAxi_wd_valid : i1, in %io_memAxi_wd_bits_data : i64, in %io_memAxi_wd_bits_strb : i8, in %io_memAxi_wd_bits_last : i1, out io_memAxi_ra_ready : i1, in %io_memAxi_ra_valid : i1, in %io_memAxi_ra_bits_addr : i32, in %io_memAxi_ra_bits_len : i8, in %io_memAxi_rd_ready : i1, out io_memAxi_rd_valid : i1, out io_memAxi_rd_bits_data : i64, out io_memAxi_rd_bits_last : i1, in %io_initMemEn : i1, in %io_initMemAddr : i32, in %io_initMemData : i8) {
    %c1_i8 = hw.constant 1 : i8
    %c1_i28 = hw.constant 1 : i28
    %c2_i28 = hw.constant 2 : i28
    %c3_i28 = hw.constant 3 : i28
    %c4_i28 = hw.constant 4 : i28
    %c5_i28 = hw.constant 5 : i28
    %c6_i28 = hw.constant 6 : i28
    %c7_i28 = hw.constant 7 : i28
    %c0_i17 = hw.constant 0 : i17
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %c0_i8 = hw.constant 0 : i8
    %c0_i32 = hw.constant 0 : i32
    %c-1_i2 = hw.constant -1 : i2
    %c1_i2 = hw.constant 1 : i2
    %true = hw.constant true
    %c0_i2 = hw.constant 0 : i2
    %ram = seq.firmem 0, 1, undefined, port_order {init = #seq.firmem.init<"/home/chenlu/program/simulator/ready-ro-run/bin/bbl-hello.bin", false, false>, prefix = ""} : <268435456 x 8>
    seq.firmem.write_port %ram[%16] = %io_initMemData, clock %clock enable %io_initMemEn : <268435456 x 8>
    seq.firmem.write_port %ram[%19] = %72, clock %clock enable %67 : <268435456 x 8>
    %0 = seq.firmem.read_port %ram[%97], clock %clock enable %103 : <268435456 x 8>
    seq.firmem.write_port %ram[%105] = %112, clock %clock enable %107 : <268435456 x 8>
    %1 = seq.firmem.read_port %ram[%105], clock %clock enable %111 : <268435456 x 8>
    seq.firmem.write_port %ram[%113] = %120, clock %clock enable %115 : <268435456 x 8>
    %2 = seq.firmem.read_port %ram[%113], clock %clock enable %119 : <268435456 x 8>
    seq.firmem.write_port %ram[%121] = %128, clock %clock enable %123 : <268435456 x 8>
    %3 = seq.firmem.read_port %ram[%121], clock %clock enable %127 : <268435456 x 8>
    %4 = seq.firmem.read_port %ram[%19], clock %clock enable %71 : <268435456 x 8>
    seq.firmem.write_port %ram[%73] = %80, clock %clock enable %75 : <268435456 x 8>
    %5 = seq.firmem.read_port %ram[%73], clock %clock enable %79 : <268435456 x 8>
    seq.firmem.write_port %ram[%81] = %88, clock %clock enable %83 : <268435456 x 8>
    %6 = seq.firmem.read_port %ram[%81], clock %clock enable %87 : <268435456 x 8>
    seq.firmem.write_port %ram[%89] = %96, clock %clock enable %91 : <268435456 x 8>
    %7 = seq.firmem.read_port %ram[%89], clock %clock enable %95 : <268435456 x 8>
    seq.firmem.write_port %ram[%97] = %104, clock %clock enable %99 : <268435456 x 8>
    %8 = seq.firmem.read_port %ram[%22], clock %clock : <268435456 x 8>
    %9 = seq.firmem.read_port %ram[%25], clock %clock : <268435456 x 8>
    %10 = seq.firmem.read_port %ram[%28], clock %clock : <268435456 x 8>
    %11 = seq.firmem.read_port %ram[%31], clock %clock : <268435456 x 8>
    %12 = seq.firmem.read_port %ram[%34], clock %clock : <268435456 x 8>
    %13 = seq.firmem.read_port %ram[%37], clock %clock : <268435456 x 8>
    %14 = seq.firmem.read_port %ram[%40], clock %clock : <268435456 x 8>
    %15 = seq.firmem.read_port %ram[%43], clock %clock : <268435456 x 8>
    %16 = comb.extract %io_initMemAddr from 0 : (i32) -> i28
    %burstLen = seq.firreg %60 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 0 : ui64} : i8
    %offset = seq.firreg %142 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 8 : ui64} : i8
    %waReady = seq.firreg %53 clock %clock reset sync %reset, %false {firrtl.random_init_start = 16 : ui64, sv.namehint = "waReady"} : i1
    %wdReady = seq.firreg %135 clock %clock reset sync %reset, %false {firrtl.random_init_start = 17 : ui64, sv.namehint = "wdReady"} : i1
    %waStart = seq.firreg %50 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 18 : ui64} : i32
    %17 = comb.extract %waStart from 0 : (i32) -> i28
    %18 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %19 = comb.add %17, %18 {sv.namehint = "_waddr_T_1"} : i28
    %raReady = seq.firreg %62 clock %clock reset sync %reset, %false {firrtl.random_init_start = 50 : ui64, sv.namehint = "raReady"} : i1
    %raStart = seq.firreg %58 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 51 : ui64} : i32
    %rdValid = seq.firreg %147 clock %clock reset sync %reset, %false {firrtl.random_init_start = 83 : ui64, sv.namehint = "rdValid"} : i1
    %20 = comb.extract %raStart from 0 : (i32) -> i28
    %21 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %22 = comb.add %20, %21, %c7_i28 {sv.namehint = "_rdata_T_3"} : i28
    %23 = comb.extract %raStart from 0 : (i32) -> i28
    %24 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %25 = comb.add %23, %24, %c6_i28 {sv.namehint = "_rdata_T_10"} : i28
    %26 = comb.extract %raStart from 0 : (i32) -> i28
    %27 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %28 = comb.add %26, %27, %c5_i28 {sv.namehint = "_rdata_T_17"} : i28
    %29 = comb.extract %raStart from 0 : (i32) -> i28
    %30 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %31 = comb.add %29, %30, %c4_i28 {sv.namehint = "_rdata_T_24"} : i28
    %32 = comb.extract %raStart from 0 : (i32) -> i28
    %33 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %34 = comb.add %32, %33, %c3_i28 {sv.namehint = "_rdata_T_31"} : i28
    %35 = comb.extract %raStart from 0 : (i32) -> i28
    %36 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %37 = comb.add %35, %36, %c2_i28 {sv.namehint = "_rdata_T_38"} : i28
    %38 = comb.extract %raStart from 0 : (i32) -> i28
    %39 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %40 = comb.add %38, %39, %c1_i28 {sv.namehint = "_rdata_T_45"} : i28
    %41 = comb.extract %raStart from 0 : (i32) -> i28
    %42 = comb.concat %c0_i17, %offset, %c0_i3 : i17, i8, i3
    %43 = comb.add %41, %42 {sv.namehint = "_rdata_T_50"} : i28
    %44 = comb.concat %8, %9, %10, %11, %12, %13, %14, %15 {sv.namehint = "rdata"} : i8, i8, i8, i8, i8, i8, i8, i8
    %state = seq.firreg %151 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 84 : ui64} : i2
    %45 = comb.icmp bin uge %offset, %burstLen {sv.namehint = "isLast"} : i8
    %46 = comb.icmp bin eq %state, %c0_i2 : i2
    %47 = comb.and bin %io_memAxi_wa_valid, %waReady : i1
    %48 = comb.mux bin %47, %c1_i2, %state : i2
    %49 = comb.and bin %46, %47 : i1
    %50 = comb.mux bin %49, %io_memAxi_wa_bits_addr, %waStart : i32
    %51 = comb.mux bin %47, %io_memAxi_wa_bits_len, %burstLen : i8
    %52 = comb.xor bin %47, %true : i1
    %53 = comb.mux bin %46, %52, %waReady : i1
    %54 = comb.or %47, %wdReady : i1
    %55 = comb.and bin %io_memAxi_ra_valid, %raReady : i1
    %56 = comb.mux bin %55, %c-1_i2, %48 : i2
    %57 = comb.and bin %46, %55 : i1
    %58 = comb.mux bin %57, %io_memAxi_ra_bits_addr, %raStart : i32
    %59 = comb.mux bin %55, %io_memAxi_ra_bits_len, %51 : i8
    %60 = comb.mux bin %46, %59, %burstLen : i8
    %61 = comb.xor bin %55, %true : i1
    %62 = comb.mux bin %46, %61, %raReady : i1
    %63 = comb.or %55, %rdValid : i1
    %64 = comb.icmp bin eq %state, %c1_i2 : i2
    %65 = comb.and %64, %io_memAxi_wd_valid : i1
    %66 = comb.xor %46, %true : i1
    %67 = comb.and %66, %65 : i1
    %68 = comb.extract %io_memAxi_wd_bits_strb from 0 : (i8) -> i1
    %69 = comb.extract %io_memAxi_wd_bits_data from 0 : (i64) -> i8
    %70 = comb.xor %46, %true : i1
    %71 = comb.and %70, %65 : i1
    %72 = comb.mux bin %68, %69, %4 : i8
    %73 = comb.add %19, %c1_i28 : i28
    %74 = comb.xor %46, %true : i1
    %75 = comb.and %74, %65 : i1
    %76 = comb.extract %io_memAxi_wd_bits_strb from 1 : (i8) -> i1
    %77 = comb.extract %io_memAxi_wd_bits_data from 8 : (i64) -> i8
    %78 = comb.xor %46, %true : i1
    %79 = comb.and %78, %65 : i1
    %80 = comb.mux bin %76, %77, %5 : i8
    %81 = comb.add %19, %c2_i28 : i28
    %82 = comb.xor %46, %true : i1
    %83 = comb.and %82, %65 : i1
    %84 = comb.extract %io_memAxi_wd_bits_strb from 2 : (i8) -> i1
    %85 = comb.extract %io_memAxi_wd_bits_data from 16 : (i64) -> i8
    %86 = comb.xor %46, %true : i1
    %87 = comb.and %86, %65 : i1
    %88 = comb.mux bin %84, %85, %6 : i8
    %89 = comb.add %19, %c3_i28 : i28
    %90 = comb.xor %46, %true : i1
    %91 = comb.and %90, %65 : i1
    %92 = comb.extract %io_memAxi_wd_bits_strb from 3 : (i8) -> i1
    %93 = comb.extract %io_memAxi_wd_bits_data from 24 : (i64) -> i8
    %94 = comb.xor %46, %true : i1
    %95 = comb.and %94, %65 : i1
    %96 = comb.mux bin %92, %93, %7 : i8
    %97 = comb.add %19, %c4_i28 : i28
    %98 = comb.xor %46, %true : i1
    %99 = comb.and %98, %65 : i1
    %100 = comb.extract %io_memAxi_wd_bits_strb from 4 : (i8) -> i1
    %101 = comb.extract %io_memAxi_wd_bits_data from 32 : (i64) -> i8
    %102 = comb.xor %46, %true : i1
    %103 = comb.and %102, %65 : i1
    %104 = comb.mux bin %100, %101, %0 : i8
    %105 = comb.add %19, %c5_i28 : i28
    %106 = comb.xor %46, %true : i1
    %107 = comb.and %106, %65 : i1
    %108 = comb.extract %io_memAxi_wd_bits_strb from 5 : (i8) -> i1
    %109 = comb.extract %io_memAxi_wd_bits_data from 40 : (i64) -> i8
    %110 = comb.xor %46, %true : i1
    %111 = comb.and %110, %65 : i1
    %112 = comb.mux bin %108, %109, %1 : i8
    %113 = comb.add %19, %c6_i28 : i28
    %114 = comb.xor %46, %true : i1
    %115 = comb.and %114, %65 : i1
    %116 = comb.extract %io_memAxi_wd_bits_strb from 6 : (i8) -> i1
    %117 = comb.extract %io_memAxi_wd_bits_data from 48 : (i64) -> i8
    %118 = comb.xor %46, %true : i1
    %119 = comb.and %118, %65 : i1
    %120 = comb.mux bin %116, %117, %2 : i8
    %121 = comb.add %19, %c7_i28 : i28
    %122 = comb.xor %46, %true : i1
    %123 = comb.and %122, %65 : i1
    %124 = comb.extract %io_memAxi_wd_bits_strb from 7 : (i8) -> i1
    %125 = comb.extract %io_memAxi_wd_bits_data from 56 : (i64) -> i8
    %126 = comb.xor %46, %true : i1
    %127 = comb.and %126, %65 : i1
    %128 = comb.mux bin %124, %125, %3 : i8
    %129 = comb.add %offset, %c1_i8 {sv.namehint = "_offset_T"} : i8
    %130 = comb.mux bin %io_memAxi_wd_valid, %129, %offset : i8
    %131 = comb.and bin %io_memAxi_wd_valid, %io_memAxi_wd_bits_last : i1
    %132 = comb.and bin %64, %131 : i1
    %133 = comb.xor %132, %true : i1
    %134 = comb.and %133, %wdReady : i1
    %135 = comb.mux bin %46, %54, %134 : i1
    %136 = comb.icmp bin eq %state, %c-1_i2 : i2
    %137 = comb.and bin %rdValid, %io_memAxi_rd_ready : i1
    %138 = comb.add %offset, %c1_i8 {sv.namehint = "_offset_T_2"} : i8
    %139 = comb.and bin %136, %137 : i1
    %140 = comb.mux bin %139, %138, %offset : i8
    %141 = comb.mux bin %64, %130, %140 : i8
    %142 = comb.mux bin %46, %c0_i8, %141 : i8
    %143 = comb.xor bin %137, %true : i1
    %144 = comb.xor %136, %true : i1
    %145 = comb.or %64, %144 : i1
    %146 = comb.mux bin %145, %rdValid, %143 : i1
    %147 = comb.mux bin %46, %63, %146 : i1
    %148 = comb.and bin %136, %137, %45 : i1
    %149 = comb.mux %64, %131, %148 : i1
    %150 = comb.mux bin %149, %c0_i2, %state : i2
    %151 = comb.mux bin %46, %56, %150 : i2
    hw.output %waReady, %wdReady, %raReady, %rdValid, %44, %45 : i1, i1, i1, i1, i64, i1
  }
  hw.module private @SimMMIO(in %clock : !seq.clock, in %reset : i1, out io_mmioAxi_wa_ready : i1, in %io_mmioAxi_wa_valid : i1, in %io_mmioAxi_wa_bits_addr : i32, out io_mmioAxi_wd_ready : i1, in %io_mmioAxi_wd_valid : i1, in %io_mmioAxi_wd_bits_data : i64, in %io_mmioAxi_wd_bits_strb : i8, in %io_mmioAxi_wd_bits_last : i1, out io_mmioAxi_ra_ready : i1, in %io_mmioAxi_ra_valid : i1, in %io_mmioAxi_ra_bits_addr : i32, in %io_mmioAxi_rd_ready : i1, out io_mmioAxi_rd_valid : i1, out io_mmioAxi_rd_bits_data : i64, out io_mmioAxi_rd_bits_last : i1, out io_uart_valid : i1, out io_uart_ch : i8) attributes {emit.fragments = [@PRINTF_COND_FRAGMENT]} {
    %c1_i8 = hw.constant 1 : i8
    %c203431937_i32 = hw.constant 203431937 : i32
    %c-1610132735_i32 = hw.constant -1610132735 : i32
    %c-1610612737_i32 = hw.constant -1610612737 : i32
    %c0_i58 = hw.constant 0 : i58
    %c805306367_i32 = hw.constant 805306367 : i32
    %c0_i2 = hw.constant 0 : i2
    %c201326591_i32 = hw.constant 201326591 : i32
    %c0_i129 = hw.constant 0 : i129
    %c268435464_i32 = hw.constant 268435464 : i32
    %c0_i4 = hw.constant 0 : i4
    %c1_i26 = hw.constant 1 : i26
    %c2_i26 = hw.constant 2 : i26
    %c3_i26 = hw.constant 3 : i26
    %c4_i26 = hw.constant 4 : i26
    %c5_i26 = hw.constant 5 : i26
    %c6_i26 = hw.constant 6 : i26
    %c7_i26 = hw.constant 7 : i26
    %c20_i64 = hw.constant 20 : i64
    %c-2147483646_i32 = hw.constant -2147483646 : i32
    %true = hw.constant true
    %c1140850688_i32 = hw.constant 1140850688 : i32
    %c201338880_i32 = hw.constant 201338880 : i32
    %c-1593835444_i32 = hw.constant -1593835444 : i32
    %c26214700_i64 = hw.constant 26214700 : i64
    %c32_i8 = hw.constant 32 : i8
    %c0_i32 = hw.constant 0 : i32
    %c0_i8 = hw.constant 0 : i8
    %c2_i3 = hw.constant 2 : i3
    %c-1593835260_i32 = hw.constant -1593835260 : i32
    %c-1593834504_i32 = hw.constant -1593834504 : i32
    %c1073741824_i32 = hw.constant 1073741824 : i32
    %c33554432_i32 = hw.constant 33554432 : i32
    %c-1593835424_i32 = hw.constant -1593835424 : i32
    %c1000000_i64 = hw.constant 1000000 : i64
    %c-1593835448_i32 = hw.constant -1593835448 : i32
    %c-1593835264_i32 = hw.constant -1593835264 : i32
    %c33570816_i32 = hw.constant 33570816 : i32
    %c33603576_i32 = hw.constant 33603576 : i32
    %c3_i3 = hw.constant 3 : i3
    %c1_i3 = hw.constant 1 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c-1_i3 = hw.constant -1 : i3
    %c0_i3 = hw.constant 0 : i3
    %c0_i64 = hw.constant 0 : i64
    %false = hw.constant false
    %c0_i127 = hw.constant 0 : i127
    %0 = seq.from_clock %clock
    %uart_0 = seq.firreg %138 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 0 : ui64} : i8
    %uart_1 = seq.firreg %141 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 8 : ui64} : i8
    %uart_2 = seq.firreg %144 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 16 : ui64} : i8
    %uart_3 = seq.firreg %147 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 24 : ui64} : i8
    %uart_4 = seq.firreg %150 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 32 : ui64} : i8
    %uart_5 = seq.firreg %153 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 40 : ui64} : i8
    %uart_6 = seq.firreg %156 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 48 : ui64} : i8
    %uart_7 = seq.firreg %159 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 56 : ui64} : i8
    %mtime = seq.firreg %9 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 64 : ui64} : i64
    %mtimecmp = seq.firreg %173 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 128 : ui64} : i64
    %disk = seq.firmem 0, 1, undefined, port_order {prefix = ""} : <67108864 x 8>
    seq.firmem.write_port %disk[%217] = %16, clock %clock enable %218 : <67108864 x 8>
    seq.firmem.write_port %disk[%220] = %13, clock %clock enable %221 : <67108864 x 8>
    seq.firmem.write_port %disk[%196] = %34, clock %clock enable %200 : <67108864 x 8>
    seq.firmem.write_port %disk[%202] = %31, clock %clock enable %203 : <67108864 x 8>
    seq.firmem.write_port %disk[%205] = %28, clock %clock enable %206 : <67108864 x 8>
    seq.firmem.write_port %disk[%208] = %25, clock %clock enable %209 : <67108864 x 8>
    seq.firmem.write_port %disk[%211] = %22, clock %clock enable %212 : <67108864 x 8>
    seq.firmem.write_port %disk[%214] = %19, clock %clock enable %215 : <67108864 x 8>
    %1 = seq.firmem.read_port %disk[%38], clock %clock : <67108864 x 8>
    %2 = seq.firmem.read_port %disk[%40], clock %clock : <67108864 x 8>
    %3 = seq.firmem.read_port %disk[%42], clock %clock : <67108864 x 8>
    %4 = seq.firmem.read_port %disk[%44], clock %clock : <67108864 x 8>
    %5 = seq.firmem.read_port %disk[%46], clock %clock : <67108864 x 8>
    %6 = seq.firmem.read_port %disk[%48], clock %clock : <67108864 x 8>
    %7 = seq.firmem.read_port %disk[%50], clock %clock : <67108864 x 8>
    %8 = seq.firmem.read_port %disk[%51], clock %clock : <67108864 x 8>
    %waready = seq.firreg %59 clock %clock reset sync %reset, %false {firrtl.random_init_start = 256 : ui64, sv.namehint = "waready"} : i1
    %wdready = seq.firreg %229 clock %clock reset sync %reset, %false {firrtl.random_init_start = 257 : ui64, sv.namehint = "wdready"} : i1
    %waddr = seq.firreg %57 clock %clock reset sync %reset, %c0_i32 {firrtl.random_init_start = 258 : ui64} : i32
    %raready = seq.firreg %64 clock %clock reset sync %reset, %false {firrtl.random_init_start = 357 : ui64, sv.namehint = "raready"} : i1
    %rdvalid = seq.firreg %244 clock %clock reset sync %reset, %false {firrtl.random_init_start = 358 : ui64, sv.namehint = "rdvalid"} : i1
    %rdata = seq.firreg %122 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 391 : ui64, sv.namehint = "rdata"} : i64
    %offset = seq.firreg %239 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 455 : ui64} : i8
    %9 = comb.add %mtime, %c20_i64 {sv.namehint = "_mtime_T"} : i64
    %state = seq.firreg %249 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 529 : ui64} : i3
    %10 = comb.icmp bin ne %offset, %c0_i8 : i8
    %11 = comb.xor bin %10, %true {sv.namehint = "islast"} : i1
    %12 = comb.extract %io_mmioAxi_wd_bits_strb from 7 {sv.namehint = "_inputwd_T_1"} : (i8) -> i1
    %13 = comb.extract %io_mmioAxi_wd_bits_data from 56 {sv.namehint = "_inputwd_T_2"} : (i64) -> i8
    %14 = comb.mux bin %12, %13, %c0_i8 {sv.namehint = "inputwd_hi_hi_hi"} : i8
    %15 = comb.extract %io_mmioAxi_wd_bits_strb from 6 {sv.namehint = "_inputwd_T_4"} : (i8) -> i1
    %16 = comb.extract %io_mmioAxi_wd_bits_data from 48 {sv.namehint = "_inputwd_T_5"} : (i64) -> i8
    %17 = comb.mux bin %15, %16, %c0_i8 {sv.namehint = "inputwd_hi_hi_lo"} : i8
    %18 = comb.extract %io_mmioAxi_wd_bits_strb from 5 {sv.namehint = "_inputwd_T_7"} : (i8) -> i1
    %19 = comb.extract %io_mmioAxi_wd_bits_data from 40 {sv.namehint = "_inputwd_T_8"} : (i64) -> i8
    %20 = comb.mux bin %18, %19, %c0_i8 {sv.namehint = "inputwd_hi_lo_hi"} : i8
    %21 = comb.extract %io_mmioAxi_wd_bits_strb from 4 {sv.namehint = "_inputwd_T_10"} : (i8) -> i1
    %22 = comb.extract %io_mmioAxi_wd_bits_data from 32 {sv.namehint = "_inputwd_T_11"} : (i64) -> i8
    %23 = comb.mux bin %21, %22, %c0_i8 {sv.namehint = "inputwd_hi_lo_lo"} : i8
    %24 = comb.extract %io_mmioAxi_wd_bits_strb from 3 {sv.namehint = "_inputwd_T_13"} : (i8) -> i1
    %25 = comb.extract %io_mmioAxi_wd_bits_data from 24 {sv.namehint = "_inputwd_T_14"} : (i64) -> i8
    %26 = comb.mux bin %24, %25, %c0_i8 {sv.namehint = "inputwd_lo_hi_hi"} : i8
    %27 = comb.extract %io_mmioAxi_wd_bits_strb from 2 {sv.namehint = "_inputwd_T_16"} : (i8) -> i1
    %28 = comb.extract %io_mmioAxi_wd_bits_data from 16 {sv.namehint = "_inputwd_T_17"} : (i64) -> i8
    %29 = comb.mux bin %27, %28, %c0_i8 {sv.namehint = "inputwd_lo_hi_lo"} : i8
    %30 = comb.extract %io_mmioAxi_wd_bits_strb from 1 {sv.namehint = "_inputwd_T_19"} : (i8) -> i1
    %31 = comb.extract %io_mmioAxi_wd_bits_data from 8 {sv.namehint = "_inputwd_T_20"} : (i64) -> i8
    %32 = comb.mux bin %30, %31, %c0_i8 {sv.namehint = "inputwd_lo_lo_hi"} : i8
    %33 = comb.extract %io_mmioAxi_wd_bits_strb from 0 {sv.namehint = "_inputwd_T_22"} : (i8) -> i1
    %34 = comb.extract %io_mmioAxi_wd_bits_data from 0 {sv.namehint = "_inputwd_T_23"} : (i64) -> i8
    %35 = comb.mux bin %33, %34, %c0_i8 {sv.namehint = "inputwd_lo_lo_lo"} : i8
    %36 = comb.concat %14, %17, %20, %23, %26, %29, %32, %35 {sv.namehint = "inputwd"} : i8, i8, i8, i8, i8, i8, i8, i8
    %37 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %38 = comb.add %37, %c7_i26 {sv.namehint = "_disk_rdata_T"} : i26
    %39 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %40 = comb.add %39, %c6_i26 {sv.namehint = "_disk_rdata_T_4"} : i26
    %41 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %42 = comb.add %41, %c5_i26 {sv.namehint = "_disk_rdata_T_8"} : i26
    %43 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %44 = comb.add %43, %c4_i26 {sv.namehint = "_disk_rdata_T_12"} : i26
    %45 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %46 = comb.add %45, %c3_i26 {sv.namehint = "_disk_rdata_T_16"} : i26
    %47 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %48 = comb.add %47, %c2_i26 {sv.namehint = "_disk_rdata_T_20"} : i26
    %49 = comb.extract %io_mmioAxi_ra_bits_addr from 0 : (i32) -> i26
    %50 = comb.add %49, %c1_i26 {sv.namehint = "_disk_rdata_T_24"} : i26
    %51 = comb.extract %io_mmioAxi_ra_bits_addr from 0 {sv.namehint = "_disk_rdata_T_31"} : (i32) -> i26
    %52 = comb.concat %1, %2, %3, %4, %5, %6, %7, %8 {sv.namehint = "disk_rdata"} : i8, i8, i8, i8, i8, i8, i8, i8
    %53 = comb.icmp bin ne %state, %c0_i3 : i3
    %54 = comb.xor bin %53, %true : i1
    %55 = comb.and bin %io_mmioAxi_wa_valid, %waready : i1
    %56 = comb.and bin %54, %55 : i1
    %57 = comb.mux bin %56, %io_mmioAxi_wa_bits_addr, %waddr : i32
    %58 = comb.xor bin %55, %true : i1
    %59 = comb.mux bin %53, %waready, %58 : i1
    %60 = comb.mux bin %55, %c1_i3, %state : i3
    %61 = comb.and bin %io_mmioAxi_ra_valid, %raready : i1
    %62 = comb.and bin %54, %61 : i1
    %63 = comb.xor bin %61, %true : i1
    %64 = comb.mux bin %53, %raready, %63 : i1
    %65 = comb.mux bin %61, %c3_i3, %60 : i3
    %66 = comb.extract %io_mmioAxi_ra_bits_addr from 28 : (i32) -> i4
    %67 = comb.icmp bin ne %66, %c0_i4 : i4
    %68 = comb.icmp bin ult %io_mmioAxi_ra_bits_addr, %c268435464_i32 : i32
    %69 = comb.and bin %67, %68 : i1
    %70 = comb.extract %io_mmioAxi_ra_bits_addr from 0 {sv.namehint = "_rdata_T_2"} : (i32) -> i3
    %71 = comb.extract %io_mmioAxi_ra_bits_addr from 0 {sv.namehint = "_rdata_T_3"} : (i32) -> i3
    %72 = hw.array_create %uart_7, %uart_6, %uart_5, %uart_4, %uart_3, %uart_2, %uart_1, %uart_0 : i8
    %73 = hw.array_get %72[%70] : !hw.array<8xi8>, i3
    %74 = comb.concat %c0_i127, %73 : i127, i8
    %75 = comb.concat %c0_i129, %71, %c0_i3 : i129, i3, i3
    %76 = comb.shl bin %74, %75 {sv.namehint = "_rdata_T_5"} : i135
    %77 = comb.extract %76 from 0 : (i135) -> i64
    %78 = comb.xor bin %69, %true : i1
    %79 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c33603576_i32 : i32
    %80 = comb.icmp bin ne %io_mmioAxi_ra_bits_addr, %c33603576_i32 : i32
    %81 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c33570816_i32 : i32
    %82 = comb.icmp bin ne %io_mmioAxi_ra_bits_addr, %c33570816_i32 : i32
    %83 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c-1593835264_i32 : i32
    %84 = comb.icmp bin ne %io_mmioAxi_ra_bits_addr, %c-1593835264_i32 : i32
    %85 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c-1593835448_i32 : i32
    %86 = comb.modu bin %mtime, %c1000000_i64 {sv.namehint = "_rdata_T_6"} : i64
    %87 = comb.extract %86 from 0 {sv.namehint = "_rdata_T_7"} : (i64) -> i32
    %88 = comb.concat %c0_i32, %87 : i32, i32
    %89 = comb.icmp bin ne %io_mmioAxi_ra_bits_addr, %c-1593835448_i32 : i32
    %90 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c-1593835444_i32 : i32
    %91 = comb.divu bin %mtime, %c1000000_i64 {sv.namehint = "_rdata_T_8"} : i64
    %92 = comb.extract %91 from 0 {sv.namehint = "rdata_hi"} : (i64) -> i32
    %93 = comb.concat %92, %c0_i32 {sv.namehint = "_rdata_T_9"} : i32, i32
    %94 = comb.icmp bin ne %io_mmioAxi_ra_bits_addr, %c-1593835444_i32 : i32
    %95 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c-1593835424_i32 : i32
    %96 = comb.icmp bin ne %io_mmioAxi_ra_bits_addr, %c-1593835424_i32 : i32
    %97 = comb.icmp bin eq %io_mmioAxi_ra_bits_addr, %c33554432_i32 : i32
    %98 = comb.icmp bin ne %io_mmioAxi_ra_bits_addr, %c33554432_i32 : i32
    %99 = comb.icmp bin ugt %io_mmioAxi_ra_bits_addr, %c201326591_i32 : i32
    %100 = comb.icmp bin ult %io_mmioAxi_ra_bits_addr, %c201338880_i32 : i32
    %101 = comb.and bin %99, %100 : i1
    %102 = comb.xor bin %101, %true : i1
    %103 = comb.extract %io_mmioAxi_ra_bits_addr from 30 : (i32) -> i2
    %104 = comb.icmp bin ne %103, %c0_i2 : i2
    %105 = comb.icmp bin ult %io_mmioAxi_ra_bits_addr, %c1140850688_i32 : i32
    %106 = comb.and bin %104, %105 : i1
    %107 = comb.xor bin %106, %true : i1
    %108 = comb.icmp bin ugt %io_mmioAxi_ra_bits_addr, %c805306367_i32 : i32
    %109 = comb.icmp bin ult %io_mmioAxi_ra_bits_addr, %c1073741824_i32 : i32
    %110 = comb.and bin %108, %109 : i1
    %111 = comb.xor bin %110, %true : i1
    %112 = comb.mux bin %106, %52, %c0_i64 : i64
    %113 = comb.mux bin %101, %rdata, %112 : i64
    %114 = comb.or bin %95, %97 : i1
    %115 = comb.mux bin %114, %c0_i64, %113 : i64
    %116 = comb.mux bin %90, %93, %115 : i64
    %117 = comb.mux bin %85, %88, %116 : i64
    %118 = comb.mux bin %83, %c26214700_i64, %117 : i64
    %119 = comb.mux bin %81, %mtimecmp, %118 : i64
    %120 = comb.mux bin %79, %mtime, %119 : i64
    %121 = comb.mux bin %69, %77, %120 : i64
    %122 = comb.mux bin %62, %121, %rdata : i64
    %123 = comb.xor bin %reset, %true : i1
    %124 = comb.and bin %62, %78, %80, %82, %84, %89, %94, %96, %98, %102, %107, %111, %123 : i1
    %125 = comb.icmp bin eq %state, %c1_i3 : i3
    %126 = comb.and bin %53, %125, %io_mmioAxi_wd_valid : i1
    %127 = comb.extract %waddr from 28 : (i32) -> i4
    %128 = comb.icmp bin ne %127, %c0_i4 : i4
    %129 = comb.icmp bin ult %waddr, %c268435464_i32 : i32
    %130 = comb.and bin %128, %129 : i1
    %131 = comb.extract %waddr from 0 {sv.namehint = "offset_1"} : (i32) -> i3
    %132 = comb.extract %waddr from 0 : (i32) -> i3
    %133 = comb.concat %c0_i58, %131, %c0_i3 : i58, i3, i3
    %134 = comb.shru bin %36, %133 {sv.namehint = "_uart_T_1"} : i64
    %135 = comb.extract %134 from 0 {sv.namehint = "_uart_T_2"} : (i64) -> i8
    %136 = comb.icmp bin eq %132, %c0_i3 : i3
    %137 = comb.and %53, %125, %io_mmioAxi_wd_valid, %130, %136 : i1
    %138 = comb.mux bin %137, %135, %uart_0 : i8
    %139 = comb.icmp bin eq %132, %c1_i3 : i3
    %140 = comb.and %53, %125, %io_mmioAxi_wd_valid, %130, %139 : i1
    %141 = comb.mux bin %140, %135, %uart_1 : i8
    %142 = comb.icmp bin eq %132, %c2_i3 : i3
    %143 = comb.and %53, %125, %io_mmioAxi_wd_valid, %130, %142 : i1
    %144 = comb.mux bin %143, %135, %uart_2 : i8
    %145 = comb.icmp bin eq %132, %c3_i3 : i3
    %146 = comb.and %53, %125, %io_mmioAxi_wd_valid, %130, %145 : i1
    %147 = comb.mux bin %146, %135, %uart_3 : i8
    %148 = comb.icmp bin eq %132, %c-4_i3 : i3
    %149 = comb.and %53, %125, %io_mmioAxi_wd_valid, %130, %148 : i1
    %150 = comb.mux bin %149, %135, %uart_4 : i8
    %151 = comb.icmp bin eq %132, %c-3_i3 : i3
    %152 = comb.and %53, %125, %io_mmioAxi_wd_valid, %130, %151 : i1
    %153 = comb.mux bin %152, %135, %c32_i8 : i8
    %154 = comb.icmp bin eq %132, %c-2_i3 : i3
    %155 = comb.and %53, %125, %io_mmioAxi_wd_valid, %130, %154 : i1
    %156 = comb.mux bin %155, %135, %uart_6 : i8
    %157 = comb.icmp bin eq %132, %c-1_i3 : i3
    %158 = comb.and %53, %125, %io_mmioAxi_wd_valid, %130, %157 : i1
    %159 = comb.mux bin %158, %135, %uart_7 : i8
    %160 = comb.extract %waddr from 0 : (i32) -> i3
    %161 = comb.icmp bin eq %160, %c0_i3 : i3
    %162 = comb.and bin %126, %130, %161, %123 : i1
    %163 = comb.and bin %125, %io_mmioAxi_wd_valid : i1
    %164 = comb.and %53, %163, %130, %161 {sv.namehint = "io_uart_valid"} : i1
    %165 = comb.and %53, %125, %io_mmioAxi_wd_valid, %130, %161, %33 : i1
    %166 = comb.mux bin %165, %34, %c0_i8 {sv.namehint = "io_uart_ch"} : i8
    %167 = comb.xor bin %130, %true : i1
    %168 = comb.icmp bin eq %waddr, %c33570816_i32 : i32
    %169 = comb.xor %168, %true : i1
    %170 = comb.xor %163, %true : i1
    %171 = comb.xor %53, %true : i1
    %172 = comb.or %171, %170, %130, %169 : i1
    %173 = comb.mux bin %172, %mtimecmp, %36 : i64
    %174 = comb.icmp bin ne %waddr, %c33570816_i32 : i32
    %175 = comb.and bin %126, %167, %174 : i1
    %176 = comb.icmp bin eq %waddr, %c-1593834504_i32 : i32
    %177 = comb.and bin %175, %176, %123 : i1
    %178 = comb.icmp bin ne %waddr, %c-1593834504_i32 : i32
    %179 = comb.icmp bin ugt %waddr, %c-1610612737_i32 : i32
    %180 = comb.icmp bin ult %waddr, %c-1610132735_i32 : i32
    %181 = comb.and bin %179, %180 : i1
    %182 = comb.xor bin %181, %true : i1
    %183 = comb.icmp bin eq %waddr, %c-1593835264_i32 : i32
    %184 = comb.icmp bin ne %waddr, %c-1593835264_i32 : i32
    %185 = comb.icmp bin eq %waddr, %c-1593835260_i32 : i32
    %186 = comb.icmp bin ne %waddr, %c-1593835260_i32 : i32
    %187 = comb.icmp bin ugt %waddr, %c201326591_i32 : i32
    %188 = comb.icmp bin ult %waddr, %c203431937_i32 : i32
    %189 = comb.and bin %187, %188 : i1
    %190 = comb.xor bin %189, %true : i1
    %191 = comb.icmp bin eq %waddr, %c33554432_i32 : i32
    %192 = comb.icmp bin ne %waddr, %c33554432_i32 : i32
    %193 = comb.icmp bin ult %waddr, %c201338880_i32 : i32
    %194 = comb.and bin %187, %193 : i1
    %195 = comb.xor bin %194, %true : i1
    %196 = comb.extract %waddr from 0 : (i32) -> i26
    %197 = comb.or bin %130, %168, %176, %181, %183, %185, %189, %191, %194 : i1
    %198 = comb.xor %197, %true : i1
    %199 = comb.and %163, %198, %106 : i1
    %200 = comb.and %53, %199 : i1
    %201 = comb.extract %waddr from 0 : (i32) -> i26
    %202 = comb.add %201, %c1_i26 : i26
    %203 = comb.and %53, %199 : i1
    %204 = comb.extract %waddr from 0 : (i32) -> i26
    %205 = comb.add %204, %c2_i26 : i26
    %206 = comb.and %53, %199 : i1
    %207 = comb.extract %waddr from 0 : (i32) -> i26
    %208 = comb.add %207, %c3_i26 : i26
    %209 = comb.and %53, %199 : i1
    %210 = comb.extract %waddr from 0 : (i32) -> i26
    %211 = comb.add %210, %c4_i26 : i26
    %212 = comb.and %53, %199 : i1
    %213 = comb.extract %waddr from 0 : (i32) -> i26
    %214 = comb.add %213, %c5_i26 : i26
    %215 = comb.and %53, %199 : i1
    %216 = comb.extract %waddr from 0 : (i32) -> i26
    %217 = comb.add %216, %c6_i26 : i26
    %218 = comb.and %53, %199 : i1
    %219 = comb.extract %waddr from 0 : (i32) -> i26
    %220 = comb.add %219, %c7_i26 : i26
    %221 = comb.and %53, %199 : i1
    %222 = comb.and bin %175, %178, %182, %184, %186, %190, %192, %195, %107, %123 : i1
    sv.ifdef  @SYNTHESIS {
    } else {
      sv.always posedge %0 {
        %PRINTF_COND_ = sv.macro.ref.expr @PRINTF_COND_() : () -> i1
        %250 = comb.and bin %PRINTF_COND_, %124 : i1
        sv.if %250 {
          sv.fwrite %c-2147483646_i32, "mmio invalid raddr: %x\0A"(%io_mmioAxi_ra_bits_addr) : i32
        }
        %251 = comb.and bin %PRINTF_COND_, %162 : i1
        sv.if %251 {
          sv.fwrite %c-2147483646_i32, "%c"(%35) : i8
        }
        %252 = comb.and bin %PRINTF_COND_, %177 : i1
        sv.if %252 {
          sv.fwrite %c-2147483646_i32, "%c"(%35) : i8
        }
        %253 = comb.and bin %PRINTF_COND_, %222 : i1
        sv.if %253 {
          sv.fwrite %c-2147483646_i32, "mmio invalid waddr: %x\0A"(%io_mmioAxi_wa_bits_addr) : i32
        }
      }
    }
    %223 = comb.and bin %io_mmioAxi_wd_valid, %io_mmioAxi_wd_bits_last : i1
    %224 = comb.mux bin %223, %c2_i3, %state : i3
    %225 = comb.xor bin %io_mmioAxi_wd_bits_last, %true : i1
    %226 = comb.xor %io_mmioAxi_wd_valid, %true : i1
    %227 = comb.or %226, %225 : i1
    %228 = comb.and %53, %125 : i1
    %229 = comb.mux bin %228, %227, %wdready : i1
    %230 = comb.icmp bin eq %state, %c2_i3 : i3
    %231 = comb.icmp bin eq %state, %c3_i3 : i3
    %232 = comb.and bin %io_mmioAxi_rd_ready, %rdvalid : i1
    %233 = comb.add %offset, %c1_i8 {sv.namehint = "_offset_T"} : i8
    %234 = comb.and bin %231, %232 : i1
    %235 = comb.or bin %125, %230 : i1
    %236 = comb.xor %234, %true : i1
    %237 = comb.or %235, %236 : i1
    %238 = comb.mux bin %237, %offset, %233 : i8
    %239 = comb.mux bin %53, %238, %c0_i8 : i8
    %240 = comb.xor %232, %true : i1
    %241 = comb.or %240, %10 : i1
    %242 = comb.xor %231, %true : i1
    %243 = comb.or %54, %235, %242 : i1
    %244 = comb.mux bin %243, %rdvalid, %241 : i1
    %245 = comb.and bin %231, %232, %11 : i1
    %246 = comb.or bin %230, %245 : i1
    %247 = comb.mux bin %246, %c0_i3, %state : i3
    %248 = comb.mux bin %125, %224, %247 : i3
    %249 = comb.mux bin %53, %248, %65 : i3
    hw.output %waready, %wdready, %raready, %rdvalid, %rdata, %11, %164, %166 : i1, i1, i1, i1, i64, i1, i1, i8
  }
  hw.module private @SimDma(in %clock : !seq.clock, in %reset : i1, in %io_dmaAxi_awready : i1, out io_dmaAxi_awvalid : i1, in %io_dmaAxi_wready : i1, out io_dmaAxi_wvalid : i1, out io_dmaAxi_wdata : i64, out io_dmaAxi_wstrb : i8, out io_dmaAxi_bready : i1, in %io_dmaAxi_bvalid : i1, in %io_dmaAxi_arready : i1, out io_dmaAxi_arvalid : i1, out io_dmaAxi_rready : i1, in %io_dmaAxi_rvalid : i1, in %io_dmaAxi_rdata : i64, in %io_dmaAxi_rlast : i1) attributes {emit.fragments = [@PRINTF_COND_FRAGMENT]} {
    %c-2147483646_i32 = hw.constant -2147483646 : i32
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %c16_i8 = hw.constant 16 : i8
    %c-3_i3 = hw.constant -3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c1311768467139281697_i64 = hw.constant 1311768467139281697 : i64
    %c2_i3 = hw.constant 2 : i3
    %c3_i3 = hw.constant 3 : i3
    %c1_i3 = hw.constant 1 : i3
    %c0_i8 = hw.constant 0 : i8
    %true = hw.constant true
    %c0_i64 = hw.constant 0 : i64
    %0 = seq.from_clock %clock
    %state = seq.firreg %74 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 0 : ui64} : i3
    %awvalid_r = seq.firreg %30 clock %clock reset sync %reset, %false {firrtl.random_init_start = 69 : ui64, sv.namehint = "awvalid_r"} : i1
    %wvalid_r = seq.firreg %60 clock %clock reset sync %reset, %false {firrtl.random_init_start = 119 : ui64, sv.namehint = "wvalid_r"} : i1
    %wdata_r = seq.firreg %42 clock %clock reset sync %reset, %c0_i64 {firrtl.random_init_start = 120 : ui64, sv.namehint = "wdata_r"} : i64
    %wstrb_r = seq.firreg %47 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 184 : ui64, sv.namehint = "wstrb_r"} : i8
    %wlast_r = seq.firreg %65 clock %clock reset sync %reset, %false {firrtl.random_init_start = 192 : ui64, sv.namehint = "wlast_r"} : i1
    %bready_r = seq.firreg %78 clock %clock reset sync %reset, %false {firrtl.random_init_start = 193 : ui64, sv.namehint = "bready_r"} : i1
    %arvalid_r = seq.firreg %9 clock %clock reset sync %reset, %false {firrtl.random_init_start = 194 : ui64, sv.namehint = "arvalid_r"} : i1
    %rready_r = seq.firreg %23 clock %clock reset sync %reset, %false {firrtl.random_init_start = 242 : ui64, sv.namehint = "rready_r"} : i1
    %count_r = seq.firreg %52 clock %clock reset sync %reset, %c0_i3 {firrtl.random_init_start = 243 : ui64} : i3
    %1 = comb.icmp bin ne %state, %c0_i3 : i3
    %2 = comb.xor bin %1, %true : i1
    %3 = comb.icmp bin eq %state, %c1_i3 : i3
    %4 = comb.and bin %io_dmaAxi_arready, %arvalid_r : i1
    %5 = comb.and bin %3, %4 : i1
    %6 = comb.xor %5, %true : i1
    %7 = comb.xor %1, %true : i1
    %8 = comb.or %7, %6 : i1
    %9 = comb.and %8, %arvalid_r : i1
    %10 = comb.or %4, %rready_r : i1
    %11 = comb.mux bin %4, %c2_i3, %state : i3
    %12 = comb.icmp bin ne %state, %c1_i3 : i3
    %13 = comb.icmp bin eq %state, %c2_i3 : i3
    %14 = comb.and bin %io_dmaAxi_rvalid, %rready_r : i1
    %15 = comb.xor bin %reset, %true : i1
    %16 = comb.and bin %1, %12, %13, %14, %15 : i1
    sv.ifdef  @SYNTHESIS {
    } else {
      sv.always posedge %0 {
        %PRINTF_COND_ = sv.macro.ref.expr @PRINTF_COND_() : () -> i1
        %79 = comb.and bin %PRINTF_COND_, %16 : i1
        sv.if %79 {
          sv.fwrite %c-2147483646_i32, "dma rdata: %x\0A"(%io_dmaAxi_rdata) : i64
        }
      }
    }
    %17 = comb.and bin %14, %io_dmaAxi_rlast : i1
    %18 = comb.mux bin %17, %c0_i3, %state : i3
    %19 = comb.and bin %13, %17 : i1
    %20 = comb.xor %19, %true : i1
    %21 = comb.and %20, %rready_r : i1
    %22 = comb.mux bin %3, %10, %21 : i1
    %23 = comb.mux bin %1, %22, %rready_r : i1
    %24 = comb.icmp bin eq %state, %c3_i3 : i3
    %25 = comb.and bin %io_dmaAxi_awready, %awvalid_r : i1
    %26 = comb.and bin %24, %25 : i1
    %27 = comb.xor %26, %true : i1
    %28 = comb.or bin %2, %3, %13 : i1
    %29 = comb.or %28, %27 : i1
    %30 = comb.and %29, %awvalid_r : i1
    %31 = comb.mux bin %25, %c1311768467139281697_i64, %wdata_r : i64
    %32 = comb.mux bin %25, %c16_i8, %wstrb_r : i8
    %33 = comb.or %25, %wvalid_r : i1
    %34 = comb.mux bin %25, %c-4_i3, %state : i3
    %35 = comb.icmp bin eq %state, %c-4_i3 : i3
    %36 = comb.and bin %io_dmaAxi_wready, %wvalid_r : i1
    %37 = comb.extract %wdata_r from 8 : (i64) -> i56
    %38 = comb.concat %c0_i8, %37 : i8, i56
    %39 = comb.and bin %35, %36 : i1
    %40 = comb.mux bin %39, %38, %wdata_r : i64
    %41 = comb.mux bin %24, %31, %40 : i64
    %42 = comb.mux bin %28, %wdata_r, %41 : i64
    %43 = comb.extract %wstrb_r from 0 : (i8) -> i7
    %44 = comb.concat %43, %false : i7, i1
    %45 = comb.mux bin %39, %44, %wstrb_r : i8
    %46 = comb.mux bin %24, %32, %45 : i8
    %47 = comb.mux bin %28, %wstrb_r, %46 : i8
    %48 = comb.add %count_r, %c1_i3 {sv.namehint = "_count_r_T"} : i3
    %49 = comb.or bin %2, %3, %13, %24 : i1
    %50 = comb.xor %39, %true : i1
    %51 = comb.or %49, %50 : i1
    %52 = comb.mux bin %51, %count_r, %48 : i3
    %53 = comb.icmp bin eq %count_r, %c2_i3 {sv.namehint = "_wlast_r_T"} : i3
    %54 = comb.and bin %36, %wlast_r : i1
    %55 = comb.mux bin %54, %c-3_i3, %state : i3
    %56 = comb.and bin %35, %54 : i1
    %57 = comb.xor %56, %true : i1
    %58 = comb.and %57, %wvalid_r : i1
    %59 = comb.mux bin %24, %33, %58 : i1
    %60 = comb.mux bin %28, %wvalid_r, %59 : i1
    %61 = comb.xor %wlast_r, %true : i1
    %62 = comb.and %61, %53 : i1
    %63 = comb.xor %39, %true : i1
    %64 = comb.or %49, %63 : i1
    %65 = comb.mux bin %64, %wlast_r, %62 : i1
    %66 = comb.or %54, %bready_r : i1
    %67 = comb.icmp bin eq %state, %c-3_i3 : i3
    %68 = comb.and bin %67, %bready_r, %io_dmaAxi_bvalid : i1
    %69 = comb.mux bin %68, %c0_i3, %state : i3
    %70 = comb.mux bin %35, %55, %69 : i3
    %71 = comb.mux bin %24, %34, %70 : i3
    %72 = comb.mux bin %13, %18, %71 : i3
    %73 = comb.mux bin %3, %11, %72 : i3
    %74 = comb.mux bin %1, %73, %state : i3
    %75 = comb.xor %68, %true : i1
    %76 = comb.and %75, %bready_r : i1
    %77 = comb.mux bin %35, %66, %76 : i1
    %78 = comb.mux bin %49, %bready_r, %77 : i1
    hw.output %awvalid_r, %wvalid_r, %wdata_r, %wstrb_r, %bready_r, %arvalid_r, %rready_r : i1, i1, i64, i8, i1, i1, i1
  }
  hw.module private @SimCrossbar(in %clock : !seq.clock, in %reset : i1, out io_inAxi_wa_ready : i1, in %io_inAxi_wa_valid : i1, in %io_inAxi_wa_bits_addr : i32, in %io_inAxi_wa_bits_len : i8, out io_inAxi_wd_ready : i1, in %io_inAxi_wd_valid : i1, in %io_inAxi_wd_bits_data : i64, in %io_inAxi_wd_bits_strb : i8, in %io_inAxi_wd_bits_last : i1, out io_inAxi_ra_ready : i1, in %io_inAxi_ra_valid : i1, in %io_inAxi_ra_bits_addr : i32, in %io_inAxi_ra_bits_len : i8, in %io_inAxi_rd_ready : i1, out io_inAxi_rd_valid : i1, out io_inAxi_rd_bits_data : i64, out io_inAxi_rd_bits_last : i1, in %io_memAxi_wa_ready : i1, out io_memAxi_wa_valid : i1, out io_memAxi_wa_bits_addr : i32, out io_memAxi_wa_bits_len : i8, in %io_memAxi_wd_ready : i1, out io_memAxi_wd_valid : i1, out io_memAxi_wd_bits_data : i64, out io_memAxi_wd_bits_strb : i8, out io_memAxi_wd_bits_last : i1, in %io_memAxi_ra_ready : i1, out io_memAxi_ra_valid : i1, out io_memAxi_ra_bits_addr : i32, out io_memAxi_ra_bits_len : i8, out io_memAxi_rd_ready : i1, in %io_memAxi_rd_valid : i1, in %io_memAxi_rd_bits_data : i64, in %io_memAxi_rd_bits_last : i1, in %io_mmioAxi_wa_ready : i1, out io_mmioAxi_wa_valid : i1, out io_mmioAxi_wa_bits_addr : i32, in %io_mmioAxi_wd_ready : i1, out io_mmioAxi_wd_valid : i1, out io_mmioAxi_wd_bits_data : i64, out io_mmioAxi_wd_bits_strb : i8, out io_mmioAxi_wd_bits_last : i1, in %io_mmioAxi_ra_ready : i1, out io_mmioAxi_ra_valid : i1, out io_mmioAxi_ra_bits_addr : i32, out io_mmioAxi_rd_ready : i1, in %io_mmioAxi_rd_valid : i1, in %io_mmioAxi_rd_bits_data : i64, in %io_mmioAxi_rd_bits_last : i1) {
    %c-1879048192_i32 = hw.constant -1879048192 : i32
    %c-2_i2 = hw.constant -2 : i2
    %c1_i2 = hw.constant 1 : i2
    %c0_i64 = hw.constant 0 : i64
    %c0_i8 = hw.constant 0 : i8
    %c0_i32 = hw.constant 0 : i32
    %c0_i2 = hw.constant 0 : i2
    %true = hw.constant true
    %state = seq.firreg %147 clock %clock reset sync %reset, %c0_i2 {firrtl.random_init_start = 0 : ui64} : i2
    %0 = comb.icmp bin eq %state, %c0_i2 : i2
    %1 = comb.icmp bin ugt %io_inAxi_ra_bits_addr, %c-1879048192_i32 : i32
    %2 = comb.extract %io_inAxi_ra_bits_addr from 31 : (i32) -> i1
    %3 = comb.xor bin %2, %true : i1
    %4 = comb.or bin %1, %3 : i1
    %5 = comb.and bin %io_inAxi_ra_valid, %4 : i1
    %6 = comb.icmp bin ugt %io_inAxi_wa_bits_addr, %c-1879048192_i32 : i32
    %7 = comb.extract %io_inAxi_wa_bits_addr from 31 : (i32) -> i1
    %8 = comb.xor bin %7, %true : i1
    %9 = comb.or bin %6, %8 : i1
    %10 = comb.and bin %io_inAxi_wa_valid, %9 : i1
    %11 = comb.or bin %5, %10 : i1
    %12 = comb.and %11, %io_inAxi_rd_ready : i1
    %13 = comb.mux bin %11, %io_inAxi_ra_bits_addr, %c0_i32 : i32
    %14 = comb.and %11, %io_inAxi_ra_valid : i1
    %15 = comb.and %11, %io_inAxi_wd_bits_last : i1
    %16 = comb.mux bin %11, %io_inAxi_wd_bits_strb, %c0_i8 : i8
    %17 = comb.mux bin %11, %io_inAxi_wd_bits_data, %c0_i64 : i64
    %18 = comb.and %11, %io_inAxi_wd_valid : i1
    %19 = comb.mux bin %11, %io_inAxi_wa_bits_addr, %c0_i32 : i32
    %20 = comb.and %11, %io_inAxi_wa_valid : i1
    %21 = comb.or bin %io_inAxi_ra_valid, %io_inAxi_wa_valid : i1
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
    %66 = comb.icmp bin eq %state, %c1_i2 : i2
    %67 = comb.and %66, %io_inAxi_rd_ready : i1
    %68 = comb.mux bin %0, %31, %67 {sv.namehint = "io_memAxi_rd_ready"} : i1
    %69 = comb.mux bin %66, %io_inAxi_ra_bits_len, %c0_i8 : i8
    %70 = comb.mux bin %0, %34, %69 {sv.namehint = "io_memAxi_ra_bits_len"} : i8
    %71 = comb.mux bin %66, %io_inAxi_ra_bits_addr, %c0_i32 : i32
    %72 = comb.mux bin %0, %37, %71 {sv.namehint = "io_memAxi_ra_bits_addr"} : i32
    %73 = comb.and %66, %io_inAxi_ra_valid : i1
    %74 = comb.mux bin %0, %39, %73 {sv.namehint = "io_memAxi_ra_valid"} : i1
    %75 = comb.and %66, %io_inAxi_wd_bits_last : i1
    %76 = comb.mux bin %0, %44, %75 {sv.namehint = "io_memAxi_wd_bits_last"} : i1
    %77 = comb.mux bin %66, %io_inAxi_wd_bits_strb, %c0_i8 : i8
    %78 = comb.mux bin %0, %47, %77 {sv.namehint = "io_memAxi_wd_bits_strb"} : i8
    %79 = comb.mux bin %66, %io_inAxi_wd_bits_data, %c0_i64 : i64
    %80 = comb.mux bin %0, %50, %79 {sv.namehint = "io_memAxi_wd_bits_data"} : i64
    %81 = comb.and %66, %io_inAxi_wd_valid : i1
    %82 = comb.mux bin %0, %52, %81 {sv.namehint = "io_memAxi_wd_valid"} : i1
    %83 = comb.mux bin %66, %io_inAxi_wa_bits_len, %c0_i8 : i8
    %84 = comb.mux bin %0, %57, %83 {sv.namehint = "io_memAxi_wa_bits_len"} : i8
    %85 = comb.mux bin %66, %io_inAxi_wa_bits_addr, %c0_i32 : i32
    %86 = comb.mux bin %0, %60, %85 {sv.namehint = "io_memAxi_wa_bits_addr"} : i32
    %87 = comb.and %66, %io_inAxi_wa_valid : i1
    %88 = comb.mux bin %0, %62, %87 {sv.namehint = "io_memAxi_wa_valid"} : i1
    %89 = comb.and bin %io_memAxi_rd_valid, %io_memAxi_rd_bits_last : i1
    %90 = comb.and bin %82, %76 : i1
    %91 = comb.or bin %89, %90 : i1
    %92 = comb.icmp bin eq %state, %c-2_i2 : i2
    %93 = comb.and %92, %io_mmioAxi_rd_bits_last : i1
    %94 = comb.mux bin %66, %io_memAxi_rd_bits_last, %93 : i1
    %95 = comb.mux bin %0, %25, %94 {sv.namehint = "io_inAxi_rd_bits_last"} : i1
    %96 = hw.array_create %c0_i64, %io_mmioAxi_rd_bits_data, %io_memAxi_rd_bits_data, %27 : i64
    %97 = hw.array_get %96[%state] {sv.namehint = "io_inAxi_rd_bits_data"} : !hw.array<4xi64>, i2
    %98 = comb.and %92, %io_mmioAxi_rd_valid : i1
    %99 = comb.mux bin %66, %io_memAxi_rd_valid, %98 : i1
    %100 = comb.mux bin %0, %29, %99 {sv.namehint = "io_inAxi_rd_valid"} : i1
    %101 = comb.xor %66, %true : i1
    %102 = comb.and %101, %92, %io_inAxi_rd_ready : i1
    %103 = comb.mux bin %0, %12, %102 {sv.namehint = "io_mmioAxi_rd_ready"} : i1
    %104 = comb.xor %92, %true : i1
    %105 = comb.or %66, %104 : i1
    %106 = comb.mux bin %105, %c0_i32, %io_inAxi_ra_bits_addr : i32
    %107 = comb.mux bin %0, %13, %106 {sv.namehint = "io_mmioAxi_ra_bits_addr"} : i32
    %108 = comb.xor %66, %true : i1
    %109 = comb.and %108, %92, %io_inAxi_ra_valid : i1
    %110 = comb.mux bin %0, %14, %109 {sv.namehint = "io_mmioAxi_ra_valid"} : i1
    %111 = comb.and %92, %io_mmioAxi_ra_ready : i1
    %112 = comb.mux bin %66, %io_memAxi_ra_ready, %111 : i1
    %113 = comb.mux bin %0, %42, %112 {sv.namehint = "io_inAxi_ra_ready"} : i1
    %114 = comb.xor %66, %true : i1
    %115 = comb.and %114, %92, %io_inAxi_wd_bits_last : i1
    %116 = comb.mux bin %0, %15, %115 {sv.namehint = "io_mmioAxi_wd_bits_last"} : i1
    %117 = comb.xor %92, %true : i1
    %118 = comb.or %66, %117 : i1
    %119 = comb.mux bin %118, %c0_i8, %io_inAxi_wd_bits_strb : i8
    %120 = comb.mux bin %0, %16, %119 {sv.namehint = "io_mmioAxi_wd_bits_strb"} : i8
    %121 = comb.xor %92, %true : i1
    %122 = comb.or %66, %121 : i1
    %123 = comb.mux bin %122, %c0_i64, %io_inAxi_wd_bits_data : i64
    %124 = comb.mux bin %0, %17, %123 {sv.namehint = "io_mmioAxi_wd_bits_data"} : i64
    %125 = comb.xor %66, %true : i1
    %126 = comb.and %125, %92, %io_inAxi_wd_valid : i1
    %127 = comb.mux bin %0, %18, %126 {sv.namehint = "io_mmioAxi_wd_valid"} : i1
    %128 = comb.and %92, %io_mmioAxi_wd_ready : i1
    %129 = comb.mux bin %66, %io_memAxi_wd_ready, %128 : i1
    %130 = comb.mux bin %0, %54, %129 {sv.namehint = "io_inAxi_wd_ready"} : i1
    %131 = comb.xor %92, %true : i1
    %132 = comb.or %66, %131 : i1
    %133 = comb.mux bin %132, %c0_i32, %io_inAxi_wa_bits_addr : i32
    %134 = comb.mux bin %0, %19, %133 {sv.namehint = "io_mmioAxi_wa_bits_addr"} : i32
    %135 = comb.xor %66, %true : i1
    %136 = comb.and %135, %92, %io_inAxi_wa_valid : i1
    %137 = comb.mux bin %0, %20, %136 {sv.namehint = "io_mmioAxi_wa_valid"} : i1
    %138 = comb.and %92, %io_mmioAxi_wa_ready : i1
    %139 = comb.mux bin %66, %io_memAxi_wa_ready, %138 : i1
    %140 = comb.mux bin %0, %65, %139 {sv.namehint = "io_inAxi_wa_ready"} : i1
    %141 = comb.and bin %io_mmioAxi_rd_valid, %io_mmioAxi_rd_bits_last : i1
    %142 = comb.and bin %127, %116 : i1
    %143 = comb.or bin %141, %142 : i1
    %144 = comb.and bin %92, %143 : i1
    %145 = comb.mux %66, %91, %144 : i1
    %146 = comb.mux bin %145, %c0_i2, %state : i2
    %147 = comb.mux bin %0, %23, %146 : i2
    hw.output %140, %130, %113, %100, %97, %95, %88, %86, %84, %82, %80, %78, %76, %74, %72, %70, %68, %137, %134, %127, %124, %120, %116, %110, %107, %103 : i1, i1, i1, i1, i64, i1, i1, i32, i8, i1, i64, i8, i1, i1, i32, i8, i1, i1, i32, i1, i64, i8, i1, i1, i32, i1
  }
  hw.module private @TransAXI(out io_raw_axi_awready : i1, in %io_raw_axi_awvalid : i1, in %io_raw_axi_awaddr : i32, in %io_raw_axi_awlen : i8, out io_raw_axi_wready : i1, in %io_raw_axi_wvalid : i1, in %io_raw_axi_wdata : i64, in %io_raw_axi_wstrb : i8, in %io_raw_axi_wlast : i1, out io_raw_axi_arready : i1, in %io_raw_axi_arvalid : i1, in %io_raw_axi_araddr : i32, in %io_raw_axi_arlen : i8, in %io_raw_axi_rready : i1, out io_raw_axi_rvalid : i1, out io_raw_axi_rdata : i64, out io_raw_axi_rlast : i1, in %io_bun_axi_wa_ready : i1, out io_bun_axi_wa_valid : i1, out io_bun_axi_wa_bits_addr : i32, out io_bun_axi_wa_bits_len : i8, in %io_bun_axi_wd_ready : i1, out io_bun_axi_wd_valid : i1, out io_bun_axi_wd_bits_data : i64, out io_bun_axi_wd_bits_strb : i8, out io_bun_axi_wd_bits_last : i1, in %io_bun_axi_ra_ready : i1, out io_bun_axi_ra_valid : i1, out io_bun_axi_ra_bits_addr : i32, out io_bun_axi_ra_bits_len : i8, out io_bun_axi_rd_ready : i1, in %io_bun_axi_rd_valid : i1, in %io_bun_axi_rd_bits_data : i64, in %io_bun_axi_rd_bits_last : i1) {
    hw.output %io_bun_axi_wa_ready, %io_bun_axi_wd_ready, %io_bun_axi_ra_ready, %io_bun_axi_rd_valid, %io_bun_axi_rd_bits_data, %io_bun_axi_rd_bits_last, %io_raw_axi_awvalid, %io_raw_axi_awaddr, %io_raw_axi_awlen, %io_raw_axi_wvalid, %io_raw_axi_wdata, %io_raw_axi_wstrb, %io_raw_axi_wlast, %io_raw_axi_arvalid, %io_raw_axi_araddr, %io_raw_axi_arlen, %io_raw_axi_rready : i1, i1, i1, i1, i64, i1, i1, i32, i8, i1, i64, i8, i1, i1, i32, i8, i1
  }
  hw.module @newtop(in %clock : !seq.clock, in %reset : i1, in %io_initMemEn : i1, in %io_initMemAddr : i32, in %io_initMemData : i8, out io_uart_valid : i1, out io_uart_ch : i8) {
    %cpu.io_master_awvalid, %cpu.io_master_awaddr, %cpu.io_master_awlen, %cpu.io_master_wvalid, %cpu.io_master_wdata, %cpu.io_master_wstrb, %cpu.io_master_wlast, %cpu.io_master_arvalid, %cpu.io_master_araddr, %cpu.io_master_arlen, %cpu.io_master_rready, %cpu.io_slave_awready, %cpu.io_slave_wready, %cpu.io_slave_bvalid, %cpu.io_slave_arready, %cpu.io_slave_rvalid, %cpu.io_slave_rdata, %cpu.io_slave_rlast = hw.instance "cpu" @CPU(clock: %clock: !seq.clock, reset: %reset: i1, io_master_awready: %transAxi.io_raw_axi_awready: i1, io_master_wready: %transAxi.io_raw_axi_wready: i1, io_master_arready: %transAxi.io_raw_axi_arready: i1, io_master_rvalid: %transAxi.io_raw_axi_rvalid: i1, io_master_rdata: %transAxi.io_raw_axi_rdata: i64, io_master_rlast: %transAxi.io_raw_axi_rlast: i1, io_slave_awvalid: %dma.io_dmaAxi_awvalid: i1, io_slave_wvalid: %dma.io_dmaAxi_wvalid: i1, io_slave_wdata: %dma.io_dmaAxi_wdata: i64, io_slave_wstrb: %dma.io_dmaAxi_wstrb: i8, io_slave_bready: %dma.io_dmaAxi_bready: i1, io_slave_arvalid: %dma.io_dmaAxi_arvalid: i1, io_slave_rready: %dma.io_dmaAxi_rready: i1) -> (io_master_awvalid: i1, io_master_awaddr: i32, io_master_awlen: i8, io_master_wvalid: i1, io_master_wdata: i64, io_master_wstrb: i8, io_master_wlast: i1, io_master_arvalid: i1, io_master_araddr: i32, io_master_arlen: i8, io_master_rready: i1, io_slave_awready: i1, io_slave_wready: i1, io_slave_bvalid: i1, io_slave_arready: i1, io_slave_rvalid: i1, io_slave_rdata: i64, io_slave_rlast: i1) {sv.namehint = "cpu.io_slave_rlast"}
    %mem.io_memAxi_wa_ready, %mem.io_memAxi_wd_ready, %mem.io_memAxi_ra_ready, %mem.io_memAxi_rd_valid, %mem.io_memAxi_rd_bits_data, %mem.io_memAxi_rd_bits_last = hw.instance "mem" @SimMEM(clock: %clock: !seq.clock, reset: %reset: i1, io_memAxi_wa_valid: %crossBar.io_memAxi_wa_valid: i1, io_memAxi_wa_bits_addr: %crossBar.io_memAxi_wa_bits_addr: i32, io_memAxi_wa_bits_len: %crossBar.io_memAxi_wa_bits_len: i8, io_memAxi_wd_valid: %crossBar.io_memAxi_wd_valid: i1, io_memAxi_wd_bits_data: %crossBar.io_memAxi_wd_bits_data: i64, io_memAxi_wd_bits_strb: %crossBar.io_memAxi_wd_bits_strb: i8, io_memAxi_wd_bits_last: %crossBar.io_memAxi_wd_bits_last: i1, io_memAxi_ra_valid: %crossBar.io_memAxi_ra_valid: i1, io_memAxi_ra_bits_addr: %crossBar.io_memAxi_ra_bits_addr: i32, io_memAxi_ra_bits_len: %crossBar.io_memAxi_ra_bits_len: i8, io_memAxi_rd_ready: %crossBar.io_memAxi_rd_ready: i1, io_initMemEn: %io_initMemEn: i1, io_initMemAddr: %io_initMemAddr: i32, io_initMemData: %io_initMemData: i8) -> (io_memAxi_wa_ready: i1, io_memAxi_wd_ready: i1, io_memAxi_ra_ready: i1, io_memAxi_rd_valid: i1, io_memAxi_rd_bits_data: i64, io_memAxi_rd_bits_last: i1) {sv.namehint = "mem.io_memAxi_rd_valid"}
    %mmio.io_mmioAxi_wa_ready, %mmio.io_mmioAxi_wd_ready, %mmio.io_mmioAxi_ra_ready, %mmio.io_mmioAxi_rd_valid, %mmio.io_mmioAxi_rd_bits_data, %mmio.io_mmioAxi_rd_bits_last, %mmio.io_uart_valid, %mmio.io_uart_ch = hw.instance "mmio" @SimMMIO(clock: %clock: !seq.clock, reset: %reset: i1, io_mmioAxi_wa_valid: %crossBar.io_mmioAxi_wa_valid: i1, io_mmioAxi_wa_bits_addr: %crossBar.io_mmioAxi_wa_bits_addr: i32, io_mmioAxi_wd_valid: %crossBar.io_mmioAxi_wd_valid: i1, io_mmioAxi_wd_bits_data: %crossBar.io_mmioAxi_wd_bits_data: i64, io_mmioAxi_wd_bits_strb: %crossBar.io_mmioAxi_wd_bits_strb: i8, io_mmioAxi_wd_bits_last: %crossBar.io_mmioAxi_wd_bits_last: i1, io_mmioAxi_ra_valid: %crossBar.io_mmioAxi_ra_valid: i1, io_mmioAxi_ra_bits_addr: %crossBar.io_mmioAxi_ra_bits_addr: i32, io_mmioAxi_rd_ready: %crossBar.io_mmioAxi_rd_ready: i1) -> (io_mmioAxi_wa_ready: i1, io_mmioAxi_wd_ready: i1, io_mmioAxi_ra_ready: i1, io_mmioAxi_rd_valid: i1, io_mmioAxi_rd_bits_data: i64, io_mmioAxi_rd_bits_last: i1, io_uart_valid: i1, io_uart_ch: i8) {sv.namehint = "mmio.io_uart_ch"}
    %dma.io_dmaAxi_awvalid, %dma.io_dmaAxi_wvalid, %dma.io_dmaAxi_wdata, %dma.io_dmaAxi_wstrb, %dma.io_dmaAxi_bready, %dma.io_dmaAxi_arvalid, %dma.io_dmaAxi_rready = hw.instance "dma" @SimDma(clock: %clock: !seq.clock, reset: %reset: i1, io_dmaAxi_awready: %cpu.io_slave_awready: i1, io_dmaAxi_wready: %cpu.io_slave_wready: i1, io_dmaAxi_bvalid: %cpu.io_slave_bvalid: i1, io_dmaAxi_arready: %cpu.io_slave_arready: i1, io_dmaAxi_rvalid: %cpu.io_slave_rvalid: i1, io_dmaAxi_rdata: %cpu.io_slave_rdata: i64, io_dmaAxi_rlast: %cpu.io_slave_rlast: i1) -> (io_dmaAxi_awvalid: i1, io_dmaAxi_wvalid: i1, io_dmaAxi_wdata: i64, io_dmaAxi_wstrb: i8, io_dmaAxi_bready: i1, io_dmaAxi_arvalid: i1, io_dmaAxi_rready: i1) {sv.namehint = "dma.io_dmaAxi_wstrb"}
    %crossBar.io_inAxi_wa_ready, %crossBar.io_inAxi_wd_ready, %crossBar.io_inAxi_ra_ready, %crossBar.io_inAxi_rd_valid, %crossBar.io_inAxi_rd_bits_data, %crossBar.io_inAxi_rd_bits_last, %crossBar.io_memAxi_wa_valid, %crossBar.io_memAxi_wa_bits_addr, %crossBar.io_memAxi_wa_bits_len, %crossBar.io_memAxi_wd_valid, %crossBar.io_memAxi_wd_bits_data, %crossBar.io_memAxi_wd_bits_strb, %crossBar.io_memAxi_wd_bits_last, %crossBar.io_memAxi_ra_valid, %crossBar.io_memAxi_ra_bits_addr, %crossBar.io_memAxi_ra_bits_len, %crossBar.io_memAxi_rd_ready, %crossBar.io_mmioAxi_wa_valid, %crossBar.io_mmioAxi_wa_bits_addr, %crossBar.io_mmioAxi_wd_valid, %crossBar.io_mmioAxi_wd_bits_data, %crossBar.io_mmioAxi_wd_bits_strb, %crossBar.io_mmioAxi_wd_bits_last, %crossBar.io_mmioAxi_ra_valid, %crossBar.io_mmioAxi_ra_bits_addr, %crossBar.io_mmioAxi_rd_ready = hw.instance "crossBar" @SimCrossbar(clock: %clock: !seq.clock, reset: %reset: i1, io_inAxi_wa_valid: %transAxi.io_bun_axi_wa_valid: i1, io_inAxi_wa_bits_addr: %transAxi.io_bun_axi_wa_bits_addr: i32, io_inAxi_wa_bits_len: %transAxi.io_bun_axi_wa_bits_len: i8, io_inAxi_wd_valid: %transAxi.io_bun_axi_wd_valid: i1, io_inAxi_wd_bits_data: %transAxi.io_bun_axi_wd_bits_data: i64, io_inAxi_wd_bits_strb: %transAxi.io_bun_axi_wd_bits_strb: i8, io_inAxi_wd_bits_last: %transAxi.io_bun_axi_wd_bits_last: i1, io_inAxi_ra_valid: %transAxi.io_bun_axi_ra_valid: i1, io_inAxi_ra_bits_addr: %transAxi.io_bun_axi_ra_bits_addr: i32, io_inAxi_ra_bits_len: %transAxi.io_bun_axi_ra_bits_len: i8, io_inAxi_rd_ready: %transAxi.io_bun_axi_rd_ready: i1, io_memAxi_wa_ready: %mem.io_memAxi_wa_ready: i1, io_memAxi_wd_ready: %mem.io_memAxi_wd_ready: i1, io_memAxi_ra_ready: %mem.io_memAxi_ra_ready: i1, io_memAxi_rd_valid: %mem.io_memAxi_rd_valid: i1, io_memAxi_rd_bits_data: %mem.io_memAxi_rd_bits_data: i64, io_memAxi_rd_bits_last: %mem.io_memAxi_rd_bits_last: i1, io_mmioAxi_wa_ready: %mmio.io_mmioAxi_wa_ready: i1, io_mmioAxi_wd_ready: %mmio.io_mmioAxi_wd_ready: i1, io_mmioAxi_ra_ready: %mmio.io_mmioAxi_ra_ready: i1, io_mmioAxi_rd_valid: %mmio.io_mmioAxi_rd_valid: i1, io_mmioAxi_rd_bits_data: %mmio.io_mmioAxi_rd_bits_data: i64, io_mmioAxi_rd_bits_last: %mmio.io_mmioAxi_rd_bits_last: i1) -> (io_inAxi_wa_ready: i1, io_inAxi_wd_ready: i1, io_inAxi_ra_ready: i1, io_inAxi_rd_valid: i1, io_inAxi_rd_bits_data: i64, io_inAxi_rd_bits_last: i1, io_memAxi_wa_valid: i1, io_memAxi_wa_bits_addr: i32, io_memAxi_wa_bits_len: i8, io_memAxi_wd_valid: i1, io_memAxi_wd_bits_data: i64, io_memAxi_wd_bits_strb: i8, io_memAxi_wd_bits_last: i1, io_memAxi_ra_valid: i1, io_memAxi_ra_bits_addr: i32, io_memAxi_ra_bits_len: i8, io_memAxi_rd_ready: i1, io_mmioAxi_wa_valid: i1, io_mmioAxi_wa_bits_addr: i32, io_mmioAxi_wd_valid: i1, io_mmioAxi_wd_bits_data: i64, io_mmioAxi_wd_bits_strb: i8, io_mmioAxi_wd_bits_last: i1, io_mmioAxi_ra_valid: i1, io_mmioAxi_ra_bits_addr: i32, io_mmioAxi_rd_ready: i1) {sv.namehint = "crossBar.io_inAxi_rd_valid"}
    %transAxi.io_raw_axi_awready, %transAxi.io_raw_axi_wready, %transAxi.io_raw_axi_arready, %transAxi.io_raw_axi_rvalid, %transAxi.io_raw_axi_rdata, %transAxi.io_raw_axi_rlast, %transAxi.io_bun_axi_wa_valid, %transAxi.io_bun_axi_wa_bits_addr, %transAxi.io_bun_axi_wa_bits_len, %transAxi.io_bun_axi_wd_valid, %transAxi.io_bun_axi_wd_bits_data, %transAxi.io_bun_axi_wd_bits_strb, %transAxi.io_bun_axi_wd_bits_last, %transAxi.io_bun_axi_ra_valid, %transAxi.io_bun_axi_ra_bits_addr, %transAxi.io_bun_axi_ra_bits_len, %transAxi.io_bun_axi_rd_ready = hw.instance "transAxi" @TransAXI(io_raw_axi_awvalid: %cpu.io_master_awvalid: i1, io_raw_axi_awaddr: %cpu.io_master_awaddr: i32, io_raw_axi_awlen: %cpu.io_master_awlen: i8, io_raw_axi_wvalid: %cpu.io_master_wvalid: i1, io_raw_axi_wdata: %cpu.io_master_wdata: i64, io_raw_axi_wstrb: %cpu.io_master_wstrb: i8, io_raw_axi_wlast: %cpu.io_master_wlast: i1, io_raw_axi_arvalid: %cpu.io_master_arvalid: i1, io_raw_axi_araddr: %cpu.io_master_araddr: i32, io_raw_axi_arlen: %cpu.io_master_arlen: i8, io_raw_axi_rready: %cpu.io_master_rready: i1, io_bun_axi_wa_ready: %crossBar.io_inAxi_wa_ready: i1, io_bun_axi_wd_ready: %crossBar.io_inAxi_wd_ready: i1, io_bun_axi_ra_ready: %crossBar.io_inAxi_ra_ready: i1, io_bun_axi_rd_valid: %crossBar.io_inAxi_rd_valid: i1, io_bun_axi_rd_bits_data: %crossBar.io_inAxi_rd_bits_data: i64, io_bun_axi_rd_bits_last: %crossBar.io_inAxi_rd_bits_last: i1) -> (io_raw_axi_awready: i1, io_raw_axi_wready: i1, io_raw_axi_arready: i1, io_raw_axi_rvalid: i1, io_raw_axi_rdata: i64, io_raw_axi_rlast: i1, io_bun_axi_wa_valid: i1, io_bun_axi_wa_bits_addr: i32, io_bun_axi_wa_bits_len: i8, io_bun_axi_wd_valid: i1, io_bun_axi_wd_bits_data: i64, io_bun_axi_wd_bits_strb: i8, io_bun_axi_wd_bits_last: i1, io_bun_axi_ra_valid: i1, io_bun_axi_ra_bits_addr: i32, io_bun_axi_ra_bits_len: i8, io_bun_axi_rd_ready: i1) {sv.namehint = "transAxi.io_raw_axi_rlast"}
    hw.output %mmio.io_uart_valid, %mmio.io_uart_ch : i1, i8
  }
  om.class @newtop_Class(%basepath: !om.basepath) {
  }
}
