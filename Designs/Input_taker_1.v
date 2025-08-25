`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 13:16:05
// Design Name: 
// Module Name: input_taker
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module input_taker #(parameter N=8, M=4, C=8)(
input clk,
input reset,
input [N-1:0] key,
input [M-1:0] Plaintxt,
input start,
output [31:0] data,
output [63:0] key_out,
output  done
    );
    

    reg [5:0] j_cur;
    wire [5:0] j_next;
    reg [31:0] pt_cur;
    reg [63:0] key_cur;
    reg [3:0] pt_next;
    reg [7:0] key_next;
    reg [N-1:0] key_buf;
    reg  [M-1:0] Plaintxt_buf;


    assign key_out = key_cur;
    assign data=pt_cur;
    
    always @(posedge clk)
    begin
        if(reset)
        begin
            pt_cur<=0;
            j_cur<=0;
            key_cur<=0;
            key_buf<=0;
            Plaintxt_buf<=0;
        end
        else
        begin
            pt_cur[(j_cur-1)-:4] <=pt_next;
            key_cur[(2*j_cur-1)-:8]<=key_next;
            j_cur<=j_next;
            key_buf<=key;
            Plaintxt_buf<=Plaintxt;
        end
    end
   
   always @*
   begin
        if(j_cur<36)
        begin
            pt_next=Plaintxt_buf;
            key_next=key_buf;
        end
        else
        begin
            pt_next=0;
            key_next=0;
        end
   end
   
    assign j_next = (  ((start==1) && (j_cur==0)) || ((j_cur<40) && (j_cur!=0)) ) ? (j_cur+4) : 0;
    assign done = (j_cur==36)?1:0;
 
    
    
endmodule
