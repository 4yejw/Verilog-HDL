`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:23:23 12/19/2022
// Design Name:   frq_div
// Module Name:   D:/ring_counter_frq/tf_frq.v
// Project Name:  ring_counter_frq
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: frq_div
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_frq;

	// Inputs
	reg mclk;
	reg rst;

	// Outputs
	wire clk;

	// Instantiate the Unit Under Test (UUT)
	frq_div uut (
		.mclk(mclk), 
		.rst(rst), 
		.clk(clk)
	);
	initial begin
		mclk = 1'b0;
		forever #5 mclk=~mclk;
	end
	
	initial begin
		// Initialize Inputs

		rst = 1'b0;
		#10 rst= 1'b1;
		#10 rst= 1'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

