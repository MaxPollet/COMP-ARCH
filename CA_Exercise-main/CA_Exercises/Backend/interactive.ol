
package require openlane
prep -design . -ignore_mismatches -tag 230426-142045_SOLUTION1_simple_program_and_MULT1
set_odb ./runs/230426-142045_SOLUTION1_simple_program_and_MULT1/results/floorplan/cpu.odb
set_def ./runs/230426-142045_SOLUTION1_simple_program_and_MULT1/results/floorplan/cpu.def
or_gui
