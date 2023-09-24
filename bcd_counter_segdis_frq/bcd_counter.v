`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:21 12/19/2022 
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
module bcd_counter(mclk,reset,cnt);
	input mclk,reset;
	output [3:0] cnt;
	reg [3:0] cnt;
	
	frq_div U(mclk,reset,clk);
	
	always@(posedge clk or posedge reset)begin
		if(reset)cnt<=0;
		else begin
			if(cnt==9)cnt<=0;
			else cnt<=cnt+1;
		end
	end
	
	//일의 자리수//
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
 
 
//십의 자리//
module number_10(mclk,rst,cnt);
 
	input     		mclk, rst;
	output	[2:0]	cnt;
	reg   	[2:0]	cnt;
	wire [2:0] clk_10;
	
	always @(posedge mclk or posedge rst) begin
	if (rst) cnt <= 0;
	else begin
		if (cnt == 5) cnt <= 0;
		else	     cnt <= cnt + 1;
	end
end


endmodule
