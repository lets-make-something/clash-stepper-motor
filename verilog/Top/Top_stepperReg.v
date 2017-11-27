// Automatically generated Verilog-2001
module Top_stepperReg(in
                     ,// clock
                     system1000
                     ,// asynchronous reset: active low
                     system1000_rstn
                     ,result);
  input [16:0] in;
  input system1000;
  input system1000_rstn;
  output [247:0] result;
  wire [239:0] regs;
  wire [239:0] result_0;
  wire [0:0] result_1;
  wire [239:0] result_2;
  wire [0:0] x;
  wire signed [63:0] x_app_arg;
  wire [7:0] x_0;
  wire signed [63:0] wild;
  wire [0:0] x_1;
  wire signed [63:0] wild_app_arg;
  wire [7:0] x_2;
  wire [6:0] x_3;
  wire [6:0] x_4;
  assign result = {8'b00000000
                  ,regs};
  
  // register begin
  reg [239:0] dout;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : Top_stepperReg_register
    if (~ system1000_rstn) begin
      dout <= ({30 {8'b00000000}});
    end else begin
      dout <= result_0;
    end
  end
  
  assign regs = dout;
  // register end
  
  reg [239:0] result_0_reg;
  always @(*) begin
    if(result_1)
      result_0_reg = result_2;
    else
      result_0_reg = regs;
  end
  assign result_0 = result_0_reg;
  
  reg [0:0] result_1_reg;
  always @(*) begin
    if(x)
      result_1_reg = 1'b1;
    else
      result_1_reg = 1'b0;
  end
  assign result_1 = result_1_reg;
  
  // replaceVec start
  wire [239:0] vecflat;
  assign vecflat = regs;
  
  reg [7:0] vec [0:30-1];
  integer i;
  always @(*) begin
    for (i=0;i<30;i=i+1) begin
      vec[30-1-i] = vecflat[i*8+:8];
    end
    vec[x_app_arg] = x_0;
  end
  
  genvar i_0;
  generate
  for (i_0=0;i_0<30;i_0=i_0+1) begin : mk_vec
    assign result_2[i_0*8+:8] = vec[(30-1)-i_0];
  end
  endgenerate
  // replaceVec end
  
  assign x = x_1;
  
  assign x_app_arg = wild;
  
  assign x_0 = x_2;
  
  assign wild = $signed(wild_app_arg);
  
  assign x_1 = in[15:15];
  
  assign wild_app_arg = $unsigned(x_3);
  
  assign x_2 = in[7:0];
  
  assign x_3 = x_4;
  
  assign x_4 = in[14:8];
endmodule
