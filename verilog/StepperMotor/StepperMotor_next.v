// Automatically generated Verilog-2001
module StepperMotor_next(dir
                        ,en
                        ,state
                        ,result);
  input [0:0] dir;
  input [0:0] en;
  input [2:0] state;
  output [2:0] result;
  wire [2:0] case_alt;
  wire [2:0] case_alt_0;
  wire [2:0] case_alt_1;
  wire [2:0] case_alt_2;
  wire [2:0] case_alt_3;
  wire [2:0] case_alt_4;
  wire [2:0] case_alt_5;
  wire [2:0] case_alt_6;
  reg [2:0] result_reg;
  always @(*) begin
    case(state)
      3'b000 : result_reg = case_alt_4;
      3'b001 : result_reg = case_alt_2;
      3'b010 : result_reg = case_alt_1;
      3'b011 : result_reg = case_alt_0;
      3'b100 : result_reg = case_alt;
      default : result_reg = 3'b000;
    endcase
  end
  assign result = result_reg;
  
  reg [2:0] case_alt_reg;
  always @(*) begin
    if(dir)
      case_alt_reg = case_alt_4;
    else
      case_alt_reg = case_alt_3;
  end
  assign case_alt = case_alt_reg;
  
  reg [2:0] case_alt_0_reg;
  always @(*) begin
    if(dir)
      case_alt_0_reg = case_alt_6;
    else
      case_alt_0_reg = case_alt_5;
  end
  assign case_alt_0 = case_alt_0_reg;
  
  reg [2:0] case_alt_1_reg;
  always @(*) begin
    if(dir)
      case_alt_1_reg = case_alt_3;
    else
      case_alt_1_reg = case_alt_4;
  end
  assign case_alt_1 = case_alt_1_reg;
  
  reg [2:0] case_alt_2_reg;
  always @(*) begin
    if(dir)
      case_alt_2_reg = case_alt_5;
    else
      case_alt_2_reg = case_alt_6;
  end
  assign case_alt_2 = case_alt_2_reg;
  
  reg [2:0] case_alt_3_reg;
  always @(*) begin
    if(en)
      case_alt_3_reg = 3'b011;
    else
      case_alt_3_reg = 3'b000;
  end
  assign case_alt_3 = case_alt_3_reg;
  
  reg [2:0] case_alt_4_reg;
  always @(*) begin
    if(en)
      case_alt_4_reg = 3'b001;
    else
      case_alt_4_reg = 3'b000;
  end
  assign case_alt_4 = case_alt_4_reg;
  
  reg [2:0] case_alt_5_reg;
  always @(*) begin
    if(en)
      case_alt_5_reg = 3'b010;
    else
      case_alt_5_reg = 3'b000;
  end
  assign case_alt_5 = case_alt_5_reg;
  
  reg [2:0] case_alt_6_reg;
  always @(*) begin
    if(en)
      case_alt_6_reg = 3'b100;
    else
      case_alt_6_reg = 3'b000;
  end
  assign case_alt_6 = case_alt_6_reg;
endmodule
