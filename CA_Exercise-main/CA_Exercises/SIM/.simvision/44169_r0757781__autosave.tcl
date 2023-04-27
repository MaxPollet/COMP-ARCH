
# NC-Sim Command File
# TOOL:	ncsim(64)	15.20-s058
#

set tcl_prompt1 {puts -nonewline "ncsim> "}
set tcl_prompt2 {puts -nonewline "> "}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 1
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 1
set tcl_all64 false
set tcl_runerror_exit false
set assert_report_incompletes 0
set show_force 1
set force_reset_by_reinvoke 0
set tcl_relaxed_literal 0
set probe_exclude_patterns {}
set probe_packed_limit 4k
set probe_unpacked_limit 16k
set assert_internal_msg no
set svseed 1
set assert_reporting_mode 0
alias . run
alias iprof profile
alias quit exit
database -open -vcd -into vcd_dump.vcd _vcd_dump.vcd1 -timescale fs
database -open -evcd -into vcd_dump.vcd _vcd_dump.vcd -timescale fs
database -open -shm -into waves.shm waves -default
probe -create -database waves cpu_tb.dut.instruction cpu_tb.dut.alu_operand_mux.input_a cpu_tb.dut.alu_operand_mux.input_b cpu_tb.dut.alu_operand_mux.mux_out cpu_tb.dut.immediate_extended
probe -create -database waves cpu_tb.dut.instruction_IF_ID cpu_tb.dut.instruction_ID_EX cpu_tb.dut.instruction_EX_MEM cpu_tb.dut.instruction_MEM_WB
probe -create -database waves cpu_tb.dut.alu_src
probe -create -database waves cpu_tb.dut.regfile_rdata_1 cpu_tb.dut.regfile_rdata_2 cpu_tb.dut.alu.alu_in_0 cpu_tb.dut.alu.alu_in_1
probe -create -database waves cpu_tb.dut.alu.alu_out
probe -create -database waves cpu_tb.dut.alu.alu_ctrl

simvision -input /users/students/r0757781/Documents/COMP-ARCH/CA_Exercise-main/CA_Exercises/SIM/.simvision/44169_r0757781__autosave.tcl.svcf