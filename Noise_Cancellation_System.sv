// Top-level Noise Cancellation System Module
module Noise_Cancellation_System(input clk, input rst, input [15:0] in_data, 
                                 output [15:0] iir_out_data, output [15:0] lms_out_data, output [1:0] state);
  
  IIR_Filter iir(.clk(clk), .rst(rst), .in_data(in_data), .iir_out_data(iir_out_data));
  LMS_Filter lms(.clk(clk), .rst(rst), .iir_out_data(iir_out_data), .lms_out_data(lms_out_data));
  FSM_Controller fsm(.clk(clk), .rst(rst), .state(state));
  
endmodule
