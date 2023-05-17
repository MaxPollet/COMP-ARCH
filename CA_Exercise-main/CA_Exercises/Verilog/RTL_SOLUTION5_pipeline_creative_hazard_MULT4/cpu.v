//Module: CPU
//Function: CPU is the top design of the RISC-V processor

//Inputs:
//	clk: main clock
//	arst_n: reset 
// enable: Starts the execution
//	addr_ext: Address for reading/writing content to Instruction Memory
//	wen_ext: Write enable for Instruction Memory
// ren_ext: Read enable for Instruction Memory
//	wdata_ext: Write word for Instruction Memory
//	addr_ext_2: Address for reading/writing content to Data Memory
//	wen_ext_2: Write enable for Data Memory
// ren_ext_2: Read enable for Data Memory
//	wdata_ext_2: Write word for Data Memory

// Outputs:
//	rdata_ext: Read data from Instruction Memory
//	rdata_ext_2: Read data from Data Memory

// mult op toevoegen 

module cpu(
		input  wire			  clk,
		input  wire         arst_n,
		input  wire         enable,
		input  wire	[63:0]  addr_ext,
		input  wire         wen_ext,
		input  wire         ren_ext,
		input  wire [31:0]  wdata_ext,
		input  wire	[63:0]  addr_ext_2,
		input  wire         wen_ext_2,
		input  wire         ren_ext_2,
		input  wire [63:0]  wdata_ext_2,
		
		output wire	[31:0]  rdata_ext,
		output wire	[63:0]  rdata_ext_2

   );

wire              zero_flag, zero_flag_EX_MEM;
wire [      63:0] branch_pc, branch_pc_EX_MEM,updated_pc,updated_pc_IF_ID, updated_pc_ID_EX, current_pc,jump_pc, jump_pc_EX_MEM, mux_3_inputC;
wire [      31:0] instruction, instruction_IF_ID,instruction_ID_EX, instruction_EX_MEM , instruction_MEM_WB;
wire [       1:0] alu_op, alu_op_ID_EX, forward_mux_1, forward_mux_2;
wire [       3:0] alu_control;
wire              reg_dst,branch, branch_ID_EX, branch_EX_MEM, mem_read, mem_read_ID_EX, mem_read_EX_MEM, mem_2_reg, mem_2_reg_ID_EX, mem_2_reg_EX_MEM, mem_2_reg_MEM_WB,
                  mem_write, mem_write_ID_EX, mem_write_EX_MEM, alu_src, alu_src_ID_EX, reg_write, reg_write_ID_EX, reg_write_EX_MEM, reg_write_MEM_WB, jump;
wire [       4:0] regfile_waddr;
wire [      63:0] regfile_wdata,mem_data, mem_data_MEM_WB, alu_out, alu_out_EX_MEM, alu_out_MEM_WB,
                  regfile_rdata_1, regfile_rdata_1_ID_EX,regfile_rdata_2, regfile_rdata_2_ID_EX,
                  alu_operand_1, alu_operand_2;

wire [      63:0] mux_2_alu_input, mux_2_alu_input_EX_MEM;

wire signed [63:0] immediate_extended, immediate_extended_ID_EX;

wire zero_flag_ID; 

immediate_extend_unit immediate_extend_u(
    .instruction         (instruction_IF_ID),
    .immediate_extended  (immediate_extended)
);

// -----------------pipeline van de instruction-----------------
reg_arst_flush #(
   .DATA_W(32)
)signal_pipe_IF_ID(
   .clk     (clk                 ),
   .arst_n  (arst_n              ),
   .din     (instruction         ),
   .en      ( enable && PCWrite),
   .dout    (instruction_IF_ID   ),
   .flush   (flush ||  Hazard_mux   )
);


reg_arst_flush #(
   .DATA_W(32)
)signal_pipe_ID_EX(
   .clk     (clk                 ),
   .arst_n  (arst_n              ),
   .din     (instruction_IF_ID   ),
   .en      (enable && PCWrite),// && Hazard_mux        ),
   .dout    (instruction_ID_EX   ),
   .flush   (flush             )
);

