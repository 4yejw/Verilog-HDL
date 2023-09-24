`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:27:18 12/04/2018 
// Design Name: 
// Module Name:    top 
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
module top(mclk,rst,seg_data,seg_com,am,led,dot_col,dot_row,vfd_e, vfd_rs, vfd_rw, vfd_data);
 
 `include "rom1.v"
	input mclk, rst;
	
	output [7:0] seg_data;
	output [7:0] seg_com;
	output am;
	output [6:0] led;
	output [13:0]  dot_col;
   output [9:0]   dot_row;
	output       vfd_e;     // VFD enable 신호
   output       vfd_rs;    // VFD rs 신호 (rs=0:명령어, rs=1:데이터)
   output       vfd_rw;    // VFD r/w 신호 (r/w=0:쓰기, r/w=1:읽기)
   output [7:0] vfd_data;  // 명령어 및 문자 데이터
  
	wire clk_1, clk_10, clk_100;
	wire [3:0] cnt_sec_1, cnt_min_1, cnt_hour_1;
	wire [2:0] cnt_sec_10, cnt_min_10, cnt_hour_10;
	wire [7:0] seg_data1, seg_data2, seg_data3, seg_data4, seg_data5, seg_data6;
	wire rst_1, rst_2;
	wire [2:0]   cnt_clk_half;
   wire         vfd_rw;
  
	reg [7:0] cnt, seg_data, seg_com;
	reg [3:0] location, day;
	reg am;
	reg [6:0] led;
   reg    [13:0]  dot_col;
   reg    [9:0]   dot_row;
   reg    [3:0]   cnt_row, cnt_fra;
   reg    [7:0]   cnt_col;
   reg            clk_col, clk_fra;
	reg  [3:0]   vfd_routine;
   reg  [7:0]   vfd_data;
   reg  [2:0]   cnt_clk;
   reg  [4:0]   cnt_delay_20m;
   reg  [8:0]   cnt_delay_2sec;
   reg  [4:0]   cnt_line;
   reg  [1:0]   cnt_brightness;
   reg          vfd_e;
   reg          vfd_rs;

///////////////////////////dot martix////////////////////////////
  always @(posedge mclk or posedge rst) begin
     if (rst) begin
            dot_row <= 1;
            cnt_row <= 0;
            clk_col <= 0;
     end
     else begin
            if (cnt_row == 9 || dot_row == 512) begin
                 dot_row <= 1;
                 cnt_row <= 0;
                 clk_col <= 1;
            end
            else begin	
                 dot_row <= dot_row << 1;
                 cnt_row <= cnt_row + 1;
                 clk_col <= 0;
            end
    end
  end


always @(posedge clk_col or posedge rst) begin
         if (rst) begin
             cnt_col <= 0;
         end
         else begin
             if (cnt_col == 255) begin
                  cnt_col <= 0;
                  clk_fra <= 1;
             end
             else begin	
                  cnt_col <= cnt_col + 1;
                  clk_fra <= 0;
             end
         end
  end


always @(posedge clk_fra or posedge rst) begin
      if (rst) cnt_fra <= 0;
      else begin
          if (cnt_fra == 9) cnt_fra <= 0;
          else              cnt_fra <= cnt_fra + 1;
      end
  end
//cnt_row, cnt_fra를 주소로 하는 롬의 데이터를 dot_col로 출력
  always @(cnt_fra) begin
      case (cnt_fra)
          0 : dot_col = rom1(cnt_row);
          1 : dot_col = rom1(cnt_row);
          2 : dot_col = rom1(cnt_row);
          3 : dot_col = rom1(cnt_row);
          4 : dot_col = rom1(cnt_row);
          5 : dot_col = rom1(cnt_row);
          6 : dot_col = rom1(cnt_row);
          7 : dot_col = rom1(cnt_row);
          8 : dot_col = rom1(cnt_row);
          9 : dot_col = rom1(cnt_row);

         default : dot_col = 0;
      endcase
  end
  
  
function [13:0] rom1;
  input [3:0] addr_in;
