`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:50:09 12/19/2022
// Design Name:   frq_div
// Module Name:   D:/bcd_counter_segdis1/tf_frq_div1.v
// Project Name:  bcd_counter_segdis1
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

module tf_frq_div1;

	// Inputs
	reg mclk;

	// Outputs
	wire clk;
	wire [3:0] count;

	// Instantiate the Unit Under Test (UUT)
	frq_div uut (
		.mclk(mclk), 
		.clk(clk), 
		.count(count)
	);
	initial begin
		mclk = 1'b0;
		forever #5 mclk=~mclk;
	end
	
	initial begin
		// Initialize Inputs
			reset = 1'b1;
		#50 reset =1'b0;
		#10 reset = 1'b1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

