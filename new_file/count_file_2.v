`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:47:22 12/21/2022 
// Design Name: 
// Module Name:    count_file_2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module count_file_2(mclk,rst,cnt1);
 
	input     		mclk, rst;
	output	[2:0]	cnt1;
	reg   	[2:0]	cnt1;
	
	frq_div_10 U1(mclk,rst,clk);
	
	always @(posedge clk or posedge rst) begin
	if (rst) cnt1 <= 0;
	else begin
		if (cnt1 == 5) cnt1 <= 0;
		else	     cnt1 <= cnt1 + 1;
	end
end
endmodule
