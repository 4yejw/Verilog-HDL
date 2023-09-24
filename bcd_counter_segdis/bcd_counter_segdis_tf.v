`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:41:25 12/19/2022
// Design Name:   bcd_counter_segdis
// Module Name:   D:/bcd_counter_segdis/bcd_counter_segdis_tf.v
// Project Name:  bcd_counter_segdis
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bcd_counter_segdis
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bcd_counter_segdis_tf;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [7:0] seg_com;
	wire [7:0] seg_data;

	// Instantiate the Unit Under Test (UUT)
	bcd_counter_segdis uut (
		.clk(clk), 
		.rst(rst), 
		.seg_com(seg_com), 
		.seg_data(seg_data)
	);
   initial begin
		clk=1'b0;
		forever #10 clk=~clk;
	end
	
	
	initial begin
		// Initialize Inputs
		
		rst = 1'b0;
		#10 rst =1'b1;
		#10 rst=1'b0;
		#50 rst = 1'b1;
		#10 rst = 1'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