begin
// 문자 코드를 배열형 변수에 대입
        case (addr_in)
                  0  : rom1 = 14'b00010010010001;
                  1  : rom1 = 14'b00101010001001;
                  2  : rom1 = 14'b01000111100111;
                  3  : rom1 = 14'b00101010001001;
                  4  : rom1 = 14'b00010010010101;
                  5  : rom1 = 14'b00000100000100;
                  6  : rom1 = 14'b00001010011100;
                  7  : rom1 = 14'b00010001000000;
                  8  : rom1 = 14'b00001010111110;
                  9  : rom1 = 14'b00000100001000;
             default : rom1 = 14'b00000000000000; 
        endcase
end
endfunction

///////////////////////////////rom1에 0-9 범위만 수정해라//////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////led 문자 display////////////////////////////////////////

//블록-①：그림 16.36의 FSM 상태를 parameter로 선언
   parameter delay_100ms    = 0;
   parameter function_set   = 1;
   parameter entry_mode     = 2;
   parameter disp_on        = 3;
   parameter disp_line1     = 4; 
   parameter disp_line2     = 5;
   parameter delay_2sec     = 6;
   parameter brightness_set = 7;
// VFD 라인 1과 라인 2의 시작 주소 설정
   parameter address_line1  = 8'b1000_0000;
   parameter address_line2  = 8'b1100_0000;
	//블록-②：함수로 정의된 문자 데이터를 삽입
`include "data_line1.v" //라인 1의 문자 데이터(함수로 정의된 파일)
`include "data_line2.v" //라인 2의 문자 데이터(함수로 정의된 파일)
// VFD Data Register에 쓰기 설정
  assign vfd_rw = 1'b0;

// vfd_e 제어신호 정의를 위한 cnt_clk_half 값 설정
  assign cnt_clk_half = 3;
  //블록-③：5ms 주기의 cnt_clk 생성
  always @(posedge rst or posedge mclk) begin
      if (rst) cnt_clk <= 0; 
      else begin
          if (cnt_clk == 4) cnt_clk <= 0;
          else              cnt_clk <= cnt_clk +1;
      end
  end
//블록-④：블록-③의 cnt_clk를 이용하여 100ms (=5×20ms)의 지연을 생성
  always @(posedge rst or posedge mclk) begin
     if (rst) cnt_delay_20m <= 0;
     else begin
        if (vfd_routine == delay_100ms) begin  //delay_100ms state
           if (cnt_clk == 4) begin
              if (cnt_delay_20m == 19) cnt_delay_20m <= 0;
              else cnt_delay_20m <= cnt_delay_20m + 1;
           end
        end
        else cnt_delay_20m <= 0;
     end
  end
//블록-⑤：블록-③의 cnt_clk를 이용하여 2sec(=5×400ms)의 지연을 생성
  always @(posedge rst or posedge mclk) begin
      if (rst) cnt_delay_2sec <= 0;
      else begin
         if (vfd_routine == delay_2sec) begin  //delay_2s state
             if (cnt_clk == 4) begin
                 if (cnt_delay_2sec == 399) cnt_delay_2sec <= 0;
                 else  cnt_delay_2sec <= cnt_delay_2sec + 1;
             end
         end
         else cnt_delay_2sec <= 0;
      end
  end
//블록-⑥：블록-③의 cnt_clk를 이용하여 80ms(=5×16ms)의 지연을 생성
//VFD 각 라인의 디스플레이를 위해 필요한 80ms의 지연을 생성
  always @(posedge rst or posedge mclk) begin
     if (rst) cnt_line <= 0;
     else begin
        if ((vfd_routine==disp_line1) ||(vfd_routine==disp_line2))
        begin
           if (cnt_clk == 4) begin
               if (cnt_line == 16) cnt_line <= 0;
               else cnt_line <= cnt_line + 1;
           end
       end
       else cnt_line <=0;
    end
  end
