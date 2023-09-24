`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:29 12/19/2022 
// Design Name: 
// Module Name:    frq_div 
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
module frq_div(mclk,rst,clk_div);
	input rst,mclk;
	output clk_div;
	reg[3:0]cnt;
	reg clk_div;
	
	always@(posedge mclk or negedge rst)begin
		if(!rst) begin
			cnt<=0;
			clk_div<=0;
		end
		else begin
			if(cnt ==9)begin
				cnt<=0;
				clk_div<=1'b1;
			end
			else begin 
				clk_div <=1'b0;
				cnt <=cnt+1;
			end
		end
	end
endmodule
