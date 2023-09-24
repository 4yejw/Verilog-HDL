`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:51:40 12/19/2022 
// Design Name: 
// Module Name:    ring_counter_frq 
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
module ring_counter_frq(mclk,rst,mode,cnt);
	input mclk,rst,mode;
	output [7:0] cnt;
	reg [7:0]cnt;
	
	frq_div1 U0(mclk,rst,clk);
	
	always@(posedge clk or posedge rst)begin
		if(rst)//rst 1이면 
			cnt<=1;
		else begin//rst 0일때 
			if(mode)begin//mode 1이면 
				if((cnt==0)||(cnt==1)) 
					cnt<=8'b1000_0000;
				else 
					cnt<=cnt>>1;
			end
			else begin //mode 0 이면 
				if((cnt==0)||(cnt==128))
					cnt<=8'b0000_0001;
				else 
					cnt<=cnt<<1;
			end
		end
	end
endmodule