// Testbench
module testbench;
  reg clk, rst;
  reg [15:0] in_data; // 16-bit input
  wire [15:0] iir_out_data, lms_out_data; // 16-bit output
  wire [1:0] state;

  // Instantiate the Noise Cancellation System
  Noise_Cancellation_System ncs(
    .clk(clk),
    .rst(rst),
    .in_data(in_data),
    .iir_out_data(iir_out_data),
    .lms_out_data(lms_out_data),
    .state(state)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Clock with a period of 10 time units
  end

  // Simulation stimulus
  initial begin
    $dumpfile("dump.vcd");       // Dump to VCD file
    $dumpvars(0, testbench);     // Dump all variables from the testbench module
    rst = 1;
    in_data = 16'h1234;          // Initial input data
    #10 rst = 0;                 // Reset de-asserted
    #100 in_data = 16'h5678;     // Change input data
    #100 in_data = 16'h9ABC;     // Another change in input data
    #100 $finish;                // End of simulation
  end

  // Monitor output
  initial begin
    $monitor("Time = %0t | in_data = %h | iir_out_data = %h | lms_out_data = %h | state = %b", 
              $time, in_data, iir_out_data, lms_out_data, state);
  end
endmodule
