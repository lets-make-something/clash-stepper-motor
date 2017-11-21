// Automatically generated Verilog-2001
module StepperMotor_topEntity_0(arg
                               ,arg_0
                               ,// clock
                               system1000
                               ,// asynchronous reset: active low
                               system1000_rstn
                               ,result);
  input [0:0] arg;
  input [0:0] arg_0;
  input system1000;
  input system1000_rstn;
  output [3:0] result;
  StepperMotor_stepperMotor StepperMotor_stepperMotor_result
  (.result (result)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.dir (arg)
  ,.en (arg_0));
endmodule
