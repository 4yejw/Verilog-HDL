`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:40 12/20/2022 
// Design Name: 
// Module Name:    frq_div1 
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
module frq_div1(mclk,rst,clk_div);
	input rst,mclk;
	output clk_div;
	reg[3:0]cnt;
	reg clk_div;
	
	always@(posedge mclk or posedge rst)begin
		if(rst) begin
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
