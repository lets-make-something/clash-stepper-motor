// Automatically generated Verilog-2001
module Top_driverOutput(stat
                       ,result);
  input [2:0] stat;
  output [3:0] result;
  reg [3:0] result_reg;
  always @(*) begin
    case(stat)
      3'b000 : result_reg = 4'b0000;
      3'b001 : result_reg = 4'b0001;
      3'b010 : result_reg = 4'b0010;
      3'b011 : result_reg = 4'b0100;
      3'b100 : result_reg = 4'b1000;
      default : result_reg = 4'b0000;
    endcase
  end
  assign result = result_reg;
endmodule
