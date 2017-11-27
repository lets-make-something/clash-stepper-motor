// Automatically generated Verilog-2001
module Top_i2cSlave(in
                   ,// clock
                   system1000
                   ,// asynchronous reset: active low
                   system1000_rstn
                   ,result);
  input [16:0] in;
  input system1000;
  input system1000_rstn;
  output [18:0] result;
  wire [0:0] app_arg;
  wire [0:0] app_arg_0;
  wire [7:0] dat;
  wire [0:0] adr_enb;
  wire [0:0] wr;
  wire [6:0] adr;
  wire [0:0] result_0;
  wire [0:0] result_1;
  wire [7:0] result_2;
  wire [0:0] result_3;
  wire [0:0] result_4;
  wire [6:0] result_5;
  wire [0:0] start;
  wire [0:0] ack;
  wire [0:0] tx_out;
  wire [0:0] result_6;
  wire [7:0] result_7;
  wire [0:0] result_8;
  wire [0:0] result_9;
  wire [6:0] result_10;
  wire [0:0] result_11;
  wire [0:0] result_12;
  wire [0:0] result_13;
  wire [6:0] x;
  wire [7:0] shiftReg2;
  wire [0:0] rx_data;
  wire [0:0] result_14;
  wire [0:0] result_15;
  wire [7:0] result_16;
  wire [0:0] result_17;
  wire [0:0] result_18;
  wire [0:0] result_19;
  wire [0:0] x_0;
  wire [0:0] x_1;
  wire [0:0] x_2;
  wire [0:0] x_3;
  wire [0:0] x_4;
  wire [0:0] strobe;
  wire [0:0] p_scl_in;
  wire [0:0] x_5;
  wire [0:0] x_6;
  wire [7:0] result_20;
  wire [4:0] cnt;
  wire [0:0] result_21;
  wire [0:0] result_22;
  wire [0:0] x_7;
  wire [0:0] result_23;
  wire [0:0] result_24;
  wire [0:0] result_25;
  wire [0:0] x_app_arg;
  wire [0:0] result_26;
  wire [0:0] result_27;
  wire [7:0] x_8;
  wire [4:0] result_28;
  wire [0:0] x_9;
  wire [0:0] x_10;
  wire [0:0] x_11;
  wire [0:0] x_12;
  wire [0:0] x_13;
  wire [7:0] tx_data;
  wire [7:0] x_case_alt;
  wire [7:0] x_case_alt_0;
  wire [0:0] result_29;
  wire [0:0] result_30;
  wire [0:0] result_31;
  wire [0:0] x_app_arg_0;
  wire [0:0] result_32;
  wire [7:0] result_33;
  wire [7:0] x_app_arg_1;
  wire [4:0] result_34;
  wire [0:0] x_14;
  wire [0:0] x_15;
  wire [0:0] x_16;
  wire [6:0] x_17;
  wire [4:0] x_18;
  wire [0:0] result_35;
  wire [0:0] result_36;
  wire [0:0] x_app_arg_2;
  wire [0:0] result_37;
  wire [7:0] result_38;
  wire [0:0] x_19;
  wire [0:0] x_20;
  wire [0:0] x_21;
  wire [0:0] result_39;
  wire [0:0] x_app_arg_3;
  wire [0:0] result_40;
  wire [0:0] x_22;
  wire [0:0] x_23;
  wire [0:0] x_24;
  wire [7:0] x_25;
  wire [0:0] result_41;
  wire [0:0] x_app_arg_4;
  wire [0:0] result_42;
  wire [0:0] x_26;
  wire [0:0] x_27;
  wire [0:0] result_43;
  wire [0:0] x_app_arg_5;
  wire [0:0] result_44;
  wire [0:0] x_28;
  wire [0:0] result_45;
  wire [0:0] x_app_arg_6;
  wire [0:0] result_46;
  wire [0:0] x_29;
  wire [0:0] result_47;
  wire [0:0] x_app_arg_7;
  assign result = {app_arg
                  ,adr_enb
                  ,app_arg_0
                  ,wr
                  ,adr
                  ,dat};
  
  // register begin
  reg [0:0] dout;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register
    if (~ system1000_rstn) begin
      dout <= 1'b1;
    end else begin
      dout <= result_0;
    end
  end
  
  assign app_arg = dout;
  // register end
  
  // register begin
  reg [0:0] dout_0;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_0
    if (~ system1000_rstn) begin
      dout_0 <= 1'b0;
    end else begin
      dout_0 <= result_1;
    end
  end
  
  assign app_arg_0 = dout_0;
  // register end
  
  // register begin
  reg [7:0] dout_1;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_1
    if (~ system1000_rstn) begin
      dout_1 <= 8'b00000000;
    end else begin
      dout_1 <= result_2;
    end
  end
  
  assign dat = dout_1;
  // register end
  
  // register begin
  reg [0:0] dout_2;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_2
    if (~ system1000_rstn) begin
      dout_2 <= 1'b0;
    end else begin
      dout_2 <= result_3;
    end
  end
  
  assign adr_enb = dout_2;
  // register end
  
  // register begin
  reg [0:0] dout_3;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_3
    if (~ system1000_rstn) begin
      dout_3 <= 1'b0;
    end else begin
      dout_3 <= result_4;
    end
  end
  
  assign wr = dout_3;
  // register end
  
  // register begin
  reg [6:0] dout_4;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_4
    if (~ system1000_rstn) begin
      dout_4 <= 7'b0000000;
    end else begin
      dout_4 <= result_5;
    end
  end
  
  assign adr = dout_4;
  // register end
  
  assign result_0 = ack & tx_out;
  
  reg [0:0] result_1_reg;
  always @(*) begin
    if(start)
      result_1_reg = 1'b0;
    else
      result_1_reg = result_6;
  end
  assign result_1 = result_1_reg;
  
  reg [7:0] result_2_reg;
  always @(*) begin
    if(start)
      result_2_reg = 8'b00000000;
    else
      result_2_reg = result_7;
  end
  assign result_2 = result_2_reg;
  
  reg [0:0] result_3_reg;
  always @(*) begin
    if(start)
      result_3_reg = 1'b0;
    else
      result_3_reg = result_8;
  end
  assign result_3 = result_3_reg;
  
  reg [0:0] result_4_reg;
  always @(*) begin
    if(start)
      result_4_reg = 1'b0;
    else
      result_4_reg = result_9;
  end
  assign result_4 = result_4_reg;
  
  reg [6:0] result_5_reg;
  always @(*) begin
    if(start)
      result_5_reg = 7'b0000000;
    else
      result_5_reg = result_10;
  end
  assign result_5 = result_5_reg;
  
  // register begin
  reg [0:0] dout_5;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_5
    if (~ system1000_rstn) begin
      dout_5 <= 1'b0;
    end else begin
      dout_5 <= result_11;
    end
  end
  
  assign start = dout_5;
  // register end
  
  // register begin
  reg [0:0] dout_6;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_6
    if (~ system1000_rstn) begin
      dout_6 <= 1'b0;
    end else begin
      dout_6 <= result_12;
    end
  end
  
  assign ack = dout_6;
  // register end
  
  // register begin
  reg [0:0] dout_7;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_7
    if (~ system1000_rstn) begin
      dout_7 <= 1'b1;
    end else begin
      dout_7 <= result_13;
    end
  end
  
  assign tx_out = dout_7;
  // register end
  
  reg [0:0] result_6_reg;
  always @(*) begin
    if(result_45)
      result_6_reg = 1'b1;
    else
      result_6_reg = 1'b0;
  end
  assign result_6 = result_6_reg;
  
  reg [7:0] result_7_reg;
  always @(*) begin
    if(result_14)
      result_7_reg = shiftReg2;
    else
      result_7_reg = dat;
  end
  assign result_7 = result_7_reg;
  
  reg [0:0] result_8_reg;
  always @(*) begin
    if(result_23)
      result_8_reg = 1'b1;
    else
      result_8_reg = 1'b0;
  end
  assign result_8 = result_8_reg;
  
  reg [0:0] result_9_reg;
  always @(*) begin
    if(result_23)
      result_9_reg = rx_data;
    else
      result_9_reg = wr;
  end
  assign result_9 = result_9_reg;
  
  reg [6:0] result_10_reg;
  always @(*) begin
    if(result_15)
      result_10_reg = x;
    else
      result_10_reg = adr;
  end
  assign result_10 = result_10_reg;
  
  assign result_11 = x_5 & result_17;
  
  reg [0:0] result_12_reg;
  always @(*) begin
    if(start)
      result_12_reg = 1'b0;
    else
      result_12_reg = result_18;
  end
  assign result_12 = result_12_reg;
  
  reg [0:0] result_13_reg;
  always @(*) begin
    if(start)
      result_13_reg = 1'b1;
    else
      result_13_reg = result_19;
  end
  assign result_13 = result_13_reg;
  
  // slice begin
  wire [7:0] bv;
  assign bv = shiftReg2;
  assign x = bv[6 : 0];
  // slice end
  
  // register begin
  reg [7:0] dout_8;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_8
    if (~ system1000_rstn) begin
      dout_8 <= 8'b00000000;
    end else begin
      dout_8 <= result_16;
    end
  end
  
  assign shiftReg2 = dout_8;
  // register end
  
  // register begin
  reg [0:0] dout_9;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_9
    if (~ system1000_rstn) begin
      dout_9 <= 1'b0;
    end else begin
      dout_9 <= x_7;
    end
  end
  
  assign rx_data = dout_9;
  // register end
  
  assign result_14 = x_2 & strobe;
  
  assign result_15 = x_4 & strobe;
  
  reg [7:0] result_16_reg;
  always @(*) begin
    if(start)
      result_16_reg = 8'b00000000;
    else
      result_16_reg = result_20;
  end
  assign result_16 = result_16_reg;
  
  assign result_17 = p_scl_in & result_22;
  
  reg [0:0] result_18_reg;
  always @(*) begin
    if(result_23)
      result_18_reg = 1'b1;
    else
      result_18_reg = result_24;
  end
  assign result_18 = result_18_reg;
  
  reg [0:0] result_19_reg;
  always @(*) begin
    if(result_25)
      result_19_reg = x_6;
    else
      result_19_reg = result_26;
  end
  assign result_19 = result_19_reg;
  
  assign x_0 = cnt == 5'b10000;
  
  assign x_1 = strobe & result_27;
  
  assign x_2 = cnt == 5'b01111;
  
  assign x_3 = cnt == 5'b01000;
  
  assign x_4 = cnt == 5'b00111;
  
  // register begin
  reg [0:0] dout_10;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_10
    if (~ system1000_rstn) begin
      dout_10 <= 1'b0;
    end else begin
      dout_10 <= result_21;
    end
  end
  
  assign strobe = dout_10;
  // register end
  
  // register begin
  reg [0:0] dout_11;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_11
    if (~ system1000_rstn) begin
      dout_11 <= 1'b1;
    end else begin
      dout_11 <= x_5;
    end
  end
  
  assign p_scl_in = dout_11;
  // register end
  
  assign x_5 = in[16:16];
  
  assign x_6 = x_app_arg == 1'b1;
  
  reg [7:0] result_20_reg;
  always @(*) begin
    if(strobe)
      result_20_reg = x_8;
    else
      result_20_reg = shiftReg2;
  end
  assign result_20 = result_20_reg;
  
  // register begin
  reg [4:0] dout_12;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_12
    if (~ system1000_rstn) begin
      dout_12 <= 5'b00000;
    end else begin
      dout_12 <= result_28;
    end
  end
  
  assign cnt = dout_12;
  // register end
  
  assign result_21 = x_5 & x_9;
  
  assign result_22 = x_10 & x_11;
  
  assign x_7 = in[15:15];
  
  assign result_23 = x_3 & x_1;
  
  reg [0:0] result_24_reg;
  always @(*) begin
    if(result_29)
      result_24_reg = 1'b0;
    else
      result_24_reg = result_30;
  end
  assign result_24 = result_24_reg;
  
  assign result_25 = x_12 & x_1;
  
  // indexBit begin
  wire [7:0] bv_0;
  assign bv_0 = tx_data;
  
  assign x_app_arg = bv_0[(64'sd7)];
  // indexBit end
  
  reg [0:0] result_26_reg;
  always @(*) begin
    if(result_31)
      result_26_reg = x_13;
    else
      result_26_reg = result_32;
  end
  assign result_26 = result_26_reg;
  
  assign result_27 = x_17 == adr;
  
  reg [7:0] x_8_reg;
  always @(*) begin
    if(rx_data)
      x_8_reg = x_case_alt_0;
    else
      x_8_reg = x_case_alt;
  end
  assign x_8 = x_8_reg;
  
  reg [4:0] result_28_reg;
  always @(*) begin
    if(start)
      result_28_reg = 5'b00000;
    else
      result_28_reg = result_34;
  end
  assign result_28 = result_28_reg;
  
  assign x_9 = ~ p_scl_in;
  
  assign x_10 = ~ x_7;
  
  // register begin
  reg [0:0] dout_13;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_13
    if (~ system1000_rstn) begin
      dout_13 <= 1'b1;
    end else begin
      dout_13 <= x_7;
    end
  end
  
  assign x_11 = dout_13;
  // register end
  
  assign x_12 = cnt == 5'b01010;
  
  assign x_13 = x_app_arg_0 == 1'b1;
  
  // register begin
  reg [7:0] dout_14;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_i2cSlave_register_14
    if (~ system1000_rstn) begin
      dout_14 <= 8'b00000000;
    end else begin
      dout_14 <= result_33;
    end
  end
  
  assign tx_data = dout_14;
  // register end
  
  assign x_case_alt = x_app_arg_1 | 8'b00000000;
  
  assign x_case_alt_0 = x_app_arg_1 | 8'b00000001;
  
  assign result_29 = x_14 & x_1;
  
  reg [0:0] result_30_reg;
  always @(*) begin
    if(result_45)
      result_30_reg = 1'b1;
    else
      result_30_reg = result_35;
  end
  assign result_30 = result_30_reg;
  
  assign result_31 = x_15 & x_1;
  
  // indexBit begin
  wire [7:0] bv_1;
  assign bv_1 = tx_data;
  
  assign x_app_arg_0 = bv_1[(64'sd6)];
  // indexBit end
  
  reg [0:0] result_32_reg;
  always @(*) begin
    if(result_36)
      result_32_reg = x_16;
    else
      result_32_reg = result_37;
  end
  assign result_32 = result_32_reg;
  
  reg [7:0] result_33_reg;
  always @(*) begin
    if(start)
      result_33_reg = 8'b00000000;
    else
      result_33_reg = result_38;
  end
  assign result_33 = result_33_reg;
  
  assign x_app_arg_1 = shiftReg2 << (64'sd1);
  
  reg [4:0] result_34_reg;
  always @(*) begin
    if(strobe)
      result_34_reg = x_18;
    else
      result_34_reg = cnt;
  end
  assign result_34 = result_34_reg;
  
  assign x_14 = cnt == 5'b01001;
  
  assign x_15 = cnt == 5'b01011;
  
  assign x_16 = x_app_arg_2 == 1'b1;
  
  assign x_17 = in[14:8];
  
  assign x_18 = cnt + 5'b00001;
  
  reg [0:0] result_35_reg;
  always @(*) begin
    if(result_47)
      result_35_reg = 1'b0;
    else
      result_35_reg = ack;
  end
  assign result_35 = result_35_reg;
  
  assign result_36 = x_19 & x_1;
  
  // indexBit begin
  wire [7:0] bv_2;
  assign bv_2 = tx_data;
  
  assign x_app_arg_2 = bv_2[(64'sd5)];
  // indexBit end
  
  reg [0:0] result_37_reg;
  always @(*) begin
    if(result_39)
      result_37_reg = x_20;
    else
      result_37_reg = result_40;
  end
  assign result_37 = result_37_reg;
  
  reg [7:0] result_38_reg;
  always @(*) begin
    if(x_21)
      result_38_reg = x_25;
    else
      result_38_reg = tx_data;
  end
  assign result_38 = result_38_reg;
  
  assign x_19 = cnt == 5'b01100;
  
  assign x_20 = x_app_arg_3 == 1'b1;
  
  assign x_21 = adr_enb & wr;
  
  assign result_39 = x_23 & x_1;
  
  // indexBit begin
  wire [7:0] bv_3;
  assign bv_3 = tx_data;
  
  assign x_app_arg_3 = bv_3[(64'sd4)];
  // indexBit end
  
  reg [0:0] result_40_reg;
  always @(*) begin
    if(result_41)
      result_40_reg = x_24;
    else
      result_40_reg = result_42;
  end
  assign result_40 = result_40_reg;
  
  assign x_22 = cnt == 5'b10001;
  
  assign x_23 = cnt == 5'b01101;
  
  assign x_24 = x_app_arg_4 == 1'b1;
  
  assign x_25 = in[7:0];
  
  assign result_41 = x_26 & x_1;
  
  // indexBit begin
  wire [7:0] bv_4;
  assign bv_4 = tx_data;
  
  assign x_app_arg_4 = bv_4[(64'sd3)];
  // indexBit end
  
  reg [0:0] result_42_reg;
  always @(*) begin
    if(result_43)
      result_42_reg = x_27;
    else
      result_42_reg = result_44;
  end
  assign result_42 = result_42_reg;
  
  assign x_26 = cnt == 5'b01110;
  
  assign x_27 = x_app_arg_5 == 1'b1;
  
  assign result_43 = x_2 & x_1;
  
  // indexBit begin
  wire [7:0] bv_5;
  assign bv_5 = tx_data;
  
  assign x_app_arg_5 = bv_5[(64'sd2)];
  // indexBit end
  
  reg [0:0] result_44_reg;
  always @(*) begin
    if(result_45)
      result_44_reg = x_28;
    else
      result_44_reg = result_46;
  end
  assign result_44 = result_44_reg;
  
  assign x_28 = x_app_arg_6 == 1'b1;
  
  assign result_45 = x_0 & x_1;
  
  // indexBit begin
  wire [7:0] bv_6;
  assign bv_6 = tx_data;
  
  assign x_app_arg_6 = bv_6[(64'sd1)];
  // indexBit end
  
  reg [0:0] result_46_reg;
  always @(*) begin
    if(result_47)
      result_46_reg = x_29;
    else
      result_46_reg = tx_out;
  end
  assign result_46 = result_46_reg;
  
  assign x_29 = x_app_arg_7 == 1'b1;
  
  assign result_47 = x_22 & x_1;
  
  // indexBit begin
  wire [7:0] bv_7;
  assign bv_7 = tx_data;
  
  assign x_app_arg_7 = bv_7[(64'sd0)];
  // indexBit end
endmodule
