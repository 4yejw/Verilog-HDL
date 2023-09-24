`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:19 12/19/2022 
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
module frq_div(mclk,reset,clk);
	input mclk,reset;
	output clk;
	reg clk;
	reg [3:0]count;
	
	always@(posedge mclk or posedge reset) begin
		if(reset) begin
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
