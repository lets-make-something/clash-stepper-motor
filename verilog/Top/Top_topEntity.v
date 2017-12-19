/* AUTOMATICALLY GENERATED VERILOG-2001 SOURCE CODE.
** GENERATED BY CLASH 0.99. DO NOT MODIFY.
*/
module Top_topEntity
    ( // Inputs
      input \#arg_0  // clock
    , input \#arg_1  // asynchronous reset: active high
    , input \#arg_2_0 
    , input \#arg_2_1 

      // Outputs
    , output wire result_0
    , output wire [3:0] result_1_0
    , output wire [3:0] result_1_1
    , output wire [3:0] result_1_2
    , output wire [3:0] result_1_3
    , output wire [3:0] result_1_4
    , output wire [3:0] result_1_5
    , output wire [3:0] result_1_6
    , output wire [3:0] result_1_7
    , output wire [3:0] result_1_8
    , output wire [3:0] result_1_9
    , output wire [3:0] result_1_10
    , output wire [3:0] result_1_11
    , output wire [3:0] result_1_12
    , output wire [3:0] result_1_13
    , output wire [3:0] result_1_14
    , output wire [3:0] result_1_15
    , output wire [3:0] result_1_16
    , output wire [3:0] result_1_17
    , output wire [3:0] result_1_18
    , output wire [3:0] result_1_19
    );
  wire [0:0] x;
  wire [0:0] y;
  wire [39:0] regs;
  wire [16:0] ds;
  wire [7:0] d1;
  wire [6:0] c1;
  wire [0:0] b1;
  wire [0:0] a1;
  wire [18:0] tup;
  wire [7:0] x_0;
  wire [6:0] x_1;
  wire [0:0] x_2;
  wire [0:0] x_3;
  wire [0:0] x_4;
  wire [0:0] x_5;
  wire [16:0] ds_0;
  wire [7:0] d1_0;
  wire [6:0] c1_0;
  wire [0:0] b1_0;
  wire [0:0] a1_0;
  wire [47:0] tup_0;
  wire [7:0] x_6;
  wire [39:0] y_0;
  wire [66:0] result_2;
  wire [0:0] sda_out;
  wire [79:0] \#app_arg ;
  wire [1:0] \#arg ;
  wire [1:0] \#arg_2 ;
  wire [1:0] tup_fun_arg;
  wire [16:0] tup_fun_arg_0;
  wire [1:0] tup_0_fun_arg;
  wire [16:0] tup_0_fun_arg_0;
  wire [39:0] \#vec ;
  wire [80:0] result;
  wire [79:0] result_1;

  assign \#arg  = {\#arg_0 ,\#arg_1 };

  assign \#arg_2  = {\#arg_2_0 ,\#arg_2_1 };

  assign x = \#arg_2 [1:1];

  assign y = \#arg_2 [0:0];

  assign regs = result_2[39:0];

  assign ds = {x,y,7'b0000000,x_6};

  assign d1 = ds[7:0];

  assign c1 = ds[14:8];

  assign b1 = ds[15:15];

  assign a1 = ds[16:16];

  assign tup_fun_arg = {\#arg [1:1],\#arg [0:0]};

  assign tup_fun_arg_0 = {a1,b1,c1,d1};

  I2CSlave_i2cSlave I2CSlave_i2cSlave_tup
  (.\#case_alt  (tup)
  ,.\$d(%,%)  (tup_fun_arg)
  ,.eta2 (tup_fun_arg_0));

  assign x_0 = tup[7:0];

  assign x_1 = tup[14:8];

  assign x_2 = tup[15:15];

  assign x_3 = tup[16:16];

  assign x_4 = tup[17:17];

  assign x_5 = tup[18:18];

  assign ds_0 = {x_3,x_2,x_1,x_0};

  assign d1_0 = ds_0[7:0];

  assign c1_0 = ds_0[14:8];

  assign b1_0 = ds_0[15:15];

  assign a1_0 = ds_0[16:16];

  assign tup_0_fun_arg = {\#arg [1:1]
                         ,\#arg [0:0]};

  assign tup_0_fun_arg_0 = {a1_0,b1_0,c1_0,d1_0};

  Top_stepperReg_0 Top_stepperReg_0_tup_0
  (.result (tup_0)
  ,.\$d(%,%)  (tup_0_fun_arg)
  ,.eta2 (tup_0_fun_arg_0));

  assign x_6 = tup_0[47:40];

  assign y_0 = tup_0[39:0];

  assign result_2 = {x_5
                    ,x_4
                    ,x_3
                    ,x_2
                    ,x_1
                    ,x_0
                    ,x_6
                    ,y_0};

  assign sda_out = result_2[66:66];

  assign \#vec  = (regs);

  // map begin
  genvar i;
  generate
  for (i=0; i < 20; i = i + 1) begin : map
    wire [1:0] map_in;
    wire [3:0] map_out;

    assign map_in = \#vec [i*2+:2];
    StepperMotor_stepperMotor StepperMotor_stepperMotor_0
  (.result (map_out)
  ,.\$d(%,%)  ({\#arg [1:1],\#arg [0:0]})
  ,.\in'  (map_in));
    assign \#app_arg [i*4+:4] = map_out;
  end
  endgenerate
  // map end

  assign result = {sda_out,\#app_arg };

  assign result_0 = result[80:80];

  assign result_1 = result[79:0];

  assign result_1_0 = result_1[79:76];

  assign result_1_1 = result_1[75:72];

  assign result_1_2 = result_1[71:68];

  assign result_1_3 = result_1[67:64];

  assign result_1_4 = result_1[63:60];

  assign result_1_5 = result_1[59:56];

  assign result_1_6 = result_1[55:52];

  assign result_1_7 = result_1[51:48];

  assign result_1_8 = result_1[47:44];

  assign result_1_9 = result_1[43:40];

  assign result_1_10 = result_1[39:36];

  assign result_1_11 = result_1[35:32];

  assign result_1_12 = result_1[31:28];

  assign result_1_13 = result_1[27:24];

  assign result_1_14 = result_1[23:20];

  assign result_1_15 = result_1[19:16];

  assign result_1_16 = result_1[15:12];

  assign result_1_17 = result_1[11:8];

  assign result_1_18 = result_1[7:4];

  assign result_1_19 = result_1[3:0];
endmodule

