// Automatically generated Verilog-2001
module Top_stepperMotor(in
                       ,// clock
                       system1000
                       ,// asynchronous reset: active low
                       system1000_rstn
                       ,result);
  input [1:0] in;
  input system1000;
  input system1000_rstn;
  output [3:0] result;
  wire [3:0] app_arg;
  Top_mealy Top_mealy_app_arg
  (.result (app_arg)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.w2 (in));
  
  // register begin
  reg [3:0] dout;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_stepperMotor_register
    if (~ system1000_rstn) begin
      dout <= 4'b0000;
    end else begin
      dout <= app_arg;
    end
  end
  
  assign result = dout;
  // register end
endmodule
