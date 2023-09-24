`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:49:11 12/21/2022 
// Design Name: 
// Module Name:    frq_div_10 
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
module frq_div_10(mclk,rst,clk);
	input rst,mclk;
	output clk;
	reg[3:0]cnt;
	reg clk;
	
	always@(posedge mclk or posedge rst)begin
		if(rst) begin
			cnt<=0;
			clk<=0;
		end
		else begin
			if(cnt ==9)begin
				cnt<=0;
				clk<=1'b1;
			end
			else begin 
				clk <=1'b0;
				cnt <=cnt+1;
			end
		end
	end
endmodule