reg_arst_flush #(
   .DATA_W(32)
)signal_pipe_EX_MEM(
   .clk     (clk                 ),
   .arst_n  (arst_n              ),
   .din     (instruction_ID_EX   ),
   .en      (enable         ),
   .dout    (instruction_EX_MEM  ),
   .flush   (              )
);

reg_arst_flush#(
   .DATA_W(32)
)signal_pipe_MEM_WB(
   .clk     (clk                 ),
   .arst_n  (arst_n              ),
   .din     (instruction_EX_MEM  ),
   .en      (enable         ),
   .dout    (instruction_MEM_WB  ),
   .flush   ()

);

// -----------------Pipeline van control signal voor mux van ALU control-----------------
reg_arst_flush#(
   .DATA_W(1)
)signal_pipe_alu_src_ID_EX(
   .clk     (clk                 ),
   .arst_n  (arst_n              ),
   .din     (alu_src             ),
   .en      (enable              ),
   .dout    (alu_src_ID_EX       ),
   .flush   (flush               )

);


// -----------------Pipeline van immediate-----------------
reg_arst_flush #(
   .DATA_W(64)
)signal_pipe_immediate_extended_ID_EX(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (immediate_extended        ),
   .en      (enable                    ),
   .dout    (immediate_extended_ID_EX  ),
   .flush   (flush                     )

);


// -----------------Pipeline van output ALU-----------------
reg_arst_flush #(
   .DATA_W(64)
)signal_pipe_ALU_out_EX_MEM(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (alu_out                   ),
   .en      (enable                    ),
   .dout    (alu_out_EX_MEM            ),
   .flush   (                     )
);

reg_arst_flush #(
   .DATA_W(64)
)signal_pipe_ALU_out_MEM_WB(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (alu_out_EX_MEM            ),
   .en      (enable                    ),
   .dout    (alu_out_MEM_WB            ),
   .flush   ()

);

// -----------------Pipeline van zero flag output ALU-----------------
reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_zero_flag_out_EX_MEM(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (zero_flag                 ),
   .en      (enable                    ),
   .dout    (zero_flag_EX_MEM          ),
   .flush   (                     )

);


// -----------------Pipeline van control signal branch-----------------
reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_branch_ID_EX(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (branch                    ), // deze branch naar vroegere brnach unit dus niet meer doorpassen
   .en      (Write_IF_ID                   ),
   .dout    (branch_ID_EX              ),
   .flush   (                     )

);

reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_branch_EX_MEM(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (branch_ID_EX              ),
   .en      (enable                    ),
   .dout    (branch_EX_MEM             ),
   .flush   ( flush                    )

);


// -----------------Pipeline van control signal jump-----------------
reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_jump_ID_EX(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (jump                      ),
   .en      (enable                    ),
   .dout    (jump_ID_EX                ),
   .flush   (flush                     )

);

reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_jump_EX_MEM(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (jump_ID_EX                ),
   .en      (enable                    ),
   .dout    (jump_EX_MEM               ),
   .flush   (                     )

);


// -----------------Pipeline van control signal mux write back-----------------
reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_mem_2_reg_ID_EX(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (mem_2_reg                 ),
   .en      (enable                    ),
   .dout    (mem_2_reg_ID_EX           ),
   .flush   (flush                     )

);

reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_mem_2_reg_EX_MEM(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (mem_2_reg_ID_EX           ),
   .en      (enable                    ),
   .dout    (mem_2_reg_EX_MEM          ),
   .flush   (                     )

);

reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_mem_2_reg_MEM_WB(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (mem_2_reg_EX_MEM          ),
   .en      (enable                    ),
   .dout    (mem_2_reg_MEM_WB          ),
   .flush   ()

);


