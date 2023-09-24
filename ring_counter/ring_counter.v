`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:06 12/20/2022 
// Design Name: 
// Module Name:    ring_counter 
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
module ring_counter(clk,rst,cnt);
	input clk,rst;
	output[7:0]cnt;
	reg[7:0]cnt;
	
	always@(posedge clk or posedge rst)begin
		if(rst)
			cnt<=1;
		else begin
			if((cnt==0)||(cnt==128))
				cnt<=1;
			else 
				cnt<=cnt<<1;
		end
	end
endmodule