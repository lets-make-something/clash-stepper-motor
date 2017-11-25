// Automatically generated Verilog-2001
module StepperMotor_topEntity_0(arg
                               ,// clock
                               system1000
                               ,// asynchronous reset: active low
                               system1000_rstn
                               ,result);
  input [1:0] arg;
  input system1000;
  input system1000_rstn;
  output [3:0] result;
  StepperMotor_stepperMotor StepperMotor_stepperMotor_result
  (.result (result)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.in (arg));
endmodule