// -----------------Pipeline van output data memory-----------------
reg_arst_flush #(
   .DATA_W(64)
)signal_pipe_mem_data_MEM_WB(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (mem_data                  ),
   .en      (enable                    ),
   .dout    (mem_data_MEM_WB           ),
   .flush   ()

);


// -----------------Pipeline van control signal data memory-----------------
reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_mem_read_ID_EX(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (mem_read                  ),
   .en      (enable                    ),
   .dout    (mem_read_ID_EX            ),
   .flush   (flush                     )
);

reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_mem_read_EX_MEM(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (mem_read_ID_EX            ),
   .en      (enable                    ),
   .dout    (mem_read_EX_MEM           ),
   .flush   (                     )
);

reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_mem_write_ID_EX(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (mem_write                 ),
   .en      (enable                    ),
   .dout    (mem_write_ID_EX           ),
   .flush   (flush                     )
);

reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_mem_write_EX_MEM(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (mem_write_ID_EX           ),
   .en      (enable                    ),
   .dout    (mem_write_EX_MEM          ),
   .flush   (                     )
);


// -----------------Pipeline van output instruction naar register file-----------------
reg_arst_flush#(
   .DATA_W(1)
)signal_pipe_reg_write_ID_EX(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (reg_write                 ),
   .en      (enable                    ),
   .dout    (reg_write_ID_EX           ),
   .flush   (flush                     )
);

reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_reg_write_EX_MEM(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (reg_write_ID_EX           ),
   .en      (enable                    ),
   .dout    (reg_write_EX_MEM          ),
   .flush   (                     )
);

reg_arst_flush #(
   .DATA_W(1)
)signal_pipe_reg_write_MEM_WB(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (reg_write_EX_MEM          ),
   .en      (enable                    ),
   .dout    (reg_write_MEM_WB          ),
   .flush   ()
);


// -----------------Pipeline van updated pc-----------------
reg_arst_flush #(
   .DATA_W(64)
)signal_pipe_updated_pc_IF_ID(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (updated_pc                ),
   .en      (enable && Write_IF_ID     ),
   .dout    (updated_pc_IF_ID          ),
   .flush   ()
);

reg_arst_flush #(
   .DATA_W(64)
)signal_pipe_updated_pc_ID_EX(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (updated_pc_IF_ID          ),
   .en      (enable                    ),
   .dout    (updated_pc_ID_EX          ),
   .flush   (flush                     )
);

reg_arst_flush #(
   .DATA_W(64)
)signal_pipe_branch_pc_EX_MEM(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (branch_pc                 ),
   .en      (enable                    ),
   .dout    (branch_pc_EX_MEM          ),
   .flush   (                          )
);


// -----------------Pipeline van jump pc -----------------
reg_arst_flush #(
   .DATA_W(64)
)signal_pipe_jump_pc_EX_MEM(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (jump_pc                   ),
   .en      (enable                    ),
   .dout    (jump_pc_EX_MEM            ),
   .flush   (                          )
);


// -----------------Pipeline van control signal ALU op-----------------
reg_arst_flush #(
   .DATA_W(2)
)signal_pipe_alu_op_ID_EX(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (alu_op                    ),
   .en      (enable                    ),
   .dout    (alu_op_ID_EX              ),
   .flush   (flush                     )
);


// -----------------Pipeline van output 1 en 2 register file-----------------
reg_arst_flush #(
   .DATA_W(64)
)signal_pipe_regfile_rdata1_ID_EX(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (regfile_rdata_1           ),
   .en      (enable                    ),
   .dout    (regfile_rdata_1_ID_EX     ),
   .flush   (flush                     )
);

reg_arst_flush #(
   .DATA_W(64)
)signal_pipe_regfile_rdata2_ID_EX(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (regfile_rdata_2           ),
   .en      (enable                    ),
   .dout    (regfile_rdata_2_ID_EX     ),
   .flush   (flush                     )
);

/*
reg_arstn_en #(
   .DATA_W(64)
)signal_pipe_regfile_rdata2_EX_MEM(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (regfile_rdata_2_ID_EX     ),
   .en      (enable                    ),
   .dout    (regfile_rdata_2_EX_MEM    )
);
*/