//블록-⑦：그림 16.36의 상태 천이도를 정의 
//각 routine에 설정된 시간이 경과하면 다음상태로 천이
  always @(posedge rst or posedge mclk) begin
    if (rst) vfd_routine <= delay_100ms;
    else begin
      if (cnt_clk == 3'b100) begin
        case (vfd_routine)
           delay_100ms : if(cnt_delay_20m == 19) 
                            vfd_routine <= function_set;
           function_set: vfd_routine <= entry_mode;
           entry_mode  : vfd_routine <= disp_on;
           disp_on     : vfd_routine <= disp_line1;
            disp_line1 : if(cnt_line == 16) vfd_routine <= disp_line2;
            disp_line2 : if(cnt_line == 16) vfd_routine <= delay_2sec;
            delay_2sec : if(cnt_delay_2sec == 399) 
                            vfd_routine <= brightness_set;
            brightness_set : vfd_routine <= delay_2sec;
          endcase
        end
     end
   end
//블록-⑧：VFD enable 신호 vfd_e 생성(루틴 별로 '0' 과 '1' 값을 정의)
  always @(posedge rst or posedge mclk) begin
    if (rst) vfd_e <= 1'b0;
    else begin
       case (vfd_routine)
          delay_100ms : vfd_e <= 1'b0;
          function_set : begin
                           if(cnt_clk >= 1 && cnt_clk <= cnt_clk_half) 
                                    vfd_e <= 1'b1;
                           else vfd_e <= 1'b0;
                         end
            entry_mode : begin
                           if(cnt_clk >= 1 && cnt_clk <= cnt_clk_half)
                                    vfd_e <= 1'b1;
                           else vfd_e <= 1'b0;
                         end
            disp_on : begin
                           if(cnt_clk >= 1 && cnt_clk <= cnt_clk_half)
                                    vfd_e <= 1'b1;
                           else vfd_e <= 1'b0;
                      end
				disp_line1 : begin
                           if(cnt_clk >= 1 && cnt_clk <= cnt_clk_half)
                                    vfd_e <= 1'b1;
                           else vfd_e <= 1'b0;
                         end
            disp_line2 : begin
                           if(cnt_clk >= 1 && cnt_clk <= cnt_clk_half)
                                    vfd_e <= 1'b1;
                           else vfd_e <= 1'b0;
                         end
            delay_2sec : vfd_e <= 1'b0;
            brightness_set : begin
                           if(cnt_clk >= 1 && cnt_clk <= cnt_clk_half)
                                    vfd_e <= 1'b1;
                           else  vfd_e <= 1'b0;
                           end
         endcase
      end
   end
//블록-⑨：vfd_rs 신호에 대한 정의
  always @(posedge rst or posedge mclk) begin
     if (rst) vfd_rs <= 1'b0;
     else begin
        if (vfd_routine == disp_line1 || vfd_routine == disp_line2) 
        begin
             if (cnt_line == 0) vfd_rs <= 0;  //for address
             else               vfd_rs <= 1;  //for data
        end
        else vfd_rs <= 1'b0;
     end
  end
//블록-⑩：brightness_set 상태일 때, VFD의 밝기 값을 변경
  always @(posedge rst or posedge mclk) begin
     if (rst) cnt_brightness <= 2'b00;
     else begin
        if (vfd_routine == brightness_set) begin
            if (cnt_brightness == 2'b11) cnt_brightness <= 2'b00;
            else   cnt_brightness <= cnt_brightness + 1;
        end
     end
  end
 //블록-⑩
 always @(posedge rst or posedge mclk) begin
		if (rst) vfd_data <= 8'b0000_0000;
		else begin
			case(vfd_routine)
				delay_100ms : vfd_data <= 8'b0000_0000;
				function_set : vfd_data <= 8'b0011_1000;
				entry_mode : vfd_data <= 8'b0000_0110;
				disp_on : vfd_data <= 8'b0000_1100;
				disp_line1 :
					if(cnt_line == 0) vfd_data <= address_line1;
					else vfd_data <= data_line1(cnt_line -1);
				disp_line2 :
					if(cnt_line == 0) vfd_data <= address_line2;
					else vfd_data <= data_line2(cnt_line -1);
				delay_2sec : vfd_data <= 9'b0000_0000;
				brightness_set : vfd_data <= {6'b001110, cnt_brightness};
			endcase
		end
	end
	//라인-1에 디스플레이될 문자 데이터(표 12.5의 ASCII 코드값을 할당)
  function [7:0] data_line1;
    input [3:0] addr_in;
  begin
    case (addr_in)
	 /////////////////////여기부터//////////////////////
           0  : data_line1 = 8'b0100_1110; // N 
           1  : data_line1 = 8'b0101_0101; // U
           2  : data_line1 = 8'b0100_1101; // M
           3  : data_line1 = 8'b0010_0000; // 
           4  : data_line1 = 8'b0011_1010; // 
           5  : data_line1 = 8'b0010_0000; // 
           6  : data_line1 = 8'b0011_0010; // 2
           7  : data_line1 = 8'b0011_0000; // 0
           8  : data_line1 = 8'b0011_0010; // 2
           9  : data_line1 = 8'b0011_0010; // 2 
           10 : data_line1 = 8'b0011_0011; // 3
           11 : data_line1 = 8'b0011_0000; // 0
           12 : data_line1 = 8'b0011_0101; // 5
           13 : data_line1 = 8'b0011_0000; // 0
           14 : data_line1 = 8'b0011_0001; // 3
           15 : data_line1 = 8'b0011_0001; // 4
      default : data_line1 = 8'b0000_0000;
    endcase
  end
endfunction
//라인-2에 디스플레이될 문자 데이터(표 12.5의 ASCII 코드값을 할당)
function [7:0] data_line2;
    input [3:0] addr_in;
  begin
     case (addr_in)
           0  : data_line2 = 8'b0100_1110; // N
           1  : data_line2 = 8'b0100_0001; // A
           2  : data_line2 = 8'b0100_1101; // M
           3  : data_line2 = 8'b0100_0101; // E
           4  : data_line2 = 8'b0010_0000; //
           5  : data_line2 = 8'b0011_1010; // :
           6  : data_line2 = 8'b0100_1101; // G
           7  : data_line2 = 8'b0110_1001; // Y
           8  : data_line2 = 8'b0110_1110; // e
           9  : data_line2 = 8'b0110_1110; // o
           10 : data_line2 = 8'b0110_1111; // n
           11 : data_line2 = 8'b0010_0000; // g
           12 : data_line2 = 8'b0010_0000; // W
           13 : data_line2 = 8'b0010_0000;
           14 : data_line2 = 8'b0010_0000;
           15 : data_line2 = 8'b0010_0000; //
//////////////////////////////여기까지 수정해////////////////////////			  
      default : data_line2 = 8'b0000_0000;
    endcase
  end
endfunction 
//////////////////////////////////////////////////////////////////////

	always @ (posedge mclk) begin
		if(location == 0) begin
			seg_data <= seg_data1;
			seg_com <= 8'b0111_1111;
		end
		else if(location == 1) begin
			seg_data <= seg_data2;
			seg_com <= 8'b1011_1111;
		end
		else if(location == 2) begin
			seg_data <= seg_data3;
			seg_com <= 8'b1110_1111;
		end
		else if(location == 3) begin
			seg_data <= seg_data4;
			seg_com <= 8'b1111_0111;
		end
		else if(location == 4) begin
			seg_data <= seg_data5;
			seg_com <= 8'b1111_1101;
		end
		else if(location == 5) begin
			seg_data <= seg_data6;
			seg_com <= 8'b1111_1110;
		end
		
		if(location == 5)
			location <= 0;
		else
			location <= location + 1;
	end
	
	//오전_오후//
	always @ (posedge mclk) begin
	if(cnt_hour_10 == 1 && cnt_hour_1 == 2) begin
		am <= 1;
	end
	if(cnt_hour_10 == 0 && cnt_hour_1 == 0) begin
		am <= 0;
	end
	if(rst)
		am <= 0;
	end

	//요일//
	always @ (posedge mclk) begin
	if(cnt_hour_10 == 0 && cnt_hour_1 == 0 && cnt_min_1 == 0 &&cnt_min_10 == 0 && cnt_sec_10 == 0 && cnt_sec_1 == 0) begin
		if(day == 0) begin
		led <= 7'b100_0000;
		end
		else if(day == 1) begin
		led <= 7'b010_0000;
		end
		else if(day == 2) begin
		led <= 7'b001_0000;
		end
		else if(day == 3) begin
		led <= 7'b000_1000;
		end
		else if(day == 4) begin
		led <= 7'b000_0100;
		end
		else if(day == 5) begin
		led <= 7'b000_0010;
		end
		else if(day == 6) begin
		led <= 7'b000_0001;
		end		
		
		if(day == 6) begin
			day <= 0;
		end
		else
 			day<=day+1;
		if(rst)begin
			day <= 0;
			led <= 7'b000_0000;
		end
	end
	end
	
	frq_div10 f1(mclk, rst, clk_100); // 1/10
	frq_div10 f2(clk_100, rst, clk_10); // 1/10(2승)
	frq_div10 f3(clk_10, rst, clk_1); // 1/10(3승)
	
	number_1 d1(clk_1, rst_2, cnt_sec_1);
	number_10 d2(cnt_sec_1[3], rst_2, cnt_sec_10); //크기를 맞춰주기 위해 정확한 자리를 찾기 위해
	 
	number_1 d3(cnt_sec_10[2], rst_2, cnt_min_1);
	number_10 d4(cnt_min_1[3], rst_2, cnt_min_10);
	 
	number_1 d5(cnt_min_10[2], rst_2, cnt_hour_1);
	number_10 d6(cnt_hour_1[3], rst_2, cnt_hour_10);
	 
	segment s1(cnt_sec_1, seg_data1);
	segment s2(cnt_sec_10, seg_data2);
	segment s3(cnt_min_1, seg_data3);
	segment s4(cnt_min_10, seg_data4);
	segment s5(cnt_hour_1, seg_data5);
	segment s6(cnt_hour_10, seg_data6);
	
	assign rst_1 = (cnt_hour_10 == 2 && cnt_hour_1 == 4)? 1 : 0;
	assign rst_2 = (rst_1 == 1 || rst == 1)? 1 : 0;
 
 
endmodule
 

//일의 자리수//
module number_1(mclk,rst,cnt);
	input     		mclk, rst;
	output	[3:0]	cnt;
	reg   	[3:0]	cnt;
 
always @(negedge mclk or posedge rst) begin
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
	
	always @(negedge mclk or posedge rst) begin
	if (rst) cnt <= 0;
	else begin
		if (cnt == 5) cnt <= 0;
		else	     cnt <= cnt + 1;
	end
end
endmodule
 
//1/10 주파수//
module frq_div10 (mclk, rst, clk_1hz);
   input     rst, mclk;
   output    clk_1hz;
   reg [2:0] cnt;
   reg       clk_1hz;
 
   always @(posedge mclk or posedge rst) begin
       if (rst) begin
           cnt <= 0;
           clk_1hz <= 1;
       end
       else begin
           if (cnt == 4) begin
               cnt <=0;
               clk_1hz <= ~clk_1hz;
           end
           else cnt <= cnt + 1;
       end
   end
endmodule
 
//세그먼트//
module segment(bcd_in,seg_data);
 
	input	[3:0] bcd_in;									
	output [7:0]seg_data;						
	reg	 [7:0]seg_data;						
	
	always @ (bcd_in) begin						
		case(bcd_in)	
		4'h0:seg_data=8'b0011_1111; 
		4'h1:seg_data=8'b0000_0110;
		4'h2:seg_data=8'b0101_1011;
		4'h3:seg_data=8'b0100_1111;
		4'h4:seg_data=8'b0110_0110;
		4'h5:seg_data=8'b0110_1101;
		4'h6:seg_data=8'b0111_1101;
		4'h7:seg_data=8'b0000_0111;
		4'h8:seg_data=8'b0111_1111;
		4'h9:seg_data=8'b0110_0111;
		default : seg_data=8'b0000_0000;
	   endcase
	end
 
endmodule
 
	
	
	
	
	
	
	
	
	
	
	
	