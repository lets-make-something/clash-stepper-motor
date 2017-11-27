// Automatically generated Verilog-2001
module Top_top(in
              ,// clock
              system1000
              ,// asynchronous reset: active low
              system1000_rstn
              ,result);
  input [1:0] in;
  input system1000;
  input system1000_rstn;
  output [120:0] result;
  wire [0:0] x;
  wire [119:0] vs;
  wire [18:0] w;
  wire [0:0] x_0;
  wire [16:0] result_0;
  wire [59:0] result_1;
  wire [0:0] x_1;
  wire [0:0] x_2;
  wire [7:0] x_3;
  wire [59:0] x_4;
  wire [67:0] tup;
  wire [16:0] result_2;
  wire [0:0] x_5;
  wire [0:0] y;
  wire [7:0] x_6;
  wire [59:0] y_0;
  wire [0:0] x_7;
  wire [0:0] x_8;
  wire [6:0] x_9;
  wire [7:0] x_10;
  wire [0:0] x_11;
  wire [0:0] x_12;
  wire [6:0] x_13;
  wire [7:0] x_14;
  assign result = {x,vs};
  
  assign x = x_0;
  
  // map begin
  wire [59:0] vec;
  assign vec = result_1;
  
  genvar i;
  generate
  for (i=0; i < 30; i = i + 1) begin : map
    wire [1:0] map_in;
    wire [3:0] map_out;
  
    assign map_in = vec[i*2+:2];
    Top_stepperMotor Top_stepperMotor_0
  (.result (map_out)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.in (map_in));
    assign vs[i*4+:4] = map_out;
  end
  endgenerate
  // map end
  
  Top_i2cSlave Top_i2cSlave_w
  (.result (w)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.in (result_0));
  
  assign x_0 = w[18:18];
  
  assign result_0 = {x_1
                    ,x_2
                    ,7'b0000000
                    ,x_3};
  
  assign result_1 = x_4;
  
  assign x_1 = x_5;
  
  assign x_2 = y;
  
  assign x_3 = x_6;
  
  assign x_4 = y_0;
  
  Top_stepperReg_0 Top_stepperReg_0_tup
  (.result (tup)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.in (result_2));
  
  assign result_2 = {x_7
                    ,x_8
                    ,x_9
                    ,x_10};
  
  assign x_5 = in[1:1];
  
  assign y = in[0:0];
  
  assign x_6 = tup[67:60];
  
  assign y_0 = tup[59:0];
  
  assign x_7 = x_11;
  
  assign x_8 = x_12;
  
  assign x_9 = x_13;
  
  assign x_10 = x_14;
  
  assign x_11 = w[16:16];
  
  assign x_12 = w[15:15];
  
  assign x_13 = w[14:8];
  
  assign x_14 = w[7:0];
endmodule
