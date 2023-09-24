`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:27 12/20/2022 
// Design Name: 
// Module Name:    bcd_counter1 
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
module bcd_counter1(mclk,rst,mode,cnt);
	input mclk,rst,mode;
	output [3:0] cnt;
	reg [3:0]cnt;
	
	
	frq_div2 U1(mclk,rst,clk);
	
	always@(posedge clk or posedge rst)begin
		if(rst)//rst 1이면 
			cnt<=0;
		else begin//rst 0일때 
			if(mode)begin//mode 1이면 
				if(cnt==0)
					cnt<=9;
				else 
					cnt<=cnt-1;
			end
			else begin //mode 0 이면 
				if(cnt==9)
					cnt<=0;
				else 
					cnt<=cnt+1;
			end
		end
	end
endmodule

