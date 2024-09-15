// IIR Filter Module
module IIR_Filter(input clk, input rst, input [15:0] in_data, output reg [15:0] iir_out_data);
  always @(posedge clk or posedge rst) begin
    if (rst) 
      iir_out_data <= 16'b0;
    else
      iir_out_data <= in_data ^ 16'h56BC;  
  end
endmodule