reg_arst_flush #(
   .DATA_W(64)
)signal_pipe_regfile_mux_2_alu_input_EX_MEM(
   .clk     (clk                       ),
   .arst_n  (arst_n                    ),
   .din     (mux_2_alu_input     ),
   .en      (enable                    ),
   .dout    (mux_2_alu_input_EX_MEM    ), 
   .flush()
);


// ----------------- EINDE PIPELINE REGISTERS-----------------




hazard_detection_unit hazard_detection (
   .mem_read_ID_EX         (mem_read_ID_EX         ),
	.instruction_rs1_IF_ID  (instruction_IF_ID[19:15]),
   .instruction_rs2_IF_ID  (instruction_IF_ID[24:20]),
   .RegisterRD_ID_EX       (instruction_ID_EX[11:7]),	
   .opcode                 (instruction_IF_ID[6:0] ),
	.PCWrite                (PCWrite                ),
	.Write_IF_ID            (Write_IF_ID            ),
   .Hazard_mux             (Hazard_mux             ), 
   .zero_flag              (zero_flag_ID           ),
   .flush                  (flush                  )
);




pc #(
   .DATA_W(64)
) program_counter (
   .clk       (clk       ),
   .arst_n    (arst_n    ),
   .branch_pc (branch_pc ),// id_stage 
   .jump_pc   (jump_pc   ),
   .zero_flag (zero_flag_ID ),
   .branch    (branch    ),
   .jump      (jump      ),
   .current_pc(current_pc),
   .enable    (enable && PCWrite   ),
   .updated_pc(updated_pc)
);



/*
hazard_detection_unit hazard_detection (
   .mem_read_ID_EX         (mem_read_EX_MEM         ),
	.instruction_rs1_IF_ID  (instruction_IF_ID[19:15]),
   .instruction_rs2_IF_ID  (instruction_IF_ID[24:20]),
   .RegisterRD_ID_EX       (instruction_EX_MEM[11:7]),	
   .opcode                 (instruction_IF_ID[6:0] ),
	.PCWrite                (PCWrite                ),
	.Write_IF_ID            (Write_IF_ID            ),
   .Hazard_mux             (Hazard_mux             ), 
   .flush                  (flush                  )
);






pc #(
   .DATA_W(64)
) program_counter (
   .clk       (clk              ),
   .arst_n    (arst_n           ),
   .branch_pc (branch_pc_EX_MEM ),
   .jump_pc   (jump_pc_EX_MEM   ),
   .zero_flag (zero_flag_EX_MEM ),
   .branch    (branch_EX_MEM    ),
   .jump      (jump_EX_MEM      ),
   .current_pc(current_pc       ),
   .PCWrite   (PCWrite          ),
   .enable    (enable  && PCWrite        ),
   .updated_pc(updated_pc)
);

*/


