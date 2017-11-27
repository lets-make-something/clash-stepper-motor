// Automatically generated Verilog-2001
module Top_stepperReg_0(in
                       ,// clock
                       system1000
                       ,// asynchronous reset: active low
                       system1000_rstn
                       ,result);
  input [16:0] in;
  input system1000;
  input system1000_rstn;
  output [67:0] result;
  wire [7:0] x;
  wire [59:0] result_0;
  wire [247:0] tup;
  wire [7:0] x_0;
  wire [239:0] x_1;
  wire [239:0] y;
  assign result = {x,result_0};
  
  assign x = x_0;
  
  // map begin
  wire [239:0] vec;
  assign vec = x_1;
  
  genvar i;
  generate
  for (i=0; i < 30; i = i + 1) begin : map
    wire [7:0] map_in;
    wire [1:0] map_out;
  
    assign map_in = vec[i*8+:8];
    Top_stepperReg_specF Top_stepperReg_specF_0
  (.result (map_out)
  ,.v (map_in));
    assign result_0[i*2+:2] = map_out;
  end
  endgenerate
  // map end
  
  Top_stepperReg Top_stepperReg_tup
  (.result (tup)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.in (in));
  
  assign x_0 = tup[247:240];
  
  assign x_1 = y;
  
  assign y = tup[239:0];
endmodule
