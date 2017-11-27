// Automatically generated Verilog-2001
module Top_mealy(w2
                ,// clock
                system1000
                ,// asynchronous reset: active low
                system1000_rstn
                ,result);
  input [1:0] w2;
  input system1000;
  input system1000_rstn;
  output [3:0] result;
  wire [3:0] y;
  wire [6:0] result_0;
  wire [6:0] result_1;
  wire [3:0] tup_app_arg;
  wire [2:0] n;
  wire [0:0] dir;
  wire [0:0] en;
  wire [2:0] x;
  wire [2:0] x_app_arg;
  wire [2:0] x_0;
  assign result = y;
  
  assign y = result_0[3:0];
  
  assign result_0 = result_1;
  
  assign result_1 = {n
                    ,tup_app_arg};
  
  Top_driverOutput Top_driverOutput_tup_app_arg
  (.result (tup_app_arg)
  ,.stat (n));
  
  Top_next Top_next_n
  (.result (n)
  ,.dir (dir)
  ,.en (en)
  ,.state (x));
  
  assign dir = w2[1:1];
  
  assign en = w2[0:0];
  
  // register begin
  reg [2:0] dout;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_mealy_register
    if (~ system1000_rstn) begin
      dout <= 3'b000;
    end else begin
      dout <= x_app_arg;
    end
  end
  
  assign x = dout;
  // register end
  
  assign x_app_arg = x_0;
  
  assign x_0 = result_0[6:4];
endmodule
