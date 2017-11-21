// Automatically generated Verilog-2001
module StepperMotor_stepperMotor(dir
                                ,en
                                ,// clock
                                system1000
                                ,// asynchronous reset: active low
                                system1000_rstn
                                ,result);
  input [0:0] dir;
  input [0:0] en;
  input system1000;
  input system1000_rstn;
  output [3:0] result;
  wire [2:0] state_app_arg;
  wire [2:0] state;
  wire [3:0] result_0;
  StepperMotor_next StepperMotor_next_state_app_arg
  (.result (state_app_arg)
  ,.dir (dir)
  ,.en (en)
  ,.state (state));
  
  // register begin
  reg [2:0] dout;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : StepperMotor_stepperMotor_register
    if (~ system1000_rstn) begin
      dout <= 3'b000;
    end else begin
      dout <= state_app_arg;
    end
  end
  
  assign state = dout;
  // register end
  
  StepperMotor_driverOutput StepperMotor_driverOutput_result_0
  (.result (result_0)
  ,.stat (state));
  
  // register begin
  reg [3:0] dout_0;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : StepperMotor_stepperMotor_register_0
    if (~ system1000_rstn) begin
      dout_0 <= 4'b0000;
    end else begin
      dout_0 <= result_0;
    end
  end
  
  assign result = dout_0;
  // register end
endmodule
