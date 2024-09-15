// FSM Controller Module
module FSM_Controller(input clk, input rst, output reg [1:0] state);
  always @(posedge clk or posedge rst) begin
    if (rst)
      state <= 2'b00;
    else
      state <= state + 1;  // Simple state transition
  end
endmodule
