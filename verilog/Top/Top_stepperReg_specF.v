// Automatically generated Verilog-2001
module Top_stepperReg_specF(v
                           ,result);
  input [7:0] v;
  output [1:0] result;
  wire [0:0] app_arg;
  wire [0:0] app_arg_0;
  wire [0:0] app_arg_1;
  wire [0:0] app_arg_2;
  // indexBit begin
  wire [7:0] bv;
  assign bv = v;
  
  assign app_arg = bv[(64'sd1)];
  // indexBit end
  
  assign app_arg_0 = app_arg == (1'b1);
  
  // indexBit begin
  wire [7:0] bv_0;
  assign bv_0 = v;
  
  assign app_arg_1 = bv_0[(64'sd0)];
  // indexBit end
  
  assign app_arg_2 = app_arg_1 == (1'b1);
  
  assign result = {app_arg_0
                  ,app_arg_2};
endmodule
