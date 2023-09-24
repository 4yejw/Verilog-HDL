`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:45:56 12/19/2022
// Design Name:   bcd_counter
// Module Name:   D:/bcd_counter_segdis1/tf_bcd_counter1.v
// Project Name:  bcd_counter_segdis1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bcd_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_bcd_counter1;

	// Inputs
	reg mclk;
	reg rst;

	// Outputs
	wire [3:0] cnt;

	// Instantiate the Unit Under Test (UUT)
	bcd_counter uut (
		.mclk(mclk), 
		.rst(rst), 
		.cnt(cnt)
	);
	initial begin
		mclk = 1'b0;
		forever #5 mclk=~mclk;
	end
	
	initial begin
		// Initialize Inputs
	
			rst = 1'b0;
		#50 rst =1'b1;
		#10 rst = 1'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

