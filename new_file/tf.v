`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:53:48 12/21/2022
// Design Name:   new_file
// Module Name:   F:/new_file/tf.v
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

module tf;

	// Inputs
	reg mclk;
	reg rst;

	// Outputs
	wire [7:0] seg_com;
	wire [7:0] seg_data;
	wire [7:0] seg_data1;

	// Instantiate the Unit Under Test (UUT)
	new_file uut (
		.mclk(mclk), 
		.rst(rst), 
		.seg_com(seg_com), 
		.seg_data(seg_data), 
		.seg_data1(seg_data1)
	);
initial begin 
	mclk = 0;
	forever #5 mclk=~mclk;
end
	initial begin
		// Initialize Inputs
		
		rst = 0;
		#5 rst =1;
		#10 rst =0;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

