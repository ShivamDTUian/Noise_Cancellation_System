module IIR_Filter (
    input clk,
    input rst,
    input [15:0] in_data,
    output reg [15:0] out_data
);
    // Example coefficients for IIR filter
    parameter A = 16'h1A2B;
    parameter B = 16'h2B3C;
    
    reg [15:0] x, y;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            x <= 16'd0;
            y <= 16'd0;
            out_data <= 16'd0;
        end else begin
            x <= in_data;
            y <= (A * x) + (B * y);
            out_data <= y;
        end
    end
endmodule
