`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:04:24 12/19/2022
// Design Name:   ring_counter_frq
// Module Name:   D:/ring_counter_frq/tf_ringcounter_frq.v
// Project Name:  ring_counter_frq
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ring_counter_frq
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_ringcounter_frq;

	// Inputs
	reg mclk;
	reg rst;
	reg mode;

	// Outputs
	wire [7:0] cnt;

	// Instantiate the Unit Under Test (UUT)
	ring_counter_frq uut (
		.mclk(mclk), 
		.rst(rst), 
		.mode(mode), 
		.cnt(cnt)
	);
	
	initial begin
		mclk = 1'b0;
		forever #5 mclk=~mclk;
	end
	
	initial begin
		// Initialize Inputs
		rst = 1'b1;
		#5 rst =1'b0;
		mode = 1'b0;
		# 200 rst = 1'b1;
		#5 rst =1'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

