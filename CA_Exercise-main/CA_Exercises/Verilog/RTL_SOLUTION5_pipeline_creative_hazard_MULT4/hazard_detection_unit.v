module hazard_detection_unit(

		input  wire        mem_read_ID_EX,
		input  wire [4:0]  instruction_rs1_IF_ID,
        input  wire [4:0]  instruction_rs2_IF_ID,
        input  wire [4:0]  RegisterRD_ID_EX,
        input wire  [6:0]  opcode,

        input wire         zero_flag,

		
		output reg	       PCWrite,
		output reg	       Write_IF_ID,
        output reg	       Hazard_mux,
        output reg	       flush

   );


    always@(*) begin
        if (mem_read_ID_EX && (RegisterRD_ID_EX == instruction_rs1_IF_ID || RegisterRD_ID_EX == instruction_rs2_IF_ID ))begin

            PCWrite         = 1'd0;
            Write_IF_ID     = 1'd0;
            Hazard_mux      = 1'd0;
            flush           = 1'd1;
            

        end

        else if (opcode == 7'b1100011 && zero_flag) begin
            PCWrite         = 1'd1;
            Write_IF_ID     = 1'd0;
            Hazard_mux      = 1'd1;
            flush           = 1'd0;
        end

        else if (opcode ==  7'b1101111)begin

            PCWrite         = 1'd1;
            Write_IF_ID     = 1'd0;
            Hazard_mux      = 1'd1;
            flush           = 1'd0;

        end
        
        else begin

            PCWrite         = 1'd1;
            Write_IF_ID     = 1'd1;
            Hazard_mux      = 1'd0;
            flush           = 1'd0;

        end
    end


endmodule