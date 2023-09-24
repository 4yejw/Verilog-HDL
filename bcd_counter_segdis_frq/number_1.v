`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:23:08 12/21/2022 
// Design Name: 
// Module Name:    number_1 
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
module number_1(mclk,rst,cnt);
	input     		mclk, rst;
	output	[3:0]	cnt;
	reg   	[3:0]	cnt;
 
 
 
always @(posedge mclk or posedge rst) begin
	if (rst) 
		cnt <= 0;
	else begin
		if (cnt == 9) cnt <= 0;
		else	     cnt <= cnt + 1;
	end
end
 
endmodule