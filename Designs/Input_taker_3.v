`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 21:50:06
// Design Name: 
// Module Name: input_taker_3
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


module input_taker_3 #(parameter N=8, M=4, C=8)(
input clk,
input reset,
input [N-1:0] key,
input [M-1:0] Plaintxt,
input start,
output reg [31:0] data,
output reg [63:0] key_out,
output reg done
    );
    
    reg [3:0] i_cur;
    reg [3:0] i_next;
    reg [31:0] data_next;
    reg [63:0] key_next;
    reg [N-1:0] key_buf;
    reg [M-1:0] Plaintxt_buf;
    reg start_buf;
    wire done_buf;
    
    always @(posedge clk)
    begin
        
            key_buf<=key;
            Plaintxt_buf<=Plaintxt;
            start_buf<=start;
            done<=done_buf;
        
    end
    
    assign done_buf = (i_cur==8)?1:0;
    always @(posedge clk)
    begin
        if(reset)
        begin
            data<=0;
            key_out<=0;
            i_cur<=0;
        end
        else
        begin
            data<=data_next;
            key_out<=key_next;
            i_cur<=i_next;
        end
    end
    
    always @*
    begin
        if( ((start_buf==1) && (i_cur==0)) )
        begin
            i_next=i_cur+1;
            data_next = 0;
            key_next = 0;
        end
        else if(((i_cur<9) && (i_cur!=0)))
        begin
            i_next=i_cur+1;
            data_next = {(data[27:0]),Plaintxt_buf};
            key_next = {(key_out[59:0]),key_buf};
        end
        else 
        begin
            i_next=0;
            data_next = data;
            key_next = key_out;
        end
    end
    
endmodule
