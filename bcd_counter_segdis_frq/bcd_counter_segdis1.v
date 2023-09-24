`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:45 12/19/2022 
// Design Name: 
// Module Name:    bcd_counter_segdis1 
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
module bcd_counter_segdis1(mclk,rst,seg_com,seg_data);
	input mclk,rst;
	output [7:0] seg_com,seg_data;
	reg [7:0] seg_data;
	
	wire [3:0]cnt;
	wire [2:0]cnt1;
	
	number_1 U0(mclk,rst,cnt);
	number_10 U1(mclk,rst,cnt1);
	
	
	always@(cnt)begin
		case(cnt)
			0:seg_data=8'b0011_1111;
			1:seg_data=8'b0000_0110;
			2:seg_data=8'b0101_1011;
			3:seg_data=8'b0100_1111;
			4:seg_data=8'b0110_0110;
			5:seg_data=8'b0110_1101;
			6:seg_data=8'b0111_1101;
			7:seg_data=8'b0000_0111;
			8:seg_data=8'b0111_1111;
			9:seg_data=8'b0110_0111;
			default :seg_data=8'bx;
			endcase
		end
		
		always@(cnt1)begin
		case(cnt1)
			0:seg_data=8'b0011_1111;
			1:seg_data=8'b0000_0110;
			2:seg_data=8'b0101_1011;
			3:seg_data=8'b0100_1111;
			4:seg_data=8'b0110_0110;
			5:seg_data=8'b0110_1101;
			default :seg_data=8'bx;
			endcase
		end
		
	assign seg_com = 8'b0011_1111;
endmodule