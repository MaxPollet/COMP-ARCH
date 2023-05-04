module forward_unit(

		input  wire        reg_write_EX_MEM,
		input  wire        reg_write_MEM_WB,
		input  wire [4:0]  RS1,
        input  wire [4:0]  RS2,
        input  wire [4:0]  RegisterRD_EX_MEM,
        input  wire [4:0]  RegisterRD_MEM_WB,
		
		output reg	[1:0]  forward_mux_1,
		output reg	[1:0]  forward_mux_2

   );


    always@(*) begin
        if((RegisterRD_EX_MEM != 16'd0) && reg_write_EX_MEM && (RegisterRD_EX_MEM == RS1)) begin
            forward_mux_1 = 2'b10;
        end
        if((RegisterRD_MEM_WB != 16'd0) && reg_write_MEM_WB && (RegisterRD_EX_MEM == RS1) && !(reg_write_EX_MEM && (RegisterRD_EX_MEM != 16'd0) && (RegisterRD_EX_MEM == RS1))) begin
            forward_mux_1 = 2'b01;
        end

        else begin
            forward_mux_1 = 2'b00;
        end  
        if((RegisterRD_EX_MEM != 16'd0) && reg_write_EX_MEM && (RegisterRD_EX_MEM == RS2)) begin
            forward_mux_2 = 2'b10;
        end
        if((RegisterRD_MEM_WB != 16'd0) && reg_write_MEM_WB && (RegisterRD_EX_MEM == RS2) && !(reg_write_EX_MEM && (RegisterRD_EX_MEM != 16'd0) && (RegisterRD_EX_MEM == RS2))) begin
            forward_mux_2 = 2'b01;
        end
        else begin
            forward_mux_2 = 2'b00;

        end
    end




endmodule