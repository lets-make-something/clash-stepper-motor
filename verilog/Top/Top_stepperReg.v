/* AUTOMATICALLY GENERATED VERILOG-2001 SOURCE CODE.
** GENERATED BY CLASH 0.99. DO NOT MODIFY.
*/
module Top_stepperReg
    ( // Inputs
      input [1:0] \$d(%,%) 
    , input [16:0] eta2

      // Outputs
    , output wire [247:0] result
    );
  reg [239:0] regs;
  reg [239:0] result_0;
  wire [239:0] result_1;
  reg [0:0] result_2;
  wire signed [63:0] wild;
  wire signed [63:0] \#wild_app_arg ;
  wire [7:0] x;
  wire [0:0] x_0;
  wire [6:0] x_1;

  // register begin
  always @(posedge \$d(%,%) [1:1] or posedge \$d(%,%) [0:0]) begin : Top_stepperReg_register
    if (\$d(%,%) [0:0]) begin
      regs <= ({30 {8'b00000000}});
    end else begin
      regs <= result_0;
    end
  end
  // register end

  always @(*) begin
    if(result_2)
      result_0 = result_1;
    else
      result_0 = regs;
  end

  // replaceVec start
  reg [7:0] vec [0:30-1];
  integer i;
  always @(*) begin
    for (i=0;i<30;i=i+1) begin
      vec[30-1-i] = regs[i*8+:8];
    end
    vec[(wild)] = x;
  end

  genvar i_0;
  generate
  for (i_0=0;i_0<30;i_0=i_0+1) begin : mk_vec
    assign result_1[i_0*8+:8] = vec[(30-1)-i_0];
  end
  endgenerate
  // replaceVec end

  always @(*) begin
    if(x_0)
      result_2 = 1'b1;
    else
      result_2 = 1'b0;
  end

  assign wild = $signed(\#wild_app_arg );

  assign \#wild_app_arg  = $unsigned(x_1);

  assign x = eta2[7:0];

  assign x_0 = eta2[15:15];

  assign x_1 = eta2[14:8];

  assign result = {8'b00000000,regs};
endmodule

