`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:38 12/16/2021 
// Design Name: 
// Module Name:    second_counter 
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

module second_counter(
input clk,
input wire switch,
input wire set,
input rst, 
output reg [7:0] num, 
output reg [3:0] seg_en
    );
parameter    SEG_NUM0 = 8'b1100_0000,  
              SEG_NUM1 = 8'b1111_1001,
			  SEG_NUM2 = 8'b1010_0100,
			  SEG_NUM3 = 8'b1011_0000,
			  SEG_NUM4 = 8'b1001_1001,
			  SEG_NUM5 = 8'b1001_0010,
			  SEG_NUM6 = 8'b1000_0010,
			  SEG_NUM7 = 8'b1111_1000,
			  SEG_NUM8 = 8'b1000_0000,
			  SEG_NUM9 = 8'b1001_0000;
parameter    DUAN_3 = 4'b0111,			  
			  DUAN_2 = 4'b1011,
			  DUAN_1 = 4'b1101,
			  DUAN_0 = 4'b1110;
			  
reg [20:0] count = 0;
reg [3:0] ms1 = 0;  
reg [3:0] ms10 = 0; 
reg [3:0] ms100 = 0; 
reg [3:0] s1 = 0; 
reg [3:0] s2 = 0;
reg [3:0] s3 = 0;
reg [3:0] s4 = 0;
 
reg [17:0] fenpin = 0;
reg clk_1ms = 0;
reg cen = 0;
integer fsm = 1;

always @(posedge clk) begin
	   if(fenpin == 100000)
		   fenpin <= 0;
		else 
		   fenpin <= fenpin + 1'b1;
end
 
always @ (posedge clk) begin
   if(fenpin < 50000)
	    clk_1ms  <= 0;
	else
	    clk_1ms  <= 1;
end

always @ (posedge clk) begin
   count <= count + 1'b1;	
end
 
always @ (posedge clk_1ms or negedge rst) begin
if (~rst) begin
fsm <= 1;
cen <= 0;
end
else if(set) begin
fsm <= 1;
cen <= 0;
end
else begin
 case(fsm)
    0: begin   
	    cen <= 1;
	    if(!switch)
		 fsm <= 1;
		 else	
		  fsm <= 0;
	    end
	 1: begin 
	    cen <= 0;
	    if(switch) 
		 fsm <= 0;
		 else
		 fsm <= 1;
       end		 
 endcase
end
 
end
 
always @ (posedge clk_1ms or negedge rst) begin 
if(~rst)begin
ms1 <= 0;
ms100 <= 0;
ms10 <= 0;
s1 <= 0;
s2 <= 0;
s3 <= 0;
s4 <= 0;
end 
else if(set)begin
ms1 <= 0;
ms100 <= 0;
ms10 <= 0;
s1 <= 0;
s2 <= 0;
s3 <= 0;
s4 <= 0;
end 
else begin
if(cen) begin
     case(ms1)
	 4'b1001: ms1 <= 4'b0000;
	 default:  ms1 <= ms1 + 1'b1;
	 endcase 
	 case(ms10)
	 4'b1001: begin
	           if(ms1 == 4'b1001)
	             ms10 <= 4'b0000;
				 end
	 default: begin
    	       if(ms1 == 4'b1001)
	             ms10 <= ms10 + 1'b1;
				 end
	 endcase
	 case(ms100)
	 4'b1001: begin
	           if(ms1 == 4'b1001 && ms10 == 4'b1001)
	             ms100 <= 4'b0000;
				 end
	 default: begin
    	       if(ms1 == 4'b1001 && ms10 == 4'b1001)
	             ms100 <= ms100 + 1'b1;
				 end
	 endcase
	 case(s1)
	 4'b1001: begin
	           if(ms1 == 4'b1001 && ms10 == 4'b1001 && ms100 == 4'b1001)
	             s1 <= 4'b0000;
				 end
	 default: begin
    	       if(ms1 == 4'b1001 && ms10 == 4'b1001 && ms100 == 4'b1001)
	             s1 <= s1 + 1'b1;
				 end
	 endcase
	 case(s2)
          4'b1001: begin
                    if(ms1 == 4'b1001 && ms10 == 4'b1001 && ms100 == 4'b1001 && s1==4'b1001)
                      s2 <= 4'b0000;
                      end
          default: begin
                    if(ms1 == 4'b1001 && ms10 == 4'b1001 && ms100 == 4'b1001 && s1==4'b1001)
                      s2 <= s2 + 1'b1;
                      end
          endcase
	 case(s3)
               4'b1001: begin
                         if(ms1 == 4'b1001 && ms10 == 4'b1001 && ms100 == 4'b1001 && s1==4'b1001 && s2==4'b1001)
                           s3 <= 4'b0000;
                           end
               default: begin
                         if(ms1 == 4'b1001 && ms10 == 4'b1001 && ms100 == 4'b1001 && s1==4'b1001 && s2==4'b1001)
                           s3 <= s3 + 1'b1;
                           end
               endcase
	 case(s4)
                         4'b1001: begin
                                   if(ms1 == 4'b1001 && ms10 == 4'b1001 && ms100 == 4'b1001 && s1==4'b1001 && s2==4'b1001 && s3==4'b1001)
                                     s4 <= 4'b0000;
                                     end
                         default: begin
                                   if(ms1 == 4'b1001 && ms10 == 4'b1001 && ms100 == 4'b1001 && s1==4'b1001 && s2==4'b1001 && s3==4'b1001)
                                     s4 <= s4 + 1'b1;
                                     end
                         endcase          
end
end
end
 
always @ (posedge clk) begin
  case(count[19:18])
  2'b00: begin
          seg_en <= DUAN_3;
			 case(s4)
			 4'b0000: num <= SEG_NUM0;
             4'b0001: num <= SEG_NUM1;
             4'b0010: num <= SEG_NUM2;
             4'b0011: num <= SEG_NUM3;
             4'b0100: num <= SEG_NUM4;
             4'b0101: num <= SEG_NUM5;
             4'b0110: num <= SEG_NUM6;
             4'b0111: num <= SEG_NUM7;
             4'b1000: num <= SEG_NUM8;
             4'b1001: num <= SEG_NUM9;
			 endcase
			end
	
  2'b01: begin
          seg_en <= DUAN_2;
			 case(s3)
			 4'b0000: num <= SEG_NUM0;
			 4'b0001: num <= SEG_NUM1;
			 4'b0010: num <= SEG_NUM2;
			 4'b0011: num <= SEG_NUM3;
			 4'b0100: num <= SEG_NUM4;
			 4'b0101: num <= SEG_NUM5;
			 4'b0110: num <= SEG_NUM6;
			 4'b0111: num <= SEG_NUM7;
			 4'b1000: num <= SEG_NUM8;
			 4'b1001: num <= SEG_NUM9;
			 endcase
			end
  2'b10: begin
          seg_en <= DUAN_1;
			 case(s2)
			 4'b0000: num <= SEG_NUM0;
             4'b0001: num <= SEG_NUM1;
             4'b0010: num <= SEG_NUM2;
             4'b0011: num <= SEG_NUM3;
             4'b0100: num <= SEG_NUM4;
             4'b0101: num <= SEG_NUM5;
             4'b0110: num <= SEG_NUM6;
             4'b0111: num <= SEG_NUM7;
             4'b1000: num <= SEG_NUM8;
             4'b1001: num <= SEG_NUM9;
			 endcase
			end
  2'b11: begin
          seg_en <= DUAN_0;
			 case(s1)
			 4'b0000: num <= SEG_NUM0;
			 4'b0001: num <= SEG_NUM1;
			 4'b0010: num <= SEG_NUM2;
			 4'b0011: num <= SEG_NUM3;
			 4'b0100: num <= SEG_NUM4;
			 4'b0101: num <= SEG_NUM5;
			 4'b0110: num <= SEG_NUM6;
			 4'b0111: num <= SEG_NUM7;
			 4'b1000: num <= SEG_NUM8;
			 4'b1001: num <= SEG_NUM9;
			 endcase
			end
  endcase
 
end
   
endmodule