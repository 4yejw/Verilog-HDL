`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:24 12/20/2022 
// Design Name: 
// Module Name:    frq_div2 
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
module frq_div2(mclk,rst,clk);
	input mclk,rst;
	output clk;
	reg clk;
	reg [3:0]count;
	
	always@(posedge mclk or posedge rst) begin
		if(rst) begin
			count<=0;
			clk<=0;
		end
		else begin
			if(count ==9)begin
				count<=0;
				clk<=1'b1;
			end
			else begin 
				clk <=1'b0;
				count <=count+1;
			end
		end
	end
endmodule