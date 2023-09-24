`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:30:53 12/22/2022
// Design Name:   new_file
// Module Name:   E:/new_file/tf_.v
// Project Name:  new_file
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: new_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_;

	// Inputs
	reg mclk;
	reg rst;

	// Outputs
	wire [7:0] seg_com;
	wire [7:0] seg_data;

	// Instantiate the Unit Under Test (UUT)
	new_file uut (
		.mclk(mclk), 
		.rst(rst), 
		.seg_com(seg_com), 
		.seg_data(seg_data)
	);

	
	initial begin
		// Initialize Inputs

		rst = 0;
		#5 rst =1; 
		#5 rst =0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always #5 mclk=~mclk;
      
endmodule

