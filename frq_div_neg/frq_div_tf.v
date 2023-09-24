`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:00:33 12/19/2022
// Design Name:   frq_div
// Module Name:   D:/frq_div/frq_div_tf.v
// Project Name:  frq_div
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

module frq_div_tf;

	// Inputs
	reg mclk;
	reg rst;

	// Outputs
	wire clk_div;

	// Instantiate the Unit Under Test (UUT)
	frq_div uut (
		.mclk(mclk), 
		.rst(rst), 
		.clk_div(clk_div)
	);
	initial begin
		mclk = 1'b0;
		forever #5 mclk=~mclk;
	end
	
	initial begin
		// Initialize Inputs
		rst = 1'b1;
		#50 rst =1'b0;
		#10 rst = 1'b1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

