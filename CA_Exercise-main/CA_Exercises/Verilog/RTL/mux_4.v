module mux_4 
  #(
   parameter integer DATA_W = 16
    )(
      input  wire input_a,
      input  wire input_b,
      input  wire input_c,
      input  wire select_a,


    output reg   mux_out_1,
    output reg   mux_out_2,  
    output reg   mux_out_3

    );

    always@(*)begin
        if(select_a == 1'b1) begin
            mux_out_1 = input_a;
            mux_out_2 = input_b;
            mux_out_3 = input_c;

        end
        else begin
            mux_out_1 = 1'd0;
            mux_out_2 = 1'd0;
            mux_out_3 = 1'd0;

        end 
    end
endmodule