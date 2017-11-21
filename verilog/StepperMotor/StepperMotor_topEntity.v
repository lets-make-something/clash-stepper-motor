// Automatically generated Verilog-2001
module StepperMotor_topEntity(input_0
                             ,input_1
                             ,// clock
                             system1000
                             ,// asynchronous reset: active low
                             system1000_rstn
                             ,output_0);
  input [0:0] input_0;
  input [0:0] input_1;
  input system1000;
  input system1000_rstn;
  output [3:0] output_0;
  StepperMotor_topEntity_0 StepperMotor_topEntity_0_inst
  (.arg (input_0)
  ,.arg_0 (input_1)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.result (output_0));
endmodule
