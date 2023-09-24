`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:30 12/19/2022 
// Design Name: 
// Module Name:    bcd_counter 
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
module bcd_counter(clk,rst,cnt);
	input clk,rst;
	output [3:0] cnt;
	reg [3:0] cnt;
	
	always@(posedge clk or posedge rst)begin
		if(rst)cnt<=0;
		else begin
			if(cnt==9)cnt<=0;
			else cnt<=cnt+1;
		end
	end
endmodule