sram_BW32 #(
   .ADDR_W(9 )
   //.DATA_W(32)
) instruction_memory(
   .clk      (clk           ),
   .addr     (current_pc    ),
   .wen      (1'b0          ),
   .ren      (1'b1          ),
   .wdata    (32'b0         ),
   .rdata    (instruction   ),   
   .addr_ext (addr_ext      ),
   .wen_ext  (wen_ext       ), 
   .ren_ext  (ren_ext       ),
   .wdata_ext(wdata_ext     ),
   .rdata_ext(rdata_ext     )
);

sram_BW64 #(
   .ADDR_W(10)
) data_memory(
   .clk      (clk            ),
   .addr     (alu_out_EX_MEM ),
   .wen      (mem_write_EX_MEM),
   .ren      (mem_read_EX_MEM),
   .wdata    (mux_2_alu_input_EX_MEM), // mogelijks fout was vroeger : regfile_rdata_2_EX_MEM
   .rdata    (mem_data       ),   
   .addr_ext (addr_ext_2     ),
   .wen_ext  (wen_ext_2      ),
   .ren_ext  (ren_ext_2      ),
   .wdata_ext(wdata_ext_2    ),
   .rdata_ext(rdata_ext_2    )
);




control_unit control_unit(
   .opcode   (instruction_IF_ID[6:0]),
   .alu_op   (alu_op                ),
   .reg_dst  (reg_dst               ),
   .branch   (branch                ),
   .mem_read (mem_read              ),
   .mem_2_reg(mem_2_reg             ),
   .mem_write(mem_write             ),
   .alu_src  (alu_src               ),
   .reg_write(reg_write             ),
   .jump     (jump                  )
);

register_file #(
   .DATA_W(64)
) register_file(
   .clk      (clk                      ),
   .arst_n   (arst_n                   ),
   .reg_write(reg_write_MEM_WB         ),
   .raddr_1  (instruction_IF_ID[19:15] ),
   .raddr_2  (instruction_IF_ID[24:20] ),
   .waddr    (instruction_MEM_WB[11:7] ),
   .wdata    (regfile_wdata            ),
   .rdata_1  (regfile_rdata_1          ),
   .rdata_2  (regfile_rdata_2          )
);



assign zero_flag_ID = (regfile_rdata_1 == regfile_rdata_2);


alu_control alu_ctrl(


   .func7_5       (instruction_ID_EX[31:25]),
   .func3         (instruction_ID_EX[14:12]),
   .alu_op        (alu_op_ID_EX            ),
   .alu_control   (alu_control             )
);

mux_2 #(
   .DATA_W(64)
) alu_operand_mux (
   .input_a (immediate_extended_ID_EX),
   .input_b (mux_2_alu_input         ),
   .select_a(alu_src_ID_EX           ),
   .mux_out (alu_operand_2           )
);


mux_3 #(
   .DATA_W(64)
) forward_unit_mux_3_1 (
   .input_a (regfile_rdata_1_ID_EX   ),
   .input_b (alu_out_EX_MEM          ),
   .input_c (regfile_wdata           ),
   .select_a(forward_mux_1           ),
   .mux_out (alu_operand_1           )
);



mux_3 #(
   .DATA_W(64)
) forward_unit_mux_3_2 (
   .input_a (regfile_rdata_2_ID_EX   ),
   .input_b (alu_out_EX_MEM          ),
   .input_c (regfile_wdata           ),
   .select_a(forward_mux_2           ),
   .mux_out (mux_2_alu_input         )
);








alu#(
   .DATA_W(64)
) alu(
   .alu_in_0 (alu_operand_1         ),
   .alu_in_1 (alu_operand_2         ),
   .alu_ctrl (alu_control           ),
   .alu_out  (alu_out               ),
   .zero_flag(zero_flag             ),
   .overflow (                      )
);




mux_2 #(
   .DATA_W(64)
) regfile_data_mux (
   .input_a  (mem_data_MEM_WB     ),
   .input_b  (alu_out_MEM_WB      ),
   .select_a (mem_2_reg_MEM_WB    ),
   .mux_out  (regfile_wdata       )
);

branch_unit#(
   .DATA_W(64)
)branch_unit(
   .updated_pc         (updated_pc_IF_ID        ),
   .immediate_extended (immediate_extended),
   .branch_pc          (branch_pc               ),
   .jump_pc            (jump_pc                 )
);


forward_unit forward_unit(

   .reg_write_EX_MEM    (reg_write_EX_MEM),
	.reg_write_MEM_WB    (reg_write_MEM_WB),
	.RS1                 (instruction_ID_EX[19:15]),
   .RS2                 (instruction_ID_EX[24:20]),
   .RegisterRD_EX_MEM   (instruction_EX_MEM[11:7]),
   .RegisterRD_MEM_WB   (instruction_MEM_WB[11:7]),	
	.forward_mux_1       (forward_mux_1),
	.forward_mux_2       (forward_mux_2)

);


endmodule